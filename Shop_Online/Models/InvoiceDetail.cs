using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Shop_Online.Models
{
    public class InvoiceDetail
    {
        [ForeignKey("Invoice")]
        public int Invoice_ID { get; set; }
        [ForeignKey("Product")]
        public int Product_ID { get; set; }
        [Required(AllowEmptyStrings = false)]
        [ForeignKey("Combo")]
        public int Combo_ID { get; set; }
        public int Amount { get; set; }
        public decimal Price { get; set; }

        public Product Product { get; set; }
        public Invoice Invoice { get; set; }
        public Combo Combo { get; set; }
    }
}
