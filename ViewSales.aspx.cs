using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NemisisWebApp.Service;
using NemisisWebApp.ViewModel;

namespace NemisisWebApp
{
    public partial class ViewSales : System.Web.UI.Page
    {

        private SalesService salesService;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.salesService = new SalesService();
                var getAllInvoices = this.salesService.GetAllInvoices().Result;
                // populate the Grid
                this.LoadSalesListGrid(getAllInvoices);
                
            }
        }

        private void LoadSalesListGrid(List<ViewSaleModel> viewSalesModel)
        {
           // convert viewSalesModel List into DataTable
            var dataTable = Utility.ToDataTable(viewSalesModel);
            this.InvoiceListGrid.DataSource = dataTable;
            this.InvoiceListGrid.DataBind();

        }


    }
}