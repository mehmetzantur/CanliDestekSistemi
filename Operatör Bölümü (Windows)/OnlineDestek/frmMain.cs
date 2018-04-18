using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using DevComponents.AdvTree;
using DevComponents.DotNetBar;
using System.Runtime.InteropServices;
using DevExpress.XtraReports.UI;
using DevComponents.DotNetBar.Controls;
using System.Media;



namespace OnlineDestek
{
  [ComVisible(true)]
    public partial class frmMain : DevComponents.DotNetBar.Office2007Form 
    {

      Timer _OpRefreshTimer = new Timer();

        public frmMain()
        {
            InitializeComponent();
            CheckForIllegalCrossThreadCalls = false;
            _OpRefreshTimer.Interval = 2000;
            _OpRefreshTimer.Tick += new EventHandler(OpRefreshTimer_Tick);
           
            
        }

        SqlConnection baglanti;
        IniFile ini = new IniFile(Application.StartupPath.ToString() + "\\Database.Ini");
        DataTable dt;
        SqlDataAdapter adaptor;
        TreeNode trnode,altnode;
        SqlCommand cmd,mesajgetir,mesajupdate;
        SqlDataReader rd,dr;
        public int loginid,yetki;
        int currentrow,nodeopid;
        int bekleyenmuscount;
        int scrollposition;
        string musip;
        TabPage mytabpage;
        PictureBox pcb,dpcb;
        RichTextBox rtb,drtb;
        TextBoxX txtmesajyaz,dtxtmesajyaz;
        PanelEx panel,dpanel;
        ButtonX buttonBlok, btngonder, dbtngonder, buttonMesaj, buttonLink;
        LabelItem linklabel,linkyarat,lblhazirlinklerim;
        TextBoxItem txtlinkmetin,txtlinkadres;
        ButtonItem btnlinkekle,btnshazirmesaj,btnslink;
        BackgroundWorker bw = null;

        public int Cevir(object o)
        {
            return (o == null || o == DBNull.Value) ? 0 : Convert.ToInt32(o);
        }


        private void OpRef()
        {
            try
            {

                baglanti = new SqlConnection(ini.IniReadValue("ConnectionString", "ConStr"));
                for (int i = 0; i <= operatoradvtree.Nodes.Count - 1; i++)
                {


                    for (int j = 0; j <= operatoradvtree.Nodes[i].Nodes.Count - 1; j++)
                    {
                        adaptor  = new SqlDataAdapter("select  ONLINE from  devonline.LOGIN WHERE LOGINID=@KID", baglanti);
                        adaptor.SelectCommand.Parameters.AddWithValue("@KID", Convert.ToInt32(operatoradvtree.Nodes[i].Nodes[j].Tag));

                        dt  = new DataTable();

                        adaptor.Fill(dt);


                        if (dt.Rows.Count > 0)
                        {
                            if (Convert.ToBoolean(dt.Rows[0]["ONLINE"]) == true)
                            {

                                operatoradvtree.Nodes[i].Nodes[j].ForeColor = Color.Green;
                                operatoradvtree.Nodes[i].Nodes[j].ImageIndex = 2;
                                operatoradvtree.Nodes[i].Nodes[j].SelectedImageIndex = 2;

                                
                                
                            }
                            else
                            {
                                operatoradvtree.Nodes[i].Nodes[j].ForeColor = Color.Red;
                                operatoradvtree.Nodes[i].Nodes[j].ImageIndex = 2;
                                operatoradvtree.Nodes[i].Nodes[j].SelectedImageIndex = 2;
                               
                                
                            }

                            baglanti = new SqlConnection(ini.IniReadValue("ConnectionString", "ConStr"));
                            SqlDataAdapter myadp = new SqlDataAdapter("SELECT * FROM devonline.MESAJ WHERE KIMDENID=" + Convert.ToInt32 (operatoradvtree.Nodes[i].Nodes[j] .Tag)+ "  AND OKUNDU=1 AND KIMEID=" + loginid, baglanti);
                            DataTable mydt = new DataTable();
                            myadp.Fill(mydt);

                            if (mydt.Rows.Count > 0)
                            {

                                operatoradvtree.Nodes[i].Nodes[j].ImageIndex = 1;
                                operatoradvtree.Nodes[i].Nodes[j].SelectedImageIndex = 1;
                            }
                            else
                            {
                                operatoradvtree.Nodes[i].Nodes[j].ImageIndex = 2;
                                operatoradvtree.Nodes[i].Nodes[j].SelectedImageIndex = 2;

                            }
                        }
                    }

                }
           }
           catch 
           {
              

           }


        }
        private void NodeOlustur()
        {

            baglanti = new SqlConnection(ini.IniReadValue("ConnectionString", "ConStr"));
            dt = new DataTable();
            adaptor = new SqlDataAdapter("SELECT * FROM devonline.DEPARTMAN ORDER BY DEPID ASC", baglanti);
            adaptor.Fill(dt);

            foreach (DataRow dr in dt.Rows)
            {
                trnode = new TreeNode();
                trnode.Text = dr["DEPADI"].ToString();
                trnode.Tag = dr["DEPID"].ToString();
                operatoradvtree.Nodes.Add(trnode);

                baglanti = new SqlConnection(ini.IniReadValue("ConnectionString", "ConStr"));
                if (baglanti.State == ConnectionState.Closed)
                {
                    baglanti.Open();
                }
                cmd = new SqlCommand("SELECT LOGINID AS KULLANICIID,ONLINE,DEPARTID,ADSOYAD,KADI FROM devonline.LOGIN ", baglanti);
                rd = cmd.ExecuteReader();
                

                    while (rd.Read())
                    {
                        altnode = new TreeNode();
                        if (rd["DEPARTID"].ToString() == trnode.Tag.ToString())
                        {
                            if (Convert.ToBoolean(rd["ONLINE"]) == true)
                            {





                                altnode.Text =rd["ADSOYAD"].ToString();
                                altnode.Tag = Convert.ToInt32(rd["KULLANICIID"]);
                                altnode.ForeColor = Color.Green;
                                altnode.NodeFont = new Font("Arial", 9, FontStyle.Bold); 
                                trnode.Nodes.Add(altnode);
                                altnode.ImageIndex = 1;


                            }
                            else
                            {


                                altnode.Text =rd["ADSOYAD"].ToString();
                                altnode.Tag = Convert.ToInt32(rd["KULLANICIID"]);
                                altnode.ForeColor = Color.Red;
                                altnode.NodeFont = new Font("Arial", 9, FontStyle.Bold); 
                                trnode.Nodes.Add(altnode);
                                altnode.ImageIndex = 1;

                            }
                        }
                    }
                


                rd.Close();
                if (baglanti.State == ConnectionState.Open)
                {
                    baglanti.Close();
                }



            }

        }
        
        
        //int sorgudonen = 0;
        //int sorgusabit = 0;

        //private void bekleyenmusterilersorgula()
        //{

        //    baglanti = new SqlConnection(ini.IniReadValue("ConnectionString", "ConStr"));
        //    if (baglanti.State == ConnectionState.Closed)
        //    {
        //        baglanti.Open();
        //    }

        //    SqlCommand sorgucmd = new SqlCommand("select count(*) as donen from devonline.ONLINEMUS where online=1",baglanti);
        //    SqlDataReader sorgudr = sorgucmd.ExecuteReader();
        //    if (sorgudr.Read())
        //    {
        //        sorgudonen = Convert.ToInt32(sorgudr["donen"]);
        //    }

        //    if (sorgudonen > sorgusabit)
        //    {
        //        sorgusabit = sorgudonen;
        //        bekleyenmusteriler();
        //    }
        //    baglanti.Close();
        //}

