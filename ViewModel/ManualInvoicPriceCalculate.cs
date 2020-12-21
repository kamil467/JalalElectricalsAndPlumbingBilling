using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NemisisWebApp.ViewModel
{
    public class ManualInvoicPriceCalculate
    {
        public int Quantity { get; set; }

        public decimal? SellingPrice { get; set; }

        /// <summary>
        /// Total discount amount . not bound to pre quantity
        /// </summary>
        public decimal? DiscountAmount { get; set; }

        public decimal? AmountAfterDiscount { get; set; }

        /// <summary>
        /// Total Tax Amount not bound to single quanity
        /// </summary>
        public decimal? TaxAmount { get; set; }

    }
}