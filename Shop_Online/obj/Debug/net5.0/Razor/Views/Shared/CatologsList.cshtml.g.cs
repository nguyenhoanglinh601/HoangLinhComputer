#pragma checksum "F:\Project\ASP MVC\Shop_Online\Shop_Online\Views\Shared\CatologsList.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "22a44fd9a6f2248582482d2568fc0b396995ca31"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Shared_CatologsList), @"mvc.1.0.view", @"/Views/Shared/CatologsList.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "F:\Project\ASP MVC\Shop_Online\Shop_Online\Views\_ViewImports.cshtml"
using Shop_Online;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "F:\Project\ASP MVC\Shop_Online\Shop_Online\Views\_ViewImports.cshtml"
using Shop_Online.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"22a44fd9a6f2248582482d2568fc0b396995ca31", @"/Views/Shared/CatologsList.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"346d189aa664d27ab20536e8a40cd93ce48956a5", @"/Views/_ViewImports.cshtml")]
    public class Views_Shared_CatologsList : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<List<Shop_Online.Models.ViewModels.CatologLayout>>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 2 "F:\Project\ASP MVC\Shop_Online\Shop_Online\Views\Shared\CatologsList.cshtml"
 foreach (var catologLayout in Model)
{

#line default
#line hidden
#nullable disable
            WriteLiteral("    <a class=\"dropdown-item\"");
            BeginWriteAttribute("href", "\r\n       href=\"", 128, "\"", 187, 2);
            WriteAttributeValue("", 143, "/Products/Filter?category=", 143, 26, true);
#nullable restore
#line 5 "F:\Project\ASP MVC\Shop_Online\Shop_Online\Views\Shared\CatologsList.cshtml"
WriteAttributeValue("", 169, catologLayout.url, 169, 18, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">");
#nullable restore
#line 5 "F:\Project\ASP MVC\Shop_Online\Shop_Online\Views\Shared\CatologsList.cshtml"
                                                      Write(catologLayout.catolog);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a>\r\n");
#nullable restore
#line 6 "F:\Project\ASP MVC\Shop_Online\Shop_Online\Views\Shared\CatologsList.cshtml"
}

#line default
#line hidden
#nullable disable
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<List<Shop_Online.Models.ViewModels.CatologLayout>> Html { get; private set; }
    }
}
#pragma warning restore 1591