        private void bekleyenmusteriler()
        {

            
            baglanti = new SqlConnection(ini.IniReadValue("ConnectionString", "ConStr"));
            if (baglanti.State == ConnectionState.Closed)
            {
              baglanti.Open();
            }
            SqlCommand bekmuscmd = new SqlCommand("SELECT musID,ADI,IP,EMAIL,MSJ,ILKZAMAN,BROWSER,ISLETIMSIS,SEHIR,ULKE,LAT,LONG FROM  devonline.ONLINEMUS WHERE KABUL = 0 AND DEPARTMAN=@DEPID ORDER BY musID DESC", baglanti);
            bekmuscmd.Parameters.AddWithValue("@DEPID", Convert.ToInt32(btndepid.Text));
            SqlDataReader rdr = bekmuscmd.ExecuteReader();
            int i = 0;
            bekleyenmusteridgv.Rows.Clear();
            while (rdr.Read())
            {

                if (rdr.HasRows == true)
                {
                    bekleyenmusteridgv.Rows.Add();
                    bekleyenmusteridgv.Rows[i].Cells["musID"].Value = rdr.GetValue(0).ToString();
                    bekleyenmusteridgv.Rows[i].Cells["ADI"].Value = rdr.GetValue(1).ToString();
                    bekleyenmusteridgv.Rows[i].Cells["IP"].Value = rdr.GetValue(2).ToString();
                    bekleyenmusteridgv.Rows[i].Cells["EMAIL"].Value = rdr.GetValue(3).ToString();
                    bekleyenmusteridgv.Rows[i].Cells["MESAJ"].Value = rdr.GetValue(4).ToString();
                    bekleyenmusteridgv.Rows[i].Cells["ILKZAMAN"].Value = rdr.GetValue(5).ToString();
                    bekleyenmusteridgv.Rows[i].Cells["BROWSER"].Value = rdr.GetValue(6).ToString();
                    bekleyenmusteridgv.Rows[i].Cells["ISLETIMSIS"].Value = rdr.GetValue(7).ToString();
                    bekleyenmusteridgv.Rows[i].Cells["SEHIR"].Value = rdr.GetValue(8).ToString();
                    bekleyenmusteridgv.Rows[i].Cells["LAT"].Value = Convert.ToDouble(rdr.GetValue(10));
                    bekleyenmusteridgv.Rows[i].Cells["LAN"].Value = Convert.ToDouble(rdr.GetValue(11));
                    switch (rdr.GetValue(9).ToString())
                    {
                        case "Turkey":
                            bekleyenmusteridgv.Rows[i].Cells["ULKE"].Value = imglistflag.Images["turkey.png"];
                            break;
                        case "United States":
                            bekleyenmusteridgv.Rows[i].Cells["ULKE"].Value = imglistflag.Images["usa.png"];
                            break;
                        default:
                            break;
                    }
                    i++;

                    bekleyenmuscount = i;
                }


                if (bekleyenmusteridgv.Rows.Count > currentrow)
                {
                    bekleyenmusteridgv.CurrentCell = bekleyenmusteridgv["ADI", currentrow];
                }

                gcontrolmusteri.Text = "";
                gcontrolmusteri.Text = "Bekleyen Müşteri Sayısı: " + i;


                

            }
            rdr.Close();
            if (baglanti.State == ConnectionState.Open)
            {
                baglanti.Close();
            }
        }
        private void blokluipler()
        {
            baglanti = new SqlConnection(ini.IniReadValue("ConnectionString", "ConStr"));
            if (baglanti.State == ConnectionState.Closed)
            {
                baglanti.Open();
            }
            adaptor = new SqlDataAdapter("select * from IPBAN", baglanti);
            dt = new DataTable();
            adaptor.Fill(dt);
            blokluipdgv.DataSource = dt;
            blokluipdgv.Columns[0].Visible = false;
            blokluipdgv.Columns[1].HeaderText = "IP Adres";
        }



        private void bugungorusulenmusteriler()
        {
          
            baglanti = new SqlConnection(ini.IniReadValue("ConnectionString", "ConStr"));
            dt = new DataTable();
            adaptor = new SqlDataAdapter("SELECT devonline.LOGIN.LOGINID,devonline.LOGIN.ADSOYAD,devonline.DEPARTMAN.DEPADI,devonline.ONLINEMUS.ULKE,devonline.ONLINEMUS.SEHIR, devonline.ONLINEMUS.IP, devonline.ONLINEMUS.ADI, devonline.ONLINEMUS.EMAIL,devonline.ONLINEMUS.MSJ, CONVERT(varchar, devonline.ONLINEMUS.ILKZAMAN, 104) AS ILKZAMAN, devonline.ONLINEMUS.BROWSER FROM devonline.ONLINEMUS LEFT OUTER JOIN devonline.LOGIN ON devonline.ONLINEMUS.DEPKULLANICIID = devonline.LOGIN.LOGINID LEFT OUTER JOIN devonline.DEPARTMAN ON devonline.ONLINEMUS.DEPARTMAN = devonline.DEPARTMAN.DEPID WHERE     (devonline.ONLINEMUS.KABUL = 1)  AND (CONVERT(varchar, devonline.ONLINEMUS.ILKZAMAN, 104) = @ILKZAMAN) AND devonline.LOGIN.LOGINID =@LOGINID ORDER BY ILKZAMAN DESC", baglanti);
            adaptor.SelectCommand.Parameters.AddWithValue("@ILKZAMAN", DateTime.Now.ToShortDateString());
            adaptor.SelectCommand.Parameters.AddWithValue("@LOGINID", loginid);
            adaptor.Fill(dt);
            gorusulenmusteridgv.DataSource = dt;

            
        }
       

        private void frmMain_Load(object sender, EventArgs e)
        {

            
            txtlinkmetin = new TextBoxItem();
            txtlinkadres = new TextBoxItem();
            btnlinkekle = new ButtonItem();
            lblhazirlinklerim = new LabelItem();
            btnshazirmesaj = new ButtonItem();
			
			
            bw = new BackgroundWorker();
            bw.DoWork += new DoWorkEventHandler(bw_DoWork);
            bw.RunWorkerCompleted += new RunWorkerCompletedEventHandler(bw_RunWorkerCompleted);
            bw.RunWorkerAsync();

            bugungorusulenmusteriler();
            bekleyenmusteriler();
            blokluipler();
            NodeOlustur();
            _OpRefreshTimer.Enabled = true;

            ClassAyarlarMethodlar cls = new ClassAyarlarMethodlar();
            cls.GridAyari(bekleyenmusteridgv);
            cls.GridAyari(gorusulenmusteridgv);


           

           
           
            wbrowser.AllowWebBrowserDrop = false;
            wbrowser.IsWebBrowserContextMenuEnabled = false;
            wbrowser.WebBrowserShortcutsEnabled = false;
            wbrowser.ObjectForScripting = this;
            wbrowser.Url = new Uri(Application.StartupPath.ToString() + "\\map\\bingmap.html");

            

            
            
        }

