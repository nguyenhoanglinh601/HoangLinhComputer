using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shop_Online.Models.Helper
{
    public static class URLGeneration
    {
        private static readonly string[] VietNamChar = new string[]
        {
            "aAeEoOuUiIdDyY",
            "áàạảãâấầậẩẫăắằặẳẵ",
            "ÁÀẠẢÃÂẤẦẬẨẪĂẮẰẶẲẴ",
            "éèẹẻẽêếềệểễ",
            "ÉÈẸẺẼÊẾỀỆỂỄ",
            "óòọỏõôốồộổỗơớờợởỡ",
            "ÓÒỌỎÕÔỐỒỘỔỖƠỚỜỢỞỠ",
            "úùụủũưứừựửữ",
            "ÚÙỤỦŨƯỨỪỰỬỮ",
            "íìịỉĩ",
            "ÍÌỊỈĨ",
            "đ",
            "Đ",
            "ýỳỵỷỹ",
            "ÝỲỴỶỸ"
        };
        public static string utf8Convert(string str)
        {
            //Thay thế và lọc dấu từng char      
            for (int i = 1; i < VietNamChar.Length; i++)
            {
                for (int j = 0; j < VietNamChar[i].Length; j++)
                    str = str.Replace(VietNamChar[i][j], VietNamChar[0][i - 1]);
            }
            return str;
        }

        public static string UrlGenerate(string title, int id)
        {
            title = utf8Convert(title);
            string newTitle = title.Replace(" ", "-");
            newTitle = newTitle.Replace("/", "-");
            newTitle = newTitle.Replace(".", "-");
            newTitle = newTitle.Replace("(", "");
            newTitle = newTitle.Replace(")", "");
            return newTitle + "-" + id;
        }

        public static string UrlGenerate(string title)
        {
            title = utf8Convert(title);
            string newTitle = title.Replace(" ", "-");
            newTitle = newTitle.Replace("/", "-");
            newTitle = newTitle.Replace(".", "-");
            newTitle = newTitle.Replace("(", "");
            newTitle = newTitle.Replace(")", "");
            return newTitle;
        }
    }
}
