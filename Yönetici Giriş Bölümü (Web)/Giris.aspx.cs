using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

public partial class Giris : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //TextBox1.Text = Session["yoneticiID"].ToString();
        aaa.Visible = false;
        TextBox1.Focus();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        
        
        if (TextBox1.Text != "" && TextBox2.Text != "")
        {
            string baglan = "Data Source=LABPC\\SQLEXPRESS;Initial Catalog=onlineDB;Persist Security Info=True;User ID=devonline;Password=123456";
            SqlConnection baglanti = new SqlConnection(baglan);

            baglanti.Open();
            SqlCommand cmd = new SqlCommand("uygulamalogin", baglanti);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@KADI", SqlDbType.VarChar).Value = TextBox1.Text;
            cmd.Parameters.Add("@PASS", SqlDbType.VarChar).Value = TextBox2.Text;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session["ADSOYAD"] = dr["ADSOYAD"].ToString();
                Session.Timeout = 9999;
                Session["KADI"] = dr["KADI"].ToString();
                Session.Timeout = 9999;
                Session["yoneticiID"] = dr["LOGINID"].ToString();
                Session.Timeout = 9999;
                
                aaa.Visible = true;
                C1Window1.ShowOnLoad = false;
                Timer1.Enabled = true;
                Label4.Text = "<br><br>Oturum Açılıyor<br>";
                
            }
            else
            {
                TextBox1.BackColor = Color.Red;
                TextBox2.BackColor = Color.Red;
                Label5.Visible = false;
                Label6.Visible = false;
            }
        }
        else
        {
            if (TextBox1.Text == "")
            {
                Label5.Visible = true;
                Label6.Visible = false;
            }
            if (TextBox2.Text == "")
            {
                Label5.Visible = false;
                Label6.Visible = true;
            }
        }

            
        
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Response.Redirect("Masaustu.aspx");
    }
}