        private void Oynat()
        {
            SoundPlayer mysoundplayer = new SoundPlayer(Application.StartupPath.ToString() + "\\Sounds\\Message.wav");
            mysoundplayer.Play();

        }

     
        void bw_DoWork(object sender, DoWorkEventArgs e)
        {

            try
            {

                if (tcgeo.TabPages.Count > 1)
                {


                    if (baglanti.State == ConnectionState.Closed)
                    {
                        baglanti.Open();
                    }



                    for (int i = 1; i < tcgeo.TabPages.Count; i++)
                    {

                       
                               
                        
                            

                        if (tcgeo.TabPages[i].Name.StartsWith("d_"))
                        {


                            if (baglanti.State == ConnectionState.Closed)
                            {
                                baglanti.Open();
                            }
                            mesajgetir = new SqlCommand("SELECT  devonline.MESAJ.MESAJID, devonline.MESAJ.KIMDENID, devonline.MESAJ.KIMEID, devonline.MESAJ.MESAJ, devonline.MESAJ.ZAMAN,devonline.MESAJ.OKUNDU, devonline.LOGIN.KADI FROM devonline.MESAJ INNER JOIN devonline.LOGIN ON devonline.MESAJ.KIMDENID = devonline.LOGIN.LOGINID WHERE (devonline.MESAJ.KIMEID ="+loginid+") AND (devonline.MESAJ.OKUNDU=1) ORDER BY devonline.MESAJ.MESAJID", baglanti);
                            dr = mesajgetir.ExecuteReader();

                            while (dr.Read())
                            {



                                if (dr.HasRows == true)
                                {
                                   

                                    if (tcgeo.TabPages[i].Name.Substring(2, Convert.ToInt32(tcgeo.TabPages[i].Name.Length - 2)) == dr["KIMDENID"].ToString())
                                    {

                                       
                                        tcgeo.TabPages[i].Controls["txtmesajlar" + tcgeo.TabPages[i].Name].Text += dr["KADI"].ToString() + ": " + dr["MESAJ"].ToString().Replace("<br>", "") + " (" + dr["ZAMAN"].ToString().Substring(11, 8) + ") \r\n";
                                        
                                        RichTextBox c = (RichTextBox)tcgeo.TabPages[i].Controls["txtmesajlar" + tcgeo.TabPages[i].Name];
                                        
                                        c.SelectionStart = c.TextLength;
                                        c.ScrollToCaret();
                                        Oynat();
                                        mesajupdate = new SqlCommand("UPDATE devonline.MESAJ SET devonline.MESAJ.OKUNDU=0 WHERE devonline.MESAJ.KIMEID=@KIMEID AND devonline.MESAJ.KIMDENID=@KIMDENID", baglanti);
                                        mesajupdate.Parameters.Add("@KIMEID", loginid);
                                        mesajupdate.Parameters.Add("@KIMDENID", Convert.ToInt32 (dr["KIMDENID"]));
                                        mesajupdate.ExecuteNonQuery();

                                    }
                                }


                            }






                            dr.Close();

                            if (baglanti.State == ConnectionState.Open)
                            {
                                baglanti.Close();
                            }
                           



                        }
                        else
                        {

                            adaptor = new SqlDataAdapter("select online,MVERILDI from devonline.ONLINEMUS where musID=" + tcgeo.TabPages[i].Name, baglanti);
                            dt = new DataTable();
                            adaptor.Fill(dt);

                            if (dt.Rows.Count > 0)
                            {
                                if (Convert.ToInt32(dt.Rows[0]["online"]) == 5 && Cevir(dt.Rows[0]["MVERILDI"]) == 0)
                                {
                                    tcgeo.TabPages[i].Controls["txtmesajlar_" + tcgeo.TabPages[i].Name].Text += Environment.NewLine + Environment.NewLine + "Müşteri Konuşmadan Ayrıldı.(" + DateTime.Now.ToLongTimeString().ToString() + ")" + Environment.NewLine + Environment.NewLine;
                                    MessageBox.Show("Müşteri Konuşmadan Ayrıldı. (" + tcgeo.TabPages[i].Text + " " + DateTime.Now.ToLongTimeString().ToString() + ")", "Sistem Mesajı");

                                    for (int ii = 0; ii < tcgeo.TabPages[i].Controls["panel_" + tcgeo.TabPages[i].Name].Controls.Count; ii++)
                                    {

                                        if (tcgeo.TabPages[i].Controls["panel_" + tcgeo.TabPages[i].Name].Controls[ii].Name == "btngonder_" + tcgeo.TabPages[i].Name)
                                        {
                                            tcgeo.TabPages[i].Controls["panel_" + tcgeo.TabPages[i].Name].Controls["btngonder_" + tcgeo.TabPages[i].Name].Enabled = false;
                                        }
                                    }



                                    if (baglanti.State == ConnectionState.Closed)
                                    {
                                        baglanti.Open();

                                    }
                                    cmd = new SqlCommand("UPDATE devonline.ONLINEMUS set MVERILDI=1 WHERE musID=" + Convert.ToInt32(tcgeo.TabPages[i].Name), baglanti);
                                    cmd.ExecuteNonQuery();
                                    if (baglanti.State == ConnectionState.Open)
                                    {
                                        baglanti.Close();
                                    }
                                    return;
                                }
                            }

                            if (baglanti.State == ConnectionState.Closed)
                            {
                                baglanti.Open();
                            }

                           
                            SqlCommand mesajgetir = new SqlCommand("SELECT devonline.MESAJ.MESAJID, devonline.MESAJ.KIMDENID, devonline.MESAJ.KIMEID, devonline.MESAJ.MESAJ, devonline.MESAJ.ZAMAN,devonline.ONLINEMUS.ADI FROM devonline.MESAJ LEFT OUTER JOIN devonline.ONLINEMUS ON devonline.MESAJ.KIMDENID = devonline.ONLINEMUS.musID WHERE KIMEID=" + loginid + " AND OKUNDU=1 ORDER BY MESAJID", baglanti);
                            SqlDataReader dr = mesajgetir.ExecuteReader();

                            while (dr.Read())
                            {



                                if (dr.HasRows == true)
                                {
                                    if (tcgeo.TabPages[i].Name == dr["KIMDENID"].ToString())
                                    {

                                        tcgeo.TabPages[i].Controls["txtmesajlar_" + tcgeo.TabPages[i].Name].Text += dr["ADI"].ToString() + ": " + dr["MESAJ"].ToString().Replace("<br>", "") + " (" + dr["ZAMAN"].ToString().Substring(11, 8) + ") \r\n";

                                        RichTextBox c = (RichTextBox)tcgeo.TabPages[i].Controls["txtmesajlar_" + tcgeo.TabPages[i].Name];
                                       
                                        c.SelectionStart = c.TextLength;
                                        c.ScrollToCaret();
                                        Oynat();
                                        SqlCommand mesajupdate = new SqlCommand("UPDATE devonline.MESAJ SET devonline.MESAJ.OKUNDU=0 WHERE devonline.MESAJ.KIMEID=@KIMEID", baglanti);
                                        mesajupdate.Parameters.Add("@KIMEID", loginid);
                                        mesajupdate.ExecuteNonQuery();

                                    }
                                }


                            }






                            dr.Close();

                            if (baglanti.State == ConnectionState.Open)
                            {
                                baglanti.Close();
                            }
                           




                        }

                    }
                   
              }

            }
            catch 
            {
               


            }
               
           
        }

  
        private void frmMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            
                if (MessageBoxEx.Show("Uygulama kapanacaktır,emin misiniz?", "Onay", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.No)
                {
                    e.Cancel = true;
                }
                else
                {

                  if (baglanti.State == ConnectionState.Closed)
                  {
                    baglanti.Open();
                  }
                  SqlCommand userstatusoff = new SqlCommand("update devonline.USERSTATUS SET ONLINE=0 WHERE KULLANICIID=@KULLANICIID", baglanti);
                  userstatusoff.Parameters.AddWithValue("@KULLANICIID", loginid);
                  userstatusoff.ExecuteNonQuery();
                  SqlCommand userstatusoff2 = new SqlCommand("update devonline.LOGIN SET ONLINE=0 WHERE LOGINID=@LOGINID", baglanti);
                  userstatusoff2.Parameters.AddWithValue("@LOGINID", loginid);
                  userstatusoff2.ExecuteNonQuery();

                  if (tcgeo.TabCount > 1)
                  {
                      foreach (TabPage tpage in tcgeo.TabPages)
                      {

                          if (tpage.Name != "tpharita" && tpage.Name.StartsWith("d_")==false)
                          {
                              
                              cmd = new SqlCommand("update devonline.ONLINEMUS set online=@online where musID=@musID", baglanti);

                              if (baglanti.State == ConnectionState.Closed)
                              {
                                  baglanti.Open();
                              }
                              try
                              {
                                  cmd.Parameters.AddWithValue("@online", 2);
                                  cmd.Parameters.AddWithValue("@musID", tpage.Name);
                                  cmd.ExecuteNonQuery();
                              }
                              catch (Exception ex)
                              {
                                  MessageBox.Show("Hata:" + ex.Message);
                              }
                              finally
                              {
                                  if (baglanti.State == ConnectionState.Open)
                                  {
                                      baglanti.Close();
                                  }
                              }

                          }
                      }
                  }
                  if (baglanti.State == ConnectionState.Open)
                  {
                    baglanti.Close();
                  }

                  foreach (System.Diagnostics.Process p in System.Diagnostics.Process.GetProcesses())
                    if (p.ProcessName == "OnlineDestek.vshost")
                    {
                      p.Kill();
                    }
                    else if (p.ProcessName == "OnlineDestek")
                    {
                      p.Kill();
                    }
                  

                }
                    
        }

