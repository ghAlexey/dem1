using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ObrazPlus
{
    public partial class MaterialsForm : Form
    {

        private readonly string _connectionString;

        public MaterialsForm(string connectionString)
        {
            InitializeComponent();
            _connectionString = connectionString;
            this.Width = 1150;
            this.Height =700;
            this.FormBorderStyle = FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.MinimizeBox = true;
        }

        private void LoadMaterials()
        {
            flowLayoutPanelMaterials.Controls.Clear();

            using (var conn = new SqlConnection(_connectionString))
            {
                conn.Open();

                string query = @"
            SELECT m.MaterialName, mt.MaterialTypeName, m.MinimumQuantity, m.QuantityInStock, 
                   m.UnitPrice, u.UnitName, m.PackageQuantity,
                   ISNULL(SUM(mp.QuantityRequired), 0) AS TotalRequired
            FROM Materials m
            JOIN MaterialTypes mt ON m.MaterialTypeID = mt.MaterialTypeID
            JOIN Units u ON m.UnitID = u.UnitID
            LEFT JOIN MaterialProducts mp ON m.MaterialID = mp.MaterialID
            GROUP BY m.MaterialName, mt.MaterialTypeName, m.MinimumQuantity, m.QuantityInStock, 
                     m.UnitPrice, u.UnitName, m.PackageQuantity
            ORDER BY m.MaterialName";

                using (var cmd = new SqlCommand(query, conn))
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string type = reader["MaterialTypeName"].ToString();
                        string name = reader["MaterialName"].ToString();
                        decimal min = Convert.ToDecimal(reader["MinimumQuantity"]);
                        decimal stock = Convert.ToDecimal(reader["QuantityInStock"]);
                        decimal price = Convert.ToDecimal(reader["UnitPrice"]);
                        string unit = reader["UnitName"].ToString();
                        decimal pack = Convert.ToDecimal(reader["PackageQuantity"]);

                        // Вычисляем, сколько нужно ДОЗАКАЗАТЬ до минимума
                        decimal required = stock < min ? (min - stock) : 0;

                        // Формируем текст
                        string labelText = $"Требуется: {required:N2}";                       

                        // Создание панели
                        var panel = new Panel
                        {
                            Width = 740, 
                            Height = 100,
                            BorderStyle = BorderStyle.FixedSingle,
                            Padding = new Padding(10),
                            Margin = new Padding(5)
                        };

                        // Левый текст
                        var labelLeft = new Label
                        {
                            AutoSize = true,
                            Font = new Font("Constantia", 10),
                            Text = $"{type} | {name}\n" +
                                   $"Минимальное количество: {min:N2}\n" +
                                   $"На складе: {stock:N2}\n" +
                                   $"Цена: {price:N2} р/{unit} | {pack:N2} в упаковке",
                            Location = new Point(10, 10)
                        };

                        // Правый текст
                        var labelRight = new Label
                        {
                            AutoSize = true,
                            Font = new Font("Constantia", 12, FontStyle.Bold),
                            Text = $"Требуется: {required:N2}",
                        };

                        // Выравнивание справа
                        labelRight.Location = new Point(panel.Width - labelRight.PreferredWidth - 20, 10);

                        panel.Controls.Add(labelLeft);
                        panel.Controls.Add(labelRight);
                        flowLayoutPanelMaterials.Controls.Add(panel);
                    }
                }
            }
        }



        private void MaterialsForm_Load(object sender, EventArgs e)
        {
            LoadMaterials();
        }

        private void buttonToProducts_Click(object sender, EventArgs e)
        {
            var productForm = new ProductForm(_connectionString);
            productForm.Show();
            this.Hide();
        }

        private void buttonExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void buttonAddMaterial_Click(object sender, EventArgs e)
        {
            var form = new MaterialEditForm(_connectionString);
            if (form.ShowDialog() == DialogResult.OK)
            {
                LoadMaterials(); // обновление карточек
            }
        }

        private void flowLayoutPanelMaterials_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
