using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shop_Online.Models.ViewModels
{
    public class Order
    {
        public Invoice invoice { get; set; }
        public List<OrderDetail> Detail { get; set; }
    }
}
