using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using NemisisWebApp.Service;
using System.Reflection;

namespace NemisisWebApp
{
    public partial class Products : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void AddButtonClick(object sender, EventArgs e)
        {
          
           // redirect to Add Product page

            Response.Redirect("AddProduct.aspx");
        }

        protected void EntityDataSource1_Selecting(object sender, EntityDataSourceSelectingEventArgs e)
        {
         
        }

     

        protected void Button2_Click(object sender, EventArgs e)
        {
            var searchValue = searchString.Text;
            if (string.IsNullOrEmpty(searchValue) || string.IsNullOrWhiteSpace(searchValue))
            {
                // do nothing
            }
            else
            {
                var productService = new ProductService();
                var productList = productService.GetProductsBySearhString(searchValue).Result;

                GridView1.DataSourceID = string.Empty;
                GridView1.DataSource = productList;
                GridView1.DataBind();
            }
           
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void SearchProduct(object sender, EventArgs e)
        {
            var searchValue = searchString.Text;
            if (string.IsNullOrEmpty(searchValue) || string.IsNullOrWhiteSpace(searchValue))
            {
                // do nothing
            }
            else
            {
                var productService = new ProductService();
                var productList = productService.GetProductsBySearhString(searchValue).Result;

                var dataTable = ToDataTable<Product>(productList);
                GridView1.DataSourceID = string.Empty;
                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;

            var productId = row.Cells[1].Text;

            Response.Redirect("UpdateProduct.aspx?id=" + productId);

        }

        protected void ShowAll(object sender, EventArgs e)
        {
            searchString.Text = string.Empty;
            var productService = new ProductService();
            var productList = productService.GetAllProducts().Result;

            var dataTable = ToDataTable<Product>(productList);
            GridView1.DataSourceID = string.Empty;
            GridView1.DataSource = dataTable;
            GridView1.DataBind();
        }

        protected void ProductPageIndexChanging(object sender, GridViewPageEventArgs e)
        {


            GridView1.PageIndex = e.NewPageIndex;

            this.SearchProduct(sender, e);


            }



        public static DataTable ToDataTable<T>(List<T> items)
        {
            DataTable dataTable = new DataTable(typeof(T).Name);

            //Get all the properties
            PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            foreach (PropertyInfo prop in Props)
            {
                //Defining type of data column gives proper data table 
                var type = (prop.PropertyType.IsGenericType && prop.PropertyType.GetGenericTypeDefinition() == typeof(Nullable<>) ? Nullable.GetUnderlyingType(prop.PropertyType) : prop.PropertyType);
                //Setting column names as Property names
                dataTable.Columns.Add(prop.Name, type);
            }
            foreach (T item in items)
            {
                var values = new object[Props.Length];
                for (int i = 0; i < Props.Length; i++)
                {
                    //inserting property values to datatable rows
                    values[i] = Props[i].GetValue(item, null);
                }
                dataTable.Rows.Add(values);
            }
            //put a breakpoint here and check datatable
            return dataTable;
        }      
    }
}