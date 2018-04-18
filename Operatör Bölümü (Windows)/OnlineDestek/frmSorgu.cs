using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using DevExpress.XtraReports.UI;
using System.Data.SqlClient;

namespace OnlineDestek
{
  public partial class frmSorgu : DevComponents.DotNetBar.Office2007Form
  {
    public frmSorgu()
    {
      CheckForIllegalCrossThreadCalls = false;
      InitializeComponent();
    }
    XtraReport Rapor;
    SqlConnection baglanti;
    IniFile ini = new IniFile(Application.StartupPath.ToString() + "\\Database.Ini");
    SqlDataAdapter adaptor;
    DataSet ds;
    private void frmSorgu_Load(object sender, EventArgs e)
    {
       
 

    }
 
    private void buttonX9_Click(object sender, EventArgs e)
    {
      switch (lblraporadi.Text)
      {
        case "Müşteri Listesi - Grafik":
          baglanti = new SqlConnection(ini.IniReadValue("ConnectionString", "ConStr"));
          adaptor = new SqlDataAdapter("select COUNT(*) AS TOPLAM ,DEPADI from devonline.ONLINEMUS,devonline.DEPARTMAN WHERE ONLINEMUS.DEPARTMAN=DEPARTMAN.DEPID group by devonline.DEPARTMAN.DEPADI", baglanti);
          ds = new DataSet();
          adaptor.Fill(ds);
          Rapor = XtraReport.FromFile(Application.StartupPath.ToString() + "\\Raporlar\\Musteri\\MusteriListesiGrafik.repx", true);
          Rapor.DataSource = ds;
          Rapor.ShowPreview ();
          break;
        case "Müşteri Listesi":

          baglanti = new SqlConnection(ini.IniReadValue("ConnectionString", "ConStr"));
          adaptor = new SqlDataAdapter("SELECT  devonline.ONLINEMUS.ADI, devonline.LOGIN.ADSOYAD, devonline.ONLINEMUS.IP, devonline.ONLINEMUS.ILKZAMAN, devonline.ONLINEMUS.SEHIR,devonline.ONLINEMUS.KABUL, devonline.DEPARTMAN.DEPADI FROM devonline.ONLINEMUS INNER JOIN devonline.DEPARTMAN ON devonline.ONLINEMUS.DEPARTMAN = devonline.DEPARTMAN.DEPID INNER JOIN devonline.LOGIN ON devonline.ONLINEMUS.DEPKULLANICIID = devonline.LOGIN.LOGINID WHERE (devonline.ONLINEMUS.KABUL = 1)", baglanti);
          ds= new DataSet();
          adaptor.Fill(ds);
          Rapor = XtraReport.FromFile(Application.StartupPath.ToString() + "\\Raporlar\\Musteri\\MusteriListesi.repx", true);
          Rapor.DataSource = ds;
          Rapor.ShowPreview();
          break;
        case "Operatör Listesi":

          baglanti = new SqlConnection(ini.IniReadValue("ConnectionString", "ConStr"));
          adaptor = new SqlDataAdapter("SELECT devonline.LOGIN.ADSOYAD, devonline.DEPARTMAN.DEPADI FROM devonline.LOGIN INNER JOIN devonline.DEPARTMAN ON devonline.LOGIN.DEPARTID = devonline.DEPARTMAN.DEPID", baglanti);
          ds = new DataSet();
          adaptor.Fill(ds);
          Rapor = XtraReport.FromFile(Application.StartupPath.ToString() + "\\Raporlar\\Operator\\OperatorListesi.repx", true);
          Rapor.DataSource = ds;
          Rapor.ShowPreview();
          break;


          case "Bloklu IP Listesi":
           baglanti = new SqlConnection(ini.IniReadValue("ConnectionString", "ConStr"));
          adaptor = new SqlDataAdapter("SELECT * from IPBAN", baglanti);
          ds = new DataSet();
          adaptor.Fill(ds);
          Rapor = XtraReport.FromFile(Application.StartupPath.ToString() + "\\Raporlar\\Musteri\\BlokluIpListesi.repx", true);
          Rapor.DataSource = ds;
          Rapor.ShowPreview();
          break;
          

        default:
          break;
      }
     
    }

    private void buttonX10_Click(object sender, EventArgs e)
    {
        this.Close();
    }
  }
}
