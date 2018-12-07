using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.ResultsManagement
{
    public partial class TMS_List : BasePage
    {
        int Total = 0;
        int PageSize = 15;
        public int CourseID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ViewState["SortOrder"] = "Time";
                ViewState["OrderDire"] = "ASC";
                CourseBind();
            }
        }
        public override void BaseBind(int ID)
        {
            ViewState["SortOrder"] = "Time";
            ViewState["OrderDire"] = "ASC";
            CourseID = ID;
            CourseBind();
        }
        private void CourseBind()
        {
            div_Course.Visible = true;
            if (CourseID > 0)
            {
                BLL.CourseSystem bll = new BLL.CourseSystem();
                List<Model.CourseSystem> list = new List<Model.CourseSystem>();
                list = bll.Details(CourseID);
                lb_CourseTitle.Text = "课程名：" + list[0].Title;
            }
            else
            {
                lb_CourseTitle.Text = "所有课程";
            }
            gv01_Bind();
        }
        private void gv01_Bind()
        {
            
            BLL.Results bll = new BLL.Results();
            List<Model.Results> list = new List<Model.Results>();


            if (ViewState["PageCount"] == null)
            {
                ViewState["PageCount"] = 1;
            }
            string Sort = ViewState["SortOrder"].ToString() + " " + ViewState["OrderDire"].ToString();
            if (CourseID > 0)
            {
                list = bll.GetList(CourseID);
            }
            else
            {
                //list = bll.GetList();
                list = bll.GetList(Convert.ToInt32(ViewState["PageCount"]), PageSize, Sort, tb_Search.Text.Trim(), ddl_Search.SelectedValue);
            }
            gv01.DataSource = list;
            gv01.DataBind();
            if (list.Count > 0)
            {
                Total = list[0].RowTotal;
                labAlert.Visible = false;
            }
            else
            {
                labAlert.Visible = true;
                labAlert.Text = "没有任何资料!";
                labAlert.Style.Add("color", "red");
            }
            PageCount();
            Page_Status();
            Auto();

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

            gv01_Bind1();
        }
        private void gv01_Bind1()
        {
            BLL.Results bll = new BLL.Results();
            List<Model.Results> list = new List<Model.Results>();


            if (ViewState["PageCount"] == null)
            {
                ViewState["PageCount"] = 1;
            }
            string Sort = ViewState["SortOrder"].ToString() + " " + ViewState["OrderDire"].ToString();
            if (CourseID > 0)
            {
                list = bll.GetList(CourseID);
            }
            else
            {
                //list = bll.GetList();
                list = bll.GetList(Convert.ToInt32(ViewState["PageCount"]), PageSize, Sort, tb_Search.Text.Trim(), ddl_Search.SelectedValue);
            }
            gv01.DataSource = list;
            gv01.DataBind();
            if (list.Count > 0)
            {
                Total = list[0].RowTotal;
                labAlert.Visible = false;
            }
            else
            {
                labAlert.Visible = true;
                labAlert.Text = "没有任何资料!";
                labAlert.Style.Add("color", "red");
            }
            PageCount();
            Page_Status();
        }
        protected void gv01_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onMouseOver", "SetNewColor(this);");
                e.Row.Attributes.Add("onMouseOut", "SetOldColor(this);");
            }
        }

        private void PageCount()
        {

            int temtotal = Total % PageSize;
            if (temtotal > 0)
            {
                ViewState["PageTotal"] = Convert.ToInt32(Total / PageSize) + 1;
            }
            else
            {
                ViewState["PageTotal"] = Total / PageSize;
            }

        }
        private void Page_Status()
        {
            LitTotal.Text = "总数:" + Total.ToString() + "";
            LitCurrAge.Text = "每页:" + PageSize + "条&nbsp;页次:" + ViewState["PageTotal"].ToString() + "/" + ViewState["PageCount"].ToString() + "&nbsp;";

            DrpGoAge.Items.Clear();
            for (int i = 1; i < Convert.ToInt32(ViewState["PageTotal"]) + 1; i++)
            {
                DrpGoAge.Items.Add(i.ToString());
            }
            if (DrpGoAge.Items.Count > 0)
            {
                DrpGoAge.SelectedIndex = Convert.ToInt32(ViewState["PageCount"]) - 1;
            }
        }
        protected void imgbtFirst_Click(object sender, EventArgs e)
        {
            string str = ((ImageButton)sender).CommandArgument;
            switch (str)
            {
                case "First":

                    if (Convert.ToInt32(ViewState["PageCount"]) > 0)
                        ViewState["PageCount"] = 1;
                    break;

                case "Next":

                    if (Convert.ToInt32(ViewState["PageCount"]) < Convert.ToInt32(ViewState["PageTotal"]))
                        ViewState["PageCount"] = Convert.ToInt32(ViewState["PageCount"]) + 1;
                    break;

                case "Prev":

                    if (Convert.ToInt32(ViewState["PageCount"]) > 1)
                        ViewState["PageCount"] = Convert.ToInt32(ViewState["PageCount"]) - 1;
                    break;

                case "Last":

                    if (Convert.ToInt32(ViewState["PageCount"]) < Convert.ToInt32(ViewState["PageTotal"]))
                        ViewState["PageCount"] = ViewState["PageTotal"];
                    break;
            }
            gv01_Bind();
        }
        protected void DrpGoAge_SelectedIndexChanged(object sender, EventArgs e)
        {
            int TempIndex = System.Convert.ToInt32(DrpGoAge.SelectedValue);
            ViewState["PageCount"] = TempIndex;
            gv01_Bind();
        }
        protected void img_Search_Click(object sender, ImageClickEventArgs e)
        {
            gv01_Bind();
        }
        protected void imgF5_Click(object sender, ImageClickEventArgs e)
        {
            gv01_Bind();
        }
        protected void gv_01_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sPage = e.SortExpression;

            if (ViewState["SortOrder"].ToString() == sPage)
            {
                if (ViewState["OrderDire"].ToString() == "Desc")
                    ViewState["OrderDire"] = "ASC";
                else
                    ViewState["OrderDire"] = "Desc";
            }
            else
            {
                ViewState["SortOrder"] = e.SortExpression;
            }
            gv01_Bind();
        }
    }
}
