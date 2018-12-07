using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.PaperProduction
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CourseBind();
                int ID = int.Parse(Request.QueryString["ID"].ToString());
                Bind(ID);
            }
        }

        private void Bind(int ID)
        {
            BLL.TitleList bll = new BLL.TitleList();
            List<Model.TitleList> list = new List<Model.TitleList>();
            list = bll.Details(ID);
            lb_Analysis.Text = "　　" + list[0].Analysis;
            lb_T_F.Text = list[0].T_F;
            lb_Title.Text = list[0].Title;
            OptionsListBind(list[0].ID);
        }

        private void OptionsListBind(int TitleListID)
        {
            BLL.OptionsList bll = new BLL.OptionsList();
            List<Model.OptionsList> list = new List<Model.OptionsList>();
            list = bll.Details(TitleListID);
            gv_01.DataSource = list;
            gv_01.DataBind();
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
