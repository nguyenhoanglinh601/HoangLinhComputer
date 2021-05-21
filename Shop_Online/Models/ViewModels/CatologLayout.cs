using Shop_Online.Models.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shop_Online.Models.ViewModels
{
    public class CatologLayout
    {
        public string catolog { get; set; }
        public string url { get; set; }

        public void setUrl()
        {
            this.url = URLGeneration.UrlGenerate(catolog);
        }
    }
}
