using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace Web
{
    public class BasePage: Page
    {
        /// <summary>
        /// 输出每个内容页的欢迎信息，内容页继承此类并重写此方法即可。此方法会由母版页自动调用
        /// </summary>
        public virtual void BaseBind(int ID)
        {
            //return "这是页面基类返回的欢迎信息！";
        }
    }
}
