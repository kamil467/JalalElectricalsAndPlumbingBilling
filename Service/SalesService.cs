using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading.Tasks;
using NemisisWebApp.ViewModel;

namespace NemisisWebApp.Service
{
    public class SalesService
    {
        private readonly NemisisBillingEntities context;

        public SalesService()
        {
            this.context = new NemisisBillingEntities();
        }

        public Task<List<ViewSaleModel>> GetAllInvoices()
        {

            var taskResult = Task.Factory.StartNew(() =>
            {
                var invoicesList = this.context.CustomerInvoices
                    .Include("Customer")
                    .Select(i => new ViewSaleModel {
                    CustomerName =       i.Customer.Name,
                    InvoiceDate = i.DateOfCreation.Value,
                    InvoiceNumber = i.InvoiceTIN,
                    SalesValue = i.TotalAmountPaidByCustomer.Value,
                      DiscountAmount = i.TotalDiscountInAmount.Value                   
                    }).ToList();

                return invoicesList;
            }
            );

            return taskResult;
        }
    }
}