using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shop_Online.Models.ViewModels
{
    public class SearchProductInfo
    {
        public List<HomeProduct> products { get; set; }
        public string key_word { get; set; }
    }
}
