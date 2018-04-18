using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxEditors;
using System.Data.SqlClient;
using DevExpress.Web.ASPxGridView;

public partial class operatorler : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    //ASPxComboBox combo;
    //protected void ASPxGridView1_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    //{
    //    int satir = ASPxGridView1.FocusedRowIndex;
    //    combo = ASPxGridView1.FindEditRowCellTemplateControl(ASPxGridView1.datac, "DEPARTID");
    //    string baglan = "Data Source=(LocalDB)\v11.0;AttachDbFilename="F:\HDD\Devlogy Projeler\Devlogy Canlı Destek Sistemi v2.0 RC\Database\onlineDB.mdf";Integrated Security=True;Connect Timeout=30";
    //    SqlConnection baglanti = new SqlConnection(baglan);
    //    baglanti.Open();

    //    SqlCommand cmd = new SqlCommand("update devonline.LOGIN set DEPARTID=@DEPARTID", baglanti);
    //    cmd.Parameters.Add("@LOGINID", System.Data.SqlDbType.Int).Value = Convert.ToInt32(e.Keys[satir]);
    //    cmd.Parameters.Add("@DEPARTID", System.Data.SqlDbType.Int).Value = Convert.ToInt32(deger);
    //    cmd.ExecuteNonQuery();
    //    baglanti.Close();
   
    //}
}