using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Admin
{
    public partial class Exchange : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string rul = Request.QueryString["BigClass"] + "-" + Request.QueryString["TitleType"];
                if (Request.QueryString["TitleType"] == "按时间查" && Request.QueryString["BigClass"] == "试卷管理")
                {
                    Common.Function.Redirect("/R-M/T" + rul+".html", "Iframe_Div_Mid_Right");
                }
                else
                {
                    if (Request.QueryString["TitleType"] == "按学员查" && Request.QueryString["BigClass"] == "试卷管理")
                    {
                        Common.Function.Redirect("/R-M/S" + rul + ".html", "Iframe_Div_Mid_Right");
                    }
                    else
                    {
                        Common.Function.Redirect("Div_Mid_Right" + rul + ".html", "Iframe_Div_Mid_Right");
                    }
                }
            }
        }
    }
}
