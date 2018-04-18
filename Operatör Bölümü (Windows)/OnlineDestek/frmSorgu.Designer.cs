namespace OnlineDestek
{
  partial class frmSorgu
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
        this.superTabControl1 = new DevComponents.DotNetBar.SuperTabControl();
        this.superTabControlPanel1 = new DevComponents.DotNetBar.SuperTabControlPanel();
        this.lblraporadi = new DevComponents.DotNetBar.LabelX();
        this.superTabItem1 = new DevComponents.DotNetBar.SuperTabItem();
        this.buttonX9 = new DevComponents.DotNetBar.ButtonX();
        this.buttonX10 = new DevComponents.DotNetBar.ButtonX();
        ((System.ComponentModel.ISupportInitialize)(this.superTabControl1)).BeginInit();
        this.superTabControl1.SuspendLayout();
        this.superTabControlPanel1.SuspendLayout();
        this.SuspendLayout();
        // 
        // superTabControl1
        // 
        // 
        // 
        // 
        // 
        // 
        // 
        this.superTabControl1.ControlBox.CloseBox.Name = "";
        // 
        // 
        // 
        this.superTabControl1.ControlBox.MenuBox.Name = "";
        this.superTabControl1.ControlBox.Name = "";
        this.superTabControl1.ControlBox.SubItems.AddRange(new DevComponents.DotNetBar.BaseItem[] {
            this.superTabControl1.ControlBox.MenuBox,
            this.superTabControl1.ControlBox.CloseBox});
        this.superTabControl1.Controls.Add(this.superTabControlPanel1);
        this.superTabControl1.Dock = System.Windows.Forms.DockStyle.Top;
        this.superTabControl1.Location = new System.Drawing.Point(0, 0);
        this.superTabControl1.Name = "superTabControl1";
        this.superTabControl1.ReorderTabsEnabled = true;
        this.superTabControl1.SelectedTabFont = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold);
        this.superTabControl1.SelectedTabIndex = 0;
        this.superTabControl1.Size = new System.Drawing.Size(412, 56);
        this.superTabControl1.TabFont = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
        this.superTabControl1.TabIndex = 2;
        this.superTabControl1.Tabs.AddRange(new DevComponents.DotNetBar.BaseItem[] {
            this.superTabItem1});
        this.superTabControl1.TabStyle = DevComponents.DotNetBar.eSuperTabStyle.WinMediaPlayer12;
        // 
        // superTabControlPanel1
        // 
        this.superTabControlPanel1.Controls.Add(this.lblraporadi);
        this.superTabControlPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
        this.superTabControlPanel1.Location = new System.Drawing.Point(0, 23);
        this.superTabControlPanel1.Name = "superTabControlPanel1";
        this.superTabControlPanel1.Size = new System.Drawing.Size(412, 33);
        this.superTabControlPanel1.TabIndex = 1;
        this.superTabControlPanel1.TabItem = this.superTabItem1;
        // 
        // lblraporadi
        // 
        this.lblraporadi.BackColor = System.Drawing.Color.Transparent;
        // 
        // 
        // 
        this.lblraporadi.BackgroundStyle.Class = "";
        this.lblraporadi.BackgroundStyle.CornerType = DevComponents.DotNetBar.eCornerType.Square;
        this.lblraporadi.Location = new System.Drawing.Point(12, 3);
        this.lblraporadi.Name = "lblraporadi";
        this.lblraporadi.Size = new System.Drawing.Size(397, 23);
        this.lblraporadi.TabIndex = 32;
        this.lblraporadi.TextAlignment = System.Drawing.StringAlignment.Center;
        // 
        // superTabItem1
        // 
        this.superTabItem1.AttachedControl = this.superTabControlPanel1;
        this.superTabItem1.GlobalItem = false;
        this.superTabItem1.Name = "superTabItem1";
        this.superTabItem1.Text = "Rapor";
        // 
        // buttonX9
        // 
        this.buttonX9.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
        this.buttonX9.CallBasePaintBackground = true;
        this.buttonX9.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
        this.buttonX9.Location = new System.Drawing.Point(202, 62);
        this.buttonX9.Name = "buttonX9";
        this.buttonX9.Size = new System.Drawing.Size(100, 28);
        this.buttonX9.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
        this.buttonX9.TabIndex = 4;
        this.buttonX9.Text = "Raporla";
        this.buttonX9.Click += new System.EventHandler(this.buttonX9_Click);
        // 
        // buttonX10
        // 
        this.buttonX10.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
        this.buttonX10.CallBasePaintBackground = true;
        this.buttonX10.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
        this.buttonX10.Location = new System.Drawing.Point(308, 62);
        this.buttonX10.Name = "buttonX10";
        this.buttonX10.Size = new System.Drawing.Size(100, 28);
        this.buttonX10.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
        this.buttonX10.TabIndex = 5;
        this.buttonX10.Text = "Kapat";
        this.buttonX10.Click += new System.EventHandler(this.buttonX10_Click);
        // 
        // frmSorgu
        // 
        this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
        this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
        this.ClientSize = new System.Drawing.Size(412, 95);
        this.Controls.Add(this.buttonX10);
        this.Controls.Add(this.buttonX9);
        this.Controls.Add(this.superTabControl1);
        this.DoubleBuffered = true;
        this.MaximizeBox = false;
        this.MaximumSize = new System.Drawing.Size(428, 133);
        this.MinimizeBox = false;
        this.MinimumSize = new System.Drawing.Size(428, 133);
        this.Name = "frmSorgu";
        this.ShowIcon = false;
        this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
        this.Load += new System.EventHandler(this.frmSorgu_Load);
        ((System.ComponentModel.ISupportInitialize)(this.superTabControl1)).EndInit();
        this.superTabControl1.ResumeLayout(false);
        this.superTabControlPanel1.ResumeLayout(false);
        this.ResumeLayout(false);

    }

    #endregion

    private DevComponents.DotNetBar.SuperTabControl superTabControl1;
    private DevComponents.DotNetBar.SuperTabControlPanel superTabControlPanel1;
    private DevComponents.DotNetBar.SuperTabItem superTabItem1;
    private DevComponents.DotNetBar.ButtonX buttonX9;
    private DevComponents.DotNetBar.ButtonX buttonX10;
    public DevComponents.DotNetBar.LabelX lblraporadi;



  }
}