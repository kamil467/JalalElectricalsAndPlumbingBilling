using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NemisisWebApp.ViewModel
{
    public class ViewSaleModel
    {
        public virtual string InvoiceNumber { get; set; }

        public virtual DateTime InvoiceDate { get; set; }

        public virtual string CustomerName { get; set; }

        public virtual decimal SalesValue { get; set; }

        public virtual decimal DiscountAmount { get; set; }

    }
}