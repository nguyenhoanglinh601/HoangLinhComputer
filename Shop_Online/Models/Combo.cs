using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Shop_Online.Models
{
    public class Combo
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        public string Combo_Name { get; set; }
        public string ProductList { get; set; }
        public DateTime StartDay { get; set; }
        public DateTime EndDay { get; set; }
        public decimal TotalMoney { get; set; }
        public string Discount { get; set; }
        public decimal DiscountMoney { get; set; }

        public ICollection<InvoiceDetail> InvoiceDetails { get; set; }
    }
}
