namespace OnlineDestek
{
    partial class frmLogin
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmLogin));
            this.sl = new DevComponents.DotNetBar.StyleManager(this.components);
            this.labelX1 = new DevComponents.DotNetBar.LabelX();
            this.txtusername = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.txtpassword = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.labelX2 = new DevComponents.DotNetBar.LabelX();
            this.btnok = new DevComponents.DotNetBar.ButtonX();
            this.btncancel = new DevComponents.DotNetBar.ButtonX();
            this.hl = new DevComponents.DotNetBar.Validator.Highlighter();
            this.img = new DevComponents.DotNetBar.Controls.ReflectionImage();
            this.SuspendLayout();
            // 
            // sl
            // 
            this.sl.ManagerStyle = DevComponents.DotNetBar.eStyle.Office2010Silver;
            // 
            // labelX1
            // 
            // 
            // 
            // 
            this.labelX1.BackgroundStyle.Class = "";
            this.labelX1.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX1.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.labelX1.Location = new System.Drawing.Point(94, 12);
            this.labelX1.Name = "labelX1";
            this.labelX1.Size = new System.Drawing.Size(85, 22);
            this.labelX1.TabIndex = 1;
            this.labelX1.Text = "Kullanıcı Adı :";
            // 
            // txtusername
            // 
            // 
            // 
            // 
            this.txtusername.Border.Class = "TextBoxBorder";
            this.txtusername.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtusername.FocusHighlightColor = System.Drawing.Color.Gainsboro;
            this.txtusername.FocusHighlightEnabled = true;
            this.txtusername.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.hl.SetHighlightOnFocus(this.txtusername, true);
            this.txtusername.Location = new System.Drawing.Point(94, 40);
            this.txtusername.Name = "txtusername";
            this.txtusername.Size = new System.Drawing.Size(185, 21);
            this.txtusername.TabIndex = 1;
            this.txtusername.WatermarkColor = System.Drawing.SystemColors.ControlDarkDark;
            this.txtusername.WatermarkText = "Kullanıcı Adı";
            // 
            // txtpassword
            // 
            // 
            // 
            // 
            this.txtpassword.Border.Class = "TextBoxBorder";
            this.txtpassword.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.txtpassword.FocusHighlightColor = System.Drawing.Color.Gainsboro;
            this.txtpassword.FocusHighlightEnabled = true;
            this.txtpassword.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.hl.SetHighlightOnFocus(this.txtpassword, true);
            this.txtpassword.Location = new System.Drawing.Point(94, 94);
            this.txtpassword.Name = "txtpassword";
            this.txtpassword.PasswordChar = '.';
            this.txtpassword.Size = new System.Drawing.Size(185, 21);
            this.txtpassword.TabIndex = 2;
            this.txtpassword.WatermarkColor = System.Drawing.SystemColors.ControlDarkDark;
            this.txtpassword.WatermarkText = "Şifre";
            // 
            // labelX2
            // 
            // 
            // 
            // 
            this.labelX2.BackgroundStyle.Class = "";
            this.labelX2.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.labelX2.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.labelX2.Location = new System.Drawing.Point(94, 66);
            this.labelX2.Name = "labelX2";
            this.labelX2.Size = new System.Drawing.Size(85, 22);
            this.labelX2.TabIndex = 5;
            this.labelX2.Text = "Şifre :";
            // 
            // btnok
            // 
            this.btnok.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btnok.CallBasePaintBackground = true;
            this.btnok.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btnok.Location = new System.Drawing.Point(94, 131);
            this.btnok.Name = "btnok";
            this.btnok.Size = new System.Drawing.Size(75, 23);
            this.btnok.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btnok.TabIndex = 3;
            this.btnok.Text = "Giriş";
            this.btnok.Click += new System.EventHandler(this.btnok_Click);
            // 
            // btncancel
            // 
            this.btncancel.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
            this.btncancel.CallBasePaintBackground = true;
            this.btncancel.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
            this.btncancel.Location = new System.Drawing.Point(204, 131);
            this.btncancel.Name = "btncancel";
            this.btncancel.Size = new System.Drawing.Size(75, 23);
            this.btncancel.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
            this.btncancel.TabIndex = 4;
            this.btncancel.Text = "İptal";
            this.btncancel.Click += new System.EventHandler(this.btncancel_Click);
            // 
            // hl
            // 
            this.hl.ContainerControl = this;
            this.hl.CustomHighlightColors = new System.Drawing.Color[] {
        System.Drawing.Color.Linen};
            this.hl.FocusHighlightColor = DevComponents.DotNetBar.Validator.eHighlightColor.Custom;
            // 
            // img
            // 
            // 
            // 
            // 
            this.img.BackgroundStyle.Class = "";
            this.img.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.img.BackgroundStyle.TextAlignment = DevComponents.DotNetBar.eStyleTextAlignment.Center;
            this.img.Image = ((System.Drawing.Image)(resources.GetObject("img.Image")));
            this.img.Location = new System.Drawing.Point(-24, -1);
            this.img.Name = "img";
            this.img.Size = new System.Drawing.Size(112, 143);
            this.img.TabIndex = 5;
            // 
            // frmLogin
            // 
            this.AcceptButton = this.btnok;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(285, 163);
            this.ControlBox = false;
            this.Controls.Add(this.btncancel);
            this.Controls.Add(this.btnok);
            this.Controls.Add(this.labelX2);
            this.Controls.Add(this.txtpassword);
            this.Controls.Add(this.txtusername);
            this.Controls.Add(this.labelX1);
            this.Controls.Add(this.img);
            this.DoubleBuffered = true;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximumSize = new System.Drawing.Size(301, 201);
            this.MinimumSize = new System.Drawing.Size(301, 201);
            this.Name = "frmLogin";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "DevLogy Online Destek Sistemi - Login";
            this.Load += new System.EventHandler(this.frmLogin_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private DevComponents.DotNetBar.StyleManager sl;
        private DevComponents.DotNetBar.Controls.ReflectionImage img;
        private DevComponents.DotNetBar.LabelX labelX1;
        private DevComponents.DotNetBar.Controls.TextBoxX txtusername;
        private DevComponents.DotNetBar.Controls.TextBoxX txtpassword;
        private DevComponents.DotNetBar.LabelX labelX2;
        private DevComponents.DotNetBar.ButtonX btnok;
        private DevComponents.DotNetBar.ButtonX btncancel;
        private DevComponents.DotNetBar.Validator.Highlighter hl;

    }
}

