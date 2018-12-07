using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;

namespace Web.SmallWindows
{
    public partial class CourseRadio : System.Web.UI.Page
    {
        /// <summary>
        /// 需返回的字符串
        /// </summary>
        public string str_returnValue = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //if (Common.LoginInfo.isLogin())
                //{
                lb_wen.Text = "";
                //BLL.UsersGlobal bll = new BLL.UsersGlobal();
                BindTreeView();

                ViewState["SortOrder"] = "Money";
                ViewState["OrderDire"] = "ASC";


                //gv01_Bind("101");
                //}
                //else
                //{
                //    Common.LoginInfo.isLogout();
                //}
            }
        }
        #region 课程体系
        private void BindTreeView()
        {
            BLL.CourseSystem bll = new BLL.CourseSystem();
            List<Model.CourseSystem> list = new List<Model.CourseSystem>();

            list = bll.GetList();
            try
            {
                TreeNode tn = new TreeNode();
                tn.Text = list[0].Name + "(<span style='color:Red'>" + list[0].CourseCount + "</span>)";
                tn.Value = list[0].CourseLbID.ToString();

                TreeView1.Nodes.Add(tn);

                CreateChildNode(tn);
            }
            catch
            {
                lb_Msg.Text = "没有内容！";
            }
        }
        private void CreateChildNode(TreeNode t)
        {
            BLL.CourseSystem bll = new BLL.CourseSystem();
            List<Model.CourseSystem> list = new List<Model.CourseSystem>();
            list = bll.GetList();
            for (int i = 1; i < list.Count; i++)
            {
                if (list[i].Up.ToString() == t.Value.ToString())
                {
                    TreeNode tn2 = new TreeNode();
                    tn2.Text = list[i].Name + "(<span style='color:Red'>" + list[i].CourseCount + "</span>)";
                    tn2.Value = list[i].CourseLbID.ToString();

                    t.ChildNodes.Add(tn2);
                    CreateChildNode(tn2);
                }
            }
        }
        #endregion

        protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
        {
            gv01_Bind(TreeView1.SelectedValue);
        }

        public void gv01_Bind(string CourseLbID)
        {
            str_returnValue = lb_wen.Text;
            BLL.CourseSystem bll = new BLL.CourseSystem();
            List<Model.CourseSystem> list = new List<Model.CourseSystem>();

            string Sort = ViewState["SortOrder"].ToString() + " " + ViewState["OrderDire"].ToString();
            lb_Title.Text = "管理体系为：[" + getCourseLbName(int.Parse(CourseLbID)) + "]的课程";

            list = bll.GetList(1, 10000, int.Parse(CourseLbID));

            gv_01.DataSource = list;
            gv_01.DataBind();
        }
        private string getCourseLbName(int CourseLbID)
        {
            BLL.CourseSystem bll = new BLL.CourseSystem();
            List<Model.CourseSystem> list = new List<Model.CourseSystem>();
            list = bll.GetList(CourseLbID);
            return list[0].Name;
        }
        protected void gv_01_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onmouseover", "currentcolor=this.style.backgroundColor;this.style.backgroundColor='#ccddee'");
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=currentcolor");
            }
            if (e.Row.RowState == DataControlRowState.Edit || e.Row.RowState == (DataControlRowState.Alternate | DataControlRowState.Edit))
            {
                ((TextBox)e.Row.Cells[4].Controls[0]).Width = Unit.Parse("100%");
                ((TextBox)e.Row.Cells[5].Controls[0]).Width = Unit.Parse("100%");
            }
        }

        protected void bt_fn_gv_01_checkbox_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < gv_01.Rows.Count; i++)
            {
                HtmlInputCheckBox checkbox = (HtmlInputCheckBox)gv_01.Rows[i].FindControl("gv_01_checkbox");
                if (checkbox.Checked == true)
                {
                    gv_02_Bind(checkbox.Value);
                }
            }
        }
        private void gv_02_Bind(string ID)
        {
            lb_CourseID.Text = lb_CourseID.Text + ID + ",";
            string str = Common.Function.MaxLength(lb_CourseID.Text, lb_CourseID.Text.Length - 1);
            DataTable dt = DBUtility.CourseSys.gettb("select * from [AP_COURSE] where [CR_ID] in (" + str + ") ");

            gv_02.DataSource = dt;
            gv_02.DataBind();

            gv_02.Visible = true;

            str_returnValue = Common.Function.Format_str(str);
            lb_wen.Text = str_returnValue;
        }

        protected void gv_02_ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton img_bt = (ImageButton)sender;
            string str = lb_CourseID.Text;
            str = str.Replace(img_bt.ToolTip + ",", "");
            lb_CourseID.Text = str;
            if (str.Length > 1)
            {
                str = Common.Function.MaxLength(str, str.Length - 1);
                DataTable dt = DBUtility.CourseSys.gettb("select * from [AP_COURSE] where [CR_ID] in (" + str + ")");
                gv_02.DataSource = dt;
                gv_02.DataBind();
                gv_02.Visible = true;
            }
            else
            {
                gv_02.Visible = false;
            }

            str_returnValue = Common.Function.Format_str(str);
            lb_wen.Text = str_returnValue;
        }
    }
}