        private void OpRefreshTimer_Tick(object sender, EventArgs e)
        {

            OpRef();
        }

        private void dbtngonder_Click(object sender, System.EventArgs e)
        {
            int id = Convert.ToInt32 (tcgeo.SelectedTab.Name.Substring(2,Convert.ToInt32 ( tcgeo.SelectedTab.Name.Length-2)));
            
            baglanti = new SqlConnection(ini.IniReadValue("ConnectionString", "ConStr"));
            cmd = new SqlCommand("SET DATEFORMAT DYM insert into devonline.MESAJ (KIMDENID,KIMEID,MESAJ,ZAMAN,OKUNDU) VALUES (@KIMDENID,@KIMEID,@MESAJ,@ZAMAN,@OKUNDU)", baglanti);
            cmd.Parameters.AddWithValue("@KIMDENID", loginid);
            cmd.Parameters.AddWithValue("@KIMEID",id);
            cmd.Parameters.AddWithValue("@MESAJ", tcgeo.SelectedTab.Controls["txtmesajyazd_" + id].Text + "<br>");
            cmd.Parameters.AddWithValue("@ZAMAN", DateTime.Now.ToString());
            cmd.Parameters.AddWithValue("@OKUNDU", 1);
            if (baglanti.State == ConnectionState.Closed)
            {
                baglanti.Open();
            }
            cmd.ExecuteNonQuery();
            tcgeo.SelectedTab.Controls["txtmesajlard_" + id].Text += btnadsoyad.Text + ": " + tcgeo.SelectedTab.Controls["txtmesajyazd_" + id].Text + " (" + DateTime.Now.ToLongTimeString().ToString() + ") \r\n";
            tcgeo.SelectedTab.Controls["txtmesajyazd_" + id].Text = "";
            RichTextBox c = (RichTextBox)tcgeo.SelectedTab.Controls["txtmesajlard_" + id];

            c.SelectionStart = c.TextLength;
            c.ScrollToCaret();
            if (baglanti.State == ConnectionState.Open)
            {
                baglanti.Close();
            }

        }

        private void btngonder_Click(object sender, System.EventArgs e)
        {


           
       
           baglanti = new SqlConnection(ini.IniReadValue("ConnectionString", "ConStr"));
           cmd = new SqlCommand("SET DATEFORMAT DYM insert into devonline.MESAJ (KIMDENID,KIMEID,MESAJ,ZAMAN,OKUNDU) VALUES (@KIMDENID,@KIMEID,@MESAJ,@ZAMAN,@OKUNDU)", baglanti);
           cmd.Parameters.AddWithValue("@KIMDENID", loginid);
           cmd.Parameters.AddWithValue("@KIMEID", Convert.ToInt32(tcgeo.SelectedTab.Name));
           cmd.Parameters.AddWithValue("@MESAJ", tcgeo.SelectedTab.Controls ["txtmesajyaz_" + tcgeo.SelectedTab.Name].Text+ "<br>");
           cmd.Parameters.AddWithValue("@ZAMAN", DateTime.Now.ToString());
           cmd.Parameters.AddWithValue("@OKUNDU", 1);
           if (baglanti.State == ConnectionState.Closed)
           {
               baglanti.Open();
           }
           cmd.ExecuteNonQuery();
           RichTextBox c = (RichTextBox)tcgeo.SelectedTab.Controls["txtmesajlar_" + tcgeo.SelectedTab.Name];
           
           tcgeo.SelectedTab.Controls["txtmesajlar_" + tcgeo.SelectedTab.Name].Text += btnadsoyad.Text + ": " + tcgeo.SelectedTab.Controls["txtmesajyaz_" + tcgeo.SelectedTab.Name].Text + " (" + DateTime.Now.ToLongTimeString().ToString() + ") \r\n";
           tcgeo.SelectedTab.Controls ["txtmesajyaz_" + tcgeo.SelectedTab.Name].Text = "";
          

           c.SelectionStart = c.TextLength;
           c.ScrollToCaret();
           if (baglanti.State == ConnectionState.Open)
           {
               baglanti.Close();
           }


           
            
        }

        private void buttonBlok_Click(object sender, System.EventArgs e)
        {
            if (baglanti.State == ConnectionState.Closed)
            {
                baglanti.Open();
            }
            //try
            //{

                SqlCommand ipvarmi = new SqlCommand("select count (*) FROM IPBAN WHERE IPNO=@IPNO", baglanti);
                ipvarmi.Parameters.AddWithValue("@IPNO", musip);

                ClassAyarlarMethodlar ch = new ClassAyarlarMethodlar();
                int ipcount = ch.Cevir(ipvarmi.ExecuteScalar());
                if (ipcount < 1)
                {
                    SqlCommand ipblokkomut = new SqlCommand("INSERT INTO IPBAN(IPNO) VALUES (@IPNO)", baglanti);
                    ipblokkomut.Parameters.AddWithValue("@IPNO", musip);
                    ipblokkomut.ExecuteNonQuery();
                    SqlCommand upkomutu = new SqlCommand("update devonline.ONLINEMUS set KABUL=@KABUL,DEPKULLANICIID=@DEPKUL WHERE musID=@musID", baglanti);
                    upkomutu.Parameters.AddWithValue("@KABUL", 2);
                    upkomutu.Parameters.AddWithValue("@DEPKUL", loginid);
                    upkomutu.Parameters.AddWithValue("@musID",Convert.ToInt32 (tcgeo.SelectedTab.Name));

                    upkomutu.ExecuteNonQuery();
                    blokluipler();
                    MessageBox.Show("Ip Adresi Bloklanmıştır. (" + musip + ")");

                }



                if (baglanti.State == ConnectionState.Open)
                {
                    baglanti.Close();
                }

            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message);

            //}
            //finally
            //{
            //    if (baglanti.State == ConnectionState.Open)
            //    {
            //        baglanti.Close();
            //    }
            //}
        }

        private void dtxtmesajyaz_KeyPress(object sender, KeyPressEventArgs e)
        {



            if (e.KeyChar == (char)13)
            {


                dbtngonder.PerformClick();
                e.Handled = true;


            }
        }

        private void txtmesajyaz_KeyPress(object sender,KeyPressEventArgs e)
        {

            

            if (e.KeyChar == (char)13)
            {

               
                btngonder.PerformClick();
                e.Handled = true;

                
            }
        }
        private void müşteriyiKonuşmayaAlToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //try
            //{
                musip = bekleyenmusteridgv.CurrentRow.Cells["IP"].Value.ToString();
                SqlCommand upkomutu = new SqlCommand("update devonline.ONLINEMUS set KABUL=@KABUL,DEPKULLANICIID=@DEPKUL WHERE musID=@musID", baglanti);
                upkomutu.Parameters.AddWithValue("@KABUL", 1);
                upkomutu.Parameters.AddWithValue("@DEPKUL", loginid);
                upkomutu.Parameters.AddWithValue("@musID", Convert.ToInt32(bekleyenmusteridgv.CurrentRow.Cells["musID"].Value));
                if (baglanti.State == ConnectionState.Closed)
                {
                    baglanti.Open();
                }
                upkomutu.ExecuteNonQuery();
                if (baglanti.State == ConnectionState.Open)
                {
                    baglanti.Close();
                }

                linklabel = new LabelItem();
                linkyarat = new LabelItem();
                pcb = new PictureBox();
                rtb = new RichTextBox();
                txtmesajyaz = new TextBoxX();
                panel = new PanelEx();
                buttonBlok = new ButtonX();
                btngonder = new ButtonX();
                buttonMesaj = new ButtonX();
                buttonLink = new ButtonX();
                
