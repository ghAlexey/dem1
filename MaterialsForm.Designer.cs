namespace ObrazPlus
{
    partial class MaterialsForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MaterialsForm));
            this.flowLayoutPanelMaterials = new System.Windows.Forms.FlowLayoutPanel();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.buttonAddMaterial = new System.Windows.Forms.Button();
            this.buttonExit = new System.Windows.Forms.Button();
            this.buttonToProducts = new System.Windows.Forms.Button();
            this.buttonToMaterials = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // flowLayoutPanelMaterials
            // 
            this.flowLayoutPanelMaterials.AutoScroll = true;
            this.flowLayoutPanelMaterials.BackColor = System.Drawing.Color.White;
            this.flowLayoutPanelMaterials.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.flowLayoutPanelMaterials.FlowDirection = System.Windows.Forms.FlowDirection.BottomUp;
            this.flowLayoutPanelMaterials.Font = new System.Drawing.Font("Constantia", 10.125F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.flowLayoutPanelMaterials.Location = new System.Drawing.Point(0, 29);
            this.flowLayoutPanelMaterials.Margin = new System.Windows.Forms.Padding(4);
            this.flowLayoutPanelMaterials.Name = "flowLayoutPanelMaterials";
            this.flowLayoutPanelMaterials.Size = new System.Drawing.Size(1174, 700);
            this.flowLayoutPanelMaterials.TabIndex = 0;
            this.flowLayoutPanelMaterials.WrapContents = false;
            this.flowLayoutPanelMaterials.Paint += new System.Windows.Forms.PaintEventHandler(this.flowLayoutPanelMaterials_Paint);
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.groupBox1.Controls.Add(this.buttonAddMaterial);
            this.groupBox1.Controls.Add(this.buttonExit);
            this.groupBox1.Controls.Add(this.buttonToProducts);
            this.groupBox1.Controls.Add(this.buttonToMaterials);
            this.groupBox1.Location = new System.Drawing.Point(0, 0);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(4);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(4);
            this.groupBox1.Size = new System.Drawing.Size(1164, 30);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            // 
            // buttonAddMaterial
            // 
            this.buttonAddMaterial.Font = new System.Drawing.Font("Constantia", 10.125F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.buttonAddMaterial.Location = new System.Drawing.Point(1527, 7);
            this.buttonAddMaterial.Margin = new System.Windows.Forms.Padding(4);
            this.buttonAddMaterial.Name = "buttonAddMaterial";
            this.buttonAddMaterial.Size = new System.Drawing.Size(211, 53);
            this.buttonAddMaterial.TabIndex = 3;
            this.buttonAddMaterial.Text = "Добавить";
            this.buttonAddMaterial.UseVisualStyleBackColor = true;
            this.buttonAddMaterial.Click += new System.EventHandler(this.buttonAddMaterial_Click);
            // 
            // buttonExit
            // 
            this.buttonExit.Location = new System.Drawing.Point(437, 7);
            this.buttonExit.Margin = new System.Windows.Forms.Padding(4);
            this.buttonExit.Name = "buttonExit";
            this.buttonExit.Size = new System.Drawing.Size(169, 53);
            this.buttonExit.TabIndex = 2;
            this.buttonExit.Text = "Выход";
            this.buttonExit.UseVisualStyleBackColor = true;
            this.buttonExit.Click += new System.EventHandler(this.buttonExit_Click);
            // 
            // buttonToProducts
            // 
            this.buttonToProducts.Location = new System.Drawing.Point(223, 7);
            this.buttonToProducts.Margin = new System.Windows.Forms.Padding(4);
            this.buttonToProducts.Name = "buttonToProducts";
            this.buttonToProducts.Size = new System.Drawing.Size(176, 53);
            this.buttonToProducts.TabIndex = 2;
            this.buttonToProducts.Text = "Продукция";
            this.buttonToProducts.UseVisualStyleBackColor = true;
            this.buttonToProducts.Click += new System.EventHandler(this.buttonToProducts_Click);
            // 
            // buttonToMaterials
            // 
            this.buttonToMaterials.Location = new System.Drawing.Point(31, 2);
            this.buttonToMaterials.Margin = new System.Windows.Forms.Padding(4);
            this.buttonToMaterials.Name = "buttonToMaterials";
            this.buttonToMaterials.Size = new System.Drawing.Size(184, 25);
            this.buttonToMaterials.TabIndex = 0;
            this.buttonToMaterials.Text = "Материалы";
            this.buttonToMaterials.UseVisualStyleBackColor = true;
            // 
            // MaterialsForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(16F, 33F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1174, 729);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.flowLayoutPanelMaterials);
            this.Font = new System.Drawing.Font("Constantia", 10.125F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "MaterialsForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Материалы";
            this.Load += new System.EventHandler(this.MaterialsForm_Load);
            this.groupBox1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.FlowLayoutPanel flowLayoutPanelMaterials;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button buttonExit;
        private System.Windows.Forms.Button buttonToProducts;
        private System.Windows.Forms.Button buttonToMaterials;
        private System.Windows.Forms.Button buttonAddMaterial;
    }
}