using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Windows.Forms;

namespace ObrazPlus
{
    public partial class ProductEditForm : Form
    {
        private readonly string _connectionString;
        private readonly int? _productId;
        private List<MaterialRow> _materialRows = new List<MaterialRow>(); // список материалов, добавленных к продукции

        // Для выбора в комбобоксах
        private Dictionary<int, string> _productTypes = new Dictionary<int, string>();
        private Dictionary<int, string> _allMaterials = new Dictionary<int, string>();

        public ProductEditForm(string connectionString, int? productId = null)
        {
            InitializeComponent();
            _connectionString = connectionString;
            _productId = productId;
        }

        // Класс для отображения состава изделия
        private class MaterialRow
        {
            public int MaterialID { get; set; }
            public string MaterialName { get; set; }
            public decimal Quantity { get; set; }
        }

        private void ProductEditForm_Load(object sender, EventArgs e)
        {
            LoadReferenceData();

            if (_productId.HasValue)
            {
                LoadProductData(_productId.Value);
                LoadProductMaterials(_productId.Value);
            }
            else
            {
                // Новый продукт — пустой список материалов
                _materialRows.Clear();
                UpdateMaterialsGrid();
            }
        }

        private void LoadReferenceData()
        {
            // Типы продукции
            using (var conn = new SqlConnection(_connectionString))
            {
                conn.Open();

                var cmdTypes = new SqlCommand("SELECT ProductTypeID, ProductTypeName FROM ProductTypes", conn);
                using (var reader = cmdTypes.ExecuteReader())
                {
                    while (reader.Read())
                        _productTypes[(int)reader["ProductTypeID"]] = reader["ProductTypeName"].ToString();
                }

                comboBoxType.DataSource = new BindingSource(_productTypes, null);
                comboBoxType.DisplayMember = "Value";
                comboBoxType.ValueMember = "Key";
            }

            // Материалы
            using (var conn = new SqlConnection(_connectionString))
            {
                conn.Open();

                var cmdMaterials = new SqlCommand("SELECT MaterialID, MaterialName FROM Materials", conn);
                using (var reader = cmdMaterials.ExecuteReader())
                {
                    _allMaterials.Clear();
                    while (reader.Read())
                        _allMaterials[(int)reader["MaterialID"]] = reader["MaterialName"].ToString();
                }
                comboBoxMaterial.DataSource = new BindingSource(_allMaterials, null);
                comboBoxMaterial.DisplayMember = "Value";
                comboBoxMaterial.ValueMember = "Key";
            }
        }

        private void LoadProductData(int id)
        {
            using (var conn = new SqlConnection(_connectionString))
            {
                conn.Open();

                var cmd = new SqlCommand(@"SELECT ProductTypeID, ProductName, Article, PartnerPrice FROM Products WHERE ProductID = @id", conn);
                cmd.Parameters.AddWithValue("@id", id);

                using (var reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        comboBoxType.SelectedValue = (int)reader["ProductTypeID"];
                        textBoxName.Text = reader["ProductName"].ToString();
                        textBoxArticle.Text = reader["Article"]?.ToString();
                        textBoxPrice.Text = reader["PartnerPrice"]?.ToString();
                    }
                }
            }
        }

