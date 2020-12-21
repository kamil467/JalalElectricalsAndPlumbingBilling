using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;

namespace NemisisWebApp
{
    public partial class ViewInvoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            var invoiceTin = Request.QueryString["invoiceId"];
            if (invoiceTin == null)
            {
                // no invoice tin
                return;
            }

            var context = new NemisisBillingEntities();

            var getCustomerInvoice = context.CustomerInvoices
                .Where(ci => ci.InvoiceTIN.ToLower().Trim() == invoiceTin.ToLower().Trim())
                .FirstOrDefault();

            if (getCustomerInvoice == null)
            {
                // no invoice found for gien invoice id.
                return;
            }
            var customerAndInvoiceRefId = context.CustomerInVoiceAndInVoiceItems.Where(itemsRef => itemsRef.CustomerInvoiceId == getCustomerInvoice.Id).ToList();

            var invoicedItems = new List<InvoiceItem>();

            // load invoicedItems
            foreach (var invoiceRef in customerAndInvoiceRefId)
            {
                invoicedItems.Add(context.InvoiceItems.Where(i => i.Id == invoiceRef.InvoiceItemsId).FirstOrDefault());
            }
          


            // Bind Cutomer info                                                    
                var customer = context.Customers.Where( c => c.Id == getCustomerInvoice.CustomerId).FirstOrDefault();
                customerName.Text = customer.Name;
                customerAddress.Text = customer.Address;
                customerContact.Text = customer.MobileNumber;
                InvoiceTIN.Text = invoiceTin;
                var cultureInfo = CultureInfo.CurrentCulture;
                InvoiceDate.Text = getCustomerInvoice.DateOfCreation.GetValueOrDefault().ToString(cultureInfo);


            // build companyProfile

                var companyProfile = context.CompanyProfiles.FirstOrDefault();
                // companyName.Text = companyProfile.CompanyName;
                //companyAddress.Text = companyProfile.Address;
                //companyContact.Text = companyProfile.ContactNumber;


             // build the data table and fill the grid view.


            DataTable dt = new DataTable();

            dt.Columns.Add(new DataColumn("RowNumber", typeof(int)));
            dt.Columns.Add(new DataColumn("ItemId", typeof(int)));
            dt.Columns.Add(new DataColumn("Item", typeof(string)));
            dt.Columns.Add(new DataColumn("Qty", typeof(int)));
            dt.Columns.Add(new DataColumn("Measurements", typeof(string)));
            dt.Columns.Add(new DataColumn("TaxAmount", typeof(string)));
            dt.Columns.Add(new DataColumn("TotalAmount", typeof(string)));
            dt.Columns.Add(new DataColumn("DiscountAmount", typeof(string)));
            dt.Columns.Add(new DataColumn("NetRate", typeof(decimal)));
            dt.Columns.Add(new DataColumn("RatePerItem", typeof(decimal)));
            

            int counter = 0;
            foreach (var iItem in invoicedItems)
            {
                DataRow dr = null;
                dr = dt.NewRow();
                dr["RowNumber"] = counter + 1;
                dr["ItemId"] = iItem.Id;
                dr["Item"] = iItem.Name;
                dr["Qty"] = iItem.Quantity ;
                dr["Measurements"] = iItem.Measurement;
                dr["TaxAmount"] = Math.Round(iItem.TotalTaxAmount.GetValueOrDefault()).ToString("C");
                dr["TotalAmount"] = Math.Round(iItem.TotalCalculatedAmount.GetValueOrDefault()).ToString("C");
                dr["DiscountAmount"] = Math.Round(iItem.TotalDiscount.GetValueOrDefault()).ToString("C");
                dr["NetRate"] = iItem.SellPrice*iItem.Quantity;  // dislay net rate without any discount and tax
                dr["RatePerItem"] = iItem.SellPrice;
                 dt.Rows.Add(dr);
                counter++;
            }
            DataRow footerRow = null;
            footerRow = dt.NewRow();

            var amountBeforeDiscount = getCustomerInvoice.TotalAmountPaidByCustomer.GetValueOrDefault() + getCustomerInvoice.TotalDiscountInAmount.GetValueOrDefault();

            var currencyCultureInfo = new CultureInfo("hi-IN");

            if (getCustomerInvoice.TotalDiscountInAmount.GetValueOrDefault() != 0)
            {


                footerRow["TotalAmount"] = "<fieldset class='register'><p><label>Total Amount:</label>" + amountBeforeDiscount.ToString("C") + "</p>"
                                           + "<p><label>Discount: </label>" + getCustomerInvoice.TotalDiscountInAmount.GetValueOrDefault().ToString("C") + "</p>"
                                            + "<p><strong><label>Net Total: </label>" + getCustomerInvoice.TotalAmountPaidByCustomer.GetValueOrDefault().ToString("C") + "</strong></p></fieldset>";
            }
            else
            {
                  
                footerRow["TotalAmount"] = "<fieldset class='register'><p><strong><label>Net Total: </label>" 
                                            + getCustomerInvoice.TotalAmountPaidByCustomer.GetValueOrDefault().ToString("C") + "</strong></p></fieldset>";
            }
            


          //  footerRow["NetRate"] = "Total";
            dt.Rows.Add(footerRow);  
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
    }
}