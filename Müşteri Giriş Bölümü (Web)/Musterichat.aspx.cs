using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;


public partial class Musteri_giris : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {

            

            if (Session["deger"] != null)
            {
                Session["deger"] = null;
            }

            if (Session["depkullanıcıid"] != null)
            {
                Session["depkullanıcıid"] = null;
            }
          
            string baglan = "Data Source=.\\SQLEXPRESS;Initial Catalog=onlineDB;Persist Security Info=True;User ID=devonline;Password=123456";
            SqlConnection baglanti = new SqlConnection(baglan);

            baglanti.Open();
            SqlCommand cmd = new SqlCommand("select * from IPBAN where IPNO=@IPNO", baglanti);
            cmd.Parameters.Add("@IPNO", HttpContext.Current.Request.UserHostAddress);
            SqlDataReader dr222 = cmd.ExecuteReader();
            if (dr222.Read())
            {
                Response.Redirect("musterigiris.aspx");
                baglanti.Close();
            }

            else
            {
                if (Session["a1"] != null && Session["b1"] != null && Session["c1"] != null && Session["d1"] != null)
                {
                string a1 =  Session["a1"].ToString();
                string b1 = Session["b1"].ToString();
                string c1 = Session["c1"].ToString ();
                string d1 = Session["d1"].ToString();

                



                    dr222.Close();
                    SqlCommand komut = new SqlCommand("devonline.musterigiris", baglanti);
                    komut.CommandType = CommandType.StoredProcedure;
                    ipal ipalclass = new ipal();
                    DataTable dt = new DataTable();
                    dt = ipalclass.YerTespiti(HttpContext.Current.Request.UserHostAddress.ToString());

                    komut.Parameters.Add("@ADI", SqlDbType.VarChar).Value = a1;
                    komut.Parameters.Add("@EMAIL", SqlDbType.VarChar).Value = b1;
                    komut.Parameters.Add("@DEPARTMAN", SqlDbType.VarChar).Value = c1;
                    komut.Parameters.Add("@MSJ", SqlDbType.Text).Value = d1;
                    komut.Parameters.Add("@IP", SqlDbType.Text).Value = HttpContext.Current.Request.UserHostAddress;
                    komut.Parameters.Add("@ILKZAMAN", SqlDbType.DateTime).Value = DateTime.Now.ToString();
                    komut.Parameters.Add("@SONZAMAN", SqlDbType.DateTime).Value = DateTime.Now.ToString();
                    komut.Parameters.Add("@BROWSER", SqlDbType.VarChar).Value = Request.Browser.Type;
                    komut.Parameters.Add("@ISLETIMSIS", SqlDbType.Text).Value = Request.Browser.Platform;
                    komut.Parameters.Add("@KABUL", SqlDbType.Int).Value = 0;
                    komut.Parameters.Add("@DEPKULLANICIID", SqlDbType.Int).Value = 0;
                    komut.Parameters.Add("@online", SqlDbType.Int).Value = 1;
                    komut.Parameters.Add("@SEHIR", SqlDbType.NVarChar).Value = dt.Rows[0]["City"].ToString();
                    komut.Parameters.Add("@ULKE", SqlDbType.NVarChar).Value = dt.Rows[0]["CountryName"].ToString();
                    komut.Parameters.Add("@LAT", SqlDbType.NVarChar).Value = dt.Rows[0]["Latitude"].ToString();
                    komut.Parameters.Add("@LONG", SqlDbType.NVarChar).Value = dt.Rows[0]["Longitude"].ToString();


                    Session["musteriID"] = komut.ExecuteScalar().ToString();

                    baglanti.Close();
                }
                else
                {
                    Response.Redirect("musterigiris.aspx");
                }

            }

           
            
        }


        HiddenField1.Value = Session["a1"].ToString();
        Session["musteriADI"] = Session["a1"].ToString();
        sanalmusid.InnerHtml = Session["musteriID"].ToString();
        TextBox2.Attributes.Add("onkeydown", "if(event.which || event.keyCode){if ((event.which == 13) || (event.keyCode == 13)) {form1.Button2.click();return false;}} else {return true}; ");
    }


   

  
}