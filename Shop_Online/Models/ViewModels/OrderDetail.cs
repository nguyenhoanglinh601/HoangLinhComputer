using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shop_Online.Models.ViewModels
{
    public class OrderDetail
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string thumbnail { get; set; }
        public int quantity { get; set; }
        public decimal price { get; set; }
    }
}
