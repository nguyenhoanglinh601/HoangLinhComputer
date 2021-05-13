using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shop_Online.Models.ViewModels
{
    public class DetailProduct
    {
        public Product productInfo { get; set; }
        public List<ProductImage> productImages { get; set; }
        public LinkedList<Product> SaleOffProductList { get; set; }
        public LinkedList<Product> SameProductList { get; set; }

    }
}