        private void LoadProductMaterials(int productId)
        {
            _materialRows.Clear();
            using (var conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                var cmd = new SqlCommand(@"
                    SELECT mp.MaterialID, m.MaterialName, mp.QuantityRequired
                    FROM MaterialProducts mp
                    JOIN Materials m ON mp.MaterialID = m.MaterialID
                    WHERE mp.ProductID = @productId", conn);
                cmd.Parameters.AddWithValue("@productId", productId);

                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        _materialRows.Add(new MaterialRow
                        {
                            MaterialID = (int)reader["MaterialID"],
                            MaterialName = reader["MaterialName"].ToString(),
                            Quantity = (decimal)reader["QuantityRequired"]
                        });
                    }
                }
            }
            UpdateMaterialsGrid();
        }

        private void UpdateMaterialsGrid()
        {
            var table = new DataTable();
            table.Columns.Add("MaterialID", typeof(int));
            table.Columns.Add("MaterialName", typeof(string));
            table.Columns.Add("Quantity", typeof(decimal));

            foreach (var row in _materialRows)
                table.Rows.Add(row.MaterialID, row.MaterialName, row.Quantity);

            dataGridViewMaterials.DataSource = table;
            dataGridViewMaterials.Columns["MaterialID"].Visible = false;
            dataGridViewMaterials.Columns["MaterialName"].HeaderText = "Материал";
            dataGridViewMaterials.Columns["Quantity"].HeaderText = "Кол-во";
        }

        private void buttonAddMaterial_Click(object sender, EventArgs e)
        {
            if (comboBoxMaterial.SelectedItem is KeyValuePair<int, string> materialPair &&
                decimal.TryParse(textBoxMaterialQty.Text, out decimal qty) && qty > 0)
            {
                int materialId = materialPair.Key;
                string name = materialPair.Value;

                // Не добавлять дубли — обновлять количество
                var existing = _materialRows.FirstOrDefault(r => r.MaterialID == materialId);
                if (existing != null)
                    existing.Quantity = qty;
                else
                    _materialRows.Add(new MaterialRow { MaterialID = materialId, MaterialName = name, Quantity = qty });

                UpdateMaterialsGrid();
            }
            else
            {
                MessageBox.Show("Выберите материал и введите корректное количество.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void buttonRemoveMaterial_Click(object sender, EventArgs e)
        {
            if (dataGridViewMaterials.SelectedRows.Count > 0)
            {
                int materialId = (int)dataGridViewMaterials.SelectedRows[0].Cells["MaterialID"].Value;
                _materialRows.RemoveAll(r => r.MaterialID == materialId);
                UpdateMaterialsGrid();
            }
        }

        private void buttonSave_Click(object sender, EventArgs e)
        {
            // Валидация
            if (comboBoxType.SelectedItem == null || string.IsNullOrWhiteSpace(textBoxName.Text) ||
                string.IsNullOrWhiteSpace(textBoxArticle.Text) || string.IsNullOrWhiteSpace(textBoxPrice.Text))
            {
                MessageBox.Show("Пожалуйста, заполните все поля для продукции.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (!decimal.TryParse(textBoxPrice.Text, out decimal price) || price < 0)
            {
                MessageBox.Show("Введите корректную цену.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            int typeId = ((KeyValuePair<int, string>)comboBoxType.SelectedItem).Key;
            string name = textBoxName.Text.Trim();
            string article = textBoxArticle.Text.Trim();

            using (var conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                SqlCommand cmd;
                int productId;

                if (_productId.HasValue)
                {
                    // Обновление продукции
                    cmd = new SqlCommand(@"
                UPDATE Products SET ProductTypeID = @typeId, ProductName = @name, Article = @article, PartnerPrice = @price
                WHERE ProductID = @id", conn);
                    cmd.Parameters.AddWithValue("@id", _productId.Value);
                    cmd.Parameters.AddWithValue("@typeId", typeId);
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@article", article);
                    cmd.Parameters.AddWithValue("@price", price);

                    cmd.ExecuteNonQuery();
                    productId = _productId.Value;
                }
                else
                {
                    // Вставка новой продукции
                    cmd = new SqlCommand(@"
                INSERT INTO Products (ProductTypeID, ProductName, Article, PartnerPrice)
                OUTPUT INSERTED.ProductID
                VALUES (@typeId, @name, @article, @price)", conn);
                    cmd.Parameters.AddWithValue("@typeId", typeId);
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@article", article);
                    cmd.Parameters.AddWithValue("@price", price);

                    productId = (int)cmd.ExecuteScalar();
                }


                // --- ДОБАВЛЯЕМ МАТЕРИАЛЫ ---
                var delCmd = new SqlCommand("DELETE FROM MaterialProducts WHERE ProductID = @id", conn);
                delCmd.Parameters.AddWithValue("@id", productId);
                delCmd.ExecuteNonQuery();

                foreach (var mat in _materialRows)
                {
                    var addMat = new SqlCommand("INSERT INTO MaterialProducts (MaterialID, ProductID, QuantityRequired) VALUES (@matId, @prodId, @qty)", conn);
                    addMat.Parameters.AddWithValue("@matId", mat.MaterialID);
                    addMat.Parameters.AddWithValue("@prodId", productId);
                    addMat.Parameters.AddWithValue("@qty", mat.Quantity);
                    addMat.ExecuteNonQuery();
                }
            }

            MessageBox.Show("Продукция успешно сохранена.", "Успех", MessageBoxButtons.OK, MessageBoxIcon.Information);
            this.DialogResult = DialogResult.OK;
            this.Close();
        }


        private void buttonCancel_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.Cancel;
            this.Close();
        }
    }
}
