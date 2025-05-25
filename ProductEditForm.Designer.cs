namespace ObrazPlus
{
    partial class ProductEditForm
    {
        private System.ComponentModel.IContainer components = null;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
                components.Dispose();
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        private void InitializeComponent()
        {
            this.labelType = new System.Windows.Forms.Label();
            this.comboBoxType = new System.Windows.Forms.ComboBox();
            this.labelName = new System.Windows.Forms.Label();
            this.textBoxName = new System.Windows.Forms.TextBox();
            this.labelArticle = new System.Windows.Forms.Label();
            this.textBoxArticle = new System.Windows.Forms.TextBox();
            this.labelPrice = new System.Windows.Forms.Label();
            this.textBoxPrice = new System.Windows.Forms.TextBox();

            this.labelMaterial = new System.Windows.Forms.Label();
            this.comboBoxMaterial = new System.Windows.Forms.ComboBox();
            this.labelMaterialQty = new System.Windows.Forms.Label();
            this.textBoxMaterialQty = new System.Windows.Forms.TextBox();
            this.buttonAddMaterial = new System.Windows.Forms.Button();
            this.buttonRemoveMaterial = new System.Windows.Forms.Button();
            this.dataGridViewMaterials = new System.Windows.Forms.DataGridView();
            this.buttonSave = new System.Windows.Forms.Button();
            this.buttonCancel = new System.Windows.Forms.Button();

            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewMaterials)).BeginInit();
            this.SuspendLayout();

            System.Drawing.Font constFont = new System.Drawing.Font("Constantia", 11F, System.Drawing.FontStyle.Regular);

            // Form
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(690, 400);
            this.Name = "ProductEditForm";
            this.Text = "Редактирование продукции";
            this.Load += new System.EventHandler(this.ProductEditForm_Load);

            // labelType
            this.labelType.AutoSize = true;
            this.labelType.Location = new System.Drawing.Point(20, 15);
            this.labelType.Name = "labelType";
            this.labelType.Size = new System.Drawing.Size(110, 17);
            this.labelType.Text = "Тип продукции:";
            this.labelType.Font = constFont;

            // comboBoxType
            this.comboBoxType.Location = new System.Drawing.Point(140, 12);
            this.comboBoxType.Size = new System.Drawing.Size(160, 28);
            this.comboBoxType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBoxType.Font = constFont;

            // labelName
            this.labelName.AutoSize = true;
            this.labelName.Location = new System.Drawing.Point(320, 15);
            this.labelName.Name = "labelName";
            this.labelName.Size = new System.Drawing.Size(119, 17);
            this.labelName.Text = "Наименование:";
            this.labelName.Font = constFont;

            // textBoxName
            this.textBoxName.Location = new System.Drawing.Point(445, 12);
            this.textBoxName.Size = new System.Drawing.Size(200, 28);
            this.textBoxName.Font = constFont;

            // labelArticle
            this.labelArticle.AutoSize = true;
            this.labelArticle.Location = new System.Drawing.Point(20, 55);
            this.labelArticle.Name = "labelArticle";
            this.labelArticle.Size = new System.Drawing.Size(67, 17);
            this.labelArticle.Text = "Артикул:";
            this.labelArticle.Font = constFont;

            // textBoxArticle
            this.textBoxArticle.Location = new System.Drawing.Point(140, 52);
            this.textBoxArticle.Size = new System.Drawing.Size(160, 28);
            this.textBoxArticle.Font = constFont;

            // labelPrice
            this.labelPrice.AutoSize = true;
            this.labelPrice.Location = new System.Drawing.Point(320, 55);
            this.labelPrice.Name = "labelPrice";
            this.labelPrice.Size = new System.Drawing.Size(48, 17);
            this.labelPrice.Text = "Цена:";
            this.labelPrice.Font = constFont;

            // textBoxPrice
            this.textBoxPrice.Location = new System.Drawing.Point(445, 52);
            this.textBoxPrice.Size = new System.Drawing.Size(200, 28);
            this.textBoxPrice.Font = constFont;

            // labelMaterial
            this.labelMaterial.AutoSize = true;
            this.labelMaterial.Location = new System.Drawing.Point(20, 95);
            this.labelMaterial.Name = "labelMaterial";
            this.labelMaterial.Size = new System.Drawing.Size(76, 17);
            this.labelMaterial.Text = "Материал:";
            this.labelMaterial.Font = constFont;

            // comboBoxMaterial
            this.comboBoxMaterial.Location = new System.Drawing.Point(100, 92);
            this.comboBoxMaterial.Size = new System.Drawing.Size(200, 28);
            this.comboBoxMaterial.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBoxMaterial.Font = constFont;

            // labelMaterialQty
            this.labelMaterialQty.AutoSize = true;
            this.labelMaterialQty.Location = new System.Drawing.Point(320, 95);
            this.labelMaterialQty.Name = "labelMaterialQty";
            this.labelMaterialQty.Size = new System.Drawing.Size(88, 17);
            this.labelMaterialQty.Text = "Количество:";
            this.labelMaterialQty.Font = constFont;

            // textBoxMaterialQty
            this.textBoxMaterialQty.Location = new System.Drawing.Point(415, 92);
            this.textBoxMaterialQty.Size = new System.Drawing.Size(80, 28);
            this.textBoxMaterialQty.Font = constFont;

            // buttonAddMaterial
            this.buttonAddMaterial.Location = new System.Drawing.Point(510, 91);
            this.buttonAddMaterial.Size = new System.Drawing.Size(70, 28);
            this.buttonAddMaterial.Text = "Добавить";
            this.buttonAddMaterial.Font = constFont;
            this.buttonAddMaterial.BackColor = System.Drawing.ColorTranslator.FromHtml("#1D476B");
            this.buttonAddMaterial.ForeColor = System.Drawing.Color.White;
            this.buttonAddMaterial.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonAddMaterial.Click += new System.EventHandler(this.buttonAddMaterial_Click);

            // buttonRemoveMaterial
            this.buttonRemoveMaterial.Location = new System.Drawing.Point(590, 91);
            this.buttonRemoveMaterial.Size = new System.Drawing.Size(70, 28);
            this.buttonRemoveMaterial.Text = "Удалить";
            this.buttonRemoveMaterial.Font = constFont;
            this.buttonRemoveMaterial.BackColor = System.Drawing.ColorTranslator.FromHtml("#AED0FF");
            this.buttonRemoveMaterial.ForeColor = System.Drawing.Color.Black;
            this.buttonRemoveMaterial.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonRemoveMaterial.Click += new System.EventHandler(this.buttonRemoveMaterial_Click);

            // dataGridViewMaterials
            this.dataGridViewMaterials.Location = new System.Drawing.Point(20, 130);
            this.dataGridViewMaterials.Size = new System.Drawing.Size(640, 200);
            this.dataGridViewMaterials.AllowUserToAddRows = false;
            this.dataGridViewMaterials.AllowUserToDeleteRows = false;
            this.dataGridViewMaterials.ReadOnly = true;
            this.dataGridViewMaterials.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridViewMaterials.Font = constFont;
            this.dataGridViewMaterials.BackgroundColor = System.Drawing.Color.White;
            this.dataGridViewMaterials.ColumnHeadersDefaultCellStyle.Font = new System.Drawing.Font("Constantia", 10F, System.Drawing.FontStyle.Bold);
            this.dataGridViewMaterials.EnableHeadersVisualStyles = false;

            // buttonSave
            this.buttonSave.Location = new System.Drawing.Point(420, 350);
            this.buttonSave.Size = new System.Drawing.Size(110, 32);
            this.buttonSave.Text = "Сохранить";
            this.buttonSave.Font = constFont;
            this.buttonSave.BackColor = System.Drawing.ColorTranslator.FromHtml("#1D476B");
            this.buttonSave.ForeColor = System.Drawing.Color.White;
            this.buttonSave.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonSave.Click += new System.EventHandler(this.buttonSave_Click);

            // buttonCancel
            this.buttonCancel.Location = new System.Drawing.Point(550, 350);
            this.buttonCancel.Size = new System.Drawing.Size(110, 32);
            this.buttonCancel.Text = "Отмена";
            this.buttonCancel.Font = constFont;
            this.buttonCancel.BackColor = System.Drawing.ColorTranslator.FromHtml("#AED0FF");
            this.buttonCancel.ForeColor = System.Drawing.Color.Black;
            this.buttonCancel.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.buttonCancel.Click += new System.EventHandler(this.buttonCancel_Click);

            // Controls
            this.Controls.Add(this.labelType);
            this.Controls.Add(this.comboBoxType);
            this.Controls.Add(this.labelName);
            this.Controls.Add(this.textBoxName);
            this.Controls.Add(this.labelArticle);
            this.Controls.Add(this.textBoxArticle);
            this.Controls.Add(this.labelPrice);
            this.Controls.Add(this.textBoxPrice);

            this.Controls.Add(this.labelMaterial);
            this.Controls.Add(this.comboBoxMaterial);
            this.Controls.Add(this.labelMaterialQty);
            this.Controls.Add(this.textBoxMaterialQty);
            this.Controls.Add(this.buttonAddMaterial);
            this.Controls.Add(this.buttonRemoveMaterial);

            this.Controls.Add(this.dataGridViewMaterials);
            this.Controls.Add(this.buttonSave);
            this.Controls.Add(this.buttonCancel);

            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewMaterials)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();
        }

        #endregion

        private System.Windows.Forms.Label labelType;
        private System.Windows.Forms.ComboBox comboBoxType;
        private System.Windows.Forms.Label labelName;
        private System.Windows.Forms.TextBox textBoxName;
        private System.Windows.Forms.Label labelArticle;
        private System.Windows.Forms.TextBox textBoxArticle;
        private System.Windows.Forms.Label labelPrice;
        private System.Windows.Forms.TextBox textBoxPrice;
        private System.Windows.Forms.Label labelMaterial;
        private System.Windows.Forms.ComboBox comboBoxMaterial;
        private System.Windows.Forms.Label labelMaterialQty;
        private System.Windows.Forms.TextBox textBoxMaterialQty;
        private System.Windows.Forms.Button buttonAddMaterial;
        private System.Windows.Forms.Button buttonRemoveMaterial;
        private System.Windows.Forms.DataGridView dataGridViewMaterials;
        private System.Windows.Forms.Button buttonSave;
        private System.Windows.Forms.Button buttonCancel;
    }
}
