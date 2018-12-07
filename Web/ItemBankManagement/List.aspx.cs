using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.ItemBankManagement
{
    public partial class List : System.Web.UI.Page
    {
        int Total = 0;
        int PageSize = 15;
        public int i = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            //{
                CourseBind();
                gv01_Bind();
            //}
        }

        private void CourseBind()
        {
            BLL.CourseSystem bll = new BLL.CourseSystem();
            List<Model.CourseSystem> list = new List<Model.CourseSystem>();
            list = bll.Details(int.Parse(Request.QueryString["CourseID"]));
            lb_CourseTitle.Text = "课程名："+list[0].Title;
        }
        private void gv01_Bind()
        {
            BLL.TitleList bll = new BLL.TitleList();
            List<Model.TitleList> list = new List<Model.TitleList>();


            if (ViewState["PageCount"] == null)
            {
                ViewState["PageCount"] = 1;
            }
            if (rbl_Extent.SelectedValue.ToString() == "")
            {
                list = bll.GetList(Convert.ToInt32(ViewState["PageCount"]), PageSize, Request.QueryString["TitleType"], int.Parse(Request.QueryString["CourseID"]));
            }
            else
            {
                list = bll.GetList(Convert.ToInt32(ViewState["PageCount"]), PageSize, Request.QueryString["TitleType"], int.Parse(Request.QueryString["CourseID"]),rbl_Extent.SelectedValue.ToString());
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
            }
            PageCount();
            Page_Status();
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
        protected void lnkFirst_Click(object sender, EventArgs e)
        {
            string str = ((LinkButton)sender).CommandArgument;
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

        protected void gv01_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ID = int.Parse(gv01.DataKeys[e.RowIndex]["ID"].ToString());
            BLL.TitleList bll = new BLL.TitleList();
            if (Request.QueryString["TitleType"] == "判断题")
            { }
            else
            {
                BLL.OptionsList bllDEL = new BLL.OptionsList();
                bllDEL.Del_TitleListID(ID);
            }
            if (bll.Del(ID) > 0)
            {
                Common.Function.AlertRedirect("删除成功！", "/ItemBankManagement/List.aspx?TitleType=" + Request.QueryString["TitleType"] + "&CourseID=" + Request.QueryString["CourseID"] );
            }
            else
            {
                Common.Function.AlertRedirect("系统繁忙！", "/ItemBankManagement/List.aspx?TitleType=" + Request.QueryString["TitleType"] + "&CourseID=" + Request.QueryString["CourseID"] );
            }
        }

        protected void gv01_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onMouseOver", "SetNewColor(this);");
                e.Row.Attributes.Add("onMouseOut", "SetOldColor(this);");
            }   
        }
    }
}