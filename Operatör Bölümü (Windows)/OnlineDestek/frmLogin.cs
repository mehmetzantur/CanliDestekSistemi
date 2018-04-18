using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using DevComponents.DotNetBar;

namespace OnlineDestek
{
    public partial class frmLogin : DevComponents.DotNetBar.Office2007Form 
    {
        public frmLogin()
        {
            InitializeComponent();
            CheckForIllegalCrossThreadCalls = false;
        }

        SqlConnection baglanti;
        IniFile ini = new IniFile(Application.StartupPath.ToString() + "\\Database.Ini");
        ClassAyarlarMethodlar methods = new ClassAyarlarMethodlar();
        int yetki = 0;
        private void frmLogin_Load(object sender, EventArgs e)
        {
            
            
        }

       
        private void btncancel_Click(object sender, EventArgs e)
        {
            DialogResult rs = new DialogResult();
            rs=DevComponents.DotNetBar.MessageBoxEx.Show("Uygulama kapanacaktır,emin misiniz?", this.Text, MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (rs == DialogResult.Yes)
            {
                this.Close();
            }


        }


        private int Cevir(object o)
        {
            return (o == null || o == DBNull.Value) ? 0 : Convert.ToInt32(o);
        }


        private void btnok_Click(object sender, EventArgs e)
        {


           
          //bool varyok=methods.InternetVarmi ();
         
          //if (varyok==true)
          //{

            try
            {
              baglanti = new SqlConnection(ini.IniReadValue("ConnectionString", "ConStr"));
              DataSet ds = new DataSet();
              SqlDataAdapter adaptor = new SqlDataAdapter("SELECT devonline.LOGIN.YETKI,devonline.LOGIN.LOGINID, devonline.LOGIN.KADI, devonline.LOGIN.PASS,devonline.DEPARTMAN.DEPID,devonline.DEPARTMAN.DEPADI, devonline.LOGIN.ADSOYAD FROM devonline.LOGIN LEFT OUTER JOIN devonline.DEPARTMAN ON devonline.LOGIN.DEPARTID = devonline.DEPARTMAN.DEPID WHERE devonline.LOGIN.KADI=@USERNAME AND devonline.LOGIN.PASS=@PASS", baglanti);
              adaptor.SelectCommand.Parameters.AddWithValue("@USERNAME", txtusername.Text);
              adaptor.SelectCommand.Parameters.AddWithValue("@PASS", txtpassword.Text);
              int s = (adaptor.Fill(ds));


              if (s >= 1)
              {
                int loginid = Convert.ToInt32(ds.Tables[0].Rows[0]["LOGINID"]);
                yetki = Cevir(ds.Tables[0].Rows[0]["YETKI"]);
                SqlCommand rowselect = new SqlCommand("select count(*) from devonline.USERSTATUS WHERE KULLANICIID=@KULLANICIID", baglanti);
                baglanti.Open();
                rowselect.Parameters.AddWithValue("@KULLANICIID", loginid);
                int kayitsayisi = Convert.ToInt32(rowselect.ExecuteScalar());
                if (kayitsayisi < 1)
                {
                  SqlCommand userstatusinsert = new SqlCommand("insert into devonline.USERSTATUS (KULLANICIID,ONLINE) VALUES(@KULLANICIID,@ONLINE)", baglanti);
                  userstatusinsert.Parameters.AddWithValue("@KULLANICIID", loginid);
                  userstatusinsert.Parameters.AddWithValue("@ONLINE", 1);
                  userstatusinsert.ExecuteNonQuery();
                }
                else
                {
                  SqlCommand cmdupdate = new SqlCommand("update devonline.USERSTATUS set ONLINE=1 WHERE KULLANICIID=@KULLANICIID", baglanti);

                  cmdupdate.Parameters.AddWithValue("@KULLANICIID", loginid);
                  cmdupdate.ExecuteNonQuery();

                  SqlCommand cmdinsert = new SqlCommand("update devonline.LOGIN set ONLINE=1 WHERE LOGINID=@LOGINID", baglanti);

                  cmdinsert.Parameters.AddWithValue("@LOGINID", loginid);
                  cmdinsert.ExecuteNonQuery();
                }
                baglanti.Close();
                this.Hide();
                frmMain anaform = new frmMain();
                anaform.loginid = loginid;
                anaform.yetki = yetki;
                anaform.btnaktifkullanici.Text = txtusername.Text;
                anaform.btndepartman.Text = ds.Tables[0].Rows[0]["DEPADI"].ToString();
                anaform.btndepid.Text = ds.Tables[0].Rows[0]["DEPID"].ToString();
                anaform.btnadsoyad.Text = ds.Tables[0].Rows[0]["ADSOYAD"].ToString();


                anaform.Show();
              }
              else
              {
                MessageBoxEx.Show("Yanlış kullanıcı adı veya şifre Girdiniz.Lütfen tekrar deneyiniz", "Hata",
                                        MessageBoxButtons.OK, MessageBoxIcon.Error);

              }



            }
            catch (Exception ex)
            {
              MessageBox.Show(ex.Message);

            }
          //}
          //else
          //{
          //  MessageBox.Show("İnternet bağlantınızı kontrol ediniz.", "Uyarı", MessageBoxButtons.OK, MessageBoxIcon.Information);
          //}
        }
    }
}
