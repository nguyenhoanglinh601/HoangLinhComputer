using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shop_Online.Models.ViewModels
{
    public class CartItem
    {
        public Product product { get; set; }
        public ProductImage thumbnail { get; set; }
    }
}
