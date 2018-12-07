using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace Web.PaperManagement
{
    public partial class Papers : Common.OLPage
    {
        /// <summary>
        /// 是否开卷
        /// </summary>
        public bool nbool;
        /// <summary>
        /// 初始编号100，对应"一、"
        /// </summary>
        public int Num = 100;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lb_U.Text = Request.QueryString["U"];
                nbool = true;
                Common.Loading.initJavascript();
                int PapersID = int.Parse(Request.QueryString["ID"]);

                gvBind("单选", PapersID, gv_01, lb_Num1, div1);
                SumScore("单选", PapersID, lb_Type1);

                gvBind("多选", PapersID, gv_02, lb_Num2, div2);
                SumScore("多选", PapersID, lb_Type2);

                gvBind("不定项选", PapersID, gv_03, lb_Num3, div3);
                SumScore("不定项选", PapersID, lb_Type3);

                gvBind("判断题", PapersID, gv_04, lb_Num4, div4);
                SumScore("判断题", PapersID, lb_Type4);

                gvBind("值选项", PapersID, gv_05, lb_Num5, div5);
                SumScore("值选项", PapersID, lb_Type5);

                SumScore("", PapersID, Label1);
            }
        }
        /// <summary>
        /// 统计分值
        /// </summary>
        /// <param name="Type">类型(单选/多选/不定项选/判断)</param>
        /// <param name="PapersID">试卷ID</param>
        /// <param name="lb">Label</param>
        /// <returns></returns>
        private void SumScore(string Type, int PapersID, Label lb)
        {
            BLL.PapersTitleList bll = new BLL.PapersTitleList();
            List<Model.PapersTitleList> list = new List<Model.PapersTitleList>();
            if (Type != "")
            {
                lb.Text = Type + "(共:" + bll.SumScore(Type, PapersID) + " 分)";
            }
            else
            {
                lb.Text = bll.SumScore(PapersID) + " 分";
            }
        }
        /// <summary>
        /// 设置编号(一、二、三、...)
        /// </summary>
        /// <param name="Type">类型(单选/多选/不定项选/判断)</param>
        /// <param name="PapersID">试卷ID</param>
        /// <returns></returns>
        private string SetNum(string Type, int PapersID)
        {
            BLL.PapersTitleList bll = new BLL.PapersTitleList();
            if (bll.nGetList(Type, PapersID))
            {
                int j = Num;
                Num = Num + 1;
                return Exchange(j);
            }
            else
            {
                return "";
            }
        }
        /// <summary>
        /// 数字与字符交换(100转成"一、")
        /// </summary>
        /// <param name="i">数字</param>
        /// <returns></returns>
        private string Exchange(int i)
        {
            if (i == 100)
            {
                return "一、";
            }
            else
            {
                if (i == 101)
                {
                    return "二、";
                }
                else
                {
                    if (i == 102)
                    {
                        return "三、";
                    }
                    else
                    {
                        if (i == 103)
                        {
                            return "四、";
                        }
                        else
                        {
                            if (i == 104)
                            {
                                return "五、";
                            }
                            else
                            {
                                if (i == 105)
                                {
                                    return "六、";
                                }
                                else
                                {
                                    if (i == 106)
                                    {
                                        return "七、";
                                    }
                                    else
                                    {
                                        if (i == 107)
                                        {
                                            return "八、";
                                        }
                                        else
                                        {
                                            if (i == 108)
                                            {
                                                return "九、";
                                            }
                                            else
                                            {
                                                if (i == 109)
                                                {
                                                    return "十、";
                                                }
                                                else
                                                {
                                                    return "";
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        /// <summary>
        /// 题目绑定
        /// </summary>
        /// <param name="Type">类型(单选/多选/不定项选/判断)</param>
        /// <param name="PapersID">试卷ID</param>
        /// <param name="gv">GridView</param>
        /// <param name="lb">Label</param>
        /// <param name="div">HtmlGenericControl</param>
        private void gvBind(string Type, int PapersID, GridView gv, Label lb, HtmlGenericControl div)
        {
            lb.Text = SetNum(Type, PapersID);
            if (lb.Text != "")
            {
                BLL.PapersTitleList bll = new BLL.PapersTitleList();
                List<Model.PapersTitleList> list = new List<Model.PapersTitleList>();
                list = bll.GetList(Type, PapersID, nbool);
                gv.DataSource = list;
                gv.DataBind();
            }
            else
            {
                div.Visible = false;
            }
        }
        /// <summary>
        /// 获取TitleListID
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gv_01_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                GridView gv_01_1 = (GridView)e.Row.FindControl("gv_01_1");
                Label lb = (Label)e.Row.FindControl("lb_ID");
                int ID = int.Parse(lb.Text);
                int PapersID = int.Parse(Request.QueryString["ID"]);
                PapersOptionsListBind(gv_01_1, ID, PapersID);
            }
        }
        /// <summary>
        /// 选项绑定
        /// </summary>
        /// <param name="gv">GridView</param>
        /// <param name="TitleListID">TitleListID</param>
        /// <param name="PapersID">PapersID</param>
        private void PapersOptionsListBind(GridView gv, int TitleListID, int PapersID)
        {
            BLL.PapersOptionsList bll = new BLL.PapersOptionsList();
            List<Model.PapersOptionsList> list = new List<Model.PapersOptionsList>();
            list = bll.GetList(TitleListID, PapersID, nbool);
            gv.DataSource = list;
            gv.DataBind();
        }

        protected void bt_Yes_Click(object sender, EventArgs e)
        {
            //Common.Function.Alert("按钮提交");
        }
        /// <summary>
        /// 提交答案
        /// </summary>
        /// <param name="Type">类型(单选/多选/不定项选/判断)</param>
        /// <param name="PapersID">试卷ID</param>
        /// <param name="gv">GridView</param>
        private void Submit(string Type, int PapersID, GridView gv, string Time)
        {
            BLL.PapersTitleList bll = new BLL.PapersTitleList();
            if (bll.nGetList(Type, PapersID))
            {
                for (int i = 0; i < gv.Rows.Count; i++)
                {
                    Label lb = (Label)gv.Rows[i].FindControl("lb_ID");
                    int TitleListID = int.Parse(lb.Text);
                    string Str_radio = Request.Form["radio" + TitleListID];

                    //Response.Write(Type + "题目：" + TitleListID + "  答案：" + Str_radio + "<br/>");

                    BLL.Results bll1 = new BLL.Results();
                    Model.Results model = new Model.Results();
                    model.UserID = int.Parse(lb_U.Text);
                    model.PapersID = PapersID;
                    model.TitleListID = TitleListID;
                    model.Answer = Str_radio;
                    model.Time = Time;
                    bll1.Add(model);
                }
            }
            else
            {
            }
        }
        /// <summary>
        /// 关闭后交试卷
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void bt_Close_Click(object sender, EventArgs e)
        {
            int PapersID = int.Parse(Request.QueryString["ID"]);
            string Time = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss:ffff");
            Submit("单选", PapersID, gv_01, Time);
            Submit("多选", PapersID, gv_02, Time);
            Submit("不定项选", PapersID, gv_03, Time);
            Submit("判断题", PapersID, gv_04, Time);
            Submit("值选项", PapersID, gv_05, Time);
            //Common.Function.Alert("关闭提交");
        }
    }
}
