using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NemisisWebApp
{
    public partial class Sales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GoToCreateInvoicePage(object sender, EventArgs e)
        {
            Response.Redirect("CreateInvoice.aspx");
        }

        protected void GoToCreateStandardInvoicePage(object sender, EventArgs e)
        {
            Response.Redirect("ManualInvoiceCreation.aspx");
        }
    }
}