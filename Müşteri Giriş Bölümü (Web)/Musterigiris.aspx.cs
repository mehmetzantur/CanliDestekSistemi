using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

public partial class Musteri_giris : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string durum = "";
            string baglan = "Data Source= .\\SQLEXPRESS;Initial Catalog=onlineDB;Persist Security Info=True;User ID=devonline;Password=123456;MultipleActiveResultSets=True";
            SqlConnection baglanti = new SqlConnection(baglan);
            baglanti.Open();
            SqlCommand cmddurum = new SqlCommand("select * from APPDURUM", baglanti);
            SqlDataReader drdurum = cmddurum.ExecuteReader();
            if (drdurum.Read())
            {
                durum = drdurum["DURUM"].ToString();
            }

            if (durum == "1")
            {
                ImageButton1.Visible = true;
                ImageButton2.Visible = false;
                Session["appdurum"] = durum;
            }
            else
            {
                ImageButton2.Visible = true;
                ImageButton1.Visible = false;
                Session["appdurum"] = durum;
            }


            Session["depkullaniciadi"] = null;

            Session["durum"] = null;


            SqlCommand cmd = new SqlCommand("select * from IPBAN where IPNO=@IPNO", baglanti);
            cmd.Parameters.Add("@IPNO", HttpContext.Current.Request.UserHostAddress);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                TextBox1.Enabled = false;
                TextBox2.Enabled = false;
                TextBox3.Enabled = false;
                DropDownList1.Enabled = false;
                ImageButton1.Enabled = false;
                Panel2.Visible = false;
                Panel1.Visible = true;
                Label6.Text = "IP Adresiniz Sistem Tarafından Engellenmiştir!";
            }
            else
            {
                Panel1.Visible = false;
                Panel2.Visible = true;
            }
            baglanti.Close();
        }
        catch (Exception err)
        {
            Response.Write(err.Message);
            
        }
        
        
        
    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["departmanadi"] = DropDownList1.SelectedItem;
        

    }
  
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
            CaptchaControl1.ValidateCaptcha(TextBox4.Text);
        if (CaptchaControl1.UserValidated)
        {
            if (TextBox1.Text == "" || TextBox3.Text == "" || TextBox2.Text == "")
            {
                Label8.Text = "Bütün Alanları Doldurunuz.";
            }
            else
            {
                Session["a1"] = TextBox1.Text;
                Session["b1"] = TextBox3.Text;
                Session["c1"] = DropDownList1.SelectedValue;
                Session["d1"] = TextBox2.Text;
                HiddenField1.Value = "1";
                Response.Redirect("musterichat.aspx");
            }
        }
        else
        {
            TextBox4.Text = "Hata!";
        }
        
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        CaptchaControl1.ValidateCaptcha(TextBox4.Text);
        if (CaptchaControl1.UserValidated)
        {
            if (TextBox1.Text == "" || TextBox3.Text == "" || TextBox2.Text == "")
            {
                Label8.Text = "Bütün Alanları Doldurunuz.";
            }
            else
            {
                string baglan = "Data Source=.\\SQLEXPRESS;Initial Catalog=onlineDB;Persist Security Info=True;User ID=devonline;Password=123456;MultipleActiveResultSets=True";
                SqlConnection baglanti = new SqlConnection(baglan);
                baglanti.Open();
                SqlCommand komut = new SqlCommand("devonline.musterigiris", baglanti);
                komut.CommandType = CommandType.StoredProcedure;
                ipal ipalclass = new ipal();
                DataTable dt = new DataTable();
                dt = ipalclass.YerTespiti(HttpContext.Current.Request.UserHostAddress.ToString());

                komut.Parameters.Add("@ADI", SqlDbType.VarChar).Value = TextBox1.Text;
                komut.Parameters.Add("@EMAIL", SqlDbType.VarChar).Value = TextBox3.Text;
                komut.Parameters.Add("@DEPARTMAN", SqlDbType.VarChar).Value = DropDownList1.SelectedValue;
                komut.Parameters.Add("@MSJ", SqlDbType.Text).Value = TextBox2.Text;
                komut.Parameters.Add("@IP", SqlDbType.Text).Value = HttpContext.Current.Request.UserHostAddress;
                komut.Parameters.Add("@ILKZAMAN", SqlDbType.DateTime).Value = DateTime.Now.ToString();
                komut.Parameters.Add("@SONZAMAN", SqlDbType.DateTime).Value = DateTime.Now.ToString();
                komut.Parameters.Add("@BROWSER", SqlDbType.VarChar).Value = Request.Browser.Type;
                komut.Parameters.Add("@ISLETIMSIS", SqlDbType.Text).Value = Request.Browser.Platform;
                komut.Parameters.Add("@KABUL", SqlDbType.Int).Value = 3;
                komut.Parameters.Add("@DEPKULLANICIID", SqlDbType.Int).Value = 0;
                komut.Parameters.Add("@online", SqlDbType.Int).Value = 1;
                komut.Parameters.Add("@SEHIR", SqlDbType.NVarChar).Value = dt.Rows[0]["City"].ToString();
                komut.Parameters.Add("@ULKE", SqlDbType.NVarChar).Value = dt.Rows[0]["CountryName"].ToString();
                komut.Parameters.Add("@LAT", SqlDbType.NVarChar).Value = dt.Rows[0]["Latitude"].ToString();
                komut.Parameters.Add("@LONG", SqlDbType.NVarChar).Value = dt.Rows[0]["Longitude"].ToString();


                komut.ExecuteNonQuery();

                baglanti.Close();

                Panel2.Visible = false;
                Panel1.Visible = true;
                Label6.Text = "Mesajınız Alınmıştır.Operatörlerimiz En Kısa Sürede Size Dönecektir.";
                Label6.ForeColor = System.Drawing.Color.Green;
            }
        }
        else
        {
            TextBox4.Text = "Hata!";
        }
    }
}