using System;
using System.Collections.Generic;
using System.Windows.Forms;
using System.IO;

namespace OnlineDestek
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            if ((File.Exists(Application.StartupPath.ToString() + "\\Database.Ini")))
            {


                Application.Run(new frmLogin());
            }
            else
            {
                Application.Run(new frmDbSec());
            }
        }
    }
}
