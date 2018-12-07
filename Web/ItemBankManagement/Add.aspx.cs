using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.ItemBankManagement
{
    public partial class Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CourseBind();
                string TitleType = Request.QueryString["TitleType"];
                string url=null;
                if (TitleType == "判断题")
                {
                    url = "T_F.aspx?TitleType=" + Request.QueryString["TitleType"] + "&CourseID=" + Request.QueryString["CourseID"] ;
                }
                else
                {
                    if (TitleType == "单选")
                    {
                        url = "Radio.aspx?TitleType=" + Request.QueryString["TitleType"] + "&CourseID=" + Request.QueryString["CourseID"] ;
                    }
                    else
                    {
                        if (TitleType == "值选项")
                        {
                            url = "RadioValue.aspx?TitleType=" + Request.QueryString["TitleType"] + "&CourseID=" + Request.QueryString["CourseID"] ;
                        }
                        else
                        {
                            url = "RedioMore.aspx?TitleType=" + Request.QueryString["TitleType"] + "&CourseID=" + Request.QueryString["CourseID"];
                        }
                    }
                }
                myIframe.Attributes.Add("src", url); 
            }
        }
        private void CourseBind()
        {
            BLL.CourseSystem bll = new BLL.CourseSystem();
            List<Model.CourseSystem> list = new List<Model.CourseSystem>();
            list = bll.Details(int.Parse(Request.QueryString["CourseID"]));
            lb_CourseTitle.Text = "课程名：" + list[0].Title;
        }
    }
}
