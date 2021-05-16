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

        public async Task<IActionResult> Index()
        {
            List<HomeProduct> listProduct = new List<HomeProduct>();
            for(int i=0; i<8; i++)
            {
                HomeProduct product = new HomeProduct();
                product.product_info = await _context.Product.FirstOrDefaultAsync(p => p.ID == 4);
                var images = await _context.ProductImage.Where(p => p.Product_ID ==4).FirstOrDefaultAsync();
                product.thumbnail = images.Image;

                listProduct.Add(product);
            }
            for (int i = 8; i < 20; i++)
            {
                HomeProduct product = new HomeProduct();
                product.product_info = await _context.Product.FirstOrDefaultAsync(p => p.ID == 5);
                var images = await _context.ProductImage.Where(p => p.Product_ID ==5).FirstOrDefaultAsync();
                product.thumbnail = images.Image;

                listProduct.Add(product);
            }
            return View(listProduct);
        }

        // GET: Products/Detail/5
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

            var productDescription = await _context.ProductDetail.FirstOrDefaultAsync(p => p.Product_ID == id);
            var productImages = await _context.ProductImage.Where(p => p.Product_ID == id).ToListAsync();

            ProductInfo productInfo = new ProductInfo();
            productInfo.product = product;
            productInfo.productDescription = productDescription;
            productInfo.productImages = productImages;

            List<ProductInfo> SaleOffProductList = new List<ProductInfo>();
            for(int i=0; i<9; i++)
            {
                var tempProduct = await _context.Product.FirstOrDefaultAsync(p => p.ID == 4);
                var tempProductImages = await _context.ProductImage.Where(p => p.Product_ID == 4).ToListAsync();
                var tempProductDetail = await _context.ProductDetail.FirstOrDefaultAsync(p => p.Product_ID == 4);

                ProductInfo tempProductInfo = new ProductInfo();
                tempProductInfo.product = tempProduct;
                tempProductInfo.productImages = tempProductImages;
                tempProductInfo.productDescription = tempProductDetail;

                SaleOffProductList.Add(tempProductInfo);
            }

            List<ProductInfo> SameProductList = new List<ProductInfo>();
            for (int i = 0; i < 8; i++)
            {
                var tempProduct = await _context.Product.FirstOrDefaultAsync(p => p.ID == 5);
                var tempProductImages = await _context.ProductImage.Where(p => p.Product_ID == 5).ToListAsync();
                var tempProductDetail = await _context.ProductDetail.FirstOrDefaultAsync(p => p.Product_ID == 5);

                ProductInfo tempProductInfo = new ProductInfo();
                tempProductInfo.product = tempProduct;
                tempProductInfo.productImages = tempProductImages;
                tempProductInfo.productDescription = tempProductDetail;

                SameProductList.Add(tempProductInfo);
            }

            DetailProduct productDetail = new DetailProduct();
            productDetail.product = productInfo;
            productDetail.SaleOffProductList = SaleOffProductList;
            productDetail.SameProductList = SameProductList;

            return View(productDetail);
        }

        private bool ProductExists(int id)
        {
            return _context.Product.Any(e => e.ID == id);
        }
    }
}
