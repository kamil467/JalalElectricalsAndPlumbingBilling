using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NemisisWebApp.Service;
using NemisisWebApp.ViewModel;
using System.Data;

namespace NemisisWebApp
{
    public partial class ManualInvoiceCreation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
                 // create a data table and ppulate with selected values

            var selectedProductId = ComboBox1.SelectedItem.Value;
            var productService = new ProductService();
            var product = productService.GetProductById(Convert.ToInt32(selectedProductId)).Result;

            // get the product by Id.

            // build Model to display the time


            if (ViewState["currentTable"] != null)
            {
                DataTable dt = (DataTable)ViewState["currentTable"] ;
                this.CopyPreviousValues(dt, product);
            }
            else
            {
               // build data table and populate with new values

               var dataTable =  this.CreateDataTable(product);
               GridView1.DataSource = dataTable;
               GridView1.DataBind();
            }

            this.Refresh(sender, e);

        }

        private decimal FinalPriceByRow(ManualInvoicPriceCalculate manual)
        {
            var finalPrice = ((manual.Quantity * manual.SellingPrice) - manual.DiscountAmount.GetValueOrDefault()) + manual.TaxAmount.GetValueOrDefault();

            return finalPrice.GetValueOrDefault();
        }



        private DataTable CreateDataTable(Product product)
        {
            DataTable dt = new DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("RowNumber", typeof(int)));
            dt.Columns.Add(new DataColumn("ProductId", typeof(int)));
            dt.Columns.Add(new DataColumn("ProductName", typeof(string)));
            dt.Columns.Add(new DataColumn("Quantity", typeof(int)));
            dt.Columns.Add(new DataColumn("Measurements", typeof(string)));
            dt.Columns.Add(new DataColumn("CostPrice", typeof(decimal)));
            dt.Columns.Add(new DataColumn("SellPrice", typeof(decimal)));
            dt.Columns.Add(new DataColumn("DiscountAmount", typeof(decimal)));
            dt.Columns.Add(new DataColumn("AmountAfterDiscount", typeof(string)));
            dt.Columns.Add(new DataColumn("TaxAmount", typeof(decimal)));
            dt.Columns.Add(new DataColumn("FinalPrice", typeof(decimal)));


            dr = dt.NewRow();
            dr["RowNumber"] = 1;
            dr["ProductId"] = product.Id;
            dr["ProductName"] = product.Name;
            dr["Quantity"] = 1;
            dr["Measurements"] = product.Measurements;
            dr["CostPrice"] = product.CostPrice;
            dr["SellPrice"] = product.SellPrice;
            dr["DiscountAmount"] = 0;
            dr["AmountAfterDiscount"] = product.SellPrice;
            dr["TaxAmount"] = 0;

            var refreshPriceCalculator = new ManualInvoicPriceCalculate
            {
                SellingPrice = product.SellPrice,
                Quantity = 1,
                DiscountAmount = 0,  // give 0 discount initial during first time load
                TaxAmount = 0,  // give 0 tax value amount 
                AmountAfterDiscount = product.SellPrice  // set to sell price

            };
           var finalPrice = Math.Round(this.FinalPriceByRow(refreshPriceCalculator));

           dr["FinalPrice"] = finalPrice;

            dt.Rows.Add(dr);

            ViewState["currentTable"] = dt;

            return dt;
        }

        protected void GenerateInvoice_Click(object sender, EventArgs e)
        {

        }
        
        /// <summary>
        /// This is a global refresher method
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Refresh(object sender , EventArgs e)
        {

            decimal netSellingPrice = 0;
            decimal netDiscountAmount = 0;
            decimal netAfterDiscountAmount = 0;
            decimal netTaxAmount = 0;
            decimal netTotalAmount = 0;

            if (ViewState["currentTable"] != null)
            {
                DataTable currentTable = (DataTable)ViewState["currentTable"];

                for (var i = 0; i < currentTable.Rows.Count; i++)
                {

                    //retrive columns
                    TextBox pName = (TextBox)GridView1.Rows[i].Cells[1].FindControl("ProductName");
                    TextBox cPrice = (TextBox)GridView1.Rows[i].Cells[1].FindControl("CostPrice");
                    TextBox sPrice = (TextBox)GridView1.Rows[i].Cells[1].FindControl("SellPrice");
                    TextBox quantity = (TextBox)GridView1.Rows[i].Cells[1].FindControl("Quantity"); ;
                    TextBox measurements = (TextBox)GridView1.Rows[i].Cells[1].FindControl("Measurements");
                    TextBox discountAmount = (TextBox)GridView1.Rows[i].Cells[1].FindControl("DiscountAmount");
                    TextBox amountAfterDiscount = (TextBox)GridView1.Rows[i].Cells[1].FindControl("AmountAfterDiscount");
                    TextBox taxAmount = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TaxAmount");
                    TextBox FinalPrice = (TextBox)GridView1.Rows[i].Cells[1].FindControl("FinalPrice");
                    // update all columns

                    currentTable.Rows[i]["ProductName"] = pName.Text;
                    currentTable.Rows[i]["Quantity"] = quantity.Text;
                    currentTable.Rows[i]["CostPrice"] = cPrice.Text;
                    currentTable.Rows[i]["SellPrice"] = sPrice.Text;
                    currentTable.Rows[i]["DiscountAmount"] = Math.Round(Convert.ToDecimal(discountAmount.Text));
                    currentTable.Rows[i]["AmountAfterDiscount"] = Math.Round((Convert.ToDecimal(sPrice.Text) * Convert.ToInt32(quantity.Text)) - Convert.ToDecimal(discountAmount.Text)).ToString();
                    currentTable.Rows[i]["Measurements"] = measurements.Text;
                    currentTable.Rows[i]["TaxAmount"] = Math.Round(Convert.ToDecimal(taxAmount.Text));

                    var refreshPriceCalculator = new ManualInvoicPriceCalculate
                    {
                        SellingPrice =Math.Round( Convert.ToDecimal(sPrice.Text)),
                        Quantity = Convert.ToInt32(quantity.Text),
                        DiscountAmount = Math.Round(Convert.ToDecimal(discountAmount.Text)),  // give 0 discount initial during first time load
                        TaxAmount = Math.Round(Convert.ToDecimal(taxAmount.Text)),  // give 0 tax value amount 


                    };
                    currentTable.Rows[i]["FinalPrice"] = Math.Round(this.FinalPriceByRow(refreshPriceCalculator));
 
                    netDiscountAmount = netDiscountAmount + refreshPriceCalculator.DiscountAmount.GetValueOrDefault();
                    netSellingPrice = netSellingPrice+refreshPriceCalculator.SellingPrice.GetValueOrDefault();
                    netTotalAmount = netTotalAmount + this.FinalPriceByRow(refreshPriceCalculator);
                    netTaxAmount = netTaxAmount + refreshPriceCalculator.TaxAmount.GetValueOrDefault();
                    netAfterDiscountAmount = netAfterDiscountAmount + Convert.ToDecimal(currentTable.Rows[i]["AmountAfterDiscount"]);
                }
                ViewState["currentTable"] = currentTable;
                GridView1.DataSource = currentTable;
                GridView1.DataBind();
                this.UpdateFooterRow(netSellingPrice, netDiscountAmount, netAfterDiscountAmount, netTaxAmount, netTotalAmount); 


            }
          
        }


        protected void RemoveButtonClicked(object sender, EventArgs e)
        {
            var button = (Button)sender;


            GridViewRow gridViewRow = (GridViewRow)button.NamingContainer;
            int rowIndex = gridViewRow.RowIndex;

            if (ViewState["currentTable"] != null)
            {
                DataTable currentTable = (DataTable)ViewState["currentTable"];

                currentTable.Rows.RemoveAt(rowIndex); // remove at gridView index
                ViewState["currentTable"] = currentTable;
                GridView1.DataSource = currentTable;
                GridView1.DataBind();
                this.Refresh(sender, e);
            }


        }

        private void CopyPreviousValues(DataTable currentTable, Product product)
        {
            DataRow tr = null;
            if (currentTable.Rows.Count > 0)
            {
                tr = currentTable.NewRow();
                tr["RowNumber"] = currentTable.Rows.Count + 1;
                tr["ProductId"] = product.Id;
                currentTable.Rows.Add(tr);
                ViewState["currentTable"] = currentTable;
                for (var i = 0; i < currentTable.Rows.Count; i++)
                {
                    TextBox pName = (TextBox)GridView1.Rows[i].Cells[1].FindControl("ProductName");
                    TextBox cPrice = (TextBox)GridView1.Rows[i].Cells[1].FindControl("CostPrice");
                    TextBox sPrice = (TextBox)GridView1.Rows[i].Cells[1].FindControl("SellPrice");
                    TextBox quantity = (TextBox)GridView1.Rows[i].Cells[1].FindControl("Quantity"); ;
                    TextBox measurements = (TextBox)GridView1.Rows[i].Cells[1].FindControl("Measurements");
                    TextBox discountAmount = (TextBox)GridView1.Rows[i].Cells[1].FindControl("DiscountAmount");
                    TextBox amountAfterDiscount = (TextBox)GridView1.Rows[i].Cells[1].FindControl("amountAfterDiscount");
                    TextBox taxAmount = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TaxAmount");
                    TextBox FinalPrice = (TextBox)GridView1.Rows[i].Cells[1].FindControl("FinalPrice");

                    if (i < currentTable.Rows.Count - 1)
                    {
                        // copy previous rows
                        pName.Text = currentTable.Rows[i]["ProductName"].ToString();
                        quantity.Text = currentTable.Rows[i]["Quantity"].ToString();
                        cPrice.Text = currentTable.Rows[i]["CostPrice"].ToString();
                        sPrice.Text = currentTable.Rows[i]["SellPrice"].ToString();
                        discountAmount.Text = currentTable.Rows[i]["DiscountAmount"].ToString();
                        amountAfterDiscount.Text = currentTable.Rows[i]["AmountAfterDiscount"].ToString();
                        measurements.Text = currentTable.Rows[i]["Measurements"].ToString();
                        taxAmount.Text = currentTable.Rows[i]["TaxAmount"].ToString();
                        FinalPrice.Text = currentTable.Rows[i]["FinalPrice"].ToString();
                    }
                    else
                    {
                        // no more rows in data Table.
                        currentTable.Rows[i]["ProductName"] = product.Name;
                        currentTable.Rows[i]["Quantity"] = 1;
                        currentTable.Rows[i]["CostPrice"] = product.CostPrice.GetValueOrDefault();
                        currentTable.Rows[i]["SellPrice"] = product.SellPrice.GetValueOrDefault();
                        currentTable.Rows[i]["DiscountAmount"] = 0;
                        currentTable.Rows[i]["AmountAfterDiscount"] = product.SellPrice;
                        currentTable.Rows[i]["Measurements"] = product.Measurements;
                        currentTable.Rows[i]["TaxAmount"] = 0;

                        var refreshPriceCalculator = new ManualInvoicPriceCalculate
                        {
                            SellingPrice = product.SellPrice,
                            Quantity = 1,
                            DiscountAmount = 0,  // give 0 discount initial during first time load
                            TaxAmount = 0,  // give 0 tax value amount 
                            AmountAfterDiscount = product.SellPrice  // set to sell price

                        };
                        currentTable.Rows[i]["FinalPrice"] = Math.Round(this.FinalPriceByRow(refreshPriceCalculator));
                    }
                    ViewState["currentTable"] = currentTable;
                    GridView1.DataSource = currentTable;
                    GridView1.DataBind();
                }

               
            }
            else
            {
                var dataTable = this.CreateDataTable(product);
                ViewState["currentTable"] = dataTable;
                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs events)
        {
            //var NetDiscountAmount = (Label)events.Row.FindControl("NetDiscountAmount");
            //var NetAmountAfterDiscount = (Label)events.Row.FindControl("NetAmountAfterDiscount");
            //var NetTaxAmount = (Label)events.Row.FindControl("NetTaxAmount");
            //var NetFinalPrice = (Label)events.Row.FindControl("NetFinalPrice");
            //var NetSell = (Label)events.Row.FindControl("NetSell");

            //if (NetDiscountAmount != null && NetAmountAfterDiscount != null && NetTaxAmount != null && NetFinalPrice != null)
            //{
            //    var labelArray = new Label[5];
            //    labelArray[0] = NetSell;
            //    labelArray[1] = NetDiscountAmount;
            //    labelArray[2] = NetAmountAfterDiscount;
            //    labelArray[3] = NetTaxAmount;
            //    labelArray[4] = NetFinalPrice;


            //    this.GlobalRefresher(labelArray);
            //}
        }



        private void UpdateFooterRow(decimal netSellingPrice, 
            decimal netDiscountAmount, 
            decimal netAfterDiscountAmount, 
            decimal netTaxAmount,
            decimal netFinal)
        {
            Label NetSellPriceLabel = (Label)GridView1.FooterRow.Cells[1].FindControl("NetSell");
            NetSellPriceLabel.Text = Math.Round(netSellingPrice).ToString();

            Label NetDiscountAmount = (Label)GridView1.FooterRow.Cells[1].FindControl("NetDiscountAmount");
            NetDiscountAmount.Text = Math.Round(netDiscountAmount).ToString();

            Label NetAmountAfterDiscount = (Label)GridView1.FooterRow.Cells[1].FindControl("NetAmountAfterDiscount");
            NetAmountAfterDiscount.Text = Math.Round(netAfterDiscountAmount).ToString();

            Label NetTaxAmount = (Label)GridView1.FooterRow.Cells[1].FindControl("NetTaxAmount");
            NetTaxAmount.Text = Math.Round(netTaxAmount).ToString();

            TextBox NetFinalPrice = (TextBox)GridView1.FooterRow.Cells[1].FindControl("beforeDiscount");
            NetFinalPrice.Text = Math.Round(netFinal).ToString();
        }

        protected void P(object sender, EventArgs e)
        {
            // create customer model 

            //create InvoiceItems

            // create customerInvoice

            // map customerInvoice and InvoiceItems


            // Create Customer
            var customer = new Customer
            {
                Name = cName.Text,
                Address = cAddress.Text,
                MobileNumber = cContactNo.Text,

            };

            var context = new NemisisBillingEntities();

            context.Customers.AddObject(customer);
            context.SaveChanges(); // get auto generated customerId

            // Create InvoiceItems

            List<InvoiceItem> invoiceItemsList = new List<InvoiceItem>();
            TextBox NetDiscountAmount = (TextBox)GridView1.FooterRow.Cells[1].FindControl("fDiscountedAmount");
            TextBox NetAmountAfterDiscount = (TextBox)GridView1.FooterRow.Cells[1].FindControl("beforeDiscount");
            Label NetTaxAmount = (Label)GridView1.FooterRow.Cells[1].FindControl("NetTaxAmount");
            TextBox NetFinalPrice = (TextBox)GridView1.FooterRow.Cells[1].FindControl("fAmount");
         

            // pull records from GridView

            if (ViewState["currentTable"] != null)
            {


                // var dataTable = GridView1.Rows[0].Cells[2].ToString();
                // refresh calculation
                DataTable currentTable = (DataTable)ViewState["currentTable"];

                for (var i = 0; i < currentTable.Rows.Count; i++)
                {

                    TextBox pName = (TextBox)GridView1.Rows[i].Cells[1].FindControl("ProductName");
                    TextBox cPrice = (TextBox)GridView1.Rows[i].Cells[1].FindControl("CostPrice");
                    TextBox sPrice = (TextBox)GridView1.Rows[i].Cells[1].FindControl("SellPrice");
                    TextBox quantity = (TextBox)GridView1.Rows[i].Cells[1].FindControl("Quantity"); ;
                    TextBox measurements = (TextBox)GridView1.Rows[i].Cells[1].FindControl("Measurements");
                    TextBox discountAmount = (TextBox)GridView1.Rows[i].Cells[1].FindControl("DiscountAmount");
                    TextBox amountAfterDiscount = (TextBox)GridView1.Rows[i].Cells[1].FindControl("amountAfterDiscount");
                    TextBox taxAmount = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TaxAmount");
                    TextBox FinalPrice = (TextBox)GridView1.Rows[i].Cells[1].FindControl("FinalPrice");


                    var invoiceItem = new InvoiceItem
                    {

                        Name = pName.Text,
                        ProductId = Convert.ToInt32(currentTable.Rows[i]["ProductId"]),
                        Quantity = Convert.ToInt32(quantity.Text),
                        SellPrice = Convert.ToDecimal(sPrice.Text),
                        TotalDiscount = Convert.ToDecimal(discountAmount.Text),
                        TotalTaxAmount = Convert.ToDecimal(taxAmount.Text),
                        TotalAmountAfterDiscount = Convert.ToDecimal(amountAfterDiscount.Text),
                        TotalCalculatedAmount = Convert.ToDecimal(FinalPrice.Text),
                        Measurement = measurements.Text,

                    };

                    invoiceItemsList.Add(invoiceItem);

                }
            }

            foreach (var invoice in invoiceItemsList)
            {
                context.InvoiceItems.AddObject(invoice);
            }

            context.SaveChanges();


            // build customerInvoice - holds total sum details of InVoice
            var customerInVoice = new CustomerInvoice
            {
                CustomerId = customer.Id,
                DateOfCreation = DateTime.Now,
                TotalAmountPaidByCustomer = Convert.ToDecimal(NetFinalPrice.Text),
                TotalAmountWithoutTax = Convert.ToDecimal(NetAmountAfterDiscount.Text),
                TotalDiscountInAmount = Convert.ToDecimal(NetDiscountAmount.Text),
                TotalTaxAmount = Convert.ToDecimal(NetTaxAmount.Text),
            };


            context.CustomerInvoices.AddObject(customerInVoice);
            context.SaveChanges();


            customerInVoice.InvoiceTIN = "IN" + customerInVoice.Id.ToString();
            context.SaveChanges();


            // map customerInvoice and InvoiceItems

            var customerAndCustomerInvoiceItems = new List<CustomerInVoiceAndInVoiceItem>();

            foreach (var invoiceItem in invoiceItemsList)
            {
                customerAndCustomerInvoiceItems.Add(

                    new CustomerInVoiceAndInVoiceItem
                    {
                        CustomerInvoiceId = customerInVoice.Id,
                        InvoiceItemsId = invoiceItem.Id,

                    }
                    );
            }

            foreach (var mappingObj in customerAndCustomerInvoiceItems)
            {
                context.CustomerInVoiceAndInVoiceItems.AddObject(mappingObj);
            }


            context.SaveChanges();
            Response.Redirect("ViewInvoice.aspx?invoiceId=" + customerInVoice.InvoiceTIN);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void Click_Calculate_Discount(object sender, EventArgs e)
        {
            var amountBeforeDiscountString = ((TextBox)GridView1.FooterRow.Cells[1].FindControl("beforeDiscount")).Text;
            var discountPercenTageValue = ((TextBox)GridView1.FooterRow.Cells[1].FindControl("discountPercenTage")).Text;
            var fDiscountedAmountTextBox = (TextBox)GridView1.FooterRow.Cells[1].FindControl("fDiscountedAmount");
            var fAmountTextBox = (TextBox)GridView1.FooterRow.Cells[1].FindControl("fAmount");
            if (string.IsNullOrEmpty(amountBeforeDiscountString) || string.IsNullOrWhiteSpace(amountBeforeDiscountString))
            {
                return;
            }

            if (string.IsNullOrEmpty(discountPercenTageValue) || string.IsNullOrWhiteSpace(discountPercenTageValue))
            {
                return;
            }

            var discountPer = Convert.ToInt32(discountPercenTageValue);
            var amountBeforeDiscount = Convert.ToInt32(amountBeforeDiscountString);
            if (discountPer == 0)
            {
                // set discount Amount = 0 and final amount = amount before discount

                fDiscountedAmountTextBox.Text = "0.00";
                fAmountTextBox.Text = amountBeforeDiscountString;
            }
            else
            {
                double discountedAmount = Convert.ToDouble(discountPer) / 100;
                double dA = discountedAmount * amountBeforeDiscount;   

                fDiscountedAmountTextBox.Text = Math.Round(dA).ToString();

                var finalAmount = amountBeforeDiscount - Math.Round(dA);

                fAmountTextBox.Text = finalAmount.ToString();
            }
            
        }

    }
}