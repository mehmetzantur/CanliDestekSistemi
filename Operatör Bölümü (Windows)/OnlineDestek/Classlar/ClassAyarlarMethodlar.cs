using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;
using System.Drawing;
using DevComponents.DotNetBar.Controls;

namespace OnlineDestek
{
    public class ClassAyarlarMethodlar
    {
        public void GridAyari(DataGridView gv)
        {
            gv.AlternatingRowsDefaultCellStyle.BackColor = SystemColors.ControlLight;
            gv.ColumnHeadersDefaultCellStyle.Font = new Font("Tahoma", 8, GraphicsUnit.Point);
            gv.DefaultCellStyle.Font = new Font("Tahoma", 8, FontStyle.Regular, GraphicsUnit.Point);
            gv.DefaultCellStyle.SelectionBackColor = Color.LightSalmon;
            return;
        }

        public int Cevir(object o)
        {
            return (o == null || o == DBNull.Value) ? 0 : Convert.ToInt32(o);
        }


        public bool InternetVarmi()
        {
          try
          {
            System.Net.Sockets.TcpClient clnt = new System.Net.Sockets.TcpClient("www.google.com", 80);
            clnt.Close();
            return true;
          }
          catch
          {
            return false;
          }
        }


        
       


    }
}
