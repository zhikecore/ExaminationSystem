using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.PaperManagement
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["TitleType"] == null)
                {
                    imgid.Visible = false;
                    spanid.Visible = false;
                }
                else
                { }
                
                int ID = int.Parse(Request.QueryString["ID"]);
                Bind(ID);
            }
        }

        private void Bind(int ID)
        {
            BLL.Papers bll = new BLL.Papers();
            List<Model.Papers> list = new List<Model.Papers>();
            list = bll.Details(ID);
            lb_Name.Text = list[0].Name;
            string url = "Radio.aspx?ID=" + ID ;
            myIframe.Attributes.Add("src", url);

            CourseBind(list[0].CourseID);
        }

        private void CourseBind(int CourseID)
        {
            BLL.CourseSystem bll = new BLL.CourseSystem();
            List<Model.CourseSystem> list = new List<Model.CourseSystem>();
            list = bll.Details(CourseID);
            lb_CourseTitle.Text = "课程名：" + list[0].Title;
        }
    }
}