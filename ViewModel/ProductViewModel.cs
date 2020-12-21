using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NemisisWebApp.ViewModel
{
    public class ProductViewModel
    {

        public string ProductName { get; set; }

        public int Quantity { get; set; }

        public decimal? CostPrice { get; set; }

        public decimal? SellingPrice { get; set; }

        public decimal? CGST { get; set; }

        public decimal? SGST { get; set; }

        public string Measurements { get; set; }
        public decimal? Total { get; set; }

        public decimal? WithoutTax { get; set; }

        public decimal? DiscountAmount { get; set; }

        public decimal? AmountAfterDiscount { get; set; }

        public decimal? TaxValue { get; set; }

        public decimal? TotalDiscountedAmount { get; set; }

        public decimal? TotalTaxAmount { get; set; }



    }
}