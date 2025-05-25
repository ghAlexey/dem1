namespace ObrazPlus
{
    partial class MaterialEditForm
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

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MaterialEditForm));
            this.comboBoxType = new System.Windows.Forms.ComboBox();
            this.textBoxName = new System.Windows.Forms.TextBox();
            this.textBoxPrice = new System.Windows.Forms.TextBox();
            this.textBoxStock = new System.Windows.Forms.TextBox();
            this.textBoxMin = new System.Windows.Forms.TextBox();
            this.textBoxPack = new System.Windows.Forms.TextBox();
            this.comboBoxUnit = new System.Windows.Forms.ComboBox();
            this.buttonSave = new System.Windows.Forms.Button();
            this.buttonCancel = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // comboBoxType
            // 
            this.comboBoxType.FormattingEnabled = true;
            this.comboBoxType.Location = new System.Drawing.Point(24, 32);
            this.comboBoxType.Name = "comboBoxType";
            this.comboBoxType.Size = new System.Drawing.Size(262, 34);
            this.comboBoxType.TabIndex = 0;
            this.comboBoxType.Text = "Тип материала";
            // 
            // textBoxName
            // 
            this.textBoxName.Location = new System.Drawing.Point(24, 85);
            this.textBoxName.Multiline = true;
            this.textBoxName.Name = "textBoxName";
            this.textBoxName.Size = new System.Drawing.Size(262, 87);
            this.textBoxName.TabIndex = 1;
            this.textBoxName.Text = "Наименование";
            // 
            // textBoxPrice
            // 
            this.textBoxPrice.Location = new System.Drawing.Point(24, 194);
            this.textBoxPrice.Name = "textBoxPrice";
            this.textBoxPrice.Size = new System.Drawing.Size(262, 33);
            this.textBoxPrice.TabIndex = 2;
            this.textBoxPrice.Text = "Цена за единицу";
            // 
            // textBoxStock
            // 
            this.textBoxStock.Location = new System.Drawing.Point(319, 33);
            this.textBoxStock.Name = "textBoxStock";
            this.textBoxStock.Size = new System.Drawing.Size(262, 33);
            this.textBoxStock.TabIndex = 3;
            this.textBoxStock.Text = "Кол-во на складе";
            // 
            // textBoxMin
            // 
            this.textBoxMin.Location = new System.Drawing.Point(319, 85);
            this.textBoxMin.Name = "textBoxMin";
            this.textBoxMin.Size = new System.Drawing.Size(262, 33);
            this.textBoxMin.TabIndex = 4;
            this.textBoxMin.Text = "Мин. остаток";
            // 
            // textBoxPack
            // 
            this.textBoxPack.Location = new System.Drawing.Point(319, 139);
            this.textBoxPack.Name = "textBoxPack";
            this.textBoxPack.Size = new System.Drawing.Size(262, 33);
            this.textBoxPack.TabIndex = 5;
            this.textBoxPack.Text = "Кол-во в упаковке";
            // 
            // comboBoxUnit
            // 
            this.comboBoxUnit.FormattingEnabled = true;
            this.comboBoxUnit.Location = new System.Drawing.Point(319, 194);
            this.comboBoxUnit.Name = "comboBoxUnit";
            this.comboBoxUnit.Size = new System.Drawing.Size(262, 34);
            this.comboBoxUnit.TabIndex = 6;
            this.comboBoxUnit.Text = "Единица измерения";
            // 
            // buttonSave
            // 
            this.buttonSave.Location = new System.Drawing.Point(75, 271);
            this.buttonSave.Name = "buttonSave";
            this.buttonSave.Size = new System.Drawing.Size(145, 54);
            this.buttonSave.TabIndex = 7;
            this.buttonSave.Text = "Сохранить";
            this.buttonSave.UseVisualStyleBackColor = true;
            // 
            // buttonCancel
            // 
            this.buttonCancel.Location = new System.Drawing.Point(362, 277);
            this.buttonCancel.Name = "buttonCancel";
            this.buttonCancel.Size = new System.Drawing.Size(145, 48);
            this.buttonCancel.TabIndex = 8;
            this.buttonCancel.Text = "Отмена";
            this.buttonCancel.UseVisualStyleBackColor = true;
            this.buttonCancel.Click += new System.EventHandler(this.buttonCancel_Click);
            // 
            // MaterialEditForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(13F, 26F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(774, 529);
            this.Controls.Add(this.buttonCancel);
            this.Controls.Add(this.buttonSave);
            this.Controls.Add(this.comboBoxUnit);
            this.Controls.Add(this.textBoxPack);
            this.Controls.Add(this.textBoxMin);
            this.Controls.Add(this.textBoxStock);
            this.Controls.Add(this.textBoxPrice);
            this.Controls.Add(this.textBoxName);
            this.Controls.Add(this.comboBoxType);
            this.Font = new System.Drawing.Font("Constantia", 7.875F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "MaterialEditForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Редактирование остатков";
            this.Load += new System.EventHandler(this.MaterialEditForm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox comboBoxType;
        private System.Windows.Forms.TextBox textBoxName;
        private System.Windows.Forms.TextBox textBoxPrice;
        private System.Windows.Forms.TextBox textBoxStock;
        private System.Windows.Forms.TextBox textBoxMin;
        private System.Windows.Forms.TextBox textBoxPack;
        private System.Windows.Forms.ComboBox comboBoxUnit;
        private System.Windows.Forms.Button buttonSave;
        private System.Windows.Forms.Button buttonCancel;
    }
}