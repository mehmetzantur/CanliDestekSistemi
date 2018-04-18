using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.UI;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using System.Runtime.InteropServices;
using System.Windows.Forms;
using System.Media;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{
   
    public WebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod(EnableSession = true)]

    public string ayrildi()
    {

        int deger = 0;
        string connectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=onlineDB;Persist Security Info=True;User ID=devonline;Password=123456";
        SqlConnection myConnection = new SqlConnection(connectionString);
        myConnection.Open();
        SqlCommand myCommand = new SqlCommand("musteriayrildi", myConnection);
        myCommand.CommandType = CommandType.StoredProcedure;
        myCommand.Parameters.Add("@musID",SqlDbType.Int).Value= Convert.ToInt32(Session["musteriID"]);
        myCommand.ExecuteNonQuery();
        myConnection.Close();

        return deger.ToString();


    }

    [WebMethod(EnableSession = true)]

    public string onlinedurum()
    {

        int deger =0;
        string connectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=onlineDB;Persist Security Info=True;User ID=devonline;Password=123456";
        SqlConnection myConnection = new SqlConnection(connectionString);
        myConnection.Open();
        SqlCommand myCommand = new SqlCommand("musterionlinedurum", myConnection);
        myCommand.CommandType = CommandType.StoredProcedure;
        myCommand.Parameters.Add("@musID", SqlDbType.Int).Value = Convert.ToInt32(Session["musteriID"]);
        
       
        SqlDataReader dr = myCommand.ExecuteReader();
        if (dr.Read())
        {
            deger = Convert.ToInt32(dr["online"]);
        }
        myConnection.Close();

        return deger.ToString();


    }

    [WebMethod(EnableSession = true)]

    public string mesaj_yaz()
    {
        
        string deger = "";
        string connectionString = "Data Source=.\\SQLEXPRESS;Initial Catalog=onlineDB;Persist Security Info=True;User ID=devonline;Password=123456";
        SqlConnection myConnection = new SqlConnection(connectionString);
        myConnection.Open();
        SqlCommand myCommand = new SqlCommand("devonline.musterimesajgoster", myConnection);
        myCommand.CommandType = CommandType.StoredProcedure;
        myCommand.Parameters.Add("@KIMEID", SqlDbType.NVarChar).Value = Session["musteriID"].ToString();
        

        SqlDataReader dr = myCommand.ExecuteReader();
        while (dr.Read())
        {
           
                if (dr["KIMEID"].ToString() == Session["musteriID"].ToString())
                {
                    deger += "<div id=" + dr["KIMDENID"].ToString() + " title=" + dr["KADI"].ToString() + "><div id=" + dr["MESAJID"].ToString() + " title=" + dr["KIMDENID"].ToString() + ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + dr["MESAJ"].ToString() + "</div></div>";
                   
                }
                
          
        }
        myConnection.Close();
      
        return deger.ToString();
        
        
    }

       [WebMethod(EnableSession = true)]
    public string count_al()
    {
        int iReturn = 0;
        string baglan = "Data Source=.\\SQLEXPRESS;Initial Catalog=onlineDB;Persist Security Info=True;User ID=devonline;Password=123456";
        SqlConnection baglanti = new SqlConnection(baglan);
        baglanti.Open();
        SqlCommand cmd = new SqlCommand("mustericountal", baglanti);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@KIMEID", SqlDbType.NVarChar).Value = Session["musteriID"].ToString();


        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            iReturn = int.Parse(dr["count"].ToString());
        }

        baglanti.Close();
        zamanguncelle();
        return iReturn.ToString();

    }

       [WebMethod(EnableSession = true)]
       public string mesajekle(string mesaj)
       {

           string baglan = "Data Source=.\\SQLEXPRESS;Initial Catalog=onlineDB;Persist Security Info=True;User ID=devonline;Password=123456";
           SqlConnection baglanti = new SqlConnection(baglan);
           SqlCommand komut = new SqlCommand("devonline.musterichat", baglanti);
           komut.CommandType = CommandType.StoredProcedure;
          
                  
           komut.Parameters.Add("@KIMDENID", SqlDbType.NVarChar).Value = Session["musteriID"].ToString();
           komut.Parameters.Add("@KIMEID", SqlDbType.NVarChar).Value = Convert.ToInt32(Session["depkullanıcıid"]);
           komut.Parameters.Add("@MESAJ", SqlDbType.NVarChar).Value = mesaj + "<br>";
           komut.Parameters.Add("@ZAMAN", SqlDbType.DateTime).Value = DateTime.Now.ToString();
           baglanti.Open();
           komut.ExecuteNonQuery();
           baglanti.Close();

           return mesaj;
       }



       [WebMethod(EnableSession = true)]
       public string okunduyap(string MESAJID)
       {

           string baglan = "Data Source=.\\SQLEXPRESS;Initial Catalog=onlineDB;Persist Security Info=True;User ID=devonline;Password=123456";
           SqlConnection baglanti = new SqlConnection(baglan);
           baglanti.Open();
           SqlCommand komut = new SqlCommand("update devonline.MESAJ set OKUNDU=0 where MESAJID=@MESAJID", baglanti);
           komut.Parameters.Add("@MESAJID", SqlDbType.Int).Value = MESAJID;
           komut.ExecuteNonQuery();
           
           return "ok";
       }




       int kontrol = 0;
       int kabul = 0;
       string dondu = "";
       [WebMethod(EnableSession = true)]
       public string chatdurum()
       {
           if (kontrol==0)
           {
              
               System.IO.StreamReader StreamReader1 = new System.IO.StreamReader(Server.MapPath("db.txt"));
               string baglan = StreamReader1.ReadToEnd();
               StreamReader1.Close();
               SqlConnection baglanti = new SqlConnection(baglan);
               SqlCommand komut = new SqlCommand("devonline.musterikontrol", baglanti);
               komut.CommandType = CommandType.StoredProcedure;

               komut.Parameters.Add("@musID", Convert.ToInt32(Session["musteriID"]));
               baglanti.Open();
               SqlDataReader dr = komut.ExecuteReader();
               if (dr.Read())
               {
                   if ((int)dr["KABUL"] == 1)
                   {

                       Session["depkullanıcıid"] = dr["DEPKULLANICIID"];
                       Session.Timeout = 9999;
                       kabul = 1;
                       Session["kabul"] = "1";
                       Session.Timeout = 9999;
                       baglanti.Close();
                   }
                   else
                   {

                       //Button1.Enabled = false;
                       kabul = 0;
                       Session["kabul"] = "0";
                       Session.Timeout = 9999;
                       dondu = "<font color=red><b>" + "<font color=black>Sistem Mesajı: Hoşgeldiniz " + Session["musteriADI"].ToString() + "</font><br>Operatörlerimiz Size En Kısa Sürede Cevap Verecektir.Lütfen Bekleyiniz..." + "</b></font><br><hr />";
                       zamanguncelle();
                   }
               }
               if (kabul == 1)
               {

                   baglanti.Open();
                   SqlCommand komut2 = new SqlCommand("devonline.musteridepart", baglanti);
                   komut2.CommandType = CommandType.StoredProcedure;

                   komut2.Parameters.Add("@depart", Convert.ToInt32(Session["depkullanıcıid"]));
                   SqlDataReader dr2 = komut2.ExecuteReader();
                   if (dr2.Read())
                   {

                       string depad = dr2["ADSOYAD"].ToString();
                       Session["depkullaniciadi"] = depad;
                       Session.Timeout = 9999;
                       dondu = "<font color=green><b>" + "Sistem Mesajı: Hoşgeldiniz " + Session["musteriADI"].ToString() + "<br>Talep Ettiğiniz Görüşme Başlamıştır.</b></font>" + "<br><hr />";
                      

                     
                       kontrol = 1;
                       
                   }
                   baglanti.Close();

               }

           }

           return dondu;
       
       }

        [WebMethod(EnableSession = true)]
       public string depkart()
       {
           string kart = "";
           if (Session["kabul"] == "1")
           {
               Session["durum"] = "Aktif";
               kart = " <table class=style22><tr><td>Operatör: </td><td class=yesiller>" + Session["depkullaniciadi"].ToString() + "</td></tr><tr><td>Departman: </td><td class=yesiller>" + Session["departmanadi"].ToString() + "</td></tr><tr><td>Durum: </td><td class=yesiller>"+ Session["durum"].ToString() + "</td></tr></table>";
              
           }
           if (Session["kabul"] == "0")
           {
               Session["durum"] = "Bekliyor";
               kart = " <table class=style22><tr><td >Operatör: </td><td class=kirmizilar>Bekliyor</td></tr><tr><td>Departman: </td><td class=kirmizilar>" + Session["departmanadi"].ToString() + "</td></tr><tr><td>Durum: </td><td class=kirmizilar>" + Session["durum"].ToString() + "</td></tr></table>";
           }
           
           return kart;
       
       }

        private void zamanguncelle()
        {
            System.IO.StreamReader StreamReader1 = new System.IO.StreamReader(Server.MapPath("db.txt"));
            string baglan = StreamReader1.ReadToEnd();
            StreamReader1.Close();
            SqlConnection baglanti = new SqlConnection(baglan);
            SqlCommand komut = new SqlCommand("devonline.musterizamanguncelle", baglanti);
            komut.CommandType = CommandType.StoredProcedure;

            komut.Parameters.Add("@musID", Convert.ToInt32(Session["musteriID"]));
            komut.Parameters.Add("@zaman", DateTime.Now);
            baglanti.Open();
            komut.ExecuteNonQuery();
            baglanti.Close();
        }


        [WebMethod(EnableSession = true)]
        public string onofdurum_yon()
        {
            string durum = "";
            string baglan = "Data Source=.\\SQLEXPRESS;Initial Catalog=onlineDB;Persist Security Info=True;User ID=devonline;Password=123456;MultipleActiveResultSets=True";
            SqlConnection baglanti = new SqlConnection(baglan);
            baglanti.Open();
            SqlCommand cmd = new SqlCommand("select * from APPDURUM", baglanti);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                durum = dr["DURUM"].ToString();
            }
            baglanti.Close();
            return durum;
        }

}
