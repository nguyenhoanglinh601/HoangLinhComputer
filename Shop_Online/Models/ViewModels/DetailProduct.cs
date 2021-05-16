using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shop_Online.Models.ViewModels
{
    public class DetailProduct
    {
        public ProductInfo product { get; set; }
        public List<ProductInfo> SaleOffProductList { get; set; }
        public List<ProductInfo> SameProductList { get; set; }

    }
}