                txtmesajyaz.KeyPress += new System.Windows.Forms.KeyPressEventHandler(txtmesajyaz_KeyPress);

                panel.Name = "panel_" + bekleyenmusteridgv.CurrentRow.Cells["musID"].Value.ToString();
                panel.Height = 45;
               
                panel.Style.Alignment = StringAlignment.Center;
                panel.Style.BackColor1.ColorSchemePart = eColorSchemePart.PanelBackground;
                panel.Style.BackColor2.ColorSchemePart = eColorSchemePart.PanelBackground2;
                panel.Style.Border = eBorderType.SingleLine;
                panel.Style.BorderColor.ColorSchemePart = eColorSchemePart.PanelBorder;
                panel.Style.ForeColor.ColorSchemePart = eColorSchemePart.PanelText;
                panel.Style.GradientAngle = 90;
              

                panel.CanvasColor = System.Drawing.SystemColors.Control;
                panel.ColorSchemeStyle = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;



                btngonder.ColorTable = eButtonColor.OrangeWithBackground;
                btngonder.Image = global::OnlineDestek.Properties.Resources.chat_icon;
                btngonder.ImagePosition = eImagePosition.Top;
                btngonder.Size = new System.Drawing.Size(43, 26);

                btngonder.Name = "btngonder_" + bekleyenmusteridgv.CurrentRow.Cells["musID"].Value.ToString();

                btngonder.Style = eDotNetBarStyle.StyleManagerControlled;


                btngonder.TextAlignment = eButtonTextAlignment.Right;

               btngonder.Click += new System.EventHandler(btngonder_Click);



               linkyarat.ItemAlignment = DevComponents.DotNetBar.eItemAlignment.Center;
               linkyarat.Name = "linkyarat_" + bekleyenmusteridgv.CurrentRow.Cells["musID"].Value.ToString();
               linkyarat.Text = "Link Yarat";
               linkyarat.TextAlignment = System.Drawing.StringAlignment.Center;

               txtlinkmetin.Name = "txtlinkmetin_" + bekleyenmusteridgv.CurrentRow.Cells["musID"].Value.ToString();
               txtlinkmetin.TextBoxWidth = 100;
               txtlinkmetin.WatermarkColor = System.Drawing.SystemColors.GrayText;
               txtlinkmetin.WatermarkText = "Görülecek Metin";

               txtlinkadres.Name = "txtlinkadres_" + bekleyenmusteridgv.CurrentRow.Cells["musID"].Value.ToString();
            //   txtlinkadres.SubItems.AddRange(new DevComponents.DotNetBar.BaseItem[] {
            //this.labelItem2});
               txtlinkadres.WatermarkColor = System.Drawing.SystemColors.GrayText;
               txtlinkadres.WatermarkText = "Adres";


               lblhazirlinklerim.Name = "hazirlinklerim" + bekleyenmusteridgv.CurrentRow.Cells["musID"].Value.ToString();
               lblhazirlinklerim.Text = "Hazır Linklerim";


              


               adaptor = new SqlDataAdapter("select * from OPOZEL where OPID="+loginid, baglanti);
               dt = new DataTable();
               adaptor.Fill(dt);


               for (int i = 0; i < dt.Rows.Count; i++)
               {

                   btnslink = new DevComponents.DotNetBar.ButtonItem();

                   btnslink.Tag = dt.Rows[i]["LINKADRES"].ToString();
                   btnslink.Text = dt.Rows[i]["LINKADI"].ToString();
                   btnslink.Click += new EventHandler(btnslink_Click);


                   
                  
                          
                         btnlinkekle.SubItems.Add(btnslink);
                       

                   




                   btnshazirmesaj = new DevComponents.DotNetBar.ButtonItem();

                   btnshazirmesaj.Text = dt.Rows[i]["HAZIRMESAJ"].ToString();
                   btnshazirmesaj.Click += new EventHandler(btnshazirmesaj_Click);
                   buttonMesaj.SubItems.Add(btnshazirmesaj);

               }




               btnlinkekle.Click += new System.EventHandler(btnlinkekle_Click);
               btnlinkekle.ItemAlignment = DevComponents.DotNetBar.eItemAlignment.Center;
               btnlinkekle.Name = "btnlinkekle_" + bekleyenmusteridgv.CurrentRow.Cells["musID"].Value.ToString();
               btnlinkekle.SubItems.Add(lblhazirlinklerim);
               btnlinkekle.Text = "Ekle / Hazır Link";


              

             
               buttonLink.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
               buttonLink.CallBasePaintBackground = true;
               buttonLink.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
               buttonLink.Image = global::OnlineDestek.Properties.Resources.link_icon;
               buttonLink.ImagePosition = DevComponents.DotNetBar.eImagePosition.Right;
              
               buttonLink.Name = "buttonLink_" + bekleyenmusteridgv.CurrentRow.Cells["musID"].Value.ToString(); 
               buttonLink.Size = new System.Drawing.Size(43, 26);
               buttonLink.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
               buttonLink.SubItems.Add(linkyarat);
               buttonLink.SubItems.Add(txtlinkmetin);
               buttonLink.SubItems.Add(txtlinkadres);
               buttonLink.SubItems.Add(btnlinkekle);
              buttonLink.SubItemsExpandWidth = 20;
             
              buttonLink.TextAlignment = DevComponents.DotNetBar.eButtonTextAlignment.Right;
              buttonLink.Tooltip = "Yeni Link - Hazır Link";


               buttonMesaj.AccessibleDescription = "";
               buttonMesaj.AccessibleRole = System.Windows.Forms.AccessibleRole.PushButton;
               buttonMesaj.CallBasePaintBackground = true;
               buttonMesaj.ColorTable = DevComponents.DotNetBar.eButtonColor.OrangeWithBackground;
               buttonMesaj.Image = global::OnlineDestek.Properties.Resources.Mail;
               buttonMesaj.ImagePosition = DevComponents.DotNetBar.eImagePosition.Right;

               linklabel.Name = "linklabel_" + bekleyenmusteridgv.CurrentRow.Cells["musID"].Value.ToString(); ;
               linklabel.Text = "Hazır Mesajlarım";
               linklabel.TextAlignment = System.Drawing.StringAlignment.Center;

              

              

               buttonMesaj.Name = "buttonMesaj_" + bekleyenmusteridgv.CurrentRow.Cells["musID"].Value.ToString();
               buttonMesaj.Size = new System.Drawing.Size(43, 26);
               buttonMesaj.Style = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;
               buttonMesaj.SubItems.Add(linklabel);
            
               buttonMesaj.SubItemsExpandWidth = 20;
              
               buttonMesaj.TextAlignment = DevComponents.DotNetBar.eButtonTextAlignment.Right;
               buttonMesaj.Tooltip = "Hazır Mesaj";
                

                buttonBlok.ColorTable = eButtonColor.OrangeWithBackground;
                buttonBlok.Image = global::OnlineDestek.Properties.Resources.icon_block;
                buttonBlok.ImagePosition = eImagePosition.Top;
                buttonBlok.Size = new System.Drawing.Size(43, 26);
                
                buttonBlok.Name = "buttonBlok_" + bekleyenmusteridgv.CurrentRow.Cells["musID"].Value.ToString();
               
                buttonBlok.Style = eDotNetBarStyle.StyleManagerControlled;


                buttonBlok.TextAlignment = eButtonTextAlignment.Right;
                buttonBlok.Tooltip = "IP Adresini Engelle";
                buttonBlok.Click += new System.EventHandler(buttonBlok_Click);
               
               
                
               
                //pcb.Image = global::OnlineDestek.Properties.Resources.banner;
                pcb.SizeMode = PictureBoxSizeMode.Normal;
            
