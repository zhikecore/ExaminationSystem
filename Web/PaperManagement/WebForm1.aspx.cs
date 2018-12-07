using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.PaperManagement
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int PapersID = int.Parse(Request.QueryString["ID"]);
            //lb_U.Text = new BLL.Papers().Details(PapersID)[0].Name;
            lb_U.Text = Request.QueryString["U"];//用户ID
            gv_1.DataSource = GetTitleCategory(PapersID);
            gv_1.DataBind();
            SumScore("", PapersID, Label1);
        }

        //获取题目类别
        public DataTable GetTitleCategory(int PapersID)
        {
            DataTable dtStatusId = new DataTable();
            dtStatusId = new BLL.PapersTitleList().GetList(PapersID);

            string statusId = "";
            if (dtStatusId.Rows.Count > 0)
            {
                foreach (DataRow item in dtStatusId.Rows)
                {
                    statusId += item["Status_id"].ToString() + ",";
                }
                
            }

            DataTable dt = new DataTable();
            BLL.Status bll = new BLL.Status();
            dt = bll.GetStatusList("YS_ID IN("+Common.Function.DelLastComma(statusId)+")");
            return dt;

        }
        
        /// <summary>
        /// 排序转换
        /// </summary>
        /// <param name="i">排序数</param>
        /// <returns></returns>
        public string Exchange(int i)
        {
            if (i == 1)
            {
                return "一、";
            }
            else if (i == 2)
            {
                return "二、";
            }
            else if (i == 3)
            {
                return "三、";
            }
            else if (i == 4)
            {
                return "四、";
            }
            else if (i == 5)
            {
                return "五、";
            }
            else if (i == 6)
            {
                return "六、";
            }
            else if (i == 7)
            {
                return "七、";
            }
            else if (i == 8)
            {
                return "八、";
            }
            else if (i == 9)
            {
                return "九、";
            }
            else
            {
                return "";
            }

        }

        protected void gv_1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                GridView gv_01 = (GridView)e.Row.FindControl("gv_01");
                Label lb = (Label)e.Row.FindControl("lb_ID");
                int ID = int.Parse(lb.Text);
                int PapersID = int.Parse(Request.QueryString["ID"]);
                PapersOptionsListBind(gv_01, ID, PapersID);
            }
        }

        /// <summary>
        /// 选项绑定
        /// </summary>
        /// <param name="gv">GridView</param>
        /// <param name="Status_id">Status_id</param>
        /// <param name="PapersID">PapersID</param>
        private void PapersOptionsListBind(GridView gv, int Status_id, int PapersID)
        {
            BLL.PapersTitleList bll = new BLL.PapersTitleList();
            List<Model.PapersTitleList> list = new List<Model.PapersTitleList>();
            list = bll.GetList("单选", PapersID,Status_id, false);
            gv.DataSource = list;
            gv.DataBind();
            
        }

        protected void gv_01_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                GridView gv_01_1 = (GridView)e.Row.FindControl("gv_01_1");
                Label lb = (Label)e.Row.FindControl("lb_ID");
                int ID = int.Parse(lb.Text);
                int PapersID = int.Parse(Request.QueryString["ID"]);
                PapersOptionsListBind1(gv_01_1, ID, PapersID);
            }
        }

        /// <summary>
        /// 选项绑定
        /// </summary>
        /// <param name="gv">GridView</param>
        /// <param name="TitleListID">TitleListID</param>
        /// <param name="PapersID">PapersID</param>
        private void PapersOptionsListBind1(GridView gv, int TitleListID, int PapersID)
        {
            BLL.PapersOptionsList bll = new BLL.PapersOptionsList();
            List<Model.PapersOptionsList> list = new List<Model.PapersOptionsList>();
            list = bll.GetList(TitleListID, PapersID, false);
            gv.DataSource = list;
            gv.DataBind();
        }

        protected void bt_Yes_Click(object sender, EventArgs e)
        {
            Common.Function.Alert("按钮提交");
            try
            {
                int PapersID = int.Parse(Request.QueryString["ID"]);
                string Time = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss:ffff");
                Submit("单选", PapersID, gv_1, Time);
                //Submit("多选", PapersID, gv_02, Time);
                //Submit("不定项选", PapersID, gv_03, Time);
                //Submit("判断题", PapersID, gv_04, Time);
                //Submit("值选项", PapersID, gv_05, Time);

                //Common.Function.Alert("成功交卷！");
            }
            catch (Exception ex)
            {
                this.Response.Write(ex.ToString());
            }
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
                    GridView gv_01 = (GridView)gv.Rows[i].FindControl("gv_01");
                    for (int j = 0; j < gv_01.Rows.Count; j++)
                    {
                        Label lb = (Label)gv_01.Rows[j].FindControl("lb_ID");
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

                        //Common.Function.Alert(model.UserID.ToString());
                        bll1.Add(model);
                    }
                }
            }
            else
            {
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
    }
}