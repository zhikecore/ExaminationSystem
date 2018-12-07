using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Master
{
    public partial class Right : System.Web.UI.MasterPage
    {
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