                rtb.BackColor = System.Drawing.Color.White;
                rtb.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
                rtb.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
                pcb.Name = "pcb_" + bekleyenmusteridgv.CurrentRow.Cells["musID"].Value.ToString();
                rtb.Name = "txtmesajlar_" + bekleyenmusteridgv.CurrentRow.Cells["musID"].Value.ToString();
                txtmesajyaz.Border.Class = "TextBoxBorder";
                txtmesajyaz.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
                txtmesajyaz.Dock = System.Windows.Forms.DockStyle.Top;
                txtmesajyaz.FocusHighlightColor = System.Drawing.SystemColors.ControlLight;
                txtmesajyaz.FocusHighlightEnabled = true;
                txtmesajyaz.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
                hl.SetHighlightOnFocus(txtmesajyaz, true);

                txtmesajyaz.Multiline = true;

                txtmesajyaz.ScrollBars = System.Windows.Forms.ScrollBars.Both;
                txtmesajyaz.Size = new System.Drawing.Size(494, 100);
                txtmesajyaz.Name = "txtmesajyaz_" + bekleyenmusteridgv.CurrentRow.Cells["musID"].Value.ToString();

                mytabpage = new TabPage();

                mytabpage.Name = bekleyenmusteridgv.CurrentRow.Cells["musID"].Value.ToString();
                mytabpage.BackColor = Color.White;



                
                panel.Dock = System.Windows.Forms.DockStyle.Bottom;
                pcb.Dock = DockStyle.Top;
                rtb.Dock = DockStyle.Fill;
                txtmesajyaz.Dock = DockStyle.Bottom;
                panel.Controls.Add(buttonBlok);
                panel.Controls.Add(btngonder);
                panel.Controls.Add(buttonMesaj);
                panel.Controls.Add(buttonLink);


                
                mytabpage.Controls.Add(pcb);
                mytabpage.Controls.Add(rtb);
                mytabpage.Controls.Add(txtmesajyaz);
                mytabpage.Controls.Add(panel);
                tcgeo.SelectedTab = mytabpage;
              


             
                
                pcb.SendToBack();
               
               
               
                mytabpage.Text = bekleyenmusteridgv.CurrentRow.Cells["ADI"].Value.ToString()+"     ";

                tcgeo.TabPages.Add(mytabpage);
               
                

                
                tcgeo.SelectedTab =mytabpage;
                buttonBlok.Location = new System.Drawing.Point(panel.Size.Width -(panel.Size.Width - buttonBlok.Width/2), (panel.Height - buttonBlok.Height) / 2);
                btngonder.Location = new System.Drawing.Point((panel.Size.Width - btngonder.Width)-15,(panel.Height - btngonder.Height) / 2);
                buttonMesaj.Location = new System.Drawing.Point(panel.Size.Width - ((panel.Size.Width  - buttonMesaj.Width)-35), (panel.Height - buttonMesaj.Height) / 2);
                buttonLink.Location = new System.Drawing.Point(panel.Size.Width - ((panel.Size.Width - buttonMesaj.Width) - 95), (panel.Height - buttonMesaj.Height) / 2);
                txtmesajyaz.Focus();

                     
                
            
                
