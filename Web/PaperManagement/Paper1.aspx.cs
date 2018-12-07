using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.PaperManagement
{
    public partial class Paper1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Response.AppendHeader("Access-Control-Allow-Origin", "*");

            int PapersID = Convert.ToInt32(Request.QueryString["paperID"]);//试卷id
            //int PapersID = 123;

            txt_paperid.Value = PapersID.ToString();
            //lb_U.Text = new BLL.Papers().Details(PapersID)[0].Name;
            int int_UserID = Convert.ToInt32(Request.QueryString["U"]);
            txt_userid.Value = int_UserID.ToString();//用户ID
            int int_CompanyID = Convert.ToInt32(Request.QueryString["companyID"]);
            txt_companyid.Value = int_CompanyID.ToString();//公司id
            if (PapersID == 0)
            {
                Common.Function.jsHint(this, "试卷id为空");
                return;
            }
            if (int_UserID == 0 && int_CompanyID==0)
            {
                Common.Function.jsHint(this, "请添加用户或公司id");
                return;
            }

            if (!authorityJudgment(int_CompanyID, int_UserID, PapersID))//权限判断
                return;
            GetTitleType(PapersID);//试卷内容获取
        }

        /// <summary>
        /// 权限判断
        /// </summary>
        /// <param name="int_comPanyID"></param>
        /// <param name="int_employeeID"></param>
        /// <param name="int_PapersID"></param>
        public bool authorityJudgment(int int_comPanyID,int int_employeeID,int int_PapersID)
        {
            bool bln_author = false;
            if (int_comPanyID == 0)
            {
                Common.Function.jsHint(this,"公司id为空");
            }
            else if(int_PapersID==0)
            {
                Common.Function.jsHint(this, "试卷id为空");
            }
            else//
            {
                Maticsoft.BLL.PaperManage BPaperManage = new Maticsoft.BLL.PaperManage();
                DataTable dt_PaperManage = BPaperManage.GetList(" PaperID="+int_PapersID+ " and CompanyID="+int_comPanyID).Tables[0];
                if (dt_PaperManage.Rows.Count > 0)
                {
                    int int_i = 0;
                    foreach (DataRow dr_row in dt_PaperManage.Rows)
                    {
                        if (!bool.Parse(dr_row["IsLongTime"].ToString()))//判断是否长期授权
                        {
                            if (isDateExpired(dr_row["EndTime"].ToString(), DateTime.Now.ToString("yyyy-MM-dd")))//日期比较是否过期
                            {//false表示过期true表示没有过期

                                if (!isDateExpired(dr_row["StartTime"].ToString(), DateTime.Now.ToString("yyyy-MM-dd")))//日期比较是否到开始时间
                                {//false表示考试时间已到true表示没有到考试时间
                                    if (int.Parse(dr_row["Used"].ToString()) < int.Parse(dr_row["Num"].ToString()))//还能不能使用
                                    {
                                        bln_author = true;
                                        break;
                                    }
                                }
                            }
                        }
                        else
                        {
                            if (int.Parse(dr_row["Used"].ToString()) < int.Parse(dr_row["Num"].ToString()))//还能不能使用
                            {
                                bln_author = true;
                                break;
                            }
                        }
                        int_i++;
                    }
                }
                else
                {
                    Common.Function.jsHint(this, "该公司没有权限");
                }
            }
            if (!bln_author)
            {
                Common.Function.jsHint(this, "权限过期或已使用完");
            }

            return bln_author;
        }

        /// <summary>
        /// 日期比较
        /// </summary>
        /// <param name="dtm_start"></param>
        /// <param name="dtm_end"></param>
        /// <returns></returns>
        public bool isDateExpired(string dtm_start,string dtm_end)
        {
            if (dtm_start == "" || dtm_end == "")
            {
                Common.Function.jsHint(this, "日期为空");
                return false;
            }
            string str_sta=(Convert.ToDateTime(dtm_start)).ToString("yyyy-MM-dd");
            if (DateTime.Compare(Convert.ToDateTime(str_sta), Convert.ToDateTime(dtm_end)) > 0)//没有过期
            {
                return true;
            }

            return false;
        }

        /// <summary>
        /// 获取题目类别
        /// </summary>
        public void GetTitleType(int PapersID)
        {
            DataTable dtStatusId = new DataTable();
            dtStatusId = new BLL.PapersTitleList().GetList(PapersID);
            StringBuilder strHtml = new StringBuilder();
            StringBuilder sortHtml = new StringBuilder();

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
            dt = bll.GetStatusList("YS_ID IN(" + Common.Function.DelLastComma(statusId) + ")");
            if (dt.Rows.Count > 0)
            {
                sortHtml.Append("<ul class='tab-all'>");
                
                int int_i = 0;
                foreach (DataRow item in dt.Rows)
                {
                    int_i++;
                    strHtml.Append("<div id='content"+ int_i + "'>");
                    strHtml.Append("<h4>"+Exchange(int_i) +item["YS_DESC"] +"</h4>");
                    strHtml.Append(GetTitles(PapersID,int.Parse(item["YS_ID"].ToString())));
                    strHtml.Append("</div>");
                    //分页按钮添加
                    sortHtml.Append("<li class='tabs_left this_tab' value='"+ int_i + "'>"+ int_i + "</li>");
                }

                //查询该试卷有没有填空题，有的话添加
                List<Model.PapersTitleList> List_PapersTitle = new List<Model.PapersTitleList>();
                List_PapersTitle = new BLL.PapersTitleList().GetList("填空题", PapersID, false);

                int int_count = ++int_i;
                if (List_PapersTitle != null)
                {
                    strHtml.Append("<div id='content" + int_count + "'>");
                    strHtml.Append("<h4>" + Exchange(int_count) + "补充意见</h4>");
                    foreach (Model.PapersTitleList item in List_PapersTitle)
                    {
                        int_i++;

                        strHtml.Append("<div id='tit_" + item.ID + "' class='survey_one'>");
                        strHtml.Append("<p><span class='order_head'>" + item.Num + "</span>" + item.Title + "</p>");
                        strHtml.Append("<div class='survey_select'>");
                        strHtml.Append("<textarea id='txt_" + item.ID + "' placeholder='" + item.Title + "'>" + GetGapAnswer(PapersID, item.ID) + "</textarea>");
                        strHtml.Append("</div></div>");

                    }
                    strHtml.Append("</div>");
                    //分页按钮添加
                    sortHtml.Append("<li class='tabs_left this_tab' value='" + int_count + "'>" + int_count + "</li>");
                }


                sortHtml.Append("</ul>");
                sortHtml.Append("<div id='div_submitPaper' class='my_submit'>提交问卷</div>");
            }

            TitleContent.InnerHtml = strHtml.ToString();

            sortNum.InnerHtml = sortHtml.ToString();
        }

        /// <summary>
        /// 获取填空题答案
        /// </summary>
        /// <param name="PapersID"></param>
        /// <param name="titleID"></param>
        /// <returns></returns>
        public string GetGapAnswer(int PapersID,int titleID)
        {
            BLL.Results BResults = new BLL.Results();

            string strSql = "SELECT UserID,PapersID,TitleListID,Answer FROM [Results] where PapersID=@PapersID and TitleListID=@titleID and UserID=@userID";
            SqlParameter[] parames ={
                    new SqlParameter("@PapersID", SqlDbType.Int,4),
                    new SqlParameter("@titleID", SqlDbType.Int,4),
                    new SqlParameter("@userID", SqlDbType.Int,4),

                };
            parames[0].Value = PapersID;
            parames[1].Value = titleID;
            parames[2].Value = Convert.ToInt32(Request.QueryString["companyID"]);

            DataTable dtResult = BResults.ExecSQL(strSql, parames);
            if (dtResult.Rows.Count > 0)
            {
                return dtResult.Rows[0]["Answer"].ToString();
            }
            else
            {
                return "";
            }
        }

        /// <summary>
        /// 获取所有题目
        /// </summary>
        public string GetTitles(int PapersID,int Status_id)
        {
            BLL.PapersTitleList bll = new BLL.PapersTitleList();
            List<Model.PapersTitleList> list = new List<Model.PapersTitleList>();
            StringBuilder strHtml = new StringBuilder();
            list = bll.GetList("单选", PapersID, Status_id, false);
            int i = 0;
            foreach (Model.PapersTitleList item in list)
            {
                i++;
                strHtml.Append("<div id='tit_"+item.ID+"' class='survey_one'>");
                strHtml.Append("<p><span class='order_head'>"+item.Num+"</span>"+item.Title+"</p>");
                strHtml.Append("<div class='survey_select'>");
                strHtml.Append(GetOptions(PapersID,item.ID));
                strHtml.Append("</div></div>");
            }

            //<dib><>
            return strHtml.ToString();
        }

        /// <summary>
        /// 获取题目选项
        /// </summary>
        /// <returns></returns>
        public string GetOptions(int PapersID, int TitleID)
        {
            BLL.PapersOptionsList bll = new BLL.PapersOptionsList();
            List<Model.PapersOptionsList> list = new List<Model.PapersOptionsList>();
            list = bll.GetList(TitleID, PapersID, false);
            StringBuilder strHtml = new StringBuilder();
            int i = 0;
            foreach (Model.PapersOptionsList item in list)
            {
                i++;
                strHtml.Append("<span class='company_radio'>");

                if (GetselOption(PapersID, TitleID)==int.Parse(item.ID.ToString()))//判断该选项是否选中
                {
                    strHtml.Append("<img id='opt_" + TitleID + "_" + item.ID + "' src='/img/company_true.png' data_checked='1' />");
                }
                else
                {
                    strHtml.Append("<img id='opt_" + TitleID + "_" + item.ID + "' src='/img/company_false.png' data_checked='0' />");
                }

                
                strHtml.Append(""+item.Name+"</span>");
            }
            return strHtml.ToString();
        }

        /// <summary>
        /// 获取已选题目
        /// </summary>
        /// <returns></returns>
        public int GetselOption(int int_paperID,int int_titleID)
        {
            BLL.Results BResults = new BLL.Results();

            string strSql = "SELECT UserID,PapersID,TitleListID,Answer FROM [Results] where PapersID=@PapersID and TitleListID=@TitleListID and UserID=@UserID";
            SqlParameter[] parames ={
                    new SqlParameter("@PapersID", SqlDbType.Int,4),
                    new SqlParameter("@TitleListID", SqlDbType.Int,4),
                    new SqlParameter("@UserID", SqlDbType.Int,4),

                };
            parames[0].Value = int_paperID;
            parames[1].Value = int_titleID;
            parames[2].Value = Convert.ToInt32(Request.QueryString["companyID"]);

            DataTable dtResult = BResults.ExecSQL(strSql, parames);
            if (dtResult.Rows.Count > 0)
            {
                //return int.Parse(dtResult.Rows[0]["Answer"].ToString());
                if (dtResult.Rows[0]["Answer"].ToString() == "")
                {
                    return 0;
                }
                else
                {
                    return int.Parse(dtResult.Rows[0]["Answer"].ToString());
                }
            }

            return 0;
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
    }
}