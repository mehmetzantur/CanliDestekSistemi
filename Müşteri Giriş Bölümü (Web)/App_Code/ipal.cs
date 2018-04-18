using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Data;
using System.Xml;

/// <summary>
/// Summary description for ipal
/// </summary>
public class ipal
{
    public DataTable YerTespiti(string ipadresim)
    {
        WebRequest istek = WebRequest.Create("http://freegeoip.appspot.com/xml/" + ipadresim);
        WebProxy proxy = new WebProxy("http://freegeoip.appspot.com/xml/" + ipadresim, true);
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
          
            return null;
        }

    }
}