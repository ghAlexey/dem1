namespace ObrazPlus
{
    partial class ProductForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        private void InitializeComponent()
        {
            System.Drawing.Font constFont = new System.Drawing.Font("Constantia", 11F, System.Drawing.FontStyle.Regular);

            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.buttonAdd = new System.Windows.Forms.Button();
            this.buttonEdit = new System.Windows.Forms.Button();
            this.buttonDelete = new System.Windows.Forms.Button();
            this.buttonExit = new System.Windows.Forms.Button();
            this.buttonToProducts = new System.Windows.Forms.Button();
            this.buttonToMaterials = new System.Windows.Forms.Button();
            this.labelTitle = new System.Windows.Forms.Label();
            this.labelProducts = new System.Windows.Forms.Label();
            this.labelMaterials = new System.Windows.Forms.Label();
            this.dataGridViewProducts = new System.Windows.Forms.DataGridView();
            this.dataGridViewMaterials = new System.Windows.Forms.DataGridView();

            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewProducts)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewMaterials)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();

            // --- Формат формы ---
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(1200, 700);
            this.Font = constFont;
            this.Text = "Продукция";
            this.Name = "ProductForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Load += new System.EventHandler(this.ProductForm_Load);

            // --- groupBox1 ---
            this.groupBox1.BackColor = System.Drawing.ColorTranslator.FromHtml("#AED0FF");
            this.groupBox1.Controls.Add(this.buttonExit);
            this.groupBox1.Controls.Add(this.buttonToProducts);
            this.groupBox1.Controls.Add(this.buttonToMaterials);
            this.groupBox1.Controls.Add(this.buttonAdd);
            this.groupBox1.Controls.Add(this.buttonEdit);
            this.groupBox1.Controls.Add(this.buttonDelete);
            this.groupBox1.Location = new System.Drawing.Point(0, 0);
            this.groupBox1.Size = new System.Drawing.Size(1200, 60);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;

            // --- buttonToMaterials ---
            this.buttonToMaterials.Text = "Материалы";
            this.buttonToMaterials.Location = new System.Drawing.Point(20, 15);
            this.buttonToMaterials.Size = new System.Drawing.Size(120, 35);
            this.buttonToMaterials.BackColor = System.Drawing.Color.White;
            this.buttonToMaterials.Font = constFont;
            this.buttonToMaterials.Click += new System.EventHandler(this.buttonToMaterials_Click);

            // --- buttonToProducts ---
            this.buttonToProducts.Text = "Продукция";
            this.buttonToProducts.Location = new System.Drawing.Point(150, 15);
            this.buttonToProducts.Size = new System.Drawing.Size(120, 35);
            this.buttonToProducts.BackColor = System.Drawing.Color.White;
            this.buttonToProducts.Font = constFont;
            // Нет события — это активная форма

            // --- buttonAdd ---
            this.buttonAdd.Text = "Добавить";
            this.buttonAdd.Location = new System.Drawing.Point(350, 15);
            this.buttonAdd.Size = new System.Drawing.Size(120, 35);
            this.buttonAdd.BackColor = System.Drawing.ColorTranslator.FromHtml("#1D476B");
            this.buttonAdd.ForeColor = System.Drawing.Color.White;
            this.buttonAdd.Font = constFont;
            this.buttonAdd.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonAdd.Click += new System.EventHandler(this.buttonAdd_Click);

            // --- buttonEdit ---
            this.buttonEdit.Text = "Редактировать";
            this.buttonEdit.Location = new System.Drawing.Point(480, 15);
            this.buttonEdit.Size = new System.Drawing.Size(140, 35);
            this.buttonEdit.BackColor = System.Drawing.ColorTranslator.FromHtml("#1D476B");
            this.buttonEdit.ForeColor = System.Drawing.Color.White;
            this.buttonEdit.Font = constFont;
            this.buttonEdit.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonEdit.Click += new System.EventHandler(this.buttonEdit_Click);

            // --- buttonDelete ---
            this.buttonDelete.Text = "Удалить";
            this.buttonDelete.Location = new System.Drawing.Point(630, 15);
            this.buttonDelete.Size = new System.Drawing.Size(120, 35);
            this.buttonDelete.BackColor = System.Drawing.ColorTranslator.FromHtml("#AED0FF");
            this.buttonDelete.ForeColor = System.Drawing.Color.Black;
            this.buttonDelete.Font = constFont;
            this.buttonDelete.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonDelete.Click += new System.EventHandler(this.buttonDelete_Click);

            // --- buttonExit ---
            this.buttonExit.Text = "Выход";
            this.buttonExit.Location = new System.Drawing.Point(1070, 15);
            this.buttonExit.Size = new System.Drawing.Size(100, 35);
            this.buttonExit.BackColor = System.Drawing.Color.White;
            this.buttonExit.Font = constFont;
            this.buttonExit.Click += new System.EventHandler(this.buttonExit_Click);

            // --- labelTitle ---
            this.labelTitle.Text = "Продукция";
            this.labelTitle.Font = new System.Drawing.Font("Constantia", 16F, System.Drawing.FontStyle.Bold);
            this.labelTitle.Location = new System.Drawing.Point(510, 70);
            this.labelTitle.Size = new System.Drawing.Size(180, 36);
            this.labelTitle.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;

            // --- labelProducts ---
            this.labelProducts.Text = "Список продукции";
            this.labelProducts.Font = constFont;
            this.labelProducts.Location = new System.Drawing.Point(40, 120);
            this.labelProducts.Size = new System.Drawing.Size(200, 30);

            // --- labelMaterials ---
            this.labelMaterials.Text = "Состав выбранной продукции";
            this.labelMaterials.Font = constFont;
            this.labelMaterials.Location = new System.Drawing.Point(40, 460);
            this.labelMaterials.Size = new System.Drawing.Size(300, 30);

            // --- dataGridViewProducts ---
            this.dataGridViewProducts.Location = new System.Drawing.Point(40, 160);
            this.dataGridViewProducts.Size = new System.Drawing.Size(1100, 280);
            this.dataGridViewProducts.ReadOnly = true;
            this.dataGridViewProducts.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridViewProducts.MultiSelect = false;
            this.dataGridViewProducts.AllowUserToAddRows = false;
            this.dataGridViewProducts.AllowUserToDeleteRows = false;
            this.dataGridViewProducts.AllowUserToResizeRows = false;
            this.dataGridViewProducts.BackgroundColor = System.Drawing.Color.White;
            this.dataGridViewProducts.Font = constFont;
            this.dataGridViewProducts.ColumnHeadersDefaultCellStyle.Font = new System.Drawing.Font("Constantia", 11F, System.Drawing.FontStyle.Bold);
            this.dataGridViewProducts.EnableHeadersVisualStyles = false;
            this.dataGridViewProducts.SelectionChanged += new System.EventHandler(this.dataGridViewProducts_SelectionChanged);

            // --- dataGridViewMaterials ---
            this.dataGridViewMaterials.Location = new System.Drawing.Point(40, 500);
            this.dataGridViewMaterials.Size = new System.Drawing.Size(1100, 150);
            this.dataGridViewMaterials.ReadOnly = true;
            this.dataGridViewMaterials.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridViewMaterials.MultiSelect = false;
            this.dataGridViewMaterials.AllowUserToAddRows = false;
            this.dataGridViewMaterials.AllowUserToDeleteRows = false;
            this.dataGridViewMaterials.AllowUserToResizeRows = false;
            this.dataGridViewMaterials.BackgroundColor = System.Drawing.Color.White;
            this.dataGridViewMaterials.Font = constFont;
            this.dataGridViewMaterials.ColumnHeadersDefaultCellStyle.Font = new System.Drawing.Font("Constantia", 11F, System.Drawing.FontStyle.Bold);
            this.dataGridViewMaterials.EnableHeadersVisualStyles = false;

            // --- Controls ---
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.labelTitle);
            this.Controls.Add(this.labelProducts);
            this.Controls.Add(this.labelMaterials);
            this.Controls.Add(this.dataGridViewProducts);
            this.Controls.Add(this.dataGridViewMaterials);

            this.groupBox1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewProducts)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewMaterials)).EndInit();
            this.ResumeLayout(false);
        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button buttonExit;
        private System.Windows.Forms.Button buttonToProducts;
        private System.Windows.Forms.Button buttonToMaterials;
        private System.Windows.Forms.Button buttonAdd;
        private System.Windows.Forms.Button buttonEdit;
        private System.Windows.Forms.Button buttonDelete;
        private System.Windows.Forms.Label labelTitle;
        private System.Windows.Forms.Label labelProducts;
        private System.Windows.Forms.Label labelMaterials;
        private System.Windows.Forms.DataGridView dataGridViewProducts;
        private System.Windows.Forms.DataGridView dataGridViewMaterials;
    }
}
