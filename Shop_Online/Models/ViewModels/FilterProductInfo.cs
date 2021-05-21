using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shop_Online.Models.ViewModels
{
    public class FilterProductInfo
    {
        public List<HomeProduct> products { get; set; }
        public string category_name { get; set; }
        public string url { get; set; }
    }
}
