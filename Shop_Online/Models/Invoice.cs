using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Shop_Online.Models
{
    public class Invoice
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        public string Invoice_Name { get; set; }
        public int Customer_Id { get; set; }
        public int Shipper_Id { get; set; }
        public decimal TotalMoney { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{dd-MM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime CreateDate { get; set; }
        public string CustomerAddress { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{dd-MM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime ShipDate { get; set; }

        public Employee Shipper { get; set; }
        public ICollection<InvoiceDetail> InvoiceDetails { get; set; }
        public Customer Customer { get; set; }
    }
}
