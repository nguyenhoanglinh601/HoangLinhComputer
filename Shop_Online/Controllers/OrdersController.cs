using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Shop_Online.Data;
using Shop_Online.Models.ViewModels;
using Microsoft.AspNetCore.Http;
using Shop_Online.Models;

namespace Shop_Online.Controllers
{
    public class OrdersController : Controller
    {
        private readonly ShopOnlineContext _context;

        public OrdersController(ShopOnlineContext context)
        {
            _context = context;
        }

        [HttpPost]
        public async Task<string> Order(string user_id, string cart)
        {
            int id = Int32.Parse(user_id);
            Customer customer = await _context.Customer.Where(c => c.ID == id).FirstOrDefaultAsync();
            try
            {
                if (customer != null)
                {
                    Invoice invoice = new Invoice();
                    invoice.Invoice_Name = "Hóa đơn trực tuyến";
                    invoice.Customer_Id = customer.ID;
                    invoice.Shipper_Id = 0;

                    DateTime now = DateTime.Now;
                    invoice.CreateDate = now;

                    DateTime shipDate = new DateTime(0001, 1, 1);
                    invoice.ShipDate = shipDate;

                    invoice.CustomerAddress = customer.Address;
                    invoice.TotalMoney = 0;

                    _context.Add(invoice);
                    await _context.SaveChangesAsync();

                    int invoice_id = invoice.ID;

                    string[] items = cart.Split(";");
                    foreach (string item in items)
                    {
                        InvoiceDetail invoiceDetail = new InvoiceDetail();

                        string[] productInfo = item.Split("-");
                        int product_id = Int32.Parse(productInfo[0]);
                        int quantity = Int32.Parse(productInfo[1]);

                        if (ProductExists(product_id) == false) return null;

                        Product product = await _context.Product.Where(p => p.ID == product_id).FirstOrDefaultAsync();

                        invoiceDetail.Invoice_ID = invoice_id;
                        invoiceDetail.Product_ID = product_id;
                        invoiceDetail.Combo_ID = 0;
                        invoiceDetail.Amount = quantity;
                        invoiceDetail.Price = product.price;

                        _context.Add(invoiceDetail);

                        invoice.TotalMoney += invoiceDetail.Price * invoiceDetail.Amount;
                    }

                    await _context.SaveChangesAsync();

                    return invoice.ID.ToString();
                }
                return null;
            }
            catch(Exception e)
            {
                return e.InnerException.Message;
            }
        }

        private bool ProductExists(int id)
        {
            return _context.Product.Any(e => e.ID == id);
        }
    }
}
