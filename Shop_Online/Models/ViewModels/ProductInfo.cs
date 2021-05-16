using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shop_Online.Models.ViewModels
{
    public class ProductInfo
    {
        public Product product { get; set; }
        public ProductDetail productDescription { get; set; }
        public List<ProductImage> productImages { get; set; }
    }
}
