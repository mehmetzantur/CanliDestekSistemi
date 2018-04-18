using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using DevComponents.DotNetBar;
using System.Data.SqlClient;
using System.IO;
using Microsoft.SqlServer.Management.Smo;
using Microsoft.SqlServer.Management.Common;
namespace OnlineDestek
{
    public partial class frmDbSec : DevComponents.DotNetBar.Office2007Form
    {
        public frmDbSec()
        {
            InitializeComponent();
        }

        string Pwd;
        DataSet ds;
        IniFile ini;
        DialogResult a;
        string sqlConnectionString;
        private void frmDbSec_Load(object sender, EventArgs e)
        {
            ClassAyarlarMethodlar ayr = new ClassAyarlarMethodlar();
            ayr.GridAyari(dbgv);
        }

        private void baglantiyap()
        {
            SqlConnection sqlbag = new SqlConnection("Server=" + ESQLServerName.Text + ";Database=master;" + "User ID=" + ESQLServerUser.Text + Pwd);
            SqlDataAdapter adaptor = new SqlDataAdapter("select top 100 name from sys.databases where name NOT IN ('master','model','tempdb','ReportServer','ReportServerTempDB','msdb')", sqlbag);
            ds = new DataSet();
            adaptor.Fill(ds);
            dbgv.DataSource = ds.Tables[0];
        }

        private void btndbgoster_Click(object sender, EventArgs e)
        {
            try
            {
                Pwd = ESQLServerPsd.Text;

                if (ESQLServerName.Text != "" || ESQLServerUser.Text != "")
                {
                   

                    if (ESQLServerPsd.Text == "")
                    {
                        Pwd = ";Password=" + ESQLServerPsd.Text + ";Trusted_Connection=False";

                        baglantiyap();
                    }
                    else
                    {
                        Pwd = ";Password=" + ESQLServerPsd.Text + ";Persist Security Info=True";
                        baglantiyap();
                    }
                }
                else
                {
                    MessageBoxEx.Show("Gerekli alanları doldurunuz.");
                }
               




                
            }
            catch (Exception ex)
            {
                MessageBoxEx.Show(ex.Message);
            }

        }

        private void btnsec_Click(object sender, EventArgs e)
        {
            if (File.Exists(Application.StartupPath.ToString() + "\\Database.Ini"))
            {
                a = MessageBox.Show("Sistemde kayıtlı bir database kaydı bulundu! Var olan kaydı değiştirmek istediğinizden emin misiniz?", "UYARI", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                if (a == DialogResult.Yes)
                {

                }
            }
            else
            {
                ini = new IniFile(Application.StartupPath.ToString() + "\\Database.Ini");

              

                if (rbsql.Checked == true)
                {
                    if (ESQLServerName.Text == "")
                    {
                        MessageBox.Show("Önce Server Adını Yazınız");
                        
                    }
                    if (ESQLServerUser.Text == "")
                    {
                        MessageBox.Show("Önce User Adını Yazınız");

                    }
                    if (dbgv.CurrentRow .Cells ["Column1"].Value.ToString () == "")
                    {
                        MessageBox.Show("Önce Database Seçiniz");
                    }
                    else
                    {

                        ini.IniWriteValue("Genel", "Db Type", "SQL Server");
                        ini.IniWriteValue("ConnectionString", "ConStr", "Data Source=" + ESQLServerName.Text + ";Initial Catalog=" + dbgv.CurrentRow.Cells["Column1"].Value.ToString() + ";User Id=" + ESQLServerUser.Text + Pwd+";MultipleActiveResultSets=True");
                        ini.IniWriteValue("Name", "Name", dbgv.CurrentRow.Cells["Column1"].Value.ToString ());

                        this.Hide();
                        frmLogin loginform = new frmLogin();
                        loginform.Show();

                    }

                }





            }
        }

        private void dbgv_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            

            try
            {
                Pwd = ESQLServerPsd.Text;

                if (ESQLServerName.Text != "" || ESQLServerUser.Text != "")
                {


                    if (ESQLServerPsd.Text == "")
                    {
                        Pwd = ";Password=" + ESQLServerPsd.Text + ";Trusted_Connection=False";

                       
                    }
                    else
                    {
                        Pwd = ";Password=" + ESQLServerPsd.Text + ";Persist Security Info=True";
                        
                    }
                }
                else
                {
                    MessageBoxEx.Show("Gerekli alanları doldurunuz.");
                }



                sqlConnectionString = "Data Source=" + ESQLServerName.Text + ";Initial Catalog=master;User Id=" + ESQLServerUser.Text + Pwd + ";MultipleActiveResultSets=True";

                FileInfo file = new FileInfo(Application.StartupPath.ToString() + "\\dbscript.sql");

                string script = file.OpenText().ReadToEnd();

                SqlConnection conn = new SqlConnection(sqlConnectionString);

                Server server = new Server(new ServerConnection(conn));


                server.ConnectionContext.ExecuteNonQuery(script);


            }
            catch (Exception ex)
            {
                MessageBoxEx.Show(ex.Message);
               
            }



          
           
        }

        private void btnvazgec_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
