using Microsoft.AspNetCore.Mvc;
using Shop_Online.Data;
using Shop_Online.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shop_Online.Models.ViewComponents
{
    public class CatologsLayoutViewComponent : ViewComponent
    {
        private readonly ShopOnlineContext _context;

        public CatologsLayoutViewComponent(ShopOnlineContext context)
        {
            _context = context;
        }
        public async Task<IViewComponentResult> InvokeAsync()
        {
            var catologList = _context.Catolog.ToList();
            List<CatologLayout> catologs = new List<CatologLayout>();

            foreach (Catolog catolog in catologList)
            {
                CatologLayout catologLayout = new CatologLayout();

                catologLayout.catolog = catolog.Catolog_Name;
                catologLayout.setUrl();

                catologs.Add(catologLayout);
            }

            return await Task.FromResult((IViewComponentResult)View("~/Views/Shared/CatologsList.cshtml", catologs));
        }
    }
}
