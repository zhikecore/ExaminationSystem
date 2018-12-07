using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Web.Master
{
    public partial class TMS : System.Web.UI.MasterPage
    {
        public static string TMSWebUrl = ConfigurationSettings.AppSettings["TMSWebUrl"];
        BasePage currentPage = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            currentPage = Page as BasePage;
        }

        protected void imgbt_Search_Click(object sender, ImageClickEventArgs e)
        {
            if (currentPage != null)
            {
                int ID = int.Parse(tb_Name.Value);
                currentPage.BaseBind(ID);
            }
        }
    }
}
