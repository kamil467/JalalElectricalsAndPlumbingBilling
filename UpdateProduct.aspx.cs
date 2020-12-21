using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NemisisWebApp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var productId = Convert.ToInt32(Request.QueryString["id"].ToString());

                var context = new NemisisBillingEntities();

                var productObject = context.Products.Where(p => p.Id == productId).FirstOrDefault();

                // setting the screens.

                if (productObject != null)
                {
                    pId.Text = productObject.Id.ToString();
                    pName.Text = productObject.Name;
                    pDescription.Text = productObject.Description;
                    measure.Text = productObject.Measurements;
                    pCostPrice.Text = productObject.CostPrice.ToString();
                    cgst.Text = productObject.CGST.ToString();
                    sgdt.Text = productObject.SGST.ToString();
                    pSellingPrice.Text = productObject.SellPrice.ToString();
                }
            }
        }

        protected void calSellingPrice(object obj, EventArgs e)
        {
            var sumPercentage = Convert.ToInt32(cgst.Text) + Convert.ToInt32(sgdt.Text) + Convert.ToInt32(profit.Text);
            double percentValue = (Convert.ToDouble(sumPercentage) / 100);

            double percentAmount = (Convert.ToDouble(pCostPrice.Text)) * percentValue;


            double sellAmount = percentAmount + (Convert.ToDouble(pCostPrice.Text));

            pSellingPrice.Text = Math.Round(sellAmount).ToString();

            Type cstype = this.GetType();

            // Get a ClientScriptManager reference from the Page class.
            ClientScriptManager cs = Page.ClientScript;

            // Check to see if the startup script is already registered.
            if (!cs.IsStartupScriptRegistered(cstype, "PopupScript"))
            {
                String cstext = "alert('Selling Price generated');";
                cs.RegisterStartupScript(cstype, "PopupScript", cstext, true);
            }

        }
        protected void AddProductItem(object sender, EventArgs e)
        {

            var context = new NemisisBillingEntities();
            var productId =  Convert.ToInt32(pId.Text) ;
            var productObject = context.Products.Where(p => p.Id ==productId ).FirstOrDefault();
    
            
                productObject.Name =  pName.Text;
                productObject.Description = pDescription.Text;
                productObject.Quantity = Convert.ToInt32(pQuantity.Text);
                productObject.SellPrice = Convert.ToDecimal(pSellingPrice.Text);
                productObject.CostPrice = Convert.ToDecimal(pCostPrice.Text);
                productObject.SGST = Convert.ToDecimal(sgdt.Text);
                productObject.CGST = Convert.ToDecimal(cgst.Text);
                productObject.Measurements = measure.Text;
                productObject.PofitPercent = Convert.ToDecimal(profit.Text);
            context.SaveChanges();

            Response.Redirect("Products.aspx");

        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Products.aspx");
        }
    }
}