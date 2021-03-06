using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Shop_Online.Models
{
    public class ProductImage
    {
        [Key]
        [ForeignKey("Product")]
        public int Product_ID { get; set; }
        [Key]
        public string Image { get; set; }

        public Product Product { get; set; }
    }
}
