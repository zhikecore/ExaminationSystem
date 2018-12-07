using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.PaperManagement
{
    public partial class Del : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int ID = int.Parse(Request.QueryString["ID"]);
            BLL.Papers bll = new BLL.Papers();
            if (bll.Del(ID) > 0)
            {
                Common.Function.AlertRedirect("删除成功！", "List.aspx?TitleType=" + Request.QueryString["TitleType"] + "&CourseID=" + Request.QueryString["CourseID"] );
            }
            else
            {
                Common.Function.AlertRedirect("系统繁忙！", "List.aspx?TitleType=" + Request.QueryString["TitleType"] + "&CourseID=" + Request.QueryString["CourseID"] );
            }
        }
    }
}
