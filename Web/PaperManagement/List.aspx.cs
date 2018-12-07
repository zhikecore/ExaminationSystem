using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.PaperManagement
{
    public partial class List : BasePage
    {
        public int CourseID = 0;
        int Total = 0;
        int PageSize = 15;
        public int i = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    lb_CourseID.Text = Request.QueryString["CourseID"];
                    CourseID = int.Parse(Request.QueryString["CourseID"]);
                    CourseBind();
                }
                catch
                { lb_CourseID.Text = "0"; }
                gv01_Bind();
            }
        }
        public override void BaseBind(int ID)
        {
            CourseID = ID;
            lb_CourseID.Text = ID.ToString();
            CourseBind();
            gv01_Bind();
        }
        /// <summary>
        /// 关于锁
        /// </summary>
        private void aboutLock()
        {
            for (int i = 0; i < gv01.Rows.Count; i++)
            {
                Label lb_ID = (Label)gv01.Rows[i].FindControl("lb_ID");
                HyperLink hl_Lock = (HyperLink)gv01.Rows[i].FindControl("hl_Lock");
                if (int.Parse(hl_Lock.Text) > 0)
                {
                    hl_Lock.ImageUrl = "/Images/Lock_OFF.jpg";
                    hl_Lock.Text = "";
                    //HyperLink hl_Updata = (HyperLink)gv01.Rows[i].FindControl("hl_Updata");
                    HyperLink hl_Del = (HyperLink)gv01.Rows[i].FindControl("hl_Del");
                    hl_Del.Visible = true;
                    //hl_Updata.Visible = true;
                    //hl_Updata.NavigateUrl = "/P-M/Updata" + lb_ID.Text + "-" + Request.QueryString["TitleType"] + "-" + int.Parse(lb_CourseID.Text) + ".html";
                    hl_Del.NavigateUrl = "/PaperManagement/Del.aspx?ID=" + lb_ID.Text + "&TitleType=" + Request.QueryString["TitleType"] + "&CourseID=" + int.Parse(lb_CourseID.Text) + ".html";
                }
                else
                {
                    hl_Lock.ImageUrl = "/Images/Lock_ON.jpg";
                    hl_Lock.Text = "销定";
                }
            }
        }

        private void CourseBind()
        {
            if (int.Parse(lb_CourseID.Text) > 0)
            {
                BLL.CourseSystem bll = new BLL.CourseSystem();
                List<Model.CourseSystem> list = new List<Model.CourseSystem>();
                list = bll.Details(int.Parse(lb_CourseID.Text));
                lb_CourseTitle.Text = "课程名：" + list[0].Title;
            }
            else
            {
                lb_CourseTitle.Text = "所有课程";
            }
        }
        private void gv01_Bind()
        {
            BLL.Papers bll = new BLL.Papers();
            List<Model.Papers> list = new List<Model.Papers>();


            if (ViewState["PageCount"] == null)
            {
                ViewState["PageCount"] = 1;
            }
            if (int.Parse(lb_CourseID.Text) > 0)
            {
                list = bll.GetList(Convert.ToInt32(ViewState["PageCount"]), PageSize, Request.QueryString["TitleType"], int.Parse(lb_CourseID.Text));
            }
            else
            {
                list = bll.GetList(Convert.ToInt32(ViewState["PageCount"]), PageSize, Request.QueryString["TitleType"]);            
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

            aboutLock();
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
            BLL.Papers bll = new BLL.Papers();
            Model.Papers model = new Model.Papers();
            List<Model.Papers> list = new List<Model.Papers>();
            list = bll.Details(ID);
            model.ID = ID;
            model.Name = list[0].Name;
            if (list[0].Lock > 0)
            {
                model.Lock = 0;
            }
            else
            {
                model.Lock = 1;
            }
            if (bll.Updata(model) > 0)
            {
                Common.Function.Redirect("List.aspx?TitleType=" + Request.QueryString["TitleType"] + "&CourseID=" + lb_CourseID.Text );
            }
            else
            {
                Common.Function.AlertRedirect("系统繁忙！", "List.aspx?TitleType=" + Request.QueryString["TitleType"] + "&CourseID=" + lb_CourseID.Text);
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