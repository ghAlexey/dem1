using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace ObrazPlus
{
    public partial class MaterialEditForm : Form
    {
        private readonly string _connectionString;
        private readonly int? _materialId;

        public MaterialEditForm(string connectionString, int? materialId = null)
        {
            InitializeComponent();
            _connectionString = connectionString;
            _materialId = materialId;

            // Стилизация: Constantia и цвета по требованию
            this.Font = new System.Drawing.Font("Constantia", 12);
            this.BackColor = System.Drawing.Color.White;
            buttonSave.Font = new System.Drawing.Font("Constantia", 13, System.Drawing.FontStyle.Bold);
            buttonSave.BackColor = System.Drawing.Color.FromArgb(29, 71, 107);
            buttonSave.ForeColor = System.Drawing.Color.White;
            buttonCancel.Font = new System.Drawing.Font("Constantia", 13, System.Drawing.FontStyle.Bold);
            buttonCancel.BackColor = System.Drawing.Color.FromArgb(174, 208, 255);
            buttonCancel.ForeColor = System.Drawing.Color.FromArgb(29, 71, 107);

            // Обработчики
            buttonSave.Click += buttonSave_Click;
            buttonCancel.Click += buttonCancel_Click;
        }

        private void MaterialEditForm_Load(object sender, EventArgs e)
        {
            LoadReferenceData();

            if (_materialId.HasValue)
                LoadMaterialData(_materialId.Value);
        }

        private void LoadReferenceData()
        {
            using (var conn = new SqlConnection(_connectionString))
            {
                conn.Open();

                // Типы материалов
                var cmdTypes = new SqlCommand("SELECT MaterialTypeID, MaterialTypeName FROM MaterialTypes", conn);
                var readerTypes = cmdTypes.ExecuteReader();
                var types = new Dictionary<int, string>();
                while (readerTypes.Read())
                    types.Add((int)readerTypes["MaterialTypeID"], readerTypes["MaterialTypeName"].ToString());
                readerTypes.Close();

                comboBoxType.DataSource = new BindingSource(types, null);
                comboBoxType.DisplayMember = "Value";
                comboBoxType.ValueMember = "Key";

                // Единицы измерения
                var cmdUnits = new SqlCommand("SELECT UnitID, UnitName FROM Units", conn);
                var readerUnits = cmdUnits.ExecuteReader();
                var units = new Dictionary<int, string>();
                while (readerUnits.Read())
                    units.Add((int)readerUnits["UnitID"], readerUnits["UnitName"].ToString());
                readerUnits.Close();

                comboBoxUnit.DataSource = new BindingSource(units, null);
                comboBoxUnit.DisplayMember = "Value";
                comboBoxUnit.ValueMember = "Key";
            }
        }

        private void LoadMaterialData(int id)
        {
            using (var conn = new SqlConnection(_connectionString))
            {
                conn.Open();

                var cmd = new SqlCommand(@"
            SELECT MaterialTypeID, MaterialName, UnitPrice, QuantityInStock, MinimumQuantity, PackageQuantity, UnitID
            FROM Materials
            WHERE MaterialID = @id", conn);

                cmd.Parameters.AddWithValue("@id", id);

                using (var reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        comboBoxType.SelectedValue = (int)reader["MaterialTypeID"];
                        textBoxName.Text = reader["MaterialName"].ToString();
                        textBoxPrice.Text = reader["UnitPrice"].ToString();
                        textBoxStock.Text = reader["QuantityInStock"].ToString();
                        textBoxMin.Text = reader["MinimumQuantity"].ToString();
                        textBoxPack.Text = reader["PackageQuantity"].ToString();
                        comboBoxUnit.SelectedValue = (int)reader["UnitID"];
                    }
                }
            }
        }

        private void buttonSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(textBoxName.Text) ||
                string.IsNullOrWhiteSpace(textBoxPrice.Text) ||
                string.IsNullOrWhiteSpace(textBoxStock.Text) ||
                string.IsNullOrWhiteSpace(textBoxMin.Text) ||
                string.IsNullOrWhiteSpace(textBoxPack.Text))
            {
                MessageBox.Show("Пожалуйста, заполните все поля.", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            try
            {
                int typeId = ((KeyValuePair<int, string>)comboBoxType.SelectedItem).Key;
                string name = textBoxName.Text.Trim();
                decimal price = decimal.Parse(textBoxPrice.Text);
                decimal stock = decimal.Parse(textBoxStock.Text);
                decimal min = decimal.Parse(textBoxMin.Text);
                decimal pack = decimal.Parse(textBoxPack.Text);
                int unitId = ((KeyValuePair<int, string>)comboBoxUnit.SelectedItem).Key;

                using (var conn = new SqlConnection(_connectionString))
                {
                    conn.Open();

                    SqlCommand cmd;

                    if (_materialId.HasValue)
                    {
                        cmd = new SqlCommand(@"
                        UPDATE Materials SET
                            MaterialTypeID = @typeId,
                            MaterialName = @name,
                            UnitPrice = @price,
                            QuantityInStock = @stock,
                            MinimumQuantity = @min,
                            PackageQuantity = @pack,
                            UnitID = @unitId
                        WHERE MaterialID = @id", conn);

                        cmd.Parameters.AddWithValue("@id", _materialId.Value);
                    }
                    else
                    {
                        cmd = new SqlCommand(@"
                        INSERT INTO Materials (MaterialTypeID, MaterialName, UnitPrice, QuantityInStock, MinimumQuantity, PackageQuantity, UnitID)
                        VALUES (@typeId, @name, @price, @stock, @min, @pack, @unitId)", conn);
                    }

                    cmd.Parameters.AddWithValue("@typeId", typeId);
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@price", price);
                    cmd.Parameters.AddWithValue("@stock", stock);
                    cmd.Parameters.AddWithValue("@min", min);
                    cmd.Parameters.AddWithValue("@pack", pack);
                    cmd.Parameters.AddWithValue("@unitId", unitId);

                    cmd.ExecuteNonQuery();
                }

                MessageBox.Show("Материал сохранён.", "Успех", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.DialogResult = DialogResult.OK;
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка при сохранении: " + ex.Message, "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
