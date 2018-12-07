using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.PaperProduction
{
    public partial class Auto : BasePage
    {
        public int CourseID = 0;
        /// <summary>
        /// 试卷ID
        /// </summary>
        private int PapersID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    CourseID = int.Parse(Request.QueryString["CourseID"]);
                    lb_CourseID.Text = Request.QueryString["CourseID"];
                    CourseBind();
                    if (Request.QueryString["TitleType"] == "问卷")
                    {
                        tb_1_1.Text = "0";
                        tb_2_2.Text = "0";
                        tb_3_3.Text = "0";
                        tb_4_4.Text = "0";
                        tb_5_5.Text = "0";
                    }
                }
                catch
                { }
            }
            lb_Msg.Text = "";
        }
        public override void BaseBind(int ID)
        {
            CourseID = ID;
            lb_CourseID.Text = ID.ToString();
            CourseBind();
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

                if (Request.QueryString["TitleType"] == "问卷")
                {
                    tb_1_1.Text = "0";
                    tb_2_2.Text = "0";
                    tb_3_3.Text = "0";
                    tb_4_4.Text = "0";
                    tb_5_5.Text = "0";
                }
            }
        }
        protected void rbl_Extent_SelectedIndexChanged(object sender, EventArgs e)
        {
            BLL.TitleList bll = new BLL.TitleList();
            Label1.Text = bll.Count("单选", int.Parse(lb_CourseID.Text), rbl_Extent.SelectedValue.ToString()).ToString();
            Label2.Text = bll.Count("多选", int.Parse(lb_CourseID.Text), rbl_Extent.SelectedValue.ToString()).ToString();
            Label3.Text = bll.Count("不定项选", int.Parse(lb_CourseID.Text), rbl_Extent.SelectedValue.ToString()).ToString();
            Label4.Text = bll.Count("判断题", int.Parse(lb_CourseID.Text), rbl_Extent.SelectedValue.ToString()).ToString();
            Label5.Text = bll.Count("值选项", int.Parse(lb_CourseID.Text), rbl_Extent.SelectedValue.ToString()).ToString();
        }
        /// <summary>
        /// 单选
        /// </summary>
        private void CB1()
        {
            if (CheckBox1.Checked)
            {
                if (Common.Function.IsNumber(tb_1.Text) && Common.Function.IsNumber(tb_1_1.Text))
                {
                    if (tb_1.Text == "0")
                    {
                        lb_Msg.Text = lb_Msg.Text + "<br/>单选：选择条数不能为0";
                    }
                    else
                    {
                        if (int.Parse(tb_1.Text) <= int.Parse(Label1.Text))
                        {
                            //
                            lb_Msg.Text = lb_Msg.Text + "<br/>单选：检查通过！";
                            if (bt_Yes.Visible)
                            {
                                InsertDB("单选", int.Parse(tb_1.Text), int.Parse(tb_1_1.Text));
                            }
                        }
                        else
                        {
                            lb_Msg.Text = lb_Msg.Text + "<br/>单选：选择条数大于该类型的总数！";
                        }
                    }
                }
                else
                {
                    lb_Msg.Text = lb_Msg.Text + "<br/>单选：选择条数，每条分值必须为正整数";
                }
            }
            else
            { }
        }
        /// <summary>
        /// 多选
        /// </summary>
        private void CB2()
        {
            if (CheckBox2.Checked)
            {
                if (Common.Function.IsNumber(tb_2.Text) && Common.Function.IsNumber(tb_2_2.Text))
                {
                    if (tb_2.Text == "0")
                    {
                        lb_Msg.Text = lb_Msg.Text + "<br/>多选：选择条数不能为0";
                    }
                    else
                    {
                        if (int.Parse(tb_2.Text) <= int.Parse(Label2.Text))
                        {
                            //
                            lb_Msg.Text = lb_Msg.Text + "<br/>多选：检查通过！";
                            if (bt_Yes.Visible)
                            {
                                InsertDB("多选", int.Parse(tb_2.Text), int.Parse(tb_2_2.Text));
                            }
                        }
                        else
                        {
                            lb_Msg.Text = lb_Msg.Text + "<br/>多选：选择条数大于该类型的总数！";
                        }
                    }
                }
                else
                {
                    lb_Msg.Text = lb_Msg.Text + "<br/>多选：选择条数，每条分值必须为正整数";
                }
            }
            else
            { }
        }
        /// <summary>
        /// 不定项选
        /// </summary>
        private void CB3()
        {
            if (CheckBox3.Checked)
            {
                if (Common.Function.IsNumber(tb_3.Text) && Common.Function.IsNumber(tb_3_3.Text))
                {
                    if (tb_3.Text == "0" )
                    {
                        lb_Msg.Text = lb_Msg.Text + "<br/>不定项选：选择条数不能为0";
                    }
                    else
                    {
                        if (int.Parse(tb_3.Text) <= int.Parse(Label3.Text))
                        {
                            //
                            lb_Msg.Text = lb_Msg.Text + "<br/>不定项选：检查通过！";
                            if (bt_Yes.Visible)
                            {
                                InsertDB("不定项选", int.Parse(tb_3.Text), int.Parse(tb_3_3.Text));
                            }
                        }
                        else
                        {
                            lb_Msg.Text = lb_Msg.Text + "<br/>不定项选：选择条数大于该类型的总数！";
                        }
                    }
                }
                else
                {
                    lb_Msg.Text = lb_Msg.Text + "<br/>不定项选：选择条数，每条分值必须为正整数";
                }
            }
            else
            { }
        }
        /// <summary>
        /// 判断题
        /// </summary>
        private void CB4()
        {
            if (CheckBox4.Checked)
            {
                if (Common.Function.IsNumber(tb_4.Text) && Common.Function.IsNumber(tb_4_4.Text))
                {
                    if (tb_4.Text == "0" )
                    {
                        lb_Msg.Text = lb_Msg.Text + "<br/>判断题：选择条数不能为0";
                    }
                    else
                    {
                        if (int.Parse(tb_4.Text) <= int.Parse(Label4.Text))
                        {
                            //
                            lb_Msg.Text = lb_Msg.Text + "<br/>判断题：检查通过！";
                            if (bt_Yes.Visible)
                            {
                                InsertDB("判断题", int.Parse(tb_4.Text), int.Parse(tb_4_4.Text));
                            }
                        }
                        else
                        {
                            lb_Msg.Text = lb_Msg.Text + "<br/>判断题：选择条数大于该类型的总数！";
                        }
                    }
                }
                else
                {
                    lb_Msg.Text = lb_Msg.Text + "<br/>判断题：选择条数，每条分值必须为正整数";
                }
            }
            else
            { }
        }
        /// <summary>
        /// 值选项
        /// </summary>
        private void CB5()
        {
            if (CheckBox5.Checked)
            {
                if (Common.Function.IsNumber(tb_5.Text) && Common.Function.IsNumber(tb_5_5.Text))
                {
                    if (tb_5.Text == "0")
                    {
                        lb_Msg.Text = lb_Msg.Text + "<br/>值选项：选择条数不能为0";
                    }
                    else
                    {
                        if (int.Parse(tb_5.Text) <= int.Parse(Label5.Text))
                        {

                            //
                            lb_Msg.Text = lb_Msg.Text + "<br/>值选项：检查通过！";
                            if (bt_Yes.Visible)
                            { 
                                InsertDB("值选项", int.Parse(tb_5.Text), int.Parse(tb_5_5.Text)); 
                            }
                        }
                        else
                        {
                            lb_Msg.Text = lb_Msg.Text + "<br/>值选项：选择条数大于该类型的总数！";
                        }
                    }
                }
                else
                {
                    lb_Msg.Text = lb_Msg.Text + "<br/>值选项：选择条数，每条分值必须为正整数";
                }
            }
            else
            { }
        }
        /// <summary>
        /// 完成
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void bt_Yes_Click(object sender, EventArgs e)
        {
            if (rbl_Extent.SelectedValue == "")
            {
                lb_Msg.Text = "请选择难易程度！";
            }
            else
            {
                //单选
                CB1();
                //多选
                CB2();
                //不定项选
                CB3();
                //判断题
                CB4();
                //值选项
                CB5();
            }
            Common.Function.AlertRedirect("添加成功！", "Auto.aspx?TitleType=" + Request.QueryString["TitleType"] + "&CourseID=" + int.Parse(lb_CourseID.Text));
        }
        /// <summary>
        /// 检查
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void bt_Che_Click(object sender, EventArgs e)
        {
            string ii = lb_CourseID.Text;
            if (ii == "0")
            {
                lb_Msg.Text = "请先选择课程！";
            }
            else
            {
                if (rbl_Extent.SelectedValue == "")
                {
                    lb_Msg.Text = "请选择难易程度！";
                }
                else
                {
                    //单选
                    CB1();
                    //多选
                    CB2();
                    //不定项选
                    CB3();
                    //判断题
                    CB4();
                    //值选项
                    CB5();
                }

                string StrChe = "";
                if (CheckBox1.Checked == true)
                {
                    StrChe = StrChe + "<br/>单选：检查通过！";
                }
                if (CheckBox2.Checked == true)
                {
                    StrChe = StrChe + "<br/>多选：检查通过！";
                }
                if (CheckBox3.Checked == true)
                {
                    StrChe = StrChe + "<br/>不定项选：检查通过！";
                }
                if (CheckBox4.Checked == true)
                {
                    StrChe = StrChe + "<br/>判断题：检查通过！";
                }
                if (CheckBox5.Checked == true)
                {
                    StrChe = StrChe + "<br/>值选项：检查通过！";
                }

                if (lb_Msg.Text == StrChe)
                {
                    if (CheckBox1.Checked == CheckBox2.Checked == CheckBox3.Checked == CheckBox4.Checked == CheckBox5.Checked == false)
                    {
                        bt_Yes.Visible = false;
                    }
                    else
                    {
                        bt_Yes.Visible = true;
                    }
                }
                else
                {
                    bt_Yes.Visible = false;
                }
            }
        }
        /// <summary>
        /// 添加试卷
        /// </summary>
        private void Papers()
        {
            BLL.Papers bll = new BLL.Papers();
            Model.Papers model = new Model.Papers();
            model.Name = Common.Function.StringEncode(tb_Name.Text.Trim());
            model.CourseID = int.Parse(lb_CourseID.Text);
            model.Type = Request.QueryString["TitleType"];
            PapersID = bll.Add(model);
            if (PapersID > 0)
            { }
            else
            {
                Common.Function.AlertRedirect("系统繁忙！", "Auto.aspx?TitleType=" + Request.QueryString["TitleType"] + "&CourseID=" + int.Parse(lb_CourseID.Text) );
            }
        }
        /// <summary>
        /// 添加到数据库
        /// </summary>
        /// <param name="Type">类型</param>
        /// <param name="Count">条数</param>
        /// <param name="Score">每条分值</param>
        private void InsertDB(string Type, int Count, int Score)
        {
            string Extent = rbl_Extent.SelectedValue.ToString();
            BLL.TitleList bll = new BLL.TitleList();
            List<Model.TitleList> list = new List<Model.TitleList>();
            list = bll.GetList(Type, int.Parse(lb_CourseID.Text), Count, Extent);
            if (PapersID>0)
            {
                //Common.Function.Alert("啥也不做");
            }
            else
            {
                //Common.Function.Alert("添加");
                Papers();
            }

            for (int i = 0; i < list.Count; i++)
            {
                Model.TitleList model = new Model.TitleList();
                model.Title = list[i].Title;
                model.T_F = list[i].T_F;
                model.Analysis = list[i].Analysis;
                model.ID = list[i].ID;
                model.CourseID = list[i].CourseID;

                AddPapersTitleList(Type, PapersID, Score, model);
            }
        }
        /// <summary>
        /// 添加试卷题目
        /// </summary>
        /// <param name="Type">类型</param>
        /// <param name="PapersID">PapersID</param>
        /// <param name="Score">分数</param>
        /// <param name="md">TitleList</param>
        private void AddPapersTitleList(string Type, int PapersID, int Score,Model.TitleList md)
        {
            BLL.PapersTitleList bll = new BLL.PapersTitleList();
            Model.PapersTitleList model = new Model.PapersTitleList();

            model.Title = md.Title;
            model.T_F = md.T_F;
            model.Analysis = md.Analysis;
            model.ID = md.ID;
            model.CourseID = md.CourseID;
            
            model.Score = Score;
            model.Type = Type;
            model.PapersID = PapersID;
            if (bll.Add(model) > 0)
            {
                AddPapersOptionsList(PapersID, model.ID, model.Score, model.Type);
            }
            else
            {
                //如果题目添加不成功
            }
        }
        /// <summary>
        /// 添加试卷选项表
        /// </summary>
        /// <param name="PapersID">PapersID</param>
        /// <param name="TitleListID">TitleListID</param>
        /// <param name="Score">Score</param>
        /// <param name="Type">Type</param>
        private void AddPapersOptionsList(int PapersID, int TitleListID, int Score, string Type)
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

                if (Type == "值选项")
                {
                    model.Score = Score - i;
                }
                else
                {
                    model.Score = 0;
                }

                Pbll.Add(model);
            }
        }
    }
}
