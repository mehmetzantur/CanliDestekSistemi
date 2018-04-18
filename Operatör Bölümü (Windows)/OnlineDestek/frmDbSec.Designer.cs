namespace OnlineDestek
{
    partial class frmDbSec
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmDbSec));
            this.gbox = new System.Windows.Forms.GroupBox();
            this.rbsql = new System.Windows.Forms.RadioButton();
            this.sqlpanel = new System.Windows.Forms.Panel();
            this.ESQLServerPsd = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.ESQLServerUser = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.ESQLServerName = new DevComponents.DotNetBar.Controls.TextBoxX();
            this.btndbgoster = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.dbgv = new System.Windows.Forms.DataGridView();
            this.Column1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.sm = new DevComponents.DotNetBar.StyleManager(this.components);
            this.btnvazgec = new System.Windows.Forms.Button();
            this.btnsec = new System.Windows.Forms.Button();
            this.hl = new DevComponents.DotNetBar.Validator.Highlighter();
            this.button1 = new System.Windows.Forms.Button();
            this.gbox.SuspendLayout();
            this.sqlpanel.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dbgv)).BeginInit();
            this.SuspendLayout();
            // 
            // gbox
            // 
            this.gbox.Controls.Add(this.rbsql);
            this.gbox.Dock = System.Windows.Forms.DockStyle.Top;
            this.gbox.Location = new System.Drawing.Point(0, 0);
            this.gbox.Name = "gbox";
            this.gbox.Size = new System.Drawing.Size(307, 70);
            this.gbox.TabIndex = 12;
            this.gbox.TabStop = false;
            this.gbox.Text = "Aktif Database";
            // 
            // rbsql
            // 
            this.rbsql.AutoSize = true;
            this.rbsql.Checked = true;
            this.rbsql.Location = new System.Drawing.Point(6, 29);
            this.rbsql.Name = "rbsql";
            this.rbsql.Size = new System.Drawing.Size(126, 17);
            this.rbsql.TabIndex = 10;
            this.rbsql.TabStop = true;
            this.rbsql.Text = "Microsoft SQL Server";
            this.rbsql.UseVisualStyleBackColor = true;
            // 
            // sqlpanel
            // 
            this.sqlpanel.Controls.Add(this.ESQLServerPsd);
            this.sqlpanel.Controls.Add(this.ESQLServerUser);
            this.sqlpanel.Controls.Add(this.ESQLServerName);
            this.sqlpanel.Controls.Add(this.btndbgoster);
            this.sqlpanel.Controls.Add(this.label3);
            this.sqlpanel.Controls.Add(this.label2);
            this.sqlpanel.Controls.Add(this.label1);
            this.sqlpanel.Controls.Add(this.dbgv);
            this.sqlpanel.Location = new System.Drawing.Point(1, 63);
            this.sqlpanel.Name = "sqlpanel";
            this.sqlpanel.Size = new System.Drawing.Size(304, 389);
            this.sqlpanel.TabIndex = 13;
            // 
            // ESQLServerPsd
            // 
            // 
            // 
            // 
            this.ESQLServerPsd.Border.Class = "TextBoxBorder";
            this.ESQLServerPsd.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.ESQLServerPsd.FocusHighlightColor = System.Drawing.Color.Gainsboro;
            this.ESQLServerPsd.FocusHighlightEnabled = true;
            this.ESQLServerPsd.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.hl.SetHighlightOnFocus(this.ESQLServerPsd, true);
            this.ESQLServerPsd.Location = new System.Drawing.Point(107, 64);
            this.ESQLServerPsd.Name = "ESQLServerPsd";
            this.ESQLServerPsd.PasswordChar = '.';
            this.ESQLServerPsd.Size = new System.Drawing.Size(100, 21);
            this.ESQLServerPsd.TabIndex = 3;
            // 
            // ESQLServerUser
            // 
            // 
            // 
            // 
            this.ESQLServerUser.Border.Class = "TextBoxBorder";
            this.ESQLServerUser.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.ESQLServerUser.FocusHighlightColor = System.Drawing.Color.Gainsboro;
            this.ESQLServerUser.FocusHighlightEnabled = true;
            this.ESQLServerUser.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.hl.SetHighlightOnFocus(this.ESQLServerUser, true);
            this.ESQLServerUser.Location = new System.Drawing.Point(107, 40);
            this.ESQLServerUser.Name = "ESQLServerUser";
            this.ESQLServerUser.Size = new System.Drawing.Size(100, 21);
            this.ESQLServerUser.TabIndex = 2;
            // 
            // ESQLServerName
            // 
            // 
            // 
            // 
            this.ESQLServerName.Border.Class = "TextBoxBorder";
            this.ESQLServerName.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
            this.ESQLServerName.FocusHighlightColor = System.Drawing.Color.Gainsboro;
            this.ESQLServerName.FocusHighlightEnabled = true;
            this.ESQLServerName.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.hl.SetHighlightOnFocus(this.ESQLServerName, true);
            this.ESQLServerName.Location = new System.Drawing.Point(107, 14);
            this.ESQLServerName.Name = "ESQLServerName";
            this.ESQLServerName.Size = new System.Drawing.Size(193, 21);
            this.ESQLServerName.TabIndex = 1;
            // 
            // btndbgoster
            // 
            this.btndbgoster.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.btndbgoster.Image = ((System.Drawing.Image)(resources.GetObject("btndbgoster.Image")));
            this.btndbgoster.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btndbgoster.Location = new System.Drawing.Point(216, 38);
            this.btndbgoster.Name = "btndbgoster";
            this.btndbgoster.Size = new System.Drawing.Size(84, 46);
            this.btndbgoster.TabIndex = 4;
            this.btndbgoster.Text = "DB Göster";
            this.btndbgoster.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btndbgoster.UseVisualStyleBackColor = true;
            this.btndbgoster.Click += new System.EventHandler(this.btndbgoster_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(3, 62);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(77, 13);
            this.label3.TabIndex = 9;
            this.label3.Text = "SQL User Pwd";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(3, 38);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(84, 13);
            this.label2.TabIndex = 8;
            this.label2.Text = "SQL User Name";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(3, 16);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(101, 13);
            this.label1.TabIndex = 7;
            this.label1.Text = "SQL Server Adı / IP";
            // 
            // dbgv
            // 
            this.dbgv.AllowUserToAddRows = false;
            this.dbgv.AllowUserToResizeColumns = false;
            this.dbgv.AllowUserToResizeRows = false;
            this.dbgv.BackgroundColor = System.Drawing.SystemColors.Control;
            this.dbgv.ColumnHeadersHeight = 100;
            this.dbgv.ColumnHeadersVisible = false;
            this.dbgv.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Column1});
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.White;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.Color.CornflowerBlue;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dbgv.DefaultCellStyle = dataGridViewCellStyle1;
            this.dbgv.Location = new System.Drawing.Point(2, 90);
            this.dbgv.MultiSelect = false;
            this.dbgv.Name = "dbgv";
            this.dbgv.ReadOnly = true;
            this.dbgv.RowHeadersVisible = false;
            this.dbgv.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dbgv.Size = new System.Drawing.Size(300, 294);
            this.dbgv.TabIndex = 7;
            this.dbgv.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dbgv_CellClick);
            // 
            // Column1
            // 
            this.Column1.DataPropertyName = "name";
            this.Column1.HeaderText = "";
            this.Column1.Name = "Column1";
            this.Column1.ReadOnly = true;
            this.Column1.Visible = false;
            this.Column1.Width = 297;
            // 
            // sm
            // 
            this.sm.ManagerStyle = DevComponents.DotNetBar.eStyle.Office2010Silver;
            // 
            // btnvazgec
            // 
            this.btnvazgec.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnvazgec.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.btnvazgec.Image = ((System.Drawing.Image)(resources.GetObject("btnvazgec.Image")));
            this.btnvazgec.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnvazgec.Location = new System.Drawing.Point(225, 458);
            this.btnvazgec.Name = "btnvazgec";
            this.btnvazgec.Size = new System.Drawing.Size(80, 32);
            this.btnvazgec.TabIndex = 6;
            this.btnvazgec.Text = "&Vazgeç";
            this.btnvazgec.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnvazgec.UseVisualStyleBackColor = true;
            this.btnvazgec.Click += new System.EventHandler(this.btnvazgec_Click);
            // 
            // btnsec
            // 
            this.btnsec.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.btnsec.Image = ((System.Drawing.Image)(resources.GetObject("btnsec.Image")));
            this.btnsec.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnsec.Location = new System.Drawing.Point(139, 458);
            this.btnsec.Name = "btnsec";
            this.btnsec.Size = new System.Drawing.Size(80, 32);
            this.btnsec.TabIndex = 5;
            this.btnsec.Text = "&Seç";
            this.btnsec.UseVisualStyleBackColor = true;
            this.btnsec.Click += new System.EventHandler(this.btnsec_Click);
            // 
            // hl
            // 
            this.hl.ContainerControl = this;
            this.hl.CustomHighlightColors = new System.Drawing.Color[] {
        System.Drawing.Color.Linen};
            this.hl.FocusHighlightColor = DevComponents.DotNetBar.Validator.eHighlightColor.Custom;
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.button1.Image = ((System.Drawing.Image)(resources.GetObject("button1.Image")));
            this.button1.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.button1.Location = new System.Drawing.Point(3, 458);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(87, 32);
            this.button1.TabIndex = 14;
            this.button1.Text = "DB Oluştur";
            this.button1.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // frmDbSec
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.btnvazgec;
            this.ClientSize = new System.Drawing.Size(307, 497);
            this.ControlBox = false;
            this.Controls.Add(this.button1);
            this.Controls.Add(this.gbox);
            this.Controls.Add(this.btnvazgec);
            this.Controls.Add(this.btnsec);
            this.Controls.Add(this.sqlpanel);
            this.DoubleBuffered = true;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximumSize = new System.Drawing.Size(323, 535);
            this.MinimumSize = new System.Drawing.Size(323, 535);
            this.Name = "frmDbSec";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Database Seçiniz";
            this.Load += new System.EventHandler(this.frmDbSec_Load);
            this.gbox.ResumeLayout(false);
            this.gbox.PerformLayout();
            this.sqlpanel.ResumeLayout(false);
            this.sqlpanel.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dbgv)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox gbox;
        private System.Windows.Forms.RadioButton rbsql;
        private System.Windows.Forms.Panel sqlpanel;
        private System.Windows.Forms.Button btndbgoster;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView dbgv;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column1;
        private DevComponents.DotNetBar.StyleManager sm;
        private System.Windows.Forms.Button btnvazgec;
        private System.Windows.Forms.Button btnsec;
        private DevComponents.DotNetBar.Controls.TextBoxX ESQLServerName;
        private DevComponents.DotNetBar.Controls.TextBoxX ESQLServerUser;
        private DevComponents.DotNetBar.Controls.TextBoxX ESQLServerPsd;
        private DevComponents.DotNetBar.Validator.Highlighter hl;
        private System.Windows.Forms.Button button1;
    }
}