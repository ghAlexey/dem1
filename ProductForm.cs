using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Windows.Forms;

namespace ObrazPlus
{
    public partial class ProductForm : Form
    {
        private readonly string _connectionString;

        public ProductForm(string connectionString)
        {
            InitializeComponent();
            _connectionString = connectionString;
        }

        private void ProductForm_Load(object sender, EventArgs e)
        {
            LoadProducts();
            if (dataGridViewProducts.Rows.Count > 0)
            {
                dataGridViewProducts.Rows[0].Selected = true;
                ShowProductMaterials();
            }
        }

        private void LoadProducts()
        {
            using (var conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                var query = @"
                    SELECT p.ProductID, p.ProductName, pt.ProductTypeName, p.Article, p.PartnerPrice
                    FROM Products p
                    JOIN ProductTypes pt ON p.ProductTypeID = pt.ProductTypeID";
                var adapter = new SqlDataAdapter(query, conn);
                var table = new DataTable();
                adapter.Fill(table);
                dataGridViewProducts.DataSource = table;

                // Оформление шрифтов
                foreach (DataGridViewColumn col in dataGridViewProducts.Columns)
                {
                    col.DefaultCellStyle.Font = new Font("Constantia", 10F, FontStyle.Regular);
                    col.HeaderCell.Style.Font = new Font("Constantia", 11F, FontStyle.Bold);
                }
            }
        }

        private void ShowProductMaterials()
        {
            if (dataGridViewProducts.SelectedRows.Count == 0)
            {
                dataGridViewMaterials.DataSource = null;
                return;
            }
            int productId = Convert.ToInt32(dataGridViewProducts.SelectedRows[0].Cells["ProductID"].Value);
            using (var conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                var query = @"
                    SELECT m.MaterialName AS [Материал], mp.QuantityRequired AS [Кол-во]
                    FROM MaterialProducts mp
                    JOIN Materials m ON mp.MaterialID = m.MaterialID
                    WHERE mp.ProductID = @productId";
                var adapter = new SqlDataAdapter(query, conn);
                adapter.SelectCommand.Parameters.AddWithValue("@productId", productId);
                var table = new DataTable();
                adapter.Fill(table);
                dataGridViewMaterials.DataSource = table;

                foreach (DataGridViewColumn col in dataGridViewMaterials.Columns)
                {
                    col.DefaultCellStyle.Font = new Font("Constantia", 10F, FontStyle.Regular);
                    col.HeaderCell.Style.Font = new Font("Constantia", 11F, FontStyle.Bold);
                }
            }
        }

        private void dataGridViewProducts_SelectionChanged(object sender, EventArgs e)
        {
            ShowProductMaterials();
        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            using (var form = new ProductEditForm(_connectionString))
            {
                if (form.ShowDialog() == DialogResult.OK)
                    LoadProducts();
            }
        }

        private void buttonEdit_Click(object sender, EventArgs e)
        {
            if (dataGridViewProducts.SelectedRows.Count == 0)
                return;
            int productId = Convert.ToInt32(dataGridViewProducts.SelectedRows[0].Cells["ProductID"].Value);
            using (var form = new ProductEditForm(_connectionString, productId))
            {
                if (form.ShowDialog() == DialogResult.OK)
                    LoadProducts();
            }
        }

        private void buttonDelete_Click(object sender, EventArgs e)
        {
            if (dataGridViewProducts.SelectedRows.Count == 0)
                return;
            int productId = Convert.ToInt32(dataGridViewProducts.SelectedRows[0].Cells["ProductID"].Value);

            var result = MessageBox.Show("Удалить выбранный продукт?", "Подтвердите удаление", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
            if (result != DialogResult.Yes)
                return;

            using (var conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                // Сначала удалить все материалы из состава
                var delMaterials = new SqlCommand("DELETE FROM MaterialProducts WHERE ProductID = @id", conn);
                delMaterials.Parameters.AddWithValue("@id", productId);
                delMaterials.ExecuteNonQuery();

                var cmd = new SqlCommand("DELETE FROM Products WHERE ProductID = @id", conn);
                cmd.Parameters.AddWithValue("@id", productId);
                cmd.ExecuteNonQuery();
            }
            LoadProducts();
        }

        private void buttonExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void buttonToMaterials_Click(object sender, EventArgs e)
        {
            var matForm = new MaterialsForm(_connectionString);
            matForm.Show();
            this.Hide();
        }
    }
}
