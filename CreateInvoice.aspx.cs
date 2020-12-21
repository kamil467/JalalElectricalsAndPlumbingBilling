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
    public partial class CreateInvoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //var selectedProductId = GridView1.I  .SelectedItem.Value;
            //var productService = new ProductService();
            //var product = productService.GetProductById(Convert.ToInt32(selectedProductId)).Result;

            //// get the product by Id.

            //// build Model to display the time

            //var productViewModel = new ProductViewModel
            //{
            //  ProductName = product.Name,
            //  Quantity = 1, // default one
            //  CostPrice = product.CostPrice.Value,
            //  SellingPrice = product.SellPrice.Value,

            //};


            //DataTable dt = new DataTable();

        }


        protected void OnItemSelected(object obj, EventArgs e)
        {
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            var selectedProductId = ComboBox1.SelectedItem.Value;
            var productService = new ProductService();
            var product = productService.GetProductById(Convert.ToInt32(selectedProductId)).Result;

            // get the product by Id.

            // build Model to display the time


            var refreshPriceCalculator = new RefreshPriceCalculator
            {
                CGST = product.CGST,
                SGST = product.SGST,
                SellingPrice = product.SellPrice,
                Quantity = 1,
                DiscountAmount = 0,  // give 0 discount initial during first time load
                TaxValue = 0,  // give 0 tax value amount 
                AmountAfterDiscount = product.SellPrice  // set to sell price

            };




            var productViewModel = new ProductViewModel
            {
                ProductName = product.Name,
                Quantity = 1, // default one
                CostPrice = product.CostPrice,
                SellingPrice = product.SellPrice,
                 Total = this.calculateProductTotalPriceRefresher(refreshPriceCalculator),
                 CGST = product.CGST,
                 SGST = product.SGST,
                 Measurements = product.Measurements,
                 WithoutTax = 1*product.SellPrice,
                AmountAfterDiscount  = product.SellPrice // set to sell price 

                 // discount 
                 // tax value 

                 // above all are empty first time.
            };

            productViewModel.TotalDiscountedAmount = productViewModel.Quantity * productViewModel.DiscountAmount;
            productViewModel.TotalTaxAmount = productViewModel.Total - productViewModel.WithoutTax;

            decimal totalSumWithoutTax = 0;
            decimal totalSumWithTax = 0;
            decimal totalTaxTobePaid = 0;
            decimal totalDiscountOffered = 0;
            // Add the data to dataTable
            if (ViewState["currentTable"] != null)
            {
                DataTable currentTable = (DataTable)ViewState["currentTable"];

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
                        TextBox quantity = (TextBox)GridView1.Rows[i].Cells[1].FindControl("Quantity");
                        TextBox cgst = (TextBox)GridView1.Rows[i].Cells[1].FindControl("CGST");
                        TextBox sgst = (TextBox)GridView1.Rows[i].Cells[1].FindControl("SGST");
                        TextBox measurements = (TextBox)GridView1.Rows[i].Cells[1].FindControl("Measurements");
                        TextBox WithoutTax = (TextBox)GridView1.Rows[i].Cells[1].FindControl("WithoutTax");
                        TextBox totalAmount = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TotalAmount");



                        TextBox discountAmount = (TextBox)GridView1.Rows[i].Cells[1].FindControl("DiscountAmount");
                        TextBox amountAfterDiscount = (TextBox)GridView1.Rows[i].Cells[1].FindControl("AmountAfterDiscount");
                        TextBox taxValue = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TaxValue");

                        TextBox totalTaxAmount = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TotalTaxAmount");
                        TextBox totalDiscountedAmount = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TotalDiscountedAmount");


                        // TotalTaxValueByQuantity TotalTaxValueByQuantity

                        TextBox TotalTaxValueByQuantity = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TotalTaxValueByQuantity");


                        //TotalGSTQuantity

                        TextBox TotalSGSTQuantity = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TotalSGSTQuantity");
                        TextBox TotalCGSTQuantity = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TotalCGSTQuantity");

                        if (i < currentTable.Rows.Count - 1)
                        {
                            // copy previous values
                            pName.Text = currentTable.Rows[i]["ProductName"].ToString();
                            quantity.Text = currentTable.Rows[i]["Quantity"].ToString();
                            cPrice.Text = currentTable.Rows[i]["CostPrice"].ToString();
                            sPrice.Text = currentTable.Rows[i]["SellPrice"].ToString();
                            cgst.Text = currentTable.Rows[i]["CGST"].ToString();
                            sgst.Text = currentTable.Rows[i]["SGST"].ToString();
                            measurements.Text = currentTable.Rows[i]["Measurements"].ToString();
                            totalAmount.Text = currentTable.Rows[i]["TotalAmount"].ToString();
                            WithoutTax.Text = currentTable.Rows[i]["WithoutTax"].ToString();

                            discountAmount.Text = currentTable.Rows[i]["DiscountAmount"].ToString();
                            amountAfterDiscount.Text = currentTable.Rows[i]["AmountAfterDiscount"].ToString();
                            taxValue.Text = currentTable.Rows[i]["TaxValue"].ToString();


                            totalTaxAmount.Text = currentTable.Rows[i]["TotalTaxAmount"].ToString();
                            totalDiscountedAmount.Text = currentTable.Rows[i]["TotalDiscountedAmount"].ToString();

                            // Total TaxVaue
                            TotalTaxValueByQuantity.Text = currentTable.Rows[i]["TotalTaxValueByQuantity"].ToString();

                            //TOTAL GST

                            TotalSGSTQuantity.Text = currentTable.Rows[i]["TotalSGSTQuantity"].ToString();

                            TotalCGSTQuantity.Text = currentTable.Rows[i]["TotalCGSTQuantity"].ToString();


                            // Total SUM panel
                            totalSumWithTax = totalSumWithTax + Convert.ToDecimal(totalAmount.Text);
                            totalSumWithoutTax = totalSumWithoutTax + Convert.ToDecimal(WithoutTax.Text);
                            totalTaxTobePaid = totalTaxTobePaid + (Convert.ToDecimal(totalTaxAmount.Text)*Convert.ToDecimal(quantity.Text));
                            totalDiscountOffered = totalDiscountOffered + Convert.ToDecimal(totalDiscountedAmount.Text);

                        }
                        else
                        {
                            // populate new values.

                            currentTable.Rows[i]["ProductName"] = productViewModel.ProductName;
                            currentTable.Rows[i]["Quantity"] = productViewModel.Quantity;
                            currentTable.Rows[i]["CostPrice"] = productViewModel.CostPrice.GetValueOrDefault();
                            currentTable.Rows[i]["SellPrice"] = productViewModel.SellingPrice.GetValueOrDefault();
                            currentTable.Rows[i]["CGST"] = productViewModel.CGST.GetValueOrDefault();
                            currentTable.Rows[i]["SGST"] = productViewModel.SGST.GetValueOrDefault();
                            currentTable.Rows[i]["Measurements"] = productViewModel.Measurements;
                            currentTable.Rows[i]["TotalAmount"] = productViewModel.Total.GetValueOrDefault();
                            currentTable.Rows[i]["WithoutTax"] = productViewModel.WithoutTax.GetValueOrDefault();

                            currentTable.Rows[i]["DiscountAmount"] = productViewModel.DiscountAmount.GetValueOrDefault();
                            currentTable.Rows[i]["AmountAfterDiscount"] = productViewModel.AmountAfterDiscount.GetValueOrDefault();
                            currentTable.Rows[i]["TaxValue"] = productViewModel.TaxValue.GetValueOrDefault();

                            currentTable.Rows[i]["TotalDiscountedAmount"] = productViewModel.TotalDiscountedAmount.GetValueOrDefault();
                            currentTable.Rows[i]["TotalTaxAmount"] = productViewModel.TotalTaxAmount.GetValueOrDefault();

                             // TotalTaxAmountByQuantity
                            currentTable.Rows[i]["TotalTaxValueByQuantity"] = productViewModel.TotalTaxAmount.GetValueOrDefault() * product.Quantity.GetValueOrDefault();

                            // GST
                            currentTable.Rows[i]["TotalSGSTQuantity"] = productViewModel.SGST.GetValueOrDefault() * product.Quantity.GetValueOrDefault();
                            currentTable.Rows[i]["TotalCGSTQuantity"] = productViewModel.CGST.GetValueOrDefault() * product.Quantity.GetValueOrDefault();



                            
                            // Total SUM Panel
                            totalSumWithTax = totalSumWithTax + productViewModel.Total.GetValueOrDefault();
                            totalSumWithoutTax = totalSumWithoutTax + productViewModel.WithoutTax.GetValueOrDefault();
                            totalTaxTobePaid = totalTaxTobePaid + (Convert.ToDecimal(productViewModel.TotalTaxAmount.GetValueOrDefault() * product.Quantity.GetValueOrDefault()));
                            totalDiscountOffered = totalDiscountOffered + Convert.ToDecimal(productViewModel.TotalDiscountedAmount.GetValueOrDefault());
                        }

                        
                        GridView1.DataSource = currentTable;
                        GridView1.DataBind();
                        
                    }
                  
                }
                else
                {
                    DataTable dt = new DataTable();
                    DataRow dr = null;
                    dt.Columns.Add(new DataColumn("RowNumber", typeof(int)));
                    dt.Columns.Add(new DataColumn("ProductId", typeof(int)));
                    dt.Columns.Add(new DataColumn("ProductName", typeof(string)));
                    dt.Columns.Add(new DataColumn("Quantity", typeof(string)));
                    dt.Columns.Add(new DataColumn("Measurements", typeof(string)));
                    dt.Columns.Add(new DataColumn("CostPrice", typeof(decimal)));
                    dt.Columns.Add(new DataColumn("SellPrice", typeof(decimal)));
                    dt.Columns.Add(new DataColumn("CGST", typeof(decimal)));
                    dt.Columns.Add(new DataColumn("SGST", typeof(decimal)));
                    dt.Columns.Add(new DataColumn("WithoutTax", typeof(string)));
                    dt.Columns.Add(new DataColumn("TotalAmount", typeof(string)));
                    dt.Columns.Add(new DataColumn("TaxValue", typeof(string)));
                    dt.Columns.Add(new DataColumn("DiscountAmount", typeof(string)));
                    dt.Columns.Add(new DataColumn("AmountAfterDiscount", typeof(string)));

                    dt.Columns.Add(new DataColumn("TotalDiscountedAmount", typeof(decimal)));
                    dt.Columns.Add(new DataColumn("TotalTaxAmount", typeof(decimal)));

                    //TotalTaxValueByQuantity
                    dt.Columns.Add(new DataColumn("TotalTaxValueByQuantity", typeof(decimal)));

                    dt.Columns.Add(new DataColumn("TotalSGSTQuantity", typeof(decimal)));
                    dt.Columns.Add(new DataColumn("TotalCGSTQuantity", typeof(decimal)));


                    dr = dt.NewRow();
                    dr["RowNumber"] = 1;
                    dr["ProductId"] = product.Id;
                    dr["ProductName"] = productViewModel.ProductName;
                    dr["Quantity"] = 1;
                    dr["Measurements"] = productViewModel.Measurements;
                    dr["CGST"] = productViewModel.CGST.GetValueOrDefault();
                    dr["SGST"] = productViewModel.SGST.GetValueOrDefault();
                    dr["CostPrice"] = productViewModel.CostPrice;
                    dr["SellPrice"] = productViewModel.SellingPrice;
                    dr["TotalAmount"] = productViewModel.Total;
                    dr["WithoutTax"] = productViewModel.WithoutTax.GetValueOrDefault();
                    dr["DiscountAmount"] = productViewModel.DiscountAmount.GetValueOrDefault();
                    dr["AmountAfterDiscount"] = productViewModel.AmountAfterDiscount.GetValueOrDefault();
                    dr["TaxValue"] = productViewModel.TaxValue.GetValueOrDefault();
                    dr["TotalDiscountedAmount"] = productViewModel.TotalDiscountedAmount.GetValueOrDefault();
                    dr["TotalTaxAmount"] = productViewModel.TotalTaxAmount.GetValueOrDefault();
                    dr["TotalTaxValueByQuantity"] = productViewModel.TotalTaxAmount.GetValueOrDefault() * product.Quantity.GetValueOrDefault();

                    dr["TotalCGSTQuantity"] = productViewModel.CGST.GetValueOrDefault() * productViewModel.Quantity;


                    dr["TotalSGSTQuantity"] = productViewModel.SGST.GetValueOrDefault() * productViewModel.Quantity;


                    dt.Rows.Add(dr);

                    ViewState["currentTable"] = dt;

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }

            }
            else
            {
                DataTable dt = new DataTable();
                DataRow dr = null;
                dt.Columns.Add(new DataColumn("RowNumber", typeof(int)));
                dt.Columns.Add(new DataColumn("ProductId", typeof(int)));
                dt.Columns.Add(new DataColumn("ProductName", typeof(string)));
                dt.Columns.Add(new DataColumn("Quantity", typeof(string)));
                dt.Columns.Add(new DataColumn("Measurements", typeof(string)));
                dt.Columns.Add(new DataColumn("CostPrice", typeof(decimal)));
                dt.Columns.Add(new DataColumn("SellPrice", typeof(decimal)));
                dt.Columns.Add(new DataColumn("CGST", typeof(decimal)));
                dt.Columns.Add(new DataColumn("SGST", typeof(decimal)));
                dt.Columns.Add(new DataColumn("WithoutTax", typeof(string)));
                dt.Columns.Add(new DataColumn("TotalAmount", typeof(string)));
                dt.Columns.Add(new DataColumn("TaxValue", typeof(string)));
                dt.Columns.Add(new DataColumn("DiscountAmount", typeof(string)));
                dt.Columns.Add(new DataColumn("AmountAfterDiscount", typeof(string)));
                dt.Columns.Add(new DataColumn("TotalDiscountedAmount", typeof(decimal)));
                dt.Columns.Add(new DataColumn("TotalTaxAmount", typeof(decimal)));
                //TotalTaxValueByQuantity
                dt.Columns.Add(new DataColumn("TotalTaxValueByQuantity", typeof(decimal)));
                dt.Columns.Add(new DataColumn("TotalSGSTQuantity", typeof(decimal)));
                dt.Columns.Add(new DataColumn("TotalCGSTQuantity", typeof(decimal)));

                dr = dt.NewRow();
                dr["RowNumber"] = 1;
                dr["ProductId"] = product.Id;
                dr["ProductName"] = productViewModel.ProductName;
                dr["Quantity"] = 1;
                dr["Measurements"] = productViewModel.Measurements;
                dr["CGST"] = productViewModel.CGST.GetValueOrDefault();
                dr["SGST"] = productViewModel.SGST.GetValueOrDefault();
                dr["CostPrice"] = productViewModel.CostPrice;
                dr["SellPrice"] = productViewModel.SellingPrice;
                dr["TotalAmount"] = productViewModel.Total;
                dr["WithoutTax"] = productViewModel.WithoutTax.GetValueOrDefault();
                dr["DiscountAmount"] = productViewModel.DiscountAmount.GetValueOrDefault();
                dr["AmountAfterDiscount"] = productViewModel.AmountAfterDiscount.GetValueOrDefault();
                dr["TaxValue"] = productViewModel.TaxValue.GetValueOrDefault();
                dr["TotalDiscountedAmount"] = productViewModel.TotalDiscountedAmount.GetValueOrDefault();
                dr["TotalTaxAmount"] = productViewModel.TotalTaxAmount.GetValueOrDefault();
                dr["TotalTaxValueByQuantity"] = productViewModel.TaxValue.GetValueOrDefault() * productViewModel.Quantity;
                dr["TotalCGSTQuantity"] = productViewModel.CGST.GetValueOrDefault() * productViewModel.Quantity;


                dr["TotalSGSTQuantity"] = productViewModel.SGST.GetValueOrDefault() * productViewModel.Quantity;
                dt.Rows.Add(dr);

               // dt.Rows.Add(dr["DiscountAmount"]);

                // Total SUM Panel
                totalSumWithTax = Convert.ToDecimal(productViewModel.Total);
                totalSumWithoutTax = Convert.ToDecimal(productViewModel.WithoutTax.GetValueOrDefault());
                totalTaxTobePaid = Convert.ToDecimal(productViewModel.TotalTaxAmount.GetValueOrDefault() * productViewModel.Quantity);
                totalDiscountOffered = Convert.ToDecimal(productViewModel.TotalDiscountedAmount.GetValueOrDefault());

                ViewState["currentTable"] = dt;

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }

           
            
             Panel1.Visible = true;  
            // Display Total SUM Panel
            NetTotalSum.Text = Math.Round(totalSumWithTax).ToString();
            NetAmountAfterDiscount.Text = Math.Round(totalSumWithoutTax).ToString();
            NetTaxAmount.Text = Math.Round(totalTaxTobePaid).ToString();
            NetDiscountAmount.Text = Math.Round(totalDiscountOffered).ToString();

        }



        


        protected void RefreshGrid(object obj, EventArgs e) {

            this.GlobalGridRefresher();
        }


        private decimal? calculateProductTotalPriceRefresher(RefreshPriceCalculator refreshCalculator)
        {
            decimal centralGSTValue = 0;
            decimal stateGSTValue = 0;

            decimal taxValue = 0;
            if (!refreshCalculator.CGST.HasValue)
            {
                // default value
                centralGSTValue = 0;

            }
            else
            {
                centralGSTValue = refreshCalculator.CGST.Value;
            }
            if (!refreshCalculator.SGST.HasValue)
            {
                // default value
                stateGSTValue = 0;

            }
            else
            {
                stateGSTValue = refreshCalculator.SGST.Value;
            }


            if (!refreshCalculator.TaxValue.HasValue)
            {
                taxValue = 0;
            }
            else
            {
                taxValue = refreshCalculator.TaxValue.Value;
            }

            var cumulativeGST = stateGSTValue + centralGSTValue;

            var cumulativeGSTByQuantity = refreshCalculator.Quantity * cumulativeGST;
            var cumulativeTaxvalue =  taxValue;
            decimal percentile = 100;
            var productPrice = refreshCalculator.AmountAfterDiscount + ((cumulativeTaxvalue * (cumulativeGST / percentile))*refreshCalculator.Quantity);
            var totalPriceByQuantity = productPrice;
            return totalPriceByQuantity;

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }







        protected void quantityChanged(object sender, EventArgs e)
        {
            GridViewRow gridViewRow = (GridViewRow)((TextBox)sender).Parent.Parent.Parent.Parent;

            this.ControlRefresher(gridViewRow);
        }

        protected void SellPriceChanged(object sender, EventArgs e)
        {
            GridViewRow gridViewRow = (GridViewRow)((TextBox)sender).Parent.Parent.Parent.Parent;

            this.ControlRefresher(gridViewRow);
        }

        protected void CGSTChanged(object sender, EventArgs e)
        {
            GridViewRow gridViewRow = (GridViewRow)((TextBox)sender).Parent.Parent.Parent.Parent;

            this.ControlRefresher(gridViewRow);
        }

        protected void SGSTChanged(object sender, EventArgs e)
        {
            GridViewRow gridViewRow = (GridViewRow)((TextBox)sender).Parent.Parent.Parent.Parent;

            this.ControlRefresher(gridViewRow);
        }



        protected void DiscountAmountChanged(object sender, EventArgs e)
        {
             GridViewRow gridViewRow = (GridViewRow)((TextBox)sender).Parent.Parent.Parent.Parent;

             this.ControlRefresher(gridViewRow);
            
        }

        
        protected void TaxValueChanged(object sender, EventArgs e)
        {
             GridViewRow gridViewRow = (GridViewRow)((TextBox)sender).Parent.Parent.Parent.Parent;

             this.ControlRefresher(gridViewRow);
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
                this.GlobalGridRefresher();
            }
            

        }

        private void GlobalGridRefresher()
        {
            decimal totalSumWithoutTax = 0;
            decimal totalSumWithTax = 0;
            decimal totalTaxTobePaid = 0;
            decimal totalDiscountOffered = 0;

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
                    TextBox quantity = (TextBox)GridView1.Rows[i].Cells[1].FindControl("Quantity");
                    TextBox cgst = (TextBox)GridView1.Rows[i].Cells[1].FindControl("CGST");
                    TextBox sgst = (TextBox)GridView1.Rows[i].Cells[1].FindControl("SGST");
                    TextBox measurements = (TextBox)GridView1.Rows[i].Cells[1].FindControl("Measurements");
                    TextBox totalAmount = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TotalAmount");
                    TextBox WithoutTax = (TextBox)GridView1.Rows[i].Cells[1].FindControl("WithoutTax");

                    TextBox discountAmount = (TextBox)GridView1.Rows[i].Cells[1].FindControl("DiscountAmount");
                    TextBox amountAfterDiscount = (TextBox)GridView1.Rows[i].Cells[1].FindControl("AmountAfterDiscount");
                    TextBox taxValue = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TaxValue");

                    TextBox totalDiscountedAmount = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TotalDiscountedAmount");
                    TextBox totalTaxAmount = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TotalTaxAmount");

                    // TotalTaxValueByQuantity
                    TextBox TotalTaxValueByQuantity = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TotalTaxValueByQuantity");

                    TextBox TotalSGSTQuantity = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TotalSGSTQuantity");
                    TextBox TotalCGSTQuantity = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TotalCGSTQuantity");

                    var refreshCalculator = new RefreshPriceCalculator
                    {
                        Quantity = Convert.ToInt32(quantity.Text),
                        SellingPrice = Convert.ToDecimal(sPrice.Text),
                        CGST = Convert.ToDecimal(cgst.Text),
                        SGST = Convert.ToDecimal(sgst.Text),
                        TaxValue = Convert.ToDecimal(taxValue.Text),
                        AmountAfterDiscount = Convert.ToDecimal(amountAfterDiscount.Text),
                    };


                    var productViewModel = new ProductViewModel
                    {
                        AmountAfterDiscount =  Convert.ToInt32(quantity.Text) *( Convert.ToDecimal(sPrice.Text)-Convert.ToDecimal(discountAmount.Text)),
                        Total = this.calculateProductTotalPriceRefresher(refreshCalculator),

                       

                    };

                    // only total and discountAfterApplied needs to be updated.
                    amountAfterDiscount.Text = productViewModel.AmountAfterDiscount.ToString();
                    totalAmount.Text = productViewModel.Total.ToString();
                    WithoutTax.Text = amountAfterDiscount.Text;
                    totalDiscountedAmount.Text = (Convert.ToDecimal(quantity.Text) * Convert.ToDecimal(discountAmount.Text)).ToString();
                    totalTaxAmount.Text = (Convert.ToDecimal(totalAmount.Text) - Convert.ToDecimal(WithoutTax.Text)).ToString();
                    TotalTaxValueByQuantity.Text = (Convert.ToDecimal(taxValue.Text) * Convert.ToInt32(quantity.Text)).ToString();


                    TotalCGSTQuantity.Text = (Convert.ToDecimal(quantity.Text) * Convert.ToDecimal(cgst.Text)).ToString();

                    TotalSGSTQuantity.Text = (Convert.ToDecimal(quantity.Text) * Convert.ToDecimal(sgst.Text)).ToString();


                    // we need to update all the fields on dataTable
                    currentTable.Rows[i]["ProductName"] = pName.Text;
                    currentTable.Rows[i]["Quantity"] = quantity.Text;
                    currentTable.Rows[i]["CostPrice"] = cPrice.Text;
                    currentTable.Rows[i]["SellPrice"] = sPrice.Text;
                    currentTable.Rows[i]["CGST"] = cgst.Text;
                    currentTable.Rows[i]["SGST"] = sgst.Text;
                    currentTable.Rows[i]["Measurements"] = measurements.Text;
                    currentTable.Rows[i]["TotalAmount"] = totalAmount.Text;
                    currentTable.Rows[i]["WithoutTax"] = WithoutTax.Text;
                    currentTable.Rows[i]["DiscountAmount"] = discountAmount.Text;
                    currentTable.Rows[i]["AmountAfterDiscount"] = amountAfterDiscount.Text;
                    currentTable.Rows[i]["TaxValue"] = taxValue.Text;

                    currentTable.Rows[i]["TotalDiscountedAmount"] = totalDiscountedAmount.Text;
                    currentTable.Rows[i]["TotalTaxAmount"] = totalTaxAmount.Text;

                    currentTable.Rows[i]["TotalTaxValueByQuantity"] = TotalTaxValueByQuantity.Text;


                    // GST
                    currentTable.Rows[i]["TotalSGSTQuantity"] = TotalSGSTQuantity.Text;
                    currentTable.Rows[i]["TotalCGSTQuantity"] = TotalCGSTQuantity.Text;

                    // updating Panel
                    
                    totalSumWithoutTax =totalSumWithoutTax + Convert.ToDecimal(WithoutTax.Text);
                    totalSumWithTax = totalSumWithTax + Convert.ToDecimal(totalAmount.Text);
                    totalDiscountOffered = totalDiscountOffered + Convert.ToDecimal(totalDiscountedAmount.Text);
                    totalTaxTobePaid = totalTaxTobePaid+Convert.ToDecimal(totalTaxAmount.Text);
                }

                //var footerRow = currentTable.NewRow();

                //footerRow["TotalDiscountedAmount"] = totalDiscountOffered;
                //footerRow["TotalTaxAmount"] = totalTaxTobePaid;
                //footerRow["TotalAmount"] = totalSumWithTax;
                //footerRow["WithoutTax"] = totalSumWithoutTax;

                //currentTable.Rows.Add(footerRow);

                ViewState["currentTable"] = currentTable;
               // this.CalculateTotalAmountPanel();
                //Panel1.Visible = true;
                //NetSumWithoutTax.Text = totalSumWithoutTax.ToString();
                //NetSumWithTax.Text = totalSumWithTax.ToString();
                //NetTax.Text = totalTaxTobePaid.ToString();

            }

            // Update Panel Setup
            NetTotalSum.Text = Math.Round(totalSumWithTax).ToString();
            NetDiscountAmount.Text = Math.Round(totalDiscountOffered).ToString();
            NetAmountAfterDiscount.Text = Math.Round(totalSumWithoutTax).ToString();
            NetTaxAmount.Text = Math.Round(totalTaxTobePaid).ToString();
            UpdatePanel2.Update();
        }

        private void ControlRefresher(GridViewRow gridViewRow)
        {
            TextBox quantity = (TextBox)gridViewRow.FindControl("Quantity");
            TextBox productName = (TextBox)gridViewRow.FindControl("ProductName");
            TextBox costPrice = (TextBox)gridViewRow.FindControl("CostPrice");
            TextBox cgst = (TextBox)gridViewRow.FindControl("CGST");
            TextBox sgst = (TextBox)gridViewRow.FindControl("SGST");
            TextBox sellingPrice = (TextBox)gridViewRow.FindControl("SellPrice");
            TextBox measurement = (TextBox)gridViewRow.FindControl("Measurements");
            TextBox total = (TextBox)gridViewRow.FindControl("TotalAmount");
            TextBox WithoutTax = (TextBox)gridViewRow.FindControl("WithoutTax");

            TextBox discount = (TextBox)gridViewRow.FindControl("DiscountAmount");
            TextBox amountAfterDiscount = (TextBox)gridViewRow.FindControl("AmountAfterDiscount");
            TextBox taxValue = (TextBox)gridViewRow.FindControl("TaxValue");

            TextBox totalDiscountedAmount = (TextBox)gridViewRow.FindControl("TotalDiscountedAmount");
            TextBox totalTaxAmount = (TextBox)gridViewRow.FindControl("TotalTaxAmount");
            

           // TotalTaxValueByQuantity
            TextBox TotalTaxValueByQuantity = (TextBox)gridViewRow.FindControl("TotalTaxValueByQuantity");

            var refreshCalculator = new RefreshPriceCalculator
            {
                Quantity = Convert.ToInt32(quantity.Text),
                SellingPrice = Convert.ToDecimal(sellingPrice.Text),
                CGST = Convert.ToDecimal(cgst.Text),
                SGST = Convert.ToDecimal(sgst.Text),
                TaxValue = Convert.ToDecimal(taxValue.Text),
            };

            amountAfterDiscount.Text = (Convert.ToInt32(quantity.Text)*(Convert.ToDecimal(sellingPrice.Text) - Convert.ToDecimal(discount.Text))).ToString(); 
            total.Text = this.calculateProductTotalPriceRefresher(refreshCalculator).GetValueOrDefault().ToString();
            WithoutTax.Text = amountAfterDiscount.Text;

            totalTaxAmount.Text = (Convert.ToDecimal(total.Text) - Convert.ToDecimal(WithoutTax.Text)).ToString();
            totalDiscountedAmount.Text = (Convert.ToInt32(quantity.Text) * Convert.ToDecimal(discount.Text)).ToString();


            TotalTaxValueByQuantity.Text = (Convert.ToDecimal(taxValue.Text) * Convert.ToInt32(quantity.Text)).ToString();
            if (ViewState["currentTable"] != null)
            {

                // update the ViewState
                this.GlobalGridRefresher();
                  
            }
        }

 



        //private void CalculateTotalAmountPanel()
        //{

        //    decimal totalAmountWithoutTax = 0;
        //    decimal totalAmountWithTax = 0;

        //    if (ViewState["currentTable"] != null)                                   
        //    {

        //        // var dataTable = GridView1.Rows[0].Cells[2].ToString();
        //        // refresh calculation
        //        DataTable currentTable = (DataTable)ViewState["currentTable"];

        //        for (var i = 0; i < currentTable.Rows.Count; i++)
        //        {

        //            TextBox pName = (TextBox)GridView1.Rows[i].Cells[1].FindControl("ProductName");
        //            TextBox cPrice = (TextBox)GridView1.Rows[i].Cells[1].FindControl("CostPrice");
        //      
       // TextBox sPrice = (TextBox)GridView1.Rows[i].Cells[1].FindControl("SellPrice");
        //            TextBox quantity = (TextBox)GridView1.Rows[i].Cells[1].FindControl("Quantity");
        //            TextBox cgst = (TextBox)GridView1.Rows[i].Cells[1].FindControl("CGST");
        //            TextBox sgst = (TextBox)GridView1.Rows[i].Cells[1].FindControl("SGST");
        //            TextBox measurements = (TextBox)GridView1.Rows[i].Cells[1].FindControl("Measurements");
        //            TextBox totalAmount = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TotalAmount");
        //            TextBox WithoutTax = (TextBox)GridView1.Rows[i].Cells[1].FindControl("WithoutTax");

        //            totalAmountWithoutTax = totalAmountWithoutTax + Convert.ToDecimal(WithoutTax.Text);
        //            totalAmountWithTax = totalAmountWithTax + Convert.ToDecimal(totalAmount.Text);
                   

        //        }

        //        NetItemsTotalWithoutTax.ReadOnly = false;
        //        NetItemsTotalWithoutTax.Text = totalAmountWithoutTax.ToString();
        //        NetItemsTotalWithoutTax.ReadOnly = true;

        //        NetItemsTotalWithTax.ReadOnly = false;
        //        NetItemsTotalWithTax.Text = totalAmountWithTax.ToString();
        //        NetItemsTotalWithTax.ReadOnly = true;

        //    }
        //}

        protected void OnRowDataBound(object obj, GridViewRowEventArgs e) {

          }

        protected void GenerateInvoice_Click(object sender, EventArgs e)
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
                    TextBox quantity = (TextBox)GridView1.Rows[i].Cells[1].FindControl("Quantity");
                    TextBox cgst = (TextBox)GridView1.Rows[i].Cells[1].FindControl("CGST");
                    TextBox sgst = (TextBox)GridView1.Rows[i].Cells[1].FindControl("SGST");
                    TextBox measurements = (TextBox)GridView1.Rows[i].Cells[1].FindControl("Measurements");
                    TextBox totalAmount = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TotalAmount");
                    TextBox WithoutTax = (TextBox)GridView1.Rows[i].Cells[1].FindControl("WithoutTax");

                    TextBox discountAmount = (TextBox)GridView1.Rows[i].Cells[1].FindControl("DiscountAmount");
                    TextBox amountAfterDiscount = (TextBox)GridView1.Rows[i].Cells[1].FindControl("AmountAfterDiscount");
                    TextBox taxValue = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TaxValue");

                    TextBox totalDiscountedAmount = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TotalDiscountedAmount");
                    TextBox totalTaxAmount = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TotalTaxAmount");

                    // TotalTaxValueByQuantity
                    TextBox TotalTaxValueByQuantity = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TotalTaxValueByQuantity");

                    TextBox TotalSGSTQuantity = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TotalSGSTQuantity");
                    TextBox TotalCGSTQuantity = (TextBox)GridView1.Rows[i].Cells[1].FindControl("TotalCGSTQuantity");


                    var invoiceItem = new InvoiceItem { 
                    
                    Name = pName.Text,
                    ProductId = Convert.ToInt32(currentTable.Rows[i]["ProductId"]),
                    Quantity = Convert.ToInt32(quantity.Text),
                    SellPrice = Convert.ToDecimal(sPrice.Text),
                    SGSTPerItem = Convert.ToDecimal(sgst.Text),
                    CGSTPerItem = Convert.ToDecimal(cgst.Text),
                    DiscountPerItem = Convert.ToDecimal(discountAmount.Text),
                    TotalDiscount = Convert.ToDecimal(NetDiscountAmount.Text),
                    TaxValuePerItem = Convert.ToDecimal(taxValue.Text),
                    TotalTaxValue = Convert.ToDecimal(TotalTaxValueByQuantity.Text),
                      TotalTaxAmount = Convert.ToDecimal(totalTaxAmount.Text),
                      TotalCGST = Convert.ToDecimal(TotalCGSTQuantity.Text),
                      TotalSGST = Convert.ToDecimal(TotalSGSTQuantity.Text),
                      TotalAmountAfterDiscount = Convert.ToDecimal(amountAfterDiscount.Text),
                      TotalAmountWithoutTax = Convert.ToDecimal(WithoutTax.Text),
                       TotalCalculatedAmount = Convert.ToDecimal(totalAmount.Text),
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
            var customerInVoice = new CustomerInvoice { 
                  CustomerId = customer.Id,
                  DateOfCreation = DateTime.Now,
                  TotalAmountPaidByCustomer = Convert.ToDecimal(NetTotalSum.Text),

                  TotalAmountWithoutTax = Convert.ToDecimal(NetAmountAfterDiscount.Text),

                  TotalDiscountInAmount =Convert.ToDecimal(NetDiscountAmount.Text),
                  TotalTaxAmount= Convert.ToDecimal(NetTaxAmount.Text),
                  
                
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

     










        }

    
}