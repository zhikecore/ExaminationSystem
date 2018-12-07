using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.ResultsManagement
{
    public partial class List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["CourseID"] != null)
                {
                    CourseBind();
                    div_Course.Visible = true;
                    gv01_Bind(int.Parse(Request.QueryString["CourseID"].ToString()));
                }
                else
                {
                    if (Request.QueryString["UserID"] != null)
                    {
                        gv01_BindUserID(int.Parse(Request.QueryString["UserID"].ToString()));
                    }
                    else
                    {
                        gv01_Bind(Request.QueryString["Time"]);
                    }
                }
            }
        }
        private void gv01_Bind(string Time)
        {
            BLL.Results bll = new BLL.Results();
            List<Model.Results> list = new List<Model.Results>();
            Time = Time[0].ToString() + Time[1].ToString() + Time[2].ToString() + Time[3].ToString() + "-" + Time[4].ToString() + Time[5].ToString() + "-" + Time[6].ToString() + Time[7].ToString();
            if (ViewState["PageCount"] == null)
            {
                ViewState["PageCount"] = 1;
            }
            list = bll.GetList(Time);
            gv01.DataSource = list;
            gv01.DataBind();

            Auto();
        }
        private void gv01_Bind(int CourseID)
        {
            BLL.Results bll = new BLL.Results();
            List<Model.Results> list = new List<Model.Results>();


            if (ViewState["PageCount"] == null)
            {
                ViewState["PageCount"] = 1;
            }
            list = bll.GetList(CourseID);
            gv01.DataSource = list;
            gv01.DataBind();

            Auto();

        }
        private void gv01_BindUserID(int UserID)
        {
            BLL.Results bll = new BLL.Results();
            List<Model.Results> list = new List<Model.Results>();


            if (ViewState["PageCount"] == null)
            {
                ViewState["PageCount"] = 1;
            }
            list = bll.GetListUserID(UserID);

            gv01.DataSource = list;
            gv01.DataBind();


            Auto();

        }
        protected void gv01_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onMouseOver", "SetNewColor(this);");
                e.Row.Attributes.Add("onMouseOut", "SetOldColor(this);");
            }
        }
        private void CourseBind()
        {
            BLL.CourseSystem bll = new BLL.CourseSystem();
            List<Model.CourseSystem> list = new List<Model.CourseSystem>();
            list = bll.Details(int.Parse(Request.QueryString["CourseID"]));
            lb_CourseTitle.Text = "课程名：" + list[0].Title;
        }


        private void Auto()
        {
            int UserID;
            int PapersID;
            string Time;
            for (int i = 0; i < gv01.Rows.Count; i++)
            {
                Label lb_UserID = (Label)gv01.Rows[i].FindControl("lb_UserID");
                Label lb_PapersID = (Label)gv01.Rows[i].FindControl("lb_PapersID");
                Label lb_Time = (Label)gv01.Rows[i].FindControl("lb_Time");

                UserID = int.Parse(lb_UserID.Text);
                PapersID = int.Parse(lb_PapersID.Text);
                Time = lb_Time.Text;

                BLL.Results bll = new BLL.Results();
                List<Model.Results> list = new List<Model.Results>();

                list = bll.Details(UserID, PapersID, Time);
            }

            if (Request.QueryString["CourseID"] != null)
            {
                CourseBind();
                div_Course.Visible = true;
                gv01_Bind1(int.Parse(Request.QueryString["CourseID"].ToString()));
            }
            else
            {
                if (Request.QueryString["UserID"] != null)
                {
                    gv01_BindUserID1(int.Parse(Request.QueryString["UserID"].ToString()));
                }
                else
                {
                    gv01_Bind1(Request.QueryString["Time"]);
                }
            }
        }

        private void gv01_Bind1(string Time)
        {
            BLL.Results bll = new BLL.Results();
            List<Model.Results> list = new List<Model.Results>();
            Time = Time[0].ToString() + Time[1].ToString() + Time[2].ToString() + Time[3].ToString() + "-" + Time[4].ToString() + Time[5].ToString() + "-" + Time[6].ToString() + Time[7].ToString();
            if (ViewState["PageCount"] == null)
            {
                ViewState["PageCount"] = 1;
            }
            list = bll.GetList(Time);
            gv01.DataSource = list;
            gv01.DataBind();
        }
        private void gv01_Bind1(int CourseID)
        {
            BLL.Results bll = new BLL.Results();
            List<Model.Results> list = new List<Model.Results>();


            if (ViewState["PageCount"] == null)
            {
                ViewState["PageCount"] = 1;
            }
            list = bll.GetList(CourseID);
            gv01.DataSource = list;
            gv01.DataBind();
        }
        private void gv01_BindUserID1(int UserID)
        {
            BLL.Results bll = new BLL.Results();
            List<Model.Results> list = new List<Model.Results>();


            if (ViewState["PageCount"] == null)
            {
                ViewState["PageCount"] = 1;
            }
            list = bll.GetListUserID(UserID);

            gv01.DataSource = list;
            gv01.DataBind();
        }
    }
}