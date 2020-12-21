using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NemisisWebApp.ViewModel
{
    public class RefreshPriceCalculator
    {

        public int Quantity { get; set; }

        public decimal? SellingPrice { get; set; }

        public decimal? CGST { get; set; }

        public decimal? SGST { get; set; }

        public decimal? DiscountAmount { get; set; }

        public decimal? AmountAfterDiscount { get; set; }

        public decimal? TaxValue { get; set; }


        public decimal? TotalDiscountedAmount { get; set; }

        public decimal? TotalTaxAmount { get; set; }  

    }
}