using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace Web.Admin
{
    public partial class Div_Mid_Right :Common.OLPage
    {
        int Total = 0;
        int PageSize = 15;
        public int i = 0;
        /// <summary>
        /// 大类(题库管理 试卷制作 试卷管理)
        /// </summary>
        public string BigClass;
        /// <summary>
        /// 标题类型(单选 多选 不定项选 判断题)
        /// </summary>
        public string TitleType;
        /// <summary>
        /// 跳转Url("/ItemBankManagement/Insert.aspx")
        /// </summary>
        public string URL;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BigClass = Request.QueryString["BigClass"];
                if (BigClass != null)
                {
                    BindTreeView();
                    TreeView1.ExpandDepth = 0;
                    TreeView1.CollapseAll();
                }
                else { }
                div_Navigation.Visible = false;
            }
        }
        //protected void BindTreeView()
        //{
        //    BLL.CourseSystem bll = new BLL.CourseSystem();
        //    List<Model.CourseSystem> list = new List<Model.CourseSystem>();
        //    list = bll.GetList();

        //    try
        //    {
        //        if (list[0].Up == 0)
        //        {
        //            TreeNode tn = new TreeNode();
        //            tn.Text = list[0].Name;
        //            tn.Value = list[0].CourseLbID.ToString();

        //            TreeView1.Nodes.Add(tn);

        //            CreateChildNode(tn);
        //        }
        //    }
        //    catch
        //    {
        //        lb_Msg.Text = "没有内容！";
        //    }
        //}

        protected void BindTreeView()
        {
            BLL.CourseSystem bll = new BLL.CourseSystem();
            List<Model.CourseSystem> list = new List<Model.CourseSystem>();
            list = bll.GetList();

            try
            {
                foreach (var item in list)
                {
                    if (item.Up == 0)
                    {
                        TreeNode tn = new TreeNode();
                        tn.Text = item.Name;
                        tn.Value = item.CourseLbID.ToString();

                        TreeView1.Nodes.Add(tn);

                        CreateChildNode(tn);
                    }
                }
            }
            catch
            {
                lb_Msg.Text = "没有内容！";
            }
        }

        protected void CreateChildNode(TreeNode t)
        {
            BLL.CourseSystem bll = new BLL.CourseSystem();
            List<Model.CourseSystem> list = new List<Model.CourseSystem>();
            list = bll.GetList();
            for (int i = 1; i < list.Count; i++)
            {
                if (list[i].Up.ToString() == t.Value.ToString())
                {
                    TreeNode tn2 = new TreeNode();
                    tn2.Text = list[i].Name;
                    tn2.Value = list[i].CourseLbID.ToString();

                    t.ChildNodes.Add(tn2);
                    CreateChildNode(tn2);
                    TreeView1.ShowLines = true;
                    TreeView1.CssClass = "text_12px";
                }
            }
        }
        protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
        {
            lb_CourseLbName.Text = TreeView1.SelectedNode.Text + "(" + TreeView1.SelectedValue + ")";
            gv01_Bind();
        }
        private void gv01_Bind()
        {
            div_Navigation.Visible = true; ;
            int LbID = int.Parse(TreeView1.SelectedValue.ToString());
            BLL.CourseSystem bll = new BLL.CourseSystem();
            List<Model.CourseSystem> list = new List<Model.CourseSystem>();


            if (ViewState["PageCount"] == null)
            {
                ViewState["PageCount"] = 1;
            }
            list = bll.GetList(Convert.ToInt32(ViewState["PageCount"]), PageSize, LbID);
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

            TitleType = Request.QueryString["TitleType"];
            BigClass = Request.QueryString["BigClass"];
            //if (BigClass == "题库管理")
            //{
            //    URL = "I-B/List";
            //}
            //else
            //{
            //    if (BigClass == "试卷制作")
            //    {
            //        URL = "P-P/Add";
            //    }
            //    else
            //    {
            //        if (BigClass == "试卷管理")
            //        {
            //            URL = "P-M/List";
            //        }
            //        else
            //        {
            //            if (BigClass == "成绩管理")
            //            {
            //                URL = "R-M/List";
            //            }
            //            else
            //            {
            //                //URL = "PaperManagement/List.aspx?TitleType=";
            //            }
            //        }
            //    }
            //}
            if (BigClass == "题库管理")
            {
                URL = "ItemBankManagement/List.aspx?TitleType=";
            }
            else
            {
                if (BigClass == "试卷制作")
                {
                    URL = "PaperProduction/Add_test.aspx?TitleType=";
                }
                else
                {
                    if (BigClass == "试卷管理")
                    {
                        URL = "PaperManagement/List.aspx?TitleType=";
                    }
                    else
                    {
                        if (BigClass == "成绩管理")
                        {
                            URL = "ResultsManagement/List.aspx?TitleType=";
                        }
                        else
                        {
                            //URL = "PaperManagement/List.aspx?TitleType=";
                        }
                    }
                }
            }
            URL = URL + TitleType;
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
    }
}
