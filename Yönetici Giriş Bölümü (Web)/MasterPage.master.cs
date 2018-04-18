using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
       bilgi.InnerHtml="<div id=yonID>" + Session["yoneticiID"].ToString() + "</div><div id=yonADI>" + Session["KADI"].ToString() + "</div>";
        
        HiddenField1.Value = Session["KADI"].ToString();
       
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



        Label1.Text = Session["KADI"].ToString();
        
        bbbb.Visible = false;
    }
    C1.Web.UI.Controls.C1Window.C1Window windowuygulama;
    C1.Web.UI.Controls.C1Window.C1Window windowchatpro;
    C1.Web.UI.Controls.C1Window.C1Window windowkonusmaizle;
    C1.Web.UI.Controls.C1Window.C1Window windowrapor;
    C1.Web.UI.Controls.C1Window.C1Window windowgecmis;

    C1.Web.UI.Controls.C1Window.C1Window windowdepartmanlar;
    C1.Web.UI.Controls.C1Window.C1Window windowoperatorler;
    C1.Web.UI.Controls.C1Window.C1Window windowyetkiler;
    C1.Web.UI.Controls.C1Window.C1Window windowayarlarim;
    C1.Web.UI.Controls.C1Window.C1Window windowyardim;
    C1.Web.UI.Controls.C1Window.C1Window hangipencere;
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        //pencereyarat("windowuygulama", 600, 500, "Uyg.Ayarları", "~/images/icons/mini/uygulamaayarlari.png","uygayarlari",false,false, Panel1);
    }
    

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        pencereyarat("windowkonusmaizle", 600, 500, "Konuşma İzle", "~/images/icons/mini/konusmalariizle.png","konusmaizle.aspx",false,false, Panel3);
    }
    
    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {
        pencereyarat("windowgecmis", 800, 600, "Geçmiş", "~/images/icons/mini/gecmiskonusmalar.png","GecmisKayitlar.aspx",true,true, Panel5);
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        bbbb.Visible = true;
        anadivbu.Visible = false;
        sabitdiv.Visible = false;
        sagtarafdiv.Visible = false;
        Timer1.Enabled = true;
        Label4.Text = "<br><br><br><br>Oturum Kapatılıyor<br>";
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        //pencereyarat("windowyardim", 600, 500, "Yardım", "~/images/icons/mini/yardim.png", Panel10);
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        //pencereyarat("windowayarlarim", 600, 500, "Ayarlarım", "~/images/icons/mini/ayarlarim.png", Panel9);
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        //pencereyarat("windowyetkiler", 600, 500, "Yetkiler", "~/images/icons/mini/yetkiler.png", Panel8);
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        pencereyarat("windowoperatorler", 670, 420, "Operatörler", "~/images/icons/mini/operatorler.png","operatorler.aspx",false,false, Panel7);
    }
    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        pencereyarat("windowdepartmanlar", 320, 300, "Departmanlar", "~/images/icons/mini/departmanlar.png","departmanlar.aspx",false,false, Panel6);
    }
    
    private void pencereyarat(string id,int width,int height,string baslik,string iconurl,string contenturl,bool maximize,bool resize,Control panelno)
    {
        hangipencere = new C1.Web.UI.Controls.C1Window.C1Window();
        hangipencere.ID = id;
        hangipencere.Height = height;
        hangipencere.Width = width;
        hangipencere.ShowOnLoad = true;
        hangipencere.Text = baslik;
        hangipencere.MinimizeZoneElementId = "minimizeler";
        hangipencere.VisualStyle = "Vista";
        hangipencere.CaptionButtons.Icon.Visible = true;
        hangipencere.ImageUrl = iconurl;
        hangipencere.StatusVisible = false;
        hangipencere.StartPosition = C1.Web.UI.Controls.C1Window.C1WindowPosition.Manual;
        hangipencere.X = 350;
        hangipencere.Y = 0;
        hangipencere.ContentUrl = contenturl;
        hangipencere.CaptionButtons.MaximizeButton.Visible = maximize;
        hangipencere.AllowResize = resize;
        hangipencere.OnClientDeactivated = "deneme1(" + id + ");";
        panelno.Controls.Add(this.hangipencere);
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Abandon();
        Response.Redirect("giris.aspx");
    }
}
