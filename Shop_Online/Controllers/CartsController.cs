using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using Microsoft.EntityFrameworkCore;
using Shop_Online.Data;
using Shop_Online.Models;
using Shop_Online.Models.ViewModels;

namespace Shop_Online.Controllers
{
    public class CartsController : Controller
    {

        private readonly ShopOnlineContext _context;

        public CartsController(ShopOnlineContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            List<CartItem> cart = new List<CartItem>();
            
            if (HttpContext.Session.GetString("cart")!=null)
            {
                string productListString = HttpContext.Session.GetString("cart");
                string[] products = productListString.Split(";");
                foreach (string productID in products)
                {
                    string[] cartItem = productID.Split("-");
                    int id = Int32.Parse(cartItem[0]);
                    if (ProductExists(id))
                    {
                        var product = await _context.Product.FirstOrDefaultAsync(p => p.ID == id);
                        var images = await _context.ProductImage.Where(p => p.Product_ID == id).ToListAsync();

                        CartItem item = new CartItem();
                        item.product = product;
                        item.thumbnail = images[0];

                        cart.Add(item);


                        //decrease product quantity when it is added to customer cart.
                        //testing...
                        product.Amount = product.Amount - 1;
                        _context.Update(product);
                    }
                }
            }
            return View(cart);
        }

        //only use to test when developing website.
        [HttpGet]
        public void clearSession()
        {
            HttpContext.Session.Clear();
        }

        [HttpPost]
        public string AddProduct(string data)
        {
            string message;
            try
            {
                HttpContext.Session.SetString("cart", data);
                message = "success";
            }
            catch
            {
                HttpContext.Session.Remove("cart");
                message = "clear cart";
            }

            return message;
        }

        private bool ProductExists(int id)
        {
            return _context.Product.Any(e => e.ID == id);
        }
    }
}
