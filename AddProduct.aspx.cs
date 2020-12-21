using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NemisisWebApp.ViewModel;

namespace NemisisWebApp
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddProduct_Click(object sender, EventArgs e)
        {

              // build a product view model.


            

            // Add product to database
        }

        protected void AddProductItem(object sender, EventArgs e)
        {
            
            var context = new NemisisBillingEntities();

            var productPrefix = string.Empty;
            if (category.SelectedValue == "E")
            {
                productPrefix = "E-";
            }
            else if(category.SelectedValue == "P")
            {
                productPrefix = "P-";
            }

            var product = new Product { 
                  Name = productPrefix+pName.Text,
                  Description= pDescription.Text,
                  Quantity = Convert.ToInt32(pQuantity.Text),
                  SellPrice = Convert.ToDecimal(pSellingPrice.Text),
                  CostPrice = Convert.ToDecimal(pCostPrice.Text),
                  SGST = Convert.ToDecimal(sgdt.Text),
                  CGST = Convert.ToDecimal(cgst.Text),
                  Measurements = measure.Text,
                
            
            };

            context.Products.AddObject(product);
            context.SaveChanges();

            Response.Redirect("ProductCreated.aspx?id=" + product.Id);

        }

        protected void calSellingPrice(object obj, EventArgs e)
        {
            var sumPercentage = Convert.ToInt32(cgst.Text) + Convert.ToInt32(sgdt.Text)+Convert.ToInt32(profit.Text);
            double percentValue =  (Convert.ToDouble(sumPercentage) / 100);

            double percentAmount = (Convert.ToDouble(pCostPrice.Text)) * percentValue;


            double sellAmount = percentAmount + (Convert.ToDouble(pCostPrice.Text));

            pSellingPrice.Text = Math.Round(sellAmount).ToString();


        }        


    }
}