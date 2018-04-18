using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class chatpro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HiddenField1.Value = Session["KADI"].ToString();
        Hidden1.Value = Session["ADSOYAD"].ToString();
        //TextBox1.Attributes.Add("onkeydown", "if(event.which || event.keyCode){if ((event.which == 13) || (event.keyCode == 13)) {form1.Button1.click();return false;}} else {return true}; ");
        Session["grupkimden"] = null;

        string baglan = "Data Source=(LocalDB)\v11.0;AttachDbFilename="F:\HDD\Devlogy Projeler\Devlogy Canlı Destek Sistemi v2.0 RC\Database\onlineDB.mdf";Integrated Security=True;Connect Timeout=30";
        SqlConnection baglanti = new SqlConnection(baglan);
        SqlCommand komut = new SqlCommand("update devonline.LOGIN set ONLINE=@ONLINE where LOGINID = @benimID", baglanti);

        komut.Parameters.Add("@benimID", SqlDbType.Int).Value = Convert.ToInt32(Session["yoneticiID"]);
        komut.Parameters.Add("@ONLINE", SqlDbType.Int).Value = 1;
        baglanti.Open();
        komut.ExecuteNonQuery();
        baglanti.Close();

    }
 
}