                bekleyenmusteriler();
                blokluipler();
                bugungorusulenmusteriler();
                
                
                
               
            //}
            //catch (Exception ex)
            //{
            // MessageBox.Show("Hata :" + ex.Message);
            //}
          


        }

        void btnlinkekle_Click(object sender, EventArgs e)
        {
            if (txtlinkmetin.Text != "" && txtlinkadres.Text != "")
            {
                TextBoxX c = (TextBoxX)tcgeo.SelectedTab.Controls["txtmesajyaz_" + tcgeo.SelectedTab.Name];
                c.Text += "<a href=" + txtlinkadres + " target=_blank>" + txtlinkmetin + "</a>";
                c.SelectionStart = txtmesajyaz.TextLength;
                c.ScrollToCaret();
                c.Focus();
                txtlinkmetin.Text = "";
                txtlinkadres.Text = "";
                buttonLink.PerformClick();
            }

        }

        void btnslink_Click(object sender, EventArgs e)
        {
            TextBoxX c = (TextBoxX)tcgeo.SelectedTab.Controls["txtmesajyaz_" + tcgeo.SelectedTab.Name];
            c.Text += " " + ((DevComponents.DotNetBar.ButtonItem)sender).Tag.ToString() + " ";
            c.SelectionStart = txtmesajyaz.TextLength;
            c.ScrollToCaret();
            c.Focus();
            buttonLink.PerformClick();

        }

        void btnshazirmesaj_Click(object sender, EventArgs e)
        {
            TextBoxX c = (TextBoxX)tcgeo.SelectedTab.Controls["txtmesajyaz_" + tcgeo.SelectedTab.Name];
            c.Text += ((DevComponents.DotNetBar.ButtonItem)sender).Text;
            c.SelectionStart = c.TextLength;
            c.ScrollToCaret();
            c.Focus();
            btngonder.PerformClick();
        }

        private void bekleyenmusteritimer_Tick(object sender, EventArgs e)
        {

          try
          {
            scrollposition = bekleyenmusteridgv.FirstDisplayedScrollingRowIndex;
              //bekleyenmusterilersorgula();
              bekleyenmusteriler();
            if (bekleyenmusteridgv.Rows.Count > 0)
            {
                
                    for (int i = 0; i < bekleyenmusteridgv.Rows.Count; i++)
                    {
                        wbrowser.Document.InvokeScript("NoktaOlustur", new object[] { (object)bekleyenmusteridgv.Rows[i].Cells["LAT"].Value, bekleyenmusteridgv.Rows[i].Cells["LAN"].Value, bekleyenmusteridgv.Rows[i].Cells["ADI"].Value, bekleyenmusteridgv.Rows[i].Cells["IP"].Value + " - " + bekleyenmusteridgv.Rows[i].Cells["SEHIR"].Value });
                    }

                    if (bekleyenmusteridgv.SelectedRows.Count > 0)
                    {
                    bekleyenmusteridgv.FirstDisplayedScrollingRowIndex = scrollposition;

                    }
            }
            else
            {
              wbrowser.Document.InvokeScript("Temizle");
            }
          }
          catch
          {

          }
        
            
         
        }

        private void bekleyenmusteridgv_CellClick(object sender, DataGridViewCellEventArgs e)
        {
          try
          {

            currentrow = bekleyenmusteridgv.CurrentRow.Index;
          }
          catch
          {

          }
              
            
        }

        private void wbrowser_DocumentCompleted(object sender, WebBrowserDocumentCompletedEventArgs e)
        {
          if (bekleyenmusteridgv.Rows.Count > 0)
          {
            wbrowser.Document.InvokeScript("GetMap");
            for (int i = 0; i < bekleyenmusteridgv.Rows.Count; i++)
            {
              wbrowser.Document.InvokeScript("NoktaOlustur", new object[] { (object)bekleyenmusteridgv.Rows[i].Cells["LAT"].Value, bekleyenmusteridgv.Rows[i].Cells["LAN"].Value, bekleyenmusteridgv.Rows[i].Cells["ADI"].Value, bekleyenmusteridgv.Rows[i].Cells["IP"].Value + " - " + bekleyenmusteridgv.Rows[i].Cells["SEHIR"].Value });
            }
          }
          else
          {

          }

          
          
        }

        private void zoomtrackbar_Scroll(object sender, EventArgs e)
        {
          try
          {
            int value = Convert.ToInt32(zoomtrackbar.Value);

            wbrowser.Document.InvokeScript("Zoom", new object[] { (object)value });
          }
          catch
          {

          }
        }

        private void musterireddet()
        {
            SqlCommand upkomutu = new SqlCommand("update devonline.ONLINEMUS set KABUL=@KABUL, online=@online, DEPKULLANICIID=@DEPKUL WHERE musID=@musID", baglanti);
            upkomutu.Parameters.AddWithValue("@KABUL", 1);
            upkomutu.Parameters.AddWithValue("@online", 2);
            upkomutu.Parameters.AddWithValue("@DEPKUL", loginid);
            upkomutu.Parameters.AddWithValue("@musID", Convert.ToInt32(bekleyenmusteridgv.CurrentRow.Cells["musID"].Value));
            if (baglanti.State == ConnectionState.Closed)
            {
                baglanti.Open();
            }
            upkomutu.ExecuteNonQuery();
            if (baglanti.State == ConnectionState.Open)
            {
                baglanti.Close();
            }
            bekleyenmusteriler();
        }

        private void bekleyenmusteridgv_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
          if (e.ColumnIndex == 0) 
          {
            müşteriyiKonuşmayaAlToolStripMenuItem.PerformClick();
           

          }
          else if (e.ColumnIndex == 1)
          {
              if (MessageBoxEx.Show("Müşteri Reddedilecek.Onaylıyor musunuz?", "Müşteri Reddet", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.No)
              {
                
              }
              else
              {
                    musterireddet();
              }
          }
          else if (e.ColumnIndex == 2)
          {
              if (MessageBoxEx.Show("Müşterinin Ip Adresi Bloklanacak.Onaylıyor musunuz?", "Müşteri Ip Bloklama", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.No)
              {

              }
              else
              {
                   ıPAdresiBloklaToolStripMenuItem.PerformClick();
              }
           
          }
        }

     
       

      
      
        private void ıPAdresiBloklaToolStripMenuItem_Click(object sender, EventArgs e)
        {
          if (baglanti.State == ConnectionState.Closed)
          {
            baglanti.Open();
          }
          try
          {
              
           SqlCommand ipvarmi = new SqlCommand("select count (*) FROM IPBAN WHERE IPNO=@IPNO", baglanti);
           ipvarmi.Parameters.AddWithValue("@IPNO", bekleyenmusteridgv.CurrentRow.Cells["IP"].Value.ToString());
           
              ClassAyarlarMethodlar ch=new ClassAyarlarMethodlar ();
            int ipcount =ch.Cevir(ipvarmi.ExecuteScalar());
            if (ipcount < 1)
            {
                SqlCommand ipblokkomut = new SqlCommand("INSERT INTO IPBAN(IPNO) VALUES (@IPNO)", baglanti);
                ipblokkomut.Parameters.AddWithValue("@IPNO", bekleyenmusteridgv.CurrentRow.Cells["IP"].Value.ToString());
                ipblokkomut.ExecuteNonQuery();
                SqlCommand upkomutu = new SqlCommand("update devonline.ONLINEMUS set KABUL=@KABUL,DEPKULLANICIID=@DEPKUL WHERE musID=@musID", baglanti);
                upkomutu.Parameters.AddWithValue("@KABUL", 2);
                upkomutu.Parameters.AddWithValue("@DEPKUL", loginid);
                upkomutu.Parameters.AddWithValue("@musID", Convert.ToInt32(bekleyenmusteridgv.CurrentRow.Cells["musID"].Value));

                upkomutu.ExecuteNonQuery();
                blokluipler();
                MessageBox.Show("Ip Adresi Bloklanmıştır. (" +  musip + ")");

            }

            
          
            if (baglanti.State == ConnectionState.Open)
            {
              baglanti.Close();
            }
              
          }
          catch (Exception ex)
          {

          //    MessageBox.Show(ex.Message);

          }
          finally
          {
            if (baglanti.State == ConnectionState.Open)
            {
              baglanti.Close();
            }
          }
           
        }

       

       

      
        private void ıPBlokKaldırToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (baglanti.State == ConnectionState.Closed)
            {
                baglanti.Open();
            }
            //try
            //{

                if (blokluipdgv.SelectedRows.Count > 0)
                {
                    SqlCommand ipblokkomut = new SqlCommand("DELETE FROM IPBAN WHERE IPNO=@IPNO", baglanti);
                    ipblokkomut.Parameters.AddWithValue("@IPNO", blokluipdgv.CurrentRow.Cells[1].Value.ToString());
                    ipblokkomut.ExecuteNonQuery();
                    blokluipler();

                }


                if (baglanti.State == ConnectionState.Open)
                {
                    baglanti.Close();
                }
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message);

            //}
            //finally
            //{
            //    if (baglanti.State == ConnectionState.Open)
            //    {
            //        baglanti.Close();
            //    }
            //}
        }

        private void müşteriListesiGrafikToolStripMenuItem_Click(object sender, EventArgs e)
        {

            if (yetki != 10)
            {
                MessageBox.Show("Yetkiniz Yok");
                return;
            }

            frmSorgu frmprm = new frmSorgu();
            frmprm.lblraporadi.Text ="Müşteri Listesi - Grafik";
            frmprm.ShowDialog();
            blokluipler();
        }

      

       
        private void tcgeo_DrawItem(object sender, DrawItemEventArgs e)
        {

            if (tcgeo.TabPages[e.Index].Name != "tpharita")
            {
                e.Graphics.DrawString("x", e.Font, Brushes.DarkBlue, e.Bounds.Right - 15, e.Bounds.Top + 4);
                e.Graphics.DrawString(tcgeo.TabPages[e.Index].Text, e.Font, Brushes.Black, e.Bounds.Left + 12, e.Bounds.Top + 4);
                e.DrawFocusRectangle();
            }
            
        }

        private void tcgeo_MouseDown(object sender, MouseEventArgs e)
        {
            for (int i = 1; i < tcgeo.TabPages.Count; i++)
            {
                
                Rectangle r = tcgeo.GetTabRect(i);
                
                Rectangle closeButton = new Rectangle(r.Right - 15, r.Top + 4, 9, 7);
                if (closeButton.Contains(e.Location))
                {
                   
                      
                        if (baglanti.State == ConnectionState.Closed)
                        {
                            baglanti.Open();
                        }
                       
                        if (tcgeo.TabCount > 1)
                        {

                           
                                if (tcgeo.TabPages[i].Name.StartsWith("d_"))
                                {
                                   
                                    tcgeo.TabPages.RemoveAt(i);

                                }
                                else
                                {

                                    cmd = new SqlCommand("update devonline.ONLINEMUS set online=@online where musID=@musID", baglanti);

                                    if (baglanti.State == ConnectionState.Closed)
                                    {
                                        baglanti.Open();
                                    }
                                    try
                                    {
                                        cmd.Parameters.AddWithValue("@online", 2);
                                        cmd.Parameters.AddWithValue("@musID", tcgeo.TabPages[i].Name);
                                        cmd.ExecuteNonQuery();
                                        tcgeo.TabPages.RemoveAt(i);
                                    }
                                    catch (Exception ex)
                                    {
                                        MessageBox.Show("Hata:" + ex.Message);
                                    }
                                    finally
                                    {
                                        if (baglanti.State == ConnectionState.Open)
                                        {
                                            baglanti.Close();
                                        }
                                    }

                                }
                            
                        }
                        if (baglanti.State == ConnectionState.Open)
                        {
                            baglanti.Close();
                        }
                        
                        
                    }
                }
            }

        private void tmmesajlar_Tick(object sender, EventArgs e)
        {
            
            bw = new BackgroundWorker();
            bw.DoWork += new DoWorkEventHandler(bw_DoWork);
            bw.RunWorkerCompleted += new RunWorkerCompletedEventHandler(bw_RunWorkerCompleted);
            bw.RunWorkerAsync();
        }


        void bw_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            tmmesajlar.Start();
        }

       

        private void operatoradvtree_AfterSelect(object sender, TreeViewEventArgs e)
        {
            nodeopid = 0;
            for (int i = 0; i <= operatoradvtree.Nodes.Count - 1; i++)
            {



                for (int j = 0; j <= operatoradvtree.Nodes[i].Nodes.Count - 1; j++)
                {


                    if (operatoradvtree.Nodes[i].Nodes[j].Text!=btnadsoyad.Text)
                    {
                        operatoradvtree.Nodes[i].Nodes[j].ContextMenuStrip = opcontext;
                        nodeopid = Convert.ToInt32(e.Node.Tag);
                    }
                   

                }
            }
        }
        private void optabolustur()
        {
            try
            {


                dpcb = new PictureBox();
                drtb = new RichTextBox();
                dtxtmesajyaz = new TextBoxX();
                dpanel = new PanelEx();

                dbtngonder = new ButtonX();
                dtxtmesajyaz.KeyPress += new System.Windows.Forms.KeyPressEventHandler(dtxtmesajyaz_KeyPress);

                dpanel.Name = "paneld_" + nodeopid.ToString();
                dpanel.Height = 45;

                dpanel.Style.Alignment = StringAlignment.Center;
                dpanel.Style.BackColor1.ColorSchemePart = eColorSchemePart.PanelBackground;
                dpanel.Style.BackColor2.ColorSchemePart = eColorSchemePart.PanelBackground2;
                dpanel.Style.Border = eBorderType.SingleLine;
                dpanel.Style.BorderColor.ColorSchemePart = eColorSchemePart.PanelBorder;
                dpanel.Style.ForeColor.ColorSchemePart = eColorSchemePart.PanelText;
                dpanel.Style.GradientAngle = 90;


                dpanel.CanvasColor = System.Drawing.SystemColors.Control;
                dpanel.ColorSchemeStyle = DevComponents.DotNetBar.eDotNetBarStyle.StyleManagerControlled;



                dbtngonder.ColorTable = eButtonColor.OrangeWithBackground;
                dbtngonder.Image = global::OnlineDestek.Properties.Resources.chat_icon;
                dbtngonder.ImagePosition = eImagePosition.Top;
                dbtngonder.Size = new System.Drawing.Size(43, 26);

                dbtngonder.Name = "btngonderd_" + nodeopid.ToString();

                dbtngonder.Style = eDotNetBarStyle.StyleManagerControlled;


                dbtngonder.TextAlignment = eButtonTextAlignment.Right;

                dbtngonder.Click += new System.EventHandler(dbtngonder_Click);











                //dpcb.Image = global::OnlineDestek.Properties.Resources.banner;
                dpcb.SizeMode = PictureBoxSizeMode.Normal;

                drtb.BackColor = System.Drawing.Color.White;
                drtb.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
                drtb.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
                dpcb.Name = "pcbd_" + nodeopid.ToString();
                drtb.Name = "txtmesajlard_" + nodeopid.ToString();
                dtxtmesajyaz.Border.Class = "TextBoxBorder";
                dtxtmesajyaz.Border.CornerType = DevComponents.DotNetBar.eCornerType.Square;
                dtxtmesajyaz.Dock = System.Windows.Forms.DockStyle.Top;
                dtxtmesajyaz.FocusHighlightColor = System.Drawing.SystemColors.ControlLight;
                dtxtmesajyaz.FocusHighlightEnabled = true;
                dtxtmesajyaz.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
                hl.SetHighlightOnFocus(dtxtmesajyaz, true);

                dtxtmesajyaz.Multiline = true;

                dtxtmesajyaz.ScrollBars = System.Windows.Forms.ScrollBars.Both;
                dtxtmesajyaz.Size = new System.Drawing.Size(494, 100);
                dtxtmesajyaz.Name = "txtmesajyazd_" + nodeopid.ToString();

                mytabpage = new TabPage();

                mytabpage.Name = "d_" + nodeopid.ToString();
                mytabpage.BackColor = Color.White;




                dpanel.Dock = System.Windows.Forms.DockStyle.Bottom;
                dpcb.Dock = DockStyle.Top;
                drtb.Dock = DockStyle.Fill;
                dtxtmesajyaz.Dock = DockStyle.Bottom;
                dpanel.Controls.Add(dbtngonder);





                mytabpage.Controls.Add(dpcb);
                mytabpage.Controls.Add(drtb);
                mytabpage.Controls.Add(dtxtmesajyaz);
                mytabpage.Controls.Add(dpanel);
                tcgeo.SelectedTab = mytabpage;





                dpcb.SendToBack();



                mytabpage.Text = operatoradvtree.SelectedNode.Text + "     ";

                tcgeo.TabPages.Add(mytabpage);




                tcgeo.SelectedTab = mytabpage;
                dbtngonder.Location = new System.Drawing.Point((dpanel.Size.Width - dbtngonder.Width) - 15, (dpanel.Height - dbtngonder.Height) / 2);
                dtxtmesajyaz.Focus();



            }
            catch (Exception ex)
            {
                MessageBox.Show("Hata :" + ex.Message);
            }
          
        }
        private void toolStripMenuItem1_Click(object sender, EventArgs e)
        {
            optabolustur();
            

        }

        private void switchButtonItem1_ValueChanged(object sender, EventArgs e)
        {
            

            if (baglanti.State == ConnectionState.Closed)
            {
                baglanti.Open();
            }

            try
            {
                if (switchButtonItem1.Value == true)
                {
                    SqlCommand userstatusoff = new SqlCommand("update devonline.USERSTATUS SET ONLINE=1 WHERE KULLANICIID=@KULLANICIID", baglanti);
                    userstatusoff.Parameters.AddWithValue("@KULLANICIID", loginid);
                    userstatusoff.ExecuteNonQuery();
                    SqlCommand userstatusoff2 = new SqlCommand("update devonline.LOGIN SET ONLINE=1 WHERE LOGINID=@LOGINID", baglanti);
                    userstatusoff2.Parameters.AddWithValue("@LOGINID", loginid);
                    userstatusoff2.ExecuteNonQuery();

                }
                else
                {
                    SqlCommand userstatusoff = new SqlCommand("update devonline.USERSTATUS SET ONLINE=0 WHERE KULLANICIID=@KULLANICIID", baglanti);
                    userstatusoff.Parameters.AddWithValue("@KULLANICIID", loginid);
                    userstatusoff.ExecuteNonQuery();
                    SqlCommand userstatusoff2 = new SqlCommand("update devonline.LOGIN SET ONLINE=0 WHERE LOGINID=@LOGINID", baglanti);
                    userstatusoff2.Parameters.AddWithValue("@LOGINID", loginid);
                    userstatusoff2.ExecuteNonQuery();

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

            if (baglanti.State == ConnectionState.Open)
            {
                baglanti.Close();
            }
        }

        private void switchButtonItem2_ValueChanged(object sender, EventArgs e)
        {
            if (baglanti.State == ConnectionState.Closed)
            {
                baglanti.Open();
            }

            try
            {

                if (switchButtonItem2.Value == true)
                {
                    SqlCommand appdurum = new SqlCommand("UPDATE APPDURUM SET DURUM=1", baglanti);

                    appdurum.ExecuteNonQuery();


                }
                else
                {
                    SqlCommand appdurum = new SqlCommand("UPDATE APPDURUM SET DURUM=0", baglanti);

                    appdurum.ExecuteNonQuery();


                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

            if (baglanti.State == ConnectionState.Open)
            {
                baglanti.Close();
            }
        }

        private void müşteriListesiToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (yetki != 10)
            {
                MessageBox.Show("Yetkiniz Yok");
                return;
            }
            frmSorgu frmprm = new frmSorgu();
            frmprm.lblraporadi.Text = "Müşteri Listesi";
            frmprm.ShowDialog();
            blokluipler();
        }

        private void operatörListesiToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (yetki != 10)
            {
                MessageBox.Show("Yetkiniz Yok");
                return;
            }

            frmSorgu frmprm = new frmSorgu();
            frmprm.lblraporadi.Text = "Operatör Listesi";
            frmprm.ShowDialog();
            blokluipler();
        }

        private void bloklananIPLerToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (yetki != 10)
            {
                MessageBox.Show("Yetkiniz Yok");
                return;
            }

            frmSorgu frmprm = new frmSorgu();
            frmprm.lblraporadi.Text = "Bloklu IP Listesi";
            frmprm.ShowDialog();
            blokluipler();

        }

        private void hakkındaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmHakkinda frmprm = new frmHakkinda();
           
            frmprm.ShowDialog();
        }

        
       

       

        

     }

          
   }

