using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.ItemBankManagement
{
    public partial class TMS_Add : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
            }
        }
        public override void BaseBind(int ID)
        {
            CourseBind(ID);
        }
        private void CourseBind(int CourseID)
        {
            if (CourseID == 0)
            {
                lb_CourseTitle.Text = "请先选择课程！";
            }
            else
            {
                BLL.CourseSystem bll = new BLL.CourseSystem();
                List<Model.CourseSystem> list = new List<Model.CourseSystem>();
                list = bll.Details(CourseID);
                lb_CourseTitle.Text = "课程名：" + list[0].Title;


                string TitleType = Request.QueryString["TitleType"];
                string url = null;
                if (TitleType == "判断题")
                {
                    url = "T_F.aspx?TitleType=" + Request.QueryString["TitleType"] + "&CourseID=" + CourseID + "";
                }
                else
                {
                    if (TitleType == "单选")
                    {
                        url = "Radio.aspx?TitleType=" + Request.QueryString["TitleType"] + "&CourseID=" + CourseID + "";
                    }
                    else
                    {
                        if (TitleType == "值选项")
                        {
                            url = "RedioValue.aspx?TitleType=" + Request.QueryString["TitleType"] + "&CourseID=" + CourseID + "";
                        }
                        else
                        {
                            url = "RedioMore.aspx?TitleType=" + Request.QueryString["TitleType"] + "&CourseID=" + CourseID + "";
                        }
                    }
                }
                myIframe.Attributes.Add("src", url);
            }
        }
    }
}
