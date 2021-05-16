using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Shop_Online.Models.ViewModels
{
    public class CustomerLogin
    {
        [Required(AllowEmptyStrings =false, ErrorMessage ="Vui lòng nhập tên tài khoản")]
        public string UserName { get; set; }
        [Required(AllowEmptyStrings = false, ErrorMessage = "Vui lòng nhập mật khẩu")]
        public string Password { get; set; }

    }
}
