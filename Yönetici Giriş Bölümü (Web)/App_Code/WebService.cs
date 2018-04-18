using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService()]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService {

    public WebService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }


    [WebMethod(EnableSession = true)]
    public string count_al_yon()
    {
        int iReturn = 0;
        string baglan = "Data Source=LABPC\\SQLEXPRESS;Initial Catalog=onlineDB;Persist Security Info=True;User ID=devonline;Password=123456";
        SqlConnection baglanti = new SqlConnection(baglan);
        baglanti.Open();
        SqlCommand cmd = new SqlCommand("mustericountal", baglanti);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@KIMEID", SqlDbType.NVarChar).Value = Session["yoneticiID"].ToString();
        //cmd.Parameters.Add("@ZAMAN", SqlDbType.DateTime).Value = DateTime.Now.ToString();

        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            iReturn = int.Parse(dr["count"].ToString());
        }
        
        baglanti.Close();

        return iReturn.ToString();

    }

    int i = 0;
    [WebMethod(EnableSession = true)]

    public string mesaj_yaz_yon()
    {
        DateTime.Now.ToShortDateString();
        string deger = "";
        string connectionString = "Data Source=LABPC\\SQLEXPRESS;Initial Catalog=onlineDB;Persist Security Info=True;User ID=devonline;Password=123456";
        SqlConnection myConnection = new SqlConnection(connectionString);
        myConnection.Open();
        SqlCommand myCommand = new SqlCommand("yoneticimesajgoster", myConnection);
        myCommand.CommandType = CommandType.StoredProcedure;
        myCommand.Parameters.Add("@KIMEID", SqlDbType.NVarChar).Value = Session["yoneticiID"].ToString();
        myCommand.Parameters.Add("@ZAMAN", SqlDbType.Date).Value = DateTime.Now.ToShortDateString();

        SqlDataReader dr = myCommand.ExecuteReader();
        while (dr.Read())
        {

            
                if (dr["KIMEID"].ToString() == Session["yoneticiID"].ToString())
                {
                    deger += "<div id=" + dr["KIMDENID"].ToString() + " style='width:180px;' title=" + dr["MESAJID"].ToString() + " >" + dr["ADSOYAD"].ToString() + ":<br>&nbsp;&nbsp;" + dr["MESAJ"].ToString() + "</div>";

                }
                
                
                if (dr["KIMDENID"].ToString() == Session["yoneticiID"].ToString())
                 {
                     deger += "<div id=" + dr["KIMEID"].ToString() + " style='width:180px;' title=" + dr["MESAJID"].ToString() + " ><FONT COLOR=#696969>" + dr["ADSOYAD"].ToString() + ":<br>&nbsp;&nbsp;" + dr["MESAJ"].ToString() + "</FONT></div>";
                 }
                
                
        
        }
        myConnection.Close();
        
        return deger.ToString();


    }


    [WebMethod(EnableSession = true)]

    public string mesaj_okundu_yon(int MESAJID)
    {
        string donen="";
        string connectionString = "Data Source=LABPC\\SQLEXPRESS;Initial Catalog=onlineDB;Persist Security Info=True;User ID=devonline;Password=123456";
        SqlConnection myConnection = new SqlConnection(connectionString);
        myConnection.Open();
        SqlCommand cmd = new SqlCommand("update devonline.MESAJ set OKUNDU=0 where MESAJID=@MESAJID", myConnection);
        cmd.Parameters.Add("@MESAJID", SqlDbType.Int).Value = MESAJID;
        cmd.ExecuteNonQuery();
        SqlCommand cmd2 = new SqlCommand("SELECT     devonline.MESAJ.MESAJID, devonline.MESAJ.KIMDENID, devonline.MESAJ.KIMEID, devonline.MESAJ.MESAJ, devonline.MESAJ.ZAMAN, devonline.MESAJ.OKUNDU, devonline.LOGIN.ADSOYAD FROM devonline.MESAJ INNER JOIN devonline.LOGIN ON devonline.MESAJ.KIMDENID = devonline.LOGIN.LOGINID where devonline.MESAJ.MESAJID=@MESAJID", myConnection);
        cmd2.Parameters.Add("@MESAJID", SqlDbType.Int).Value = MESAJID;
        SqlDataReader dr = cmd2.ExecuteReader();
        if (dr.Read())
        {
            string mesaj = dr["MESAJ"].ToString();
            mesaj = mesaj.Replace(":D", "<img src='images/smiley/g2.gif' />");
            mesaj = mesaj.Replace(":)", "<img src='images/smiley/g1.gif' />");
            mesaj = mesaj.Replace(":(", "<img src='images/smiley/ag1.gif' />");
            mesaj = mesaj.Replace(":P", "<img src='images/smiley/gd.gif' />");
            mesaj = mesaj.Replace(";)", "<img src='images/smiley/ga.gif' />");
            donen = "<div id=" + dr["KIMDENID"].ToString() + " title=" + dr["ADSOYAD"].ToString() + ">&nbsp;&nbsp;" + mesaj + "</div>";
        }
        myConnection.Close();
        return donen;
    }  



    [WebMethod(EnableSession = true)]
    public string mesajekle_yon(string mesaj , int kimegidecek)
    {

        string baglan = "Data Source=LABPC\\SQLEXPRESS;Initial Catalog=onlineDB;Persist Security Info=True;User ID=devonline;Password=123456";
        SqlConnection baglanti = new SqlConnection(baglan);
        SqlCommand komut = new SqlCommand("devonline.musterichat", baglanti);
        komut.CommandType = CommandType.StoredProcedure;


        komut.Parameters.Add("@KIMDENID", SqlDbType.NVarChar).Value = Session["yoneticiID"].ToString();
        komut.Parameters.Add("@KIMEID", SqlDbType.NVarChar).Value = kimegidecek.ToString();
        komut.Parameters.Add("@MESAJ", SqlDbType.NVarChar).Value = mesaj + "<br>";
        komut.Parameters.Add("@ZAMAN", SqlDbType.DateTime).Value = DateTime.Now.ToString();
        baglanti.Open();
        komut.ExecuteNonQuery();
        baglanti.Close();

        return mesaj;
    }


    [WebMethod(EnableSession = true)]
    public string kisilistesi_yon()
    {
        string kisiler = "";
        string baglan = "Data Source=LABPC\\SQLEXPRESS;Initial Catalog=onlineDB;Persist Security Info=True;User ID=devonline;Password=123456";
        SqlConnection baglanti = new SqlConnection(baglan);
        SqlCommand komut = new SqlCommand("yoneticikisilistesi", baglanti);
        komut.CommandType = CommandType.StoredProcedure;
        komut.Parameters.Add("@LOGINID", SqlDbType.Int).Value = Convert.ToInt32(Session["yoneticiID"]);
        baglanti.Open();
        SqlDataReader dr = komut.ExecuteReader();
        while (dr.Read())
        {
            string a = dr["LOGINID"].ToString() + "a";
            if (Convert.ToInt32(dr["ONLINE"]) == 1)
            {
                kisiler += "<div id=" + a + " onclick=divyarat(this.id) class=chatprokisilistesi>&nbsp;<img src='images/icons/online.png'/>" + " " + dr["ADSOYAD"].ToString() + "</div>";
            }
            else
            {
                kisiler += "<div id=" + a + " onclick=divyarat(this.id) class=chatprokisilistesi >&nbsp;<img src='images/icons/offline.png'/>" + " " + dr["ADSOYAD"].ToString() + "</div>";
            }
                
            
            

        }
        baglanti.Close();

        return kisiler;



    }



    [WebMethod(EnableSession = true)]
    public string sanaldivolustur_yon()
    {
        string kisiler = "";
        string baglan = "Data Source=LABPC\\SQLEXPRESS;Initial Catalog=onlineDB;Persist Security Info=True;User ID=devonline;Password=123456";
        SqlConnection baglanti = new SqlConnection(baglan);
        SqlCommand komut = new SqlCommand("yoneticisanaldivolustur", baglanti);
        komut.CommandType = CommandType.StoredProcedure;
        komut.Parameters.Add("@benimID", SqlDbType.Int).Value = Convert.ToInt32(Session["yoneticiID"]);
        baglanti.Open();
        SqlDataReader dr = komut.ExecuteReader();
        while (dr.Read())
        {
            string a = dr["LOGINID"].ToString();
            
                kisiler += "<div id=" + a + "snldiv class=sanaldivler></div><br><br>";
            

        }
        baglanti.Close();

        return kisiler;
    }



    [WebMethod(EnableSession = true)]
    public string onlinekontrol_yon()
    {

        string durumlar = "";
        string baglan = "Data Source=LABPC\\SQLEXPRESS;Initial Catalog=onlineDB;Persist Security Info=True;User ID=devonline;Password=123456";
        SqlConnection baglanti = new SqlConnection(baglan);
        SqlCommand komut = new SqlCommand("yoneticionlinekontrol", baglanti);
        komut.CommandType = CommandType.StoredProcedure;
        komut.Parameters.Add("@benimID", SqlDbType.Int).Value = Convert.ToInt32(Session["yoneticiID"]);
        baglanti.Open();
        SqlDataReader dr = komut.ExecuteReader();
        while (dr.Read())
        {
            string n = dr["LOGINID"].ToString() + "n";
            if (Convert.ToInt32(dr["ONLINE"]) == 1)
            {
                durumlar += "<div id=" + n + " >" + "&nbsp;<img src='images/icons/online.png'/>" + " " + dr["ADSOYAD"].ToString() + "</div>";
            }
            else
            {
                durumlar += "<div id=" + n + " >" + "&nbsp;<img src='images/icons/offline.png'/>" + " " + dr["ADSOYAD"].ToString() + "</div>"; 
            }
                

        }
        baglanti.Close();

        return durumlar;
    }



     [WebMethod(EnableSession = true)]
    public string konusmalistesi_yon()
    {
        string opADI = "";
        string liste = "";
        string baglan = "Data Source=LABPC\\SQLEXPRESS;Initial Catalog=onlineDB;Persist Security Info=True;User ID=devonline;Password=123456;MultipleActiveResultSets=True";
        SqlConnection baglanti = new SqlConnection(baglan);
        SqlCommand komut = new SqlCommand("yoneticikonusmalar", baglanti);
        

        komut.CommandType = CommandType.StoredProcedure;
        
        baglanti.Open();
        SqlDataReader dr = komut.ExecuteReader();
        
        while (dr.Read())
        {
            int musID = Convert.ToInt32(dr["DEPKULLANICIID"]);
            SqlCommand komut2 = new SqlCommand("select * from devonline.LOGIN where LOGINID=@LOGINID", baglanti);
            komut2.Parameters.Add("@LOGINID", SqlDbType.Int).Value = musID;

            SqlDataReader dr2 = komut2.ExecuteReader();
            while (dr2.Read())
            {
                 opADI = dr2["ADSOYAD"].ToString();
            } 
            
            string a = dr["musID"].ToString();

            liste += "<div id=" + a + "-" + dr["DEPKULLANICIID"].ToString() + " tagName=deneme class=konusmalistesi onclick='kisianaliz(" + dr["musID"].ToString() + "," + dr["DEPKULLANICIID"].ToString() + ",this.id)' >" + " Müşteri&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: " + dr["ADI"].ToString() + "<br>Departman&nbsp;: " + dr["DEPADI"].ToString() + "<br>Operatör&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: " + opADI + "<br>Başlama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: " + dr["ILKZAMAN"].ToString() + "</div><br>";

            dr2.Close();
        }
        baglanti.Close();
         
        return liste;
    }


     [WebMethod(EnableSession = true)]
     public string konusmayaz_yon(string musID,string opID)
     {
         string opadi = "";
         string musadi = "";
         string liste = "";
         string baglan = "Data Source=LABPC\\SQLEXPRESS;Initial Catalog=onlineDB;Persist Security Info=True;User ID=devonline;Password=123456;MultipleActiveResultSets=True";
         SqlConnection baglanti = new SqlConnection(baglan);
         SqlCommand komut = new SqlCommand("yoneticikonusmalaryaz", baglanti);
         SqlCommand komut2 = new SqlCommand("select ADSOYAD from devonline.LOGIN where LOGINID=@LOGINID", baglanti);
         SqlCommand komut3 = new SqlCommand("select ADI from devonline.ONLINEMUS where musID=@musID", baglanti);

         komut.CommandType = CommandType.StoredProcedure;
         komut.Parameters.AddWithValue("KIMEID", SqlDbType.NVarChar).Value = musID;
         komut.Parameters.AddWithValue("KIMDENID", SqlDbType.NVarChar).Value = opID;
         komut2.Parameters.Add("@LOGINID", opID);
         komut3.Parameters.Add("@musID", musID);

         baglanti.Open();
         SqlDataReader dr = komut.ExecuteReader();
         SqlDataReader dr2 = komut2.ExecuteReader();
         SqlDataReader dr3 = komut3.ExecuteReader();

         while (dr.Read())
         {
             if (dr2.Read())
             {
                     opadi = dr2["ADSOYAD"].ToString();
             }
             
             if (dr3.Read())
             {
                 musadi = dr3["ADI"].ToString();
             }


             if (dr["KIMEID"].ToString() == musID)
             {
                 liste += "<div id=" + musID + " style='color:green;' >" + opadi + ": " + dr["MESAJ"].ToString() + "</div><br>";
                 
             }
             else
             {
                 liste += "<div id=" + opID + " style='color:blue;' >" + musadi + ": " + dr["MESAJ"].ToString() + "</div><br>";
             }
             

         }
         
         baglanti.Close();

         return liste;
     }


     [WebMethod(EnableSession = true)]
     public string konusmacount_yon(string musID, string opID)
     {
         string liste = "";
         string baglan = "Data Source=LABPC\\SQLEXPRESS;Initial Catalog=onlineDB;Persist Security Info=True;User ID=devonline;Password=123456";
         SqlConnection baglanti = new SqlConnection(baglan);
         SqlCommand komut = new SqlCommand("yoneticikonusmalarcount", baglanti);
         komut.CommandType = CommandType.StoredProcedure;
         komut.Parameters.AddWithValue("KIMEID", SqlDbType.NVarChar).Value = musID;
         komut.Parameters.AddWithValue("KIMDENID", SqlDbType.NVarChar).Value = opID;
         baglanti.Open();
         SqlDataReader dr = komut.ExecuteReader();
         while (dr.Read())
         {

             liste = dr["toplam"].ToString();

         }
         baglanti.Close();

         return liste;
     }



     [WebMethod(EnableSession = true)]
     public string onof_yon(int onofdeger)
     {


         string baglan = "Data Source=LABPC\\SQLEXPRESS;Initial Catalog=onlineDB;Persist Security Info=True;User ID=devonline;Password=123456";
         SqlConnection baglanti = new SqlConnection(baglan);
         SqlCommand komut = new SqlCommand("update devonline.LOGIN set ONLINE=@ONLINE where LOGINID = @benimID", baglanti);
         
         komut.Parameters.Add("@benimID", SqlDbType.Int).Value = Convert.ToInt32(Session["yoneticiID"]);
         komut.Parameters.Add("@ONLINE", SqlDbType.Int).Value = onofdeger;
         baglanti.Open();
         komut.ExecuteNonQuery();
         baglanti.Close();

         return onofdeger.ToString();
     }



     [WebMethod(EnableSession = true)]
     public string gecmiskayitlar_yon(int musID)
     {
         string kayitlar = "";
             string opADI = "";
         int opID = 0;
             string musADI = "";
         if (musID != null)
         {


             
             string baglan = "Data Source=LABPC\\SQLEXPRESS;Initial Catalog=onlineDB;Persist Security Info=True;User ID=devonline;Password=123456;MultipleActiveResultSets=True";
             SqlConnection baglanti = new SqlConnection(baglan);
             SqlCommand komut = new SqlCommand("select * from devonline.MESAJ where KIMEID=@KIMEID or KIMDENID=@KIMDENID", baglanti);
             SqlCommand komut2 = new SqlCommand("select * from devonline.LOGIN where LOGINID=@LOGINID", baglanti);
             SqlCommand komut3 = new SqlCommand("select * from devonline.ONLINEMUS where musID=@musID", baglanti);

             komut.Parameters.Add("@KIMEID", SqlDbType.NVarChar).Value = musID.ToString();
             komut.Parameters.Add("@KIMDENID", SqlDbType.NVarChar).Value = musID.ToString();
             komut3.Parameters.Add("@musID", SqlDbType.Int).Value = musID;
             baglanti.Open();
             SqlDataReader dr = komut.ExecuteReader();
             SqlDataReader dr2 = null;
             SqlDataReader dr3 = komut3.ExecuteReader();

             dr3.Read();
             musADI = dr3["ADI"].ToString();
             opID = Convert.ToInt32(dr3["DEPKULLANICIID"]);
             komut2.Parameters.Add("@LOGINID", SqlDbType.Int).Value = opID;
             dr2 = komut2.ExecuteReader();
             dr2.Read();
             opADI = dr2["ADSOYAD"].ToString();
             kayitlar = "<div style='background-image:url(App_Themes/Aqua/GridView/gvPagerBottomPanelBackground.gif); background-repeat:repeat-x; width:100%; height:50px; overflow:auto;'> <div style='margin-top:9px; font-family:Calibri; font-size:14px;'><FONT color=green>Operatör: " + opADI + "</font> ile <font color=blue>Müşteri: " + musADI + "</font> Konuşması Görüntüleniyor.  </div> </div>";
             kayitlar += "<div style='width:100%; height:300px; overflow:auto; font-family:calibri; font-size:14px;'>";
             while (dr.Read())
             {
                
                 if (Convert.ToInt32(dr["KIMEID"]) == musID)
                 {
                     kayitlar += "<FONT COLOR=Green>" + opADI + ": " + dr["MESAJ"].ToString() + "</FONT>";
                 }

                 if (Convert.ToInt32(dr["KIMEID"]) == opID)
                 {
                     kayitlar += "<FONT COLOR=Blue>" + musADI + ": " + dr["MESAJ"].ToString() + "</FONT>";
                 }
             }


             kayitlar += "</div>";

           
             dr.Close();
             dr2.Close();
             dr3.Close();
             baglanti.Close();
         }
             return kayitlar;
         
     }

     
}
