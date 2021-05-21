using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Shop_Online.Data;
using Shop_Online.Models;
using Shop_Online.Models.Helper;
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
            //for(int i=0; i<8; i++)
            //{
            //    HomeProduct product = new HomeProduct();
            //    product.product_info = await _context.Product.FirstOrDefaultAsync(p => p.ID == 4);
            //    var images = await _context.ProductImage.Where(p => p.Product_ID ==4).FirstOrDefaultAsync();
            //    product.thumbnail = images.Image;
            //    product.url = URLGeneration.UrlGenerate(product.product_info.Product_Name, product.product_info.ID);

            //    listProduct.Add(product);
            //}

            var listBestSaleProduct = await _context.Product
                .Take(8)
                .OrderBy(p => p.ID)
                .ToListAsync();

            listBestSaleProduct.ForEach(item =>
            {
                HomeProduct product = new HomeProduct();
                product.product_info = item;
                var images = _context.ProductImage.Where(p => p.Product_ID == item.ID).FirstOrDefault();
                product.thumbnail = images.Image;
                product.url = URLGeneration.UrlGenerate(product.product_info.Product_Name, product.product_info.ID);
                listProduct.Add(product);
            });

            //for (int i = 8; i < 20; i++)
            //{
            //    HomeProduct product = new HomeProduct();
            //    product.product_info = await _context.Product.FirstOrDefaultAsync(p => p.ID == 5);
            //    var images = await _context.ProductImage.Where(p => p.Product_ID ==5).FirstOrDefaultAsync();
            //    product.thumbnail = images.Image;
            //    product.url = URLGeneration.UrlGenerate(product.product_info.Product_Name, product.product_info.ID);

            //    listProduct.Add(product);
            //}

            var listHighlightProduct = _context.Product
                .Skip(8)
                .Take(12)
                .OrderBy(p => p.ID)
                .ToList();

            listHighlightProduct.ForEach(item =>
            {
                HomeProduct product = new HomeProduct();
                product.product_info = item;
                var images = _context.ProductImage.Where(p => p.Product_ID == item.ID).FirstOrDefault();
                product.thumbnail = images.Image;
                product.url = URLGeneration.UrlGenerate(product.product_info.Product_Name, product.product_info.ID);
                listProduct.Add(product);
            });

            return View(listProduct);
        }

        // GET: Products/Detail/5
        public async Task<IActionResult> Detail(string p)
        {
            if (String.IsNullOrEmpty(p))
            {
                return RedirectToAction("Index");
            }

            int id = Int32.Parse(p.Split("-").Last());

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
            productInfo.url = URLGeneration.UrlGenerate(product.Product_Name, product.ID);

            List<ProductInfo> SaleOffProductList = new List<ProductInfo>();
            var listProductSaleOff = _context.Product
                .OrderBy(p => p.Amount)
                .Take(9)
                .ToList();

            listProductSaleOff.ForEach(item =>
            {
                var tempProduct = item;
                var tempProductImages = _context.ProductImage.Where(p => p.Product_ID == item.ID).ToList();
                var tempProductDetail = _context.ProductDetail.FirstOrDefault(p => p.Product_ID == item.ID);

                ProductInfo tempProductInfo = new ProductInfo();
                tempProductInfo.product = tempProduct;
                tempProductInfo.productImages = tempProductImages;
                tempProductInfo.productDescription = tempProductDetail;
                tempProductInfo.url = URLGeneration.UrlGenerate(tempProduct.Product_Name, tempProduct.ID);

                SaleOffProductList.Add(tempProductInfo);
            });

            List<ProductInfo> SameProductList = new List<ProductInfo>();
            var listProductSame = _context.Product
                .OrderByDescending(p => p.ID)
                .Take(8)
                .ToList();

            listProductSame.ForEach(item =>
            {
                var tempProduct = item;
                var tempProductImages = _context.ProductImage.Where(p => p.Product_ID == item.ID).ToList();
                var tempProductDetail = _context.ProductDetail.FirstOrDefault(p => p.Product_ID == item.ID);

                ProductInfo tempProductInfo = new ProductInfo();
                tempProductInfo.product = tempProduct;
                tempProductInfo.productImages = tempProductImages;
                tempProductInfo.productDescription = tempProductDetail;
                tempProductInfo.url = URLGeneration.UrlGenerate(tempProduct.Product_Name, tempProduct.ID);

                SameProductList.Add(tempProductInfo);
            });

            Catolog catolog = await _context.Catolog.Where(c => c.ID == product.Catalog_id).FirstOrDefaultAsync();

            CatologLayout catologLayout = new CatologLayout();
            catologLayout.catolog = catolog.Catolog_Name;
            catologLayout.setUrl();

            DetailProduct productDetail = new DetailProduct();    
            productDetail.product = productInfo;
            productDetail.SaleOffProductList = SaleOffProductList;
            productDetail.SameProductList = SameProductList;
            productDetail.CatologInfo = catologLayout;

            return View(productDetail);
        }

        public async Task<IActionResult> Search(string key_word)
        {
            if (String.IsNullOrEmpty(key_word))
            {
                return RedirectToAction("Index");
            }

            SearchProductInfo searchProductInfo = new SearchProductInfo();
            var listProduct = await _context.Product.Where(p => p.Product_Name.Contains(key_word)).ToListAsync();
            List<HomeProduct> listProductInfo = new List<HomeProduct>();
            listProduct.ForEach(item =>
            {
                HomeProduct product = new HomeProduct();
                product.product_info = _context.Product.FirstOrDefault(p => p.ID == item.ID);
                var images = _context.ProductImage.Where(p => p.Product_ID == item.ID).FirstOrDefault();
                product.thumbnail = images.Image;
                product.url = URLGeneration.UrlGenerate(product.product_info.Product_Name, product.product_info.ID);

                listProductInfo.Add(product);
            });
            //for(int i=0; i<8; i++)
            //{
            //    HomeProduct product = new HomeProduct();
            //    product.product_info = await _context.Product.FirstOrDefaultAsync(p => p.ID == 4);
            //    var images = await _context.ProductImage.Where(p => p.Product_ID ==4).FirstOrDefaultAsync();
            //    product.thumbnail = images.Image;
            //    product.url = URLGeneration.UrlGenerate(product.product_info.Product_Name, product.product_info.ID);

            //    listProduct.Add(product);
            //}

            searchProductInfo.products = listProductInfo;
            searchProductInfo.key_word = key_word;

            return View(searchProductInfo);
        }

        public async Task<IActionResult> filter(string category)
        {
            if (String.IsNullOrEmpty(category))
            {
                return RedirectToAction("Index");
            }

            Catolog catolog = null;

            List<Catolog> listCatolog = await _context.Catolog.ToListAsync();
            foreach (Catolog item in listCatolog)
            {
                if (URLGeneration.UrlGenerate(item.Catolog_Name) == category)
                {
                    catolog = item;
                    break;
                }
            };

            FilterProductInfo filterProductInfo = new FilterProductInfo();

            if (catolog != null)
            {
                int catolog_id = catolog.ID;

                List<Product> listProduct = await _context.Product.Where(p => p.Catalog_id == catolog_id).ToListAsync();

                List<HomeProduct> listProductInfo = new List<HomeProduct>();

                listProduct.ForEach(item =>
                {
                    HomeProduct product = new HomeProduct();
                    product.product_info = _context.Product.FirstOrDefault(p => p.ID == item.ID);
                    var images = _context.ProductImage.Where(p => p.Product_ID == item.ID).FirstOrDefault();
                    product.thumbnail = images.Image;
                    product.url = URLGeneration.UrlGenerate(product.product_info.Product_Name, product.product_info.ID);

                    listProductInfo.Add(product);
                });

                filterProductInfo.products = listProductInfo;

                filterProductInfo.category_name = catolog.Catolog_Name;

                filterProductInfo.url = category;
            }

            return View(filterProductInfo);
        }

        private bool ProductExists(int id)
        {
            return _context.Product.Any(e => e.ID == id);
        }
    }
}
