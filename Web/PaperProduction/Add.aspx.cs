using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;

namespace Web.PaperProduction
{
    public partial class Add1 : BasePage
    {
        public int CourseID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    lb_CourseID.Text = Request.QueryString["CourseID"];
                    CourseID = int.Parse(Request.QueryString["CourseID"]);
                    CourseBind();
                    TreeBind("TEST_TYPE");//绑定类别
                    //gvBind();
                }
                catch
                {
                    lb_CourseID.Text = "0";
                }
            }
        }

        /// <summary>
        /// add by wangke 2016-11-23 绑定类别
        /// </summary>
        /// <param name="ys_code"></param>
        private void TreeBind(string ys_code)
        {
            BLL.Status bll = new BLL.Status();
            List<Model.Status> list = new List<Model.Status>();
            list = bll.GetList(ys_code);

            this.ddl_category.Items.Clear();
            this.ddl_category.Items.Add(new ListItem("所有类别", "0"));
            foreach (Model.Status sta in list)
            {
                string Id = sta.YS_ID.ToString();
                string Title = sta.YS_DESC.ToString().Trim();

                this.ddl_category.Items.Add(new ListItem(Title, Id));
            }
        }

        //add by wangke 2016-11-23 题目类别
        protected void ddlProperty_SelectedIndexChanged(object sender, EventArgs e)
        {
            gv_01.DataSource = null;
            gv_01.DataBind();
            int status_id = int.Parse(ddl_category.SelectedValue.ToString());
            BLL.TitleList bll = new BLL.TitleList();
            DataTable dt = bll.GetList("单选", int.Parse(lb_CourseID.Text), status_id);
            gv_01.DataSource = dt;
            gv_01.DataBind();
        }

        public override void BaseBind(int ID)
        {
            CourseID = ID;
            lb_CourseID.Text = ID.ToString();
            CourseBind();
        }
        private void gvBind()
        {
            BLL.TitleList bll = new BLL.TitleList();
            List<Model.TitleList> list = new List<Model.TitleList>();
            list = bll.GetList("单选", int.Parse(lb_CourseID.Text));
            gv_01.DataSource = list;
            gv_01.DataBind();
        }
        private void CourseBind()
        {
            if (int.Parse(lb_CourseID.Text) > 0)
            {
                BLL.CourseSystem bll = new BLL.CourseSystem();
                List<Model.CourseSystem> list = new List<Model.CourseSystem>();
                list = bll.Details(int.Parse(lb_CourseID.Text));
                lb_CourseTitle.Text = "课程名：" + list[0].Title;
                tb_Name.Text = "《" + list[0].Title + Request.QueryString["TitleType"] + "》";

                gvBind();
            }
        }
        protected void gv_01_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onMouseOver", "SetNewColor(this);");
                e.Row.Attributes.Add("onMouseOut", "SetOldColor(this);");
            }
        }
        protected void gv_05_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onMouseOver", "SetNewColor(this);");
                e.Row.Attributes.Add("onMouseOut", "SetOldColor(this);");


                GridView gv_01_1 = (GridView)e.Row.FindControl("gv_01_1");
                Label lb = (Label)e.Row.FindControl("lb_ID");
                int ID = int.Parse(lb.Text);

                PapersOptionsListBind(gv_01_1, ID);
            }
        }
        /// <summary>
        /// 选项绑定
        /// </summary>
        /// <param name="gv">GridView</param>
        /// <param name="TitleListID">TitleListID</param>
        private void PapersOptionsListBind(GridView gv, int TitleListID)
        {
            BLL.OptionsList bll = new BLL.OptionsList();
            List<Model.OptionsList> list = new List<Model.OptionsList>();
            list = bll.Details(TitleListID);
            gv.DataSource = list;
            gv.DataBind();
        }

        protected void lbt_Click(object sender, EventArgs e)
        {
            int ii, jj;
            ii = gvValue(gv_01) + gvValue(gv_02) + gvValue(gv_03) + gvValue(gv_04) + gvValue(gv_05);
            jj = gvCount(gv_01) + gvCount(gv_02) + gvCount(gv_03) + gvCount(gv_04) + gvCount(gv_05);
            string str = "单选题：" + gvCount(gv_01) + "条；" + gvValue(gv_01) + "分；<br/>";
            str = str + "多选题：" + gvCount(gv_02) + "条；" + gvValue(gv_02) + "分；<br/>";
            str = str + "不定选题：" + gvCount(gv_03) + "条；" + gvValue(gv_03) + "分；<br/>";
            str = str + "判断题：" + gvCount(gv_04) + "条；" + gvValue(gv_04) + "分；<br/>";
            str = str + "值选项题：" + gvCount(gv_05) + "条；" + gvValue(gv_05) + "分；<br/>";
            str = str + "共：" + jj + "道题；总：" + ii + "分。";
            lb_Msg.Text = str;


            //Common.Function.Alert(ScoreOptionsList(gv_05,12).ToString());

            //for (int k = 0; k < gv_05.Rows.Count; k++)
            //{
            //    GridView gv_01_1 = (GridView)gv_05.Rows[k].FindControl("gv_01_1");
            //    for (int i = 0; i < gv_01_1.Rows.Count; i++)
            //    {
            //        int ID = int.Parse(((Label)gv_01_1.Rows[i].FindControl("lb_ID")).Text);
            //        Common.Function.Alert(ID.ToString());
            //        if (ID == 74)
            //        {
            //            string n = ((HtmlInputText)gv_01_1.Rows[i].FindControl("textfield")).Value;
            //            Common.Function.Alert(n);
            //        }
            //        else
            //        {
            //            Common.Function.Alert("");
            //        }
            //    }
            //}
        }
        /// <summary>
        /// 题目(共多少条)
        /// </summary>
        /// <param name="gv">GridView</param>
        /// <returns></returns>
        private int gvCount(GridView gv)
        {
            int jj = 0;
            for (int i = 0; i < gv.Rows.Count; i++)
            {
                HtmlInputCheckBox cbx = (HtmlInputCheckBox)gv.Rows[i].FindControl("checkbox");
                if (cbx.Checked == true)
                {
                    //ii = ii + int.Parse(((HtmlInputText)gv.Rows[i].FindControl("textfield")).Value);
                    jj = jj + 1;
                }
                else
                { }
            }
            return jj;
        }
        /// <summary>
        /// 分值(共多少分)
        /// </summary>
        /// <param name="gv">GridView</param>
        /// <returns></returns>
        private int gvValue(GridView gv)
        {
            int ii = 0;
            for (int i = 0; i < gv.Rows.Count; i++)
            {
                HtmlInputCheckBox cbx = (HtmlInputCheckBox)gv.Rows[i].FindControl("checkbox");
                if (cbx.Checked == true)
                {
                    try
                    {
                        ii = ii + int.Parse(((HtmlInputText)gv.Rows[i].FindControl("textfield")).Value);
                    }
                    catch
                    {
                        ii = ii + 0;
                    }
                }
                else
                { }
            }
            return ii;
        }
        //自动出题
        protected void bt_Yes_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Auto.aspx?TitleType=" + Request.QueryString["TitleType"] + "&CourseID=" + int.Parse(lb_CourseID.Text));
        }
        protected void imgbt_Save_Click(object sender, ImageClickEventArgs e)
        {
            BLL.Papers bll = new BLL.Papers();
            Model.Papers model = new Model.Papers();
            model.Name = Common.Function.StringEncode(tb_Name.Text.Trim());
            model.CourseID = int.Parse(lb_CourseID.Text);
            model.Type = Request.QueryString["TitleType"];
            int PapersID = bll.Add(model);
            if (PapersID > 0)
            {
                AddPapersTitleList(PapersID);
            }
            else
            {
                Common.Function.AlertRedirect("系统繁忙！", "Add.aspx?TitleType=" + Request.QueryString["TitleType"] + "&CourseID=" + int.Parse(lb_CourseID.Text));
            }
        }
        /// <summary>
        /// 添加试卷题目
        /// </summary>
        /// <param name="PapersID"></param>
        private void AddPapersTitleList(int PapersID)
        {
            AddgvPapersTitleList("单选", gv_01, PapersID);
            AddgvPapersTitleList("多选", gv_02, PapersID);
            AddgvPapersTitleList("不定项选", gv_03, PapersID);
            AddgvPapersTitleList("判断题", gv_04, PapersID);
            AddgvPapersTitleList("值选项", gv_05, PapersID);

            Common.Function.AlertRedirect("添加成功！", "Add.aspx?TitleType=" + Request.QueryString["TitleType"] + "&CourseID=" + int.Parse(lb_CourseID.Text));
        }
        /// <summary>
        /// 添加试卷题目
        /// </summary>
        /// <param name="Type">类型</param>
        /// <param name="gv">GridView</param>
        /// <param name="PapersID">PapersID</param>
        private void AddgvPapersTitleList(string Type, GridView gv, int PapersID)
        {
            BLL.PapersTitleList bll = new BLL.PapersTitleList();
            Model.PapersTitleList model = new Model.PapersTitleList();
            int Count = gv.Rows.Count;
            for (int i = 0; i < Count; i++)
            {
                HtmlInputCheckBox cbx = (HtmlInputCheckBox)gv.Rows[i].FindControl("checkbox");
                if (cbx.Checked == true)
                {
                    model.Title = ((Label)gv.Rows[i].FindControl("lb_Title")).Text;
                    model.T_F = ((Label)gv.Rows[i].FindControl("lb_T_F")).Text;
                    model.Analysis = ((Label)gv.Rows[i].FindControl("lb_Analysis")).Text;
                    model.ID = int.Parse(((Label)gv.Rows[i].FindControl("lb_ID")).Text);

                    string score = ((HtmlInputText)gv.Rows[i].FindControl("textfield")).Value;
                    if (score == "")
                    {
                        model.Score = 0;
                    }
                    else
                    {
                        model.Score = int.Parse(score);
                    }
                    model.CourseID = int.Parse(lb_CourseID.Text);
                    model.Type = Type;
                    model.PapersID = PapersID;
                    if (bll.Add(model) > 0)
                    {
                        AddgvPapersOptionsList(model.ID, PapersID,gv);
                    }
                    else
                    {
                        //如果题目添加不成功
                    }
                }
                else
                {
                    //如果题用户没有勾选
                }
            }
        }
        /// <summary>
        /// 选项的分值
        /// </summary>
        /// <param name="gv"></param>
        /// <param name="p"></param>
        /// <returns></returns>
        private int ScoreOptionsList(GridView gv,int p)
        {
            //int score = 0;
            //try
            //{
            //    for (int k = 0; k < gv.Rows.Count; k++)
            //    {
            //        GridView gv_01_1 = (GridView)gv.Rows[k].FindControl("gv_01_1");
            //        for (int i = 0; i < gv_01_1.Rows.Count; i++)
            //        {
            //            int ID = int.Parse(((Label)gv.Rows[i].FindControl("lb_ID")).Text);
            //            if (ID == p)
            //            {
            //                string n = ((HtmlInputText)gv_01_1.Rows[i].FindControl("textfield")).Value;
            //                score = int.Parse(n);
            //            }
            //            else
            //            {
            //                score = 0;
            //            }
            //        }
            //    }
            //    return score;
            //}
            //catch
            //{
            //    return 0;
            //}
            if (gv == gv_05)
            {
                int score = 10;
                for (int k = 0; k < gv.Rows.Count; k++)
                {
                    GridView gv_01_1 = (GridView)gv.Rows[k].FindControl("gv_01_1");
                    for (int i = 0; i < gv_01_1.Rows.Count; i++)
                    {
                        int ID = int.Parse(((Label)gv_01_1.Rows[i].FindControl("lb_ID")).Text);
                        if (ID == p)
                        {
                            string n = ((HtmlInputText)gv_01_1.Rows[i].FindControl("textfield")).Value;
                            score= int.Parse(n);
                            break;
                        }
                    }
                    //break;
                }
                return score;
            }
            else
            {
                return 0;
            }
        }
        /// <summary>
        /// 添加试卷选项表
        /// </summary>
        /// <param name="TitleListID">TitleListID</param>
        private void AddgvPapersOptionsList(int TitleListID, int PapersID,GridView gv)
        {
            BLL.OptionsList bll = new BLL.OptionsList();
            List<Model.OptionsList> list = new List<Model.OptionsList>();
            list = bll.Details(TitleListID);

            for (int i = 0; i < list.Count; i++)
            {
                BLL.PapersOptionsList Pbll = new BLL.PapersOptionsList();
                Model.PapersOptionsList model = new Model.PapersOptionsList();
                model.ID = list[i].ID;
                model.TitleListID = TitleListID;
                model.Name = list[i].Name;
                model.T_F = list[i].T_F;
                model.PapersID = PapersID;
                model.Score = ScoreOptionsList(gv, list[i].ID);
                Pbll.Add(model);
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (gv_01.Rows.Count > 0)
            { }
            else
            {
                BLL.TitleList bll = new BLL.TitleList();
                List<Model.TitleList> list = new List<Model.TitleList>();
                //if (rbl_Extent.SelectedValue.ToString() == "")
                //{
                    list = bll.GetList("单选", int.Parse(lb_CourseID.Text));
                //}
                //else
                //{
                //    list = bll.GetList("单选", CourseID, rbl_Extent.SelectedValue.ToString());
                //}
                gv_01.DataSource = list;
                gv_01.DataBind();
            }
            MultiView1.ActiveViewIndex = 0;
            TabTitle1.Attributes.Add("class", "menu_title_on");
            TabTitle2.Attributes.Add("class", "menu_title");
            TabTitle3.Attributes.Add("class", "menu_title");
            TabTitle4.Attributes.Add("class", "menu_title");
            TabTitle5.Attributes.Add("class", "menu_title");
        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (gv_02.Rows.Count > 0)
            { }
            else
            {
                BLL.TitleList bll = new BLL.TitleList();
                List<Model.TitleList> list = new List<Model.TitleList>();
                //if (rbl_Extent.SelectedValue.ToString() == "")
                //{
                    list = bll.GetList("多选", int.Parse(lb_CourseID.Text));
                //}
                //else
                //{
                //    list = bll.GetList("多选", CourseID, rbl_Extent.SelectedValue.ToString());
                //}
                gv_02.DataSource = list;
                gv_02.DataBind();
            }
            MultiView1.ActiveViewIndex = 1;
            TabTitle1.Attributes.Add("class", "menu_title");
            TabTitle2.Attributes.Add("class", "menu_title_on");
            TabTitle3.Attributes.Add("class", "menu_title");
            TabTitle4.Attributes.Add("class", "menu_title");
            TabTitle5.Attributes.Add("class", "menu_title");
        }
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            if (gv_03.Rows.Count > 0)
            { }
            else
            {
                BLL.TitleList bll = new BLL.TitleList();
                List<Model.TitleList> list = new List<Model.TitleList>();
                //if (rbl_Extent.SelectedValue.ToString() == "")
                //{
                    list = bll.GetList("不定项选", int.Parse(lb_CourseID.Text));
                //}
                //else
                //{
                //    list = bll.GetList("不定项选", CourseID, rbl_Extent.SelectedValue.ToString());
                //}
                gv_03.DataSource = list;
                gv_03.DataBind();
            }
            MultiView1.ActiveViewIndex = 2;
            TabTitle1.Attributes.Add("class", "menu_title");
            TabTitle2.Attributes.Add("class", "menu_title");
            TabTitle3.Attributes.Add("class", "menu_title_on");
            TabTitle4.Attributes.Add("class", "menu_title");
            TabTitle5.Attributes.Add("class", "menu_title");
        }
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            if (gv_04.Rows.Count > 0)
            { }
            else
            {
                BLL.TitleList bll = new BLL.TitleList();
                List<Model.TitleList> list = new List<Model.TitleList>();
                //if (rbl_Extent.SelectedValue.ToString() == "")
                //{
                    list = bll.GetList("判断题", int.Parse(lb_CourseID.Text));
                //}
                //else
                //{
                //    list = bll.GetList("判断题", CourseID, rbl_Extent.SelectedValue.ToString());
                //}
                gv_04.DataSource = list;
                gv_04.DataBind();
            }
            MultiView1.ActiveViewIndex = 3;
            TabTitle1.Attributes.Add("class", "menu_title");
            TabTitle2.Attributes.Add("class", "menu_title");
            TabTitle3.Attributes.Add("class", "menu_title");
            TabTitle4.Attributes.Add("class", "menu_title_on");
            TabTitle5.Attributes.Add("class", "menu_title");
        }
        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            if (gv_05.Rows.Count > 0)
            { }
            else
            {
                BLL.TitleList bll = new BLL.TitleList();
                List<Model.TitleList> list = new List<Model.TitleList>();
                //if (rbl_Extent.SelectedValue.ToString() == "")
                //{
                    list = bll.GetList("值选项", int.Parse(lb_CourseID.Text));
                //}
                //else
                //{
                //    list = bll.GetList("值选项", CourseID, rbl_Extent.SelectedValue.ToString());
                //}
                gv_05.DataSource = list;
                gv_05.DataBind();
            }
            MultiView1.ActiveViewIndex = 4;
            TabTitle1.Attributes.Add("class", "menu_title");
            TabTitle2.Attributes.Add("class", "menu_title");
            TabTitle3.Attributes.Add("class", "menu_title");
            TabTitle4.Attributes.Add("class", "menu_title");
            TabTitle5.Attributes.Add("class", "menu_title_on");
        }
    }
}
