using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Shop_Online.Data;
using Shop_Online.Models;
using Shop_Online.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shop_Online.Controllers
{
    public class CustomersController : Controller
    {
        private readonly ShopOnlineContext _context;

        public CustomersController(ShopOnlineContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public IActionResult ConfirmLogin(CustomerLogin customerLoginInfo)
        {
            if (ModelState.IsValid)
            {
                Customer customer =_context.Customer
                    .Where(c => c.Username == customerLoginInfo.UserName && c.Password == customerLoginInfo.Password)
                    .FirstOrDefault();
                if(customer == null)
                {
                    ViewData["message"] = "Tài khoản không tồn tại";
                    return View("Login", customerLoginInfo);
                }
                else
                {
                    HttpContext.Session.SetString("user_id", customer.ID.ToString());
                    return View("LoginSuccess", customer);
                }
            }
            return View("Login", customerLoginInfo);
        }
    }
}
