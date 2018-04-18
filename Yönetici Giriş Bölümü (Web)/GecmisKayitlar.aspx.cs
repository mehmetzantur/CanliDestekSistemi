using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class devgrid : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.WriteXlsToResponse("gridrapor");
    }

    protected void ASPxButton3_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.WriteXlsToResponse(ASPxTextBox1.Text);
    }
    protected void ASPxButton4_Click(object sender, EventArgs e)
    {
        ASPxGridViewExporter1.WriteXlsxToResponse(ASPxTextBox1.Text);
    }
}