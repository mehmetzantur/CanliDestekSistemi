using System;
using System.Collections.Generic;
using System.Text;
using System.Net;
using System.Data;
using DevComponents.DotNetBar;
using System.Xml;

namespace OnlineDestek
{
    public class ClassIpAl
    {
        public static string IPAdresim()
        {
            WebClient client = new WebClient();
            try
            {
                string str = client.DownloadString("http://checkip.dyndns.org/");
                int baslangicIndex = str.IndexOf("Current IP Address:") + 20;
                int index = 0;
                if (baslangicIndex > 0)
                {
                    index = str.IndexOf("</body>", baslangicIndex);
                    return str.Substring(baslangicIndex, index - baslangicIndex);
                }
                return "";
            }
            catch (Exception)
            {
                return "";
            }
        }

        public DataTable YerTespiti(string ipadresim)
        {
            WebRequest istek = WebRequest.Create("http://freegeoip.appspot.com/xml/"+ipadresim);
            WebProxy proxy =new WebProxy("http://freegeoip.appspot.com/xml/"+ipadresim, true);
            istek.Proxy = proxy;
            istek.Timeout = 3000;

            try
            {
                WebResponse resp = istek.GetResponse();
                XmlTextReader xmlokuyucu = new XmlTextReader(resp.GetResponseStream());
                DataSet ds = new DataSet();
                ds.ReadXml(xmlokuyucu);
                return ds.Tables[0]; 
            }
            catch (Exception ex)
            {
                MessageBoxEx.Show(ex.Message);
                return null;
            }

        }

    }
}
