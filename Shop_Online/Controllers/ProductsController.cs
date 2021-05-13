using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Shop_Online.Data;
using Shop_Online.Models;
using Shop_Online.Models.ViewModels;

namespace Shop_Online.Controllers
{
    public class ProductsController : Controller
    {
        private readonly ShopOnlineContext _context;

        public ProductsController(ShopOnlineContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Home()
        {
            List<HomeProduct> listProduct = new List<HomeProduct>();
            for(int i=0; i<20; i++)
            {
                HomeProduct product = new HomeProduct();
                product.product_info = await _context.Product.FirstOrDefaultAsync(p => p.ID == 4);
                var images = await _context.ProductImage.ToListAsync();
                product.thumbnail = images.First().Image;

                listProduct.Add(product);
            }
            return View(listProduct);
        }

        // GET: Products
        public async Task<IActionResult> Index()
        {
            return View(await _context.Product.ToListAsync());
        }

        // GET: Products/Details/5
        public async Task<IActionResult> Detail(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Product
                .FirstOrDefaultAsync(m => m.ID == id);

            if (product == null)
            {
                return NotFound();
            }

            LinkedList<Product> SaleOffProductList = new LinkedList<Product>();
            for(int i=0; i<4; i++)
            {
                Product tempProduct = new Product();
                tempProduct = await _context.Product.FirstOrDefaultAsync(p => p.ID == 4);

                SaleOffProductList.AddLast(tempProduct);
            }

            LinkedList<Product> SameProductList = new LinkedList<Product>();
            for (int i = 0; i < 8; i++)
            {
                Product tempProduct = new Product();
                tempProduct = await _context.Product.FirstOrDefaultAsync(p => p.ID == 4);

                SameProductList.AddLast(tempProduct);
            }

            List<ProductImage> productImages =await _context.ProductImage.Where(p => p.Product_ID == 4).ToListAsync();

            DetailProduct productDetail = new DetailProduct();
            productDetail.productInfo = product;
            productDetail.productImages = productImages;
            productDetail.SaleOffProductList = SaleOffProductList;
            productDetail.SameProductList = SameProductList;

            return View(productDetail);
        }

        // GET: Products/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ID,Product_Name,Catalog_id,Amount,price")] Product product)
        {
            if (ModelState.IsValid)
            {
                _context.Add(product);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(product);
        }

        // GET: Products/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Product.FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }
            return View(product);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ID,Product_Name,Catalog_id,Amount,price")] Product product)
        {
            if (id != product.ID)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(product);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductExists(product.ID))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(product);
        }

        // GET: Products/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Product
                .FirstOrDefaultAsync(m => m.ID == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var product = await _context.Product.FindAsync(id);
            _context.Product.Remove(product);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ProductExists(int id)
        {
            return _context.Product.Any(e => e.ID == id);
        }
    }
}
