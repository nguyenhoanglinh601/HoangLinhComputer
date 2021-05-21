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

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            string user_id = HttpContext.Session.GetString("user_id");
            if (user_id == null)
            {
                return Redirect("../../Customers/Login");
            }

            int customer_id = Int32.Parse(user_id);

            List<Order> orders = new List<Order>();
            var invoices = await _context.Invoice
                .Where(i => i.Customer_Id == customer_id)
                .OrderByDescending(i=>i.ID)
                .ToListAsync();

            foreach(Invoice invoice in invoices)
            {
                Order order = new Order();
                order.invoice = invoice;

                var invoiceDetails = await _context.InvoiceDetail
                    .Where(i => i.Invoice_ID == invoice.ID)
                    .ToListAsync();

                List<OrderDetail> orderDetails = new List<OrderDetail>();
                foreach(InvoiceDetail invoiceDetail in invoiceDetails)
                {
                    OrderDetail orderDetail = new OrderDetail();
                    Product product = await _context.Product
                       .Where(p => p.ID == invoiceDetail.Product_ID)
                       .FirstOrDefaultAsync();

                    orderDetail.ProductName = product.Product_Name;
                    orderDetail.quantity = invoiceDetail.Amount;

                    orderDetails.Add(orderDetail);
                }

                order.Detail = orderDetails;

                orders.Add(order);
            }

            return View(orders);
        }

        [HttpPost]
        public async Task<string> Order(string user_id, string cart, string address)
        {
            int id = Int32.Parse(user_id);
            Customer customer = await _context.Customer.Where(c => c.ID == id).FirstOrDefaultAsync();
            try
            {
                if (customer != null)
                {
                    HttpContext.Session.SetString("user_id", user_id);

                    Invoice invoice = new Invoice();
                    invoice.Invoice_Name = "Hóa đơn trực tuyến";
                    invoice.Customer_Id = customer.ID;
                    invoice.Shipper_Id = 0;

                    DateTime now = DateTime.Now;
                    invoice.CreateDate = now;

                    DateTime shipDate = new DateTime(0001, 1, 1);
                    invoice.ShipDate = shipDate;

                    if (String.IsNullOrEmpty(address))
                    {
                        invoice.CustomerAddress = customer.Address;
                    }
                    else
                    {
                        invoice.CustomerAddress = address;
                    }
                    
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

                        product.Amount -= quantity;
                        _context.Update(product);
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

        public async Task<IActionResult> Detail(int id)
        {
            string user_id = HttpContext.Session.GetString("user_id");
            if(user_id == null)
            {
                return Redirect("../../Customers/Login");
            }

            int cus = Int32.Parse(user_id);
            if (!InvoicExists(id, cus)) return Redirect("../../");

            Invoice invoice = await _context.Invoice
                .Where(i => i.ID == id && i.Customer_Id == cus)
                .FirstOrDefaultAsync();

            Order order = new Order();
            order.invoice = invoice;

            var invoiceDetails = await _context.InvoiceDetail.Where(i => i.Invoice_ID == id).ToListAsync();

            List<OrderDetail> orderDetails = new List<OrderDetail>();
            foreach(InvoiceDetail invoiceDetail in invoiceDetails)
            {
                OrderDetail orderDetail = new OrderDetail();

                Product product = await _context.Product
                    .Where(p => p.ID == invoiceDetail.Product_ID)
                    .FirstOrDefaultAsync();
                var productImages = await _context.ProductImage
                    .Where(p => p.Product_ID == invoiceDetail.Product_ID)
                    .ToListAsync();

                orderDetail.ProductId = invoiceDetail.Product_ID;
                orderDetail.ProductName = product.Product_Name;
                orderDetail.quantity = invoiceDetail.Amount;
                orderDetail.price = invoiceDetail.Price;
                orderDetail.thumbnail = productImages.First().Image;

                orderDetails.Add(orderDetail);
            }

            order.Detail = orderDetails;

            return View(order);
        }
        private bool InvoicExists(int id, int cus)
        {
            return _context.Invoice.Any(i => i.ID == id && i.Customer_Id == cus);
        }

        private bool ProductExists(int id)
        {
            return _context.Product.Any(e => e.ID == id);
        }
    }
}
