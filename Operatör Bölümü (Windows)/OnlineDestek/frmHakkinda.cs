using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace OnlineDestek
{
    public partial class frmHakkinda : DevComponents.DotNetBar.Office2007Form 
    {
        public frmHakkinda()
        {
            InitializeComponent();
        }

        private void frmHakkinda_Load(object sender, EventArgs e)
        {

        }

        private void buttonX1_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
