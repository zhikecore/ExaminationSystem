
using DBUtility;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web;
using System.Web.SessionState;

namespace Web.tools
{
    /// <summary>
    /// ajax_CUstomerManage 的摘要说明
    /// </summary>
    public class ajax_CUstomerManage : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            HttpContext.Current.Response.AppendHeader("Access-Control-Allow-Origin", "*");

            //取得处事类型
            string action = context.Request["action"];
            switch (action)
            {
                case "addCompany": //添加客户公司
                    addCompany(context);
                    break;
                case "GetCompanyList":
                    GetCompanyList(context);
                    break;
                case "GetCompanyInfo":
                    GetCompanyInfo(context);
                    break;
                case "updateCompany":
                    updateCompany(context);
                    break;
                case "deleteCompany":
                    deleteCompany(context);
                    break;
                case "GetEmployeeList":
                    GetEmployeeList(context);
                    break;
                case "addEmployee":
                    addEmployee(context);
                    break;
                case "updateEmployee":
                    updateEmployee(context);
                    break;
                case "GetEmployeeInfo":
                    GetEmployeeInfo(context);
                    break;
                case "deleteEmployee":
                    deleteEmployee(context);
                    break;
                case "GetPaperList":
                    GetPaperList(context);
                    break;
                case "addPaperAuthor":
                    addPaperAuthor(context);
                    break;
                case "GetAuthorList":
                    GetAuthorList(context);
                    break;
                case "GetPaperInfo":
                    GetPaperInfo(context);
                    break;
                case "deleteAuthor":
                    deleteAuthor(context);
                    break;
                case "GetAuthorEmployee":
                    GetAuthorEmployee(context);
                    break;
                case "addEmployeeAuthor":
                    addEmployeeAuthor(context);
                    break;
                case "addPaperResult"://添加考试结果
                    addPaperResult(context);
                    break;
                case "submitVerify"://提交验证
                    submitVerify(context);
                    break;
                case "subPapers"://试卷提交
                    subPapers(context);
                    break;
                case "searchCompanyList"://公司搜索
                    searchCompanyList(context);
                    break;
                case "isCanTest"://是否还可以考试
                    isCanTest(context);
                    break;
            }
        }

        /// <summary>
        /// 时间比较
        /// </summary>
        /// <param name="dtm_start"></param>
        /// <param name="dtm_end"></param>
        /// <returns></returns>
        public bool isMinuteExpired(string dtm_start, string dtm_end)
        {
            int int_Minutes = int.Parse(ConfigurationSettings.AppSettings["submitPaperTime"]);//获取配置时间
            string str_sta = (Convert.ToDateTime(dtm_start)).ToString("yyyy-MM-dd hh:mm:ss");
            if ((Convert.ToDateTime(str_sta)-Convert.ToDateTime(dtm_end)).TotalMinutes >= int_Minutes)//判断是否可以再次考试
            {
                return true;
            }

            return false;
        }

        /// <summary>
        /// 日期比较
        /// </summary>
        /// <param name="dtm_start"></param>
        /// <param name="dtm_end"></param>
        /// <returns></returns>
        public bool isDateExpired(string dtm_start, string dtm_end)
        {
            string str_sta = (Convert.ToDateTime(dtm_start)).ToString("yyyy-MM-dd hh:mm:ss");
            if (DateTime.Compare(Convert.ToDateTime(str_sta) , Convert.ToDateTime(dtm_end)) >0)
            {
                return true;
            }

            return false;
        }

        /// <summary>
        /// 是否还可以考试
        /// </summary>
        /// <returns></returns>
        private void isCanTest(HttpContext context)
        {
            int PapersID = int.Parse(context.Request["str_paperID"].ToString());
            int CompanyID = int.Parse(context.Request["str_companyID"].ToString());

            //验证是否可以再次考试
            BLL.Results BResult = new BLL.Results();
            string str_Results = "SELECT isnull(SubmitTime,'') as SubmitTime FROM Results WHERE PapersID=" + PapersID + " AND UserID=" + CompanyID + " and isnull(SubmitTime,'')<>'' ORDER BY SubmitTime DESC";
            DataTable dt_Results = BResult.ExecSQL(str_Results);
            if (dt_Results.Rows.Count > 0)//已经考过
            {
                context.Response.Write("{\"status\": 0, \"msg\": \"您已经考过一次！\"}");
                return;
            }
            else//没有考过
            {
                //查询该试卷有多少题目
                BLL.PapersTitleList BPapersTitleList = new BLL.PapersTitleList();
                string str_Papers = "SELECT COUNT(*) AS count FROM [ExaminationSystem].[Exam].PapersTitleList WHERE PapersID=@PapersID";
                SqlParameter[] spm_PapersTitleList ={
                    new SqlParameter("@PapersID", SqlDbType.Int,4)

                };
                spm_PapersTitleList[0].Value = PapersID;

                DataTable dtResult = BPapersTitleList.ExecSQL(str_Papers, spm_PapersTitleList);
                int int_titleCount = 0;//试卷题目总数
                if (dtResult.Rows.Count > 0)
                {
                    int_titleCount = int.Parse(dtResult.Rows[0][0].ToString());
                }

                //查询已经提交几道题
                BLL.Results BResults = new BLL.Results();
                string str_Result = "SELECT UserID,PapersID,TitleListID FROM [Results] where PapersID=@PapersID and UserID=@UserID and isnull(SubmitTime,'')=''";
                SqlParameter[] spm_Results ={
                    new SqlParameter("@PapersID", SqlDbType.Int,4),
                    new SqlParameter("@UserID", SqlDbType.Int,4),

                };
                spm_Results[0].Value = PapersID;
                spm_Results[1].Value = CompanyID;
                DataTable dt_Result = BResults.ExecSQL(str_Result, spm_Results);
                int int_subcount = 0;
                if (dt_Result.Rows.Count > 0)
                {
                    int_subcount = dt_Result.Rows.Count;
                }

                context.Response.Write("{\"status\":1,\"subcount\": " + int_subcount + ", \"count\": " + int_titleCount + "}");
                return;
            }
        }

        /// <summary>
        /// 试卷提交验证
        /// </summary>
        /// <param name="context"></param>
        private void submitVerify(HttpContext context)
        {
            int PapersID = int.Parse(context.Request["str_paperID"].ToString());
            int CompanyID = int.Parse(context.Request["str_companyID"].ToString());

            //验证是否可以再次考试
            BLL.Results BResult = new BLL.Results();
            string str_Results = "SELECT isnull(SubmitTime,'') as SubmitTime FROM Results WHERE PapersID=" + PapersID + " AND UserID="+CompanyID+ " ORDER BY SubmitTime DESC";
            DataTable dt_Results = BResult.ExecSQL(str_Results);
            if (dt_Results.Rows.Count > 0)
            {
                if (dt_Results.Rows[0]["SubmitTime"].ToString() != "")
                {
                    if (!isMinuteExpired(DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"), dt_Results.Rows[0]["SubmitTime"].ToString()))
                    {
                        string str_date = dt_Results.Rows[0]["SubmitTime"].ToString();
                        context.Response.Write("{\"status\":2,\"datetime\": \"" + str_date + "\"}");
                        return;
                    }
                }
            }

            //查询该试卷有多少题目
            BLL.PapersTitleList BPapersTitleList = new BLL.PapersTitleList();
            string str_Papers = "SELECT COUNT(*) AS count FROM [ExaminationSystem].[Exam].PapersTitleList WHERE PapersID=@PapersID";
            SqlParameter[] spm_PapersTitleList ={
                    new SqlParameter("@PapersID", SqlDbType.Int,4)

                };
            spm_PapersTitleList[0].Value = PapersID;

            DataTable dtResult = BPapersTitleList.ExecSQL(str_Papers, spm_PapersTitleList);
            int int_titleCount = 0;//试卷题目总数
            if (dtResult.Rows.Count > 0)
            {
                int_titleCount = int.Parse(dtResult.Rows[0][0].ToString());
            }

            //查询已经提交几道题
            BLL.Results BResults = new BLL.Results();
            string str_Result = "SELECT UserID,PapersID,TitleListID FROM [Results] where PapersID=@PapersID and UserID=@UserID and isnull(SubmitTime,'')=''";
            SqlParameter[] spm_Results ={
                    new SqlParameter("@PapersID", SqlDbType.Int,4),
                    new SqlParameter("@UserID", SqlDbType.Int,4),

                };
            spm_Results[0].Value = PapersID;
            spm_Results[1].Value = CompanyID;
            DataTable dt_Result = BResults.ExecSQL(str_Result, spm_Results);
            int int_subcount = 0;
            if (dt_Result.Rows.Count > 0)
            {
                int_subcount = dt_Result.Rows.Count;
            }

            context.Response.Write("{\"status\":1,\"subcount\": " + int_subcount + ", \"count\": " + int_titleCount + "}");
            return;

        }

        /// <summary>
        /// 试卷提交
        /// </summary>
        /// <param name="context"></param>
        private void subPapers(HttpContext context)
        {
            int PaperID = int.Parse(context.Request["str_paperID"].ToString());//
            string TitleIDs = context.Request["str_titleID"].ToString();//
            int UserID = int.Parse(context.Request["str_companyID"].ToString());//
            string str_gapID = context.Request["str_gapID"].ToString();//填空题id
            string str_gapValue = context.Request["str_gapValue"].ToString();//填空题答案

            BLL.PapersTitleList bll = new BLL.PapersTitleList();
            if (bll.nGetList("单选", PaperID))
            {
                BLL.Results BResults = new BLL.Results();
                if (TitleIDs.Contains(","))//多个添加
                {
                    //添加填空题
                    if (str_gapID.Contains(","))
                    {
                        string[] arr_gapID = str_gapID.Split(',');//填空题id
                        string[] arr_gapValue = str_gapValue.Split(',');//填空题答案
                        int int_i = 0;
                        foreach (string item in arr_gapID)
                        {
                            Model.Results MResult = new Model.Results();

                            //查询该题目是否已经提交（提交修改，未提交添加）
                            DataTable dt_Results = isGapExist(PaperID, UserID, int.Parse(item));
                            if (dt_Results.Rows.Count > 0)
                            {//修改
                                MResult.UserID = int.Parse(dt_Results.Rows[0]["UserID"].ToString());
                                MResult.PapersID = int.Parse(dt_Results.Rows[0]["PapersID"].ToString());
                                MResult.TitleListID = int.Parse(item);
                                MResult.Answer = arr_gapValue[int_i];
                                MResult.Time = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss:ffff");
                                //MResult.SubmitTime = DateTime.Now;
                                BResults.Update(MResult);
                            }
                            else
                            {//添加
                                MResult.UserID = UserID;
                                MResult.PapersID = PaperID;
                                MResult.TitleListID = int.Parse(item);
                                MResult.Answer = arr_gapValue[int_i];
                                MResult.Time = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss:ffff");
                                MResult.SubmitTime = DateTime.Now;
                                BResults.AddResult(MResult);
                            }

                            int_i++;

                        }
                    }
                    else if (str_gapID != "")//一个填空题
                    {
                        Model.Results MResult = new Model.Results();

                        //查询该题目是否已经提交（提交修改，未提交添加）
                        DataTable dt_Results = isGapExist(PaperID, UserID, int.Parse(str_gapID));
                        if (dt_Results.Rows.Count > 0)
                        {//修改
                            MResult.UserID = int.Parse(dt_Results.Rows[0]["UserID"].ToString());
                            MResult.PapersID = int.Parse(dt_Results.Rows[0]["PapersID"].ToString());
                            MResult.TitleListID = int.Parse(str_gapID);
                            MResult.Answer = str_gapValue;
                            MResult.Time = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss:ffff");
                            //MResult.SubmitTime = DateTime.Now;
                            BResults.Update(MResult);
                        }
                        else
                        {//添加
                            MResult.UserID = UserID;
                            MResult.PapersID = PaperID;
                            MResult.TitleListID = int.Parse(str_gapID);
                            MResult.Answer = str_gapValue;
                            MResult.Time = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss:ffff");
                            MResult.SubmitTime = DateTime.Now;
                            BResults.AddResult(MResult);
                        }
                    }


                    string[] arr_titleID = TitleIDs.Split(',');
                    int int_success = 0;
                    int int_error = 0;
                    foreach (string item in arr_titleID)
                    {
                        Model.Results mode = new Model.Results();
                        mode.UserID = UserID;
                        mode.PapersID = PaperID;
                        mode.TitleListID = int.Parse(item);
                        mode.Answer = "";
                        mode.Time = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss:ffff");
                        mode.SubmitTime = DateTime.Now;

                        //Common.Function.Alert(model.UserID.ToString());
                        if (BResults.AddResult(mode) > 0)
                        {
                            int_success++;
                        }
                        else
                        {
                            int_error++;
                        }
                    }

                    //查询已经提交的题目
                    string str_Result = "SELECT UserID,PapersID,TitleListID FROM [Results] where PapersID=@PapersID and UserID=@UserID and ISNULL(SubmitTime,'')=''";
                    SqlParameter[] spm_Results ={
                            new SqlParameter("@PapersID", SqlDbType.Int,4),
                            new SqlParameter("@UserID", SqlDbType.Int,4),

                        };
                    spm_Results[0].Value = PaperID;
                    spm_Results[1].Value = UserID;
                    DataTable dt_Result = BResults.ExecSQL(str_Result, spm_Results);
                    if (dt_Result.Rows.Count > 0)
                    {
                        Model.Results MResult = new Model.Results();
                        MResult.SubmitTime = DateTime.Now;
                        MResult.PapersID = PaperID;
                        MResult.UserID = UserID;
                        foreach (DataRow item in dt_Result.Rows)
                        {

                            MResult.TitleListID = int.Parse(item["TitleListID"].ToString());
                            BResults.UpdateExtend(MResult);
                        }
                    }

                    //修改试卷权限表字段（该方法只针对ERP（权限到公司））
                    paperAuthor(PaperID, UserID);

                    context.Response.Write("{\"status\":2,\"success\": " + int_success + ", \"error\": " + int_error + "}");
                    return;
                }
                else//单个添加
                {
                    if (TitleIDs != "")//如果还有没有提交的则添加
                    {
                        //添加填空题
                        if (str_gapID.Contains(","))
                        {

                            string[] arr_gapID = str_gapID.Split(',');//填空题id
                            string[] arr_gapValue = str_gapValue.Split(',');//填空题答案
                            int int_i = 0;
                            foreach (string item in arr_gapID)
                            {
                                Model.Results MResult = new Model.Results();
                                //查询该题目是否已经提交（提交修改，未提交添加）
                                DataTable dt_Results = isGapExist(PaperID, UserID, int.Parse(item));
                                if (dt_Results.Rows.Count > 0)
                                {//修改
                                    MResult.UserID = int.Parse(dt_Results.Rows[0]["UserID"].ToString());
                                    MResult.PapersID = int.Parse(dt_Results.Rows[0]["PapersID"].ToString());
                                    MResult.TitleListID = int.Parse(item);
                                    MResult.Answer = arr_gapValue[int_i];
                                    MResult.Time = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss:ffff");
                                    //MResult.SubmitTime = DateTime.Now;
                                    BResults.Update(MResult);
                                }
                                else
                                {//添加
                                    MResult.UserID = UserID;
                                    MResult.PapersID = PaperID;
                                    MResult.TitleListID = int.Parse(item);
                                    MResult.Answer = arr_gapValue[int_i];
                                    MResult.Time = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss:ffff");
                                    MResult.SubmitTime = DateTime.Now;
                                    BResults.AddResult(MResult);
                                }
                                int_i++;
                            }
                        }
                        else if(str_gapID!="")//一个填空题
                        {
                            Model.Results MResult = new Model.Results();

                            //查询该题目是否已经提交（提交修改，未提交添加）
                            DataTable dt_Results = isGapExist(PaperID, UserID, int.Parse(str_gapID));
                            if (dt_Results.Rows.Count > 0)
                            {//修改
                                MResult.UserID = int.Parse(dt_Results.Rows[0]["UserID"].ToString());
                                MResult.PapersID = int.Parse(dt_Results.Rows[0]["PapersID"].ToString());
                                MResult.TitleListID = int.Parse(str_gapID);
                                MResult.Answer = str_gapValue;
                                MResult.Time = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss:ffff");
                                //MResult.SubmitTime = DateTime.Now;
                                BResults.Update(MResult);
                            }
                            else
                            {//添加
                                MResult.UserID = UserID;
                                MResult.PapersID = PaperID;
                                MResult.TitleListID = int.Parse(str_gapID);
                                MResult.Answer = str_gapValue;
                                MResult.Time = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss:ffff");
                                MResult.SubmitTime = DateTime.Now;
                                BResults.AddResult(MResult);
                            }
                        }


                        Model.Results mode = new Model.Results();
                        mode.UserID = UserID;
                        mode.PapersID = PaperID;
                        mode.TitleListID = int.Parse(TitleIDs);
                        mode.Answer = "";
                        mode.Time = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss:ffff");
                        mode.SubmitTime = DateTime.Now;
                        //Common.Function.Alert(model.UserID.ToString());
                        if (BResults.AddResult(mode) > 0)
                        {
                            //查询已经提交的题目,然后修改提交时间
                            string str_Result = "SELECT UserID,PapersID,TitleListID FROM [Results] where PapersID=@PapersID and UserID=@UserID";
                            SqlParameter[] spm_Results ={
                                new SqlParameter("@PapersID", SqlDbType.Int,4),
                                new SqlParameter("@UserID", SqlDbType.Int,4),

                            };
                            spm_Results[0].Value = PaperID;
                            spm_Results[1].Value = UserID;
                            DataTable dt_Result = BResults.ExecSQL(str_Result, spm_Results);
                            if (dt_Result.Rows.Count > 0)
                            {
                                Model.Results MResult = new Model.Results();
                                MResult.SubmitTime = DateTime.Now;
                                MResult.PapersID = PaperID;
                                MResult.UserID = UserID;
                                foreach (DataRow item in dt_Result.Rows)
                                {

                                    MResult.TitleListID = int.Parse(item["TitleListID"].ToString());
                                    BResults.UpdateExtend(MResult);
                                }
                            }

                            context.Response.Write("{\"status\": 1, \"msg\": \"添加成功！\"}");
                            return;
                        }
                        else
                        {
                            context.Response.Write("{\"status\": 0, \"msg\": \"添加失败！\"}");
                            return;
                        }
                    }
                    else
                    {
                        //添加填空题
                        if (str_gapID.Contains(","))
                        {
                            string[] arr_gapID = str_gapID.Split(',');//填空题id
                            string[] arr_gapValue = str_gapValue.Split(',');//填空题答案
                            int int_i = 0;
                            foreach (string item in arr_gapID)
                            {
                                Model.Results MResult = new Model.Results();

                                //查询该题目是否已经提交（提交修改，未提交添加）
                                DataTable dt_Results = isGapExist(PaperID, UserID, int.Parse(item));
                                if (dt_Results.Rows.Count > 0)
                                {//修改
                                    MResult.UserID = int.Parse(dt_Results.Rows[0]["UserID"].ToString());
                                    MResult.PapersID = int.Parse(dt_Results.Rows[0]["PapersID"].ToString());
                                    MResult.TitleListID = int.Parse(item);
                                    MResult.Answer = arr_gapValue[int_i];
                                    MResult.Time = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss:ffff");
                                    //MResult.SubmitTime = DateTime.Now;
                                    BResults.Update(MResult);
                                }
                                else
                                {//添加
                                    MResult.UserID = UserID;
                                    MResult.PapersID = PaperID;
                                    MResult.TitleListID = int.Parse(item);
                                    MResult.Answer = arr_gapValue[int_i];
                                    MResult.Time = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss:ffff");
                                    MResult.SubmitTime = DateTime.Now;
                                    BResults.AddResult(MResult);
                                }

                                int_i++;
                            }
                        }
                        else if (str_gapID != "")//一个填空题
                        {
                            Model.Results MResult = new Model.Results();

                            //查询该题目是否已经提交（提交修改，未提交添加）
                            DataTable dt_Results = isGapExist(PaperID, UserID, int.Parse(str_gapID));
                            if (dt_Results.Rows.Count > 0)
                            {//修改
                                MResult.UserID = int.Parse(dt_Results.Rows[0]["UserID"].ToString());
                                MResult.PapersID = int.Parse(dt_Results.Rows[0]["PapersID"].ToString());
                                MResult.TitleListID = int.Parse(str_gapID);
                                MResult.Answer = str_gapValue;
                                MResult.Time = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss:ffff");
                                //MResult.SubmitTime = DateTime.Now;
                                BResults.Update(MResult);
                            }
                            else
                            {//添加
                                MResult.UserID = UserID;
                                MResult.PapersID = PaperID;
                                MResult.TitleListID = int.Parse(str_gapID);
                                MResult.Answer = str_gapValue;
                                MResult.Time = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss:ffff");
                                MResult.SubmitTime = DateTime.Now;
                                BResults.AddResult(MResult);
                            }
                        }


                        //查询已经提交的题目,然后修改提交时间
                        string str_Result = "SELECT UserID,PapersID,TitleListID FROM [Results] where PapersID=@PapersID and UserID=@UserID and ISNULL(SubmitTime,'')=''";
                        SqlParameter[] spm_Results ={
                                new SqlParameter("@PapersID", SqlDbType.Int,4),
                                new SqlParameter("@UserID", SqlDbType.Int,4),

                            };
                        spm_Results[0].Value = PaperID;
                        spm_Results[1].Value = UserID;
                        DataTable dt_Result = BResults.ExecSQL(str_Result, spm_Results);
                        if (dt_Result.Rows.Count > 0)
                        {
                            Model.Results MResult = new Model.Results();
                            MResult.SubmitTime = DateTime.Now;
                            MResult.PapersID = PaperID;
                            MResult.UserID = UserID;
                            foreach (DataRow item in dt_Result.Rows)
                            {

                                MResult.TitleListID = int.Parse(item["TitleListID"].ToString());
                                BResults.UpdateExtend(MResult);
                            }
                        }

                        context.Response.Write("{\"status\": 1, \"msg\": \"添加成功！\"}");
                        return;
                    }

                    
                }

            }
        }

        /// <summary>
        /// 查询指定题目添加题是否存在
        /// </summary>
        /// <param name="paperID"></param>
        /// <param name="userID"></param>
        /// <param name="TitleListID"></param>
        /// <returns></returns>
        private DataTable isGapExist(int paperID,int userID,int TitleListID)
        {
            BLL.Results BResults = new BLL.Results();
            DataTable dt_Result = new DataTable();

            //查询该题目是否已经提交（提交修改，未提交添加）
            string str_sql = "SELECT UserID,PapersID,TitleListID FROM [Results] where PapersID=@PapersID and UserID=@UserID and TitleListID=@TitleListID";
            SqlParameter[] spm_Result ={
                            new SqlParameter("@PapersID", SqlDbType.Int,4),
                            new SqlParameter("@UserID", SqlDbType.Int,4),
                            new SqlParameter("@TitleListID", SqlDbType.Int,4),
                            };
            spm_Result[0].Value = paperID;
            spm_Result[1].Value = userID;
            spm_Result[2].Value = TitleListID;
            dt_Result = BResults.ExecSQL(str_sql, spm_Result);

            return dt_Result;
        }

        /// <summary>
        /// 权限修改
        /// </summary>
        /// <param name="PaperID"></param>
        /// <param name="UserID">本来是按照公司id查找的，由于ERP那边的需求，这个userID就是公司id</param>
        /// <returns></returns>
        private bool paperAuthor(int PaperID,int UserID)
        {
            Maticsoft.BLL.PaperManage BPaperManage = new Maticsoft.BLL.PaperManage();
            DataTable dt_PaperManage = BPaperManage.GetList(" PaperID=" + PaperID + " and CompanyID=" + UserID).Tables[0];
            if (dt_PaperManage.Rows.Count > 0)
            {
                foreach (DataRow dr_row in dt_PaperManage.Rows)
                {
                    if (!bool.Parse(dr_row["IsLongTime"].ToString()))//判断是否长期授权
                    {
                        if (isDateExpired(dr_row["EndTime"].ToString(), DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss")))//日期比较是否过期
                        {//false表示过期true表示没有过期

                            if (!isDateExpired(dr_row["StartTime"].ToString(), DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss")))//日期比较是否到开始时间
                            {//false表示考试时间已到true表示没有到考试时间
                                if (int.Parse(dr_row["Used"].ToString()) < int.Parse(dr_row["Num"].ToString()))//还能不能使用
                                {
                                    Maticsoft.Model.PaperManage MPaperManage = BPaperManage.GetModel(int.Parse(dr_row["ID"].ToString()));
                                    MPaperManage.Used++;
                                    MPaperManage.Assigned++;
                                    if (BPaperManage.Update(MPaperManage))
                                    {
                                        return true;
                                    }
                                }
                            }
                        }
                    }
                    else
                    {
                        if (int.Parse(dr_row["Used"].ToString()) < int.Parse(dr_row["Num"].ToString()))//还能不能使用
                        {
                            Maticsoft.Model.PaperManage MPaperManage = BPaperManage.GetModel(int.Parse(dr_row["ID"].ToString()));
                            MPaperManage.Used++;
                            MPaperManage.Assigned++;
                            if (BPaperManage.Update(MPaperManage))
                            {
                                return true;
                            }
                        }
                    }
                }
            }

            return false;
        }

        /// <summary>
        /// 获取客户列表
        /// </summary>
        /// <param name="context"></param>
        private void GetCompanyList(HttpContext context)
        {
            //int status_id = int.Parse(context.Request["status_id"].ToString());
            Maticsoft.BLL.Company BCompany = new Maticsoft.BLL.Company();
            DataTable dt = BCompany.GetList("1=1").Tables[0];
            string json = Common.Function.ToJson(dt);
            context.Response.Write(json);
            return;

        }

        /// <summary>
        /// 获取员工列表
        /// </summary>
        /// <param name="context"></param>
        private void GetEmployeeList(HttpContext context)
        {
            int ID = int.Parse(context.Request["ID"].ToString());//公司ID
            Maticsoft.BLL.Employee BEmployee = new Maticsoft.BLL.Employee();
            DataTable dt = BEmployee.GetList("CompanyID="+ID).Tables[0];
            string json = Common.Function.ToJson(dt);
            context.Response.Write(json);
            return;

        }

        /// <summary>
        /// 获取试卷列表
        /// </summary>
        /// <param name="context"></param>
        private void GetPaperList(HttpContext context)
        {
            //int ID = int.Parse(context.Request["ID"].ToString());//公司ID
            BLL.Papers BPapers = new BLL.Papers();
            DataTable dt = BPapers.GetList("Type='问卷' order by id desc ").Tables[0];
            string json = Common.Function.ToJson(dt);
            context.Response.Write(json);
            return;

        }

        /// <summary>
        /// 获取试卷授权列表
        /// </summary>
        /// <param name="context"></param>
        private void GetAuthorList(HttpContext context)
        {
            int CompanyID = int.Parse(context.Request["CompanyID"].ToString());//公司ID
            Maticsoft.BLL.PaperManage BPaperManage = new Maticsoft.BLL.PaperManage();
            DataTable dt = BPaperManage.GetList("CompanyID="+ CompanyID+ " ORDER by ID desc").Tables[0];
            string json = Common.Function.ToJson(dt);
            context.Response.Write(json);
            return;

        }

        /// <summary>
        /// 获取客户信息
        /// </summary>
        /// <param name="context"></param>
        private void GetCompanyInfo(HttpContext context)
        {
            int ID = int.Parse(context.Request["ID"].ToString());
            Maticsoft.BLL.Company BCompany = new Maticsoft.BLL.Company();
            DataTable dt = BCompany.GetList("ID="+ID).Tables[0];
            string json = Common.Function.ToJson(dt);
            context.Response.Write(json);
            return;

        }

        /// <summary>
        /// 获取员工信息
        /// </summary>
        /// <param name="context"></param>
        private void GetEmployeeInfo(HttpContext context)
        {
            int ID = int.Parse(context.Request["ID"].ToString());
            Maticsoft.BLL.Employee BEmployee = new Maticsoft.BLL.Employee();
            DataTable dt = BEmployee.GetList("ID=" + ID).Tables[0];
            string json = Common.Function.ToJson(dt);
            context.Response.Write(json);
            return;

        }

        /// <summary>
        /// 获取试卷信息
        /// </summary>
        /// <param name="context"></param>
        private void GetPaperInfo(HttpContext context)
        {
            int ID = int.Parse(context.Request["PaperID"].ToString());
            BLL.Papers BPapers = new BLL.Papers();
            DataTable dt = BPapers.GetList("ID=" + ID).Tables[0];
            string json = Common.Function.ToJson(dt);
            context.Response.Write(json);
            return;

        }

        /// <summary>
        /// 获取授权员工
        /// </summary>
        /// <param name="context"></param>
        private void GetAuthorEmployee(HttpContext context)
        {
            int PManageID = int.Parse(context.Request["AuthorID"].ToString());
            Maticsoft.BLL.EmployeeAuthor BEmployeeAuthor = new Maticsoft.BLL.EmployeeAuthor();
            DataTable dt = BEmployeeAuthor.GetList("PManageID=" + PManageID).Tables[0];
            string json = Common.Function.ToJson(dt);
            context.Response.Write(json);
            return;

        }

        /// <summary>
        /// 搜索公司
        /// </summary>
        /// <param name="context"></param>
        private void searchCompanyList(HttpContext context)
        {
            string str_search = context.Request["search"].ToString();//搜索内容

            Maticsoft.BLL.Company BCompany = new Maticsoft.BLL.Company();
            DataTable dt = BCompany.GetList(" Name like '%" + str_search+"%' or obj_ID like '%"+str_search+"%'").Tables[0];
            string json = Common.Function.ToJson(dt);
            context.Response.Write(json);
            return;

        }

        /// <summary>
        /// 添加客户公司
        /// </summary>
        /// <param name="context"></param>
        private void addCompany(HttpContext context)
        {
            string Name = context.Request["Name"].ToString();//公司名
            //string CreateTime = context.Request["CreateTime"].ToString();//创建时间
            string Website = context.Request["Website"].ToString();//网址
            string obj_ID = context.Request["obj_ID"].ToString();//对象ID

            Maticsoft.BLL.Company BCompany = new Maticsoft.BLL.Company();
            Maticsoft.Model.Company MCompany = new Maticsoft.Model.Company();
            MCompany.Name = Name;
            MCompany.CreateTime = DateTime.Now;
            MCompany.Website = Website;
            MCompany.obj_ID = int.Parse(obj_ID);
            if (BCompany.Add(MCompany) > 0)
            {
                context.Response.Write("{\"status\": 1, \"msg\": \"保存成功！\"}");
                return;
            }
            else
            {
                context.Response.Write("{\"status\": 0, \"msg\": \"系统繁忙！\"}");
                return;
            }
        }

        /// <summary>
        /// 添加公司员工
        /// </summary>
        /// <param name="context"></param>
        private void addEmployee(HttpContext context)
        {
            string Name = context.Request["Name"].ToString();//员工名
            string Remark = context.Request["Remark"].ToString();//备注
            string Tel = context.Request["Tel"].ToString();//电话
            string CompanyID = context.Request["CompanyID"].ToString();//公司ID

            Maticsoft.BLL.Employee BEmployee = new Maticsoft.BLL.Employee();
            Maticsoft.Model.Employee MEmployee = new Maticsoft.Model.Employee();
            MEmployee.Name = Name;
            MEmployee.Remark = Remark;
            MEmployee.Tel = Tel;
            MEmployee.CompanyID = int.Parse(CompanyID);
            if (BEmployee.Add(MEmployee) > 0)
            {
                context.Response.Write("{\"status\": 1, \"msg\": \"保存成功！\"}");
                return;
            }
            else
            {
                context.Response.Write("{\"status\": 0, \"msg\": \"系统繁忙！\"}");
                return;
            }
        }

        /// <summary>
        /// 添加试卷授权
        /// </summary>
        /// <param name="context"></param>
        private void addPaperAuthor(HttpContext context)
        {
            string Title = context.Request["Title"].ToString();//授权名
            Boolean IsLongTime = Boolean.Parse(context.Request["IsLongTime"].ToString());//
            string StartTime = context.Request["StartTime"].ToString();//
            string EndTime = context.Request["EndTime"].ToString();//
            int Num = int.Parse(context.Request["Num"].ToString());//
            int PaperID = int.Parse(context.Request["PaperID"].ToString());//
            int CompanyID = int.Parse(context.Request["CompanyID"].ToString());//

            Maticsoft.BLL.PaperManage BPaperManage = new Maticsoft.BLL.PaperManage();
            Maticsoft.Model.PaperManage MPaperManage = new Maticsoft.Model.PaperManage();
            MPaperManage.Title = Title;
            MPaperManage.IsLongTime = IsLongTime;
            if (!IsLongTime) {
                MPaperManage.StartTime = DateTime.Parse(StartTime);
                MPaperManage.EndTime = DateTime.Parse(EndTime);
            }
            MPaperManage.Num = Num;
            MPaperManage.PaperID = PaperID;
            MPaperManage.CompanyID = CompanyID;
            MPaperManage.CreateDateTime = DateTime.Now;
            if (BPaperManage.Add(MPaperManage) > 0)
            {
                context.Response.Write("{\"status\": 1, \"msg\": \"保存成功！\"}");
                return;
            }
            else
            {
                context.Response.Write("{\"status\": 0, \"msg\": \"系统繁忙！\"}");
                return;
            }
        }

        /// <summary>
        /// 添加员工授权
        /// </summary>
        /// <param name="context"></param>
        private void addEmployeeAuthor(HttpContext context)
        {

            string EmployeeID = context.Request["ID"].ToString();//
            int PaperID = int.Parse(context.Request["PaperID1"].ToString());//
            int PManageID = int.Parse(context.Request["AuthorID"].ToString());//

            Maticsoft.BLL.EmployeeAuthor BEmployeeAuthor = new Maticsoft.BLL.EmployeeAuthor();
            Maticsoft.Model.EmployeeAuthor MEmployeeAuthor = new Maticsoft.Model.EmployeeAuthor();
            Maticsoft.BLL.PaperManage BPaperManage = new Maticsoft.BLL.PaperManage();
            Maticsoft.Model.PaperManage MPaperManager = BPaperManage.GetModel(PManageID);
            //MEmployeeAuthor.EmployeeID = EmployeeID;
            MEmployeeAuthor.PaperID = PaperID;
            MEmployeeAuthor.PManageID = PManageID;
            MEmployeeAuthor.IsUsed = false;
            MEmployeeAuthor.CreateTime = DateTime.Now;

            if (EmployeeID.Contains(","))//添加多条
            {
                string[] arrEmployeeID = EmployeeID.Split(',');
                int success = 0;
                int error = 0;
                bool isAuthor=true;
                //判断该员工是否已经授权
                //foreach (string item in arrEmployeeID)
                //{
                //    //判断该员工是否已经授权
                //    DataTable dt = BEmployeeAuthor.GetList(" EmployeeID=" + int.Parse(item) + " AND PManageID=" + PManageID).Tables[0];
                //    if (dt.Rows.Count > 0)
                //    {
                //        isAuthor = false;
                //    }
                    
                //}

                //判断是否还可以授权
                if (MPaperManager.Num - MPaperManager.Assigned == 0)
                {
                    context.Response.Write("{\"status\": 0, \"msg\": \"该试卷授权已分配完！\"}");
                    return;
                }
                int arr = MPaperManager.Assigned + arrEmployeeID.Length;
                if (MPaperManager.Assigned+ arrEmployeeID.Length>MPaperManager.Num)
                {
                    context.Response.Write("{\"status\": 0, \"msg\": \"剩余授权数不够！\"}");
                    return;
                }

                if (isAuthor)//没有已经授权的员工在添加
                {
                    foreach (string item in arrEmployeeID)
                    {
                        MEmployeeAuthor.EmployeeID = int.Parse(item);
                        if (BEmployeeAuthor.Add(MEmployeeAuthor) > 0)
                        {
                            success++;
                        }
                        else
                        {
                            error++;
                        }
                    }
                    //修改已分配字段
                    MPaperManager.Assigned = MPaperManager.Assigned + success;
                    BPaperManage.Update(MPaperManager);
                }
                if (isAuthor)
                {
                    context.Response.Write("{\"status\":2,\"success\": " + success + ", \"error\": " + error + "}");
                    return;
                }
                else
                {
                    context.Response.Write("{\"status\": 0, \"msg\": \"所选员工中有已经授权！\"}");
                    return;
                }
                

            }
            else
            {//添加一条
                //判断该员工是否已经授权
                //DataTable dt = BEmployeeAuthor.GetList(" EmployeeID=" + int.Parse(EmployeeID) + " AND PManageID=" + PManageID).Tables[0];
                //if (dt.Rows.Count > 0)
                //{
                //    context.Response.Write("{\"status\": 0, \"msg\": \"该员工已经授权！\"}");
                //    return;
                //}
                //判断是否还可以授权
                if (MPaperManager.Num - MPaperManager.Assigned == 0)
                {
                    context.Response.Write("{\"status\": 0, \"msg\": \"该试卷授权已分配完！\"}");
                    return;
                }


                MPaperManager.Assigned++;
                MEmployeeAuthor.EmployeeID = int.Parse(EmployeeID);
                if (BEmployeeAuthor.Add(MEmployeeAuthor) > 0 && BPaperManage.Update(MPaperManager))
                {
                    context.Response.Write("{\"status\": 1, \"msg\": \"保存成功！\"}");
                    return;
                }
                else
                {
                    context.Response.Write("{\"status\": 0, \"msg\": \"系统繁忙！\"}");
                    return;
                }
            }

            
            
        }

        /// <summary>
        /// 添加考试结果
        /// </summary>
        /// <param name="context"></param>
        private void addPaperResult(HttpContext context)
        {
            int PaperID = int.Parse(context.Request["PaperID"].ToString());//
            int TitleID = int.Parse(context.Request["TitleID"].ToString());//
            int AnswerID = int.Parse(context.Request["AnswerID"].ToString());//
            int UserID = int.Parse(context.Request["UserID"].ToString());//

            BLL.PapersTitleList bll = new BLL.PapersTitleList();
            if (bll.nGetList("单选", PaperID))
            {
                BLL.Results BResults = new BLL.Results();

                string strSql = "SELECT UserID,PapersID,TitleListID FROM [Results] where PapersID=@PapersID and TitleListID=@TitleListID and UserID=@UserID";
                SqlParameter[] parames ={
                    new SqlParameter("@PapersID", SqlDbType.Int,4),
                    new SqlParameter("@TitleListID", SqlDbType.Int,4),
                    new SqlParameter("@UserID", SqlDbType.Int,4),
                    
                };
                parames[0].Value = PaperID;
                parames[1].Value = TitleID;
                parames[2].Value = UserID;

                DataTable dtResult = BResults.ExecSQL(strSql, parames);
                if (dtResult.Rows.Count > 0)//判断是否存在记录
                {
                    Model.Results mode = new Model.Results();
                    mode.UserID = int.Parse(dtResult.Rows[0]["UserID"].ToString());
                    mode.PapersID = int.Parse(dtResult.Rows[0]["PapersID"].ToString());
                    mode.TitleListID = int.Parse(dtResult.Rows[0]["TitleListID"].ToString());
                    mode.Answer = AnswerID.ToString();
                    mode.Time = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss:ffff");

                    //Common.Function.Alert(model.UserID.ToString());
                    if (BResults.Update(mode))
                    {
                        context.Response.Write("{\"status\": 1, \"msg\": \"更新成功！\"}");
                        return;
                    }
                    else
                    {
                        context.Response.Write("{\"status\": 0, \"msg\": \"更新失败！\"}");
                        return;
                    }
                }
                else
                {
                    Model.Results mode = new Model.Results();
                    mode.UserID = UserID;
                    mode.PapersID = PaperID;
                    mode.TitleListID = TitleID;
                    mode.Answer = AnswerID.ToString();
                    mode.Time = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss:ffff");

                    //Common.Function.Alert(model.UserID.ToString());
                    if (BResults.AddResult(mode) > 0)
                    {
                        context.Response.Write("{\"status\": 1, \"msg\": \"添加成功！\"}");
                        return;
                    }
                    else
                    {
                        context.Response.Write("{\"status\": 0, \"msg\": \"添加失败！\"}");
                        return;
                    }
                }
                
            }
        }

        /// <summary>
        /// 修改客户公司
        /// </summary>
        /// <param name="context"></param>
        private void updateCompany(HttpContext context)
        {
            string ID = context.Request["ID"].ToString();//ID
            string Name = context.Request["Name"].ToString();//公司名
            //string CreateTime = context.Request["CreateTime"].ToString();//创建时间
            string Website = context.Request["Website"].ToString();//网址

            Maticsoft.BLL.Company BCompany = new Maticsoft.BLL.Company();
            Maticsoft.Model.Company MCompany = BCompany.GetModel(int.Parse(ID));
            MCompany.Name = Name;
            //MCompany.CreateTime = DateTime.Parse(CreateTime);
            MCompany.Website = Website;
            if (BCompany.Update(MCompany))
            {
                context.Response.Write("{\"status\": 1, \"msg\": \"修改成功！\"}");
                return;
            }
            else
            {
                context.Response.Write("{\"status\": 0, \"msg\": \"系统繁忙！\"}");
                return;
            }
        }

        /// <summary>
        /// 修改员工信息
        /// </summary>
        /// <param name="context"></param>
        private void updateEmployee(HttpContext context)
        {
            string ID = context.Request["ID"].ToString();//ID
            string Name = context.Request["Name"].ToString();//员工名
            string Remark = context.Request["Remark"].ToString();//备注
            string Tel = context.Request["Tel"].ToString();//电话

            Maticsoft.BLL.Employee BEmployee = new Maticsoft.BLL.Employee();
            Maticsoft.Model.Employee MEmployee = BEmployee.GetModel(int.Parse(ID));
            MEmployee.Name = Name;
            MEmployee.Remark = Remark;
            MEmployee.Tel = Tel;
            if (BEmployee.Update(MEmployee))
            {
                context.Response.Write("{\"status\": 1, \"msg\": \"修改成功！\"}");
                return;
            }
            else
            {
                context.Response.Write("{\"status\": 0, \"msg\": \"系统繁忙！\"}");
                return;
            }
        }

        /// <summary>
        /// 删除客户公司
        /// </summary>
        /// <param name="context"></param>
        private void deleteCompany(HttpContext context)
        {
            string ID = context.Request["ID"].ToString();//ID

            Maticsoft.BLL.Company BCompany = new Maticsoft.BLL.Company();
            if (ID.Contains(","))//批量删除
            {
                if (BCompany.DeleteList(Common.Function.DelLastComma(ID)))
                {
                    context.Response.Write("{\"status\": 1, \"msg\": \"删除成功！\"}");
                    return;
                }
                else
                {
                    context.Response.Write("{\"status\": 0, \"msg\": \"删除失败！\"}");
                    return;
                }
            }
            else//单个删除
            {
                if (BCompany.Delete(int.Parse(ID)))
                {
                    context.Response.Write("{\"status\": 1, \"msg\": \"删除成功！\"}");
                    return;
                }
                else
                {
                    context.Response.Write("{\"status\": 0, \"msg\": \"删除失败！\"}");
                    return;
                }
            }
        }

        /// <summary>
        /// 删除员工
        /// </summary>
        /// <param name="context"></param>
        private void deleteEmployee(HttpContext context)
        {
            string ID = context.Request["ID"].ToString();//ID

            Maticsoft.BLL.Employee BEmployee = new Maticsoft.BLL.Employee();
            if (ID.Contains(","))//批量删除
            {
                if (BEmployee.DeleteList(Common.Function.DelLastComma(ID)))
                {
                    context.Response.Write("{\"status\": 1, \"msg\": \"删除成功！\"}");
                    return;
                }
                else
                {
                    context.Response.Write("{\"status\": 0, \"msg\": \"删除失败！\"}");
                    return;
                }
            }
            else//单个删除
            {
                if (BEmployee.Delete(int.Parse(ID)))
                {
                    context.Response.Write("{\"status\": 1, \"msg\": \"删除成功！\"}");
                    return;
                }
                else
                {
                    context.Response.Write("{\"status\": 0, \"msg\": \"删除失败！\"}");
                    return;
                }
            }
        }

        /// <summary>
        /// 删除试卷授权
        /// </summary>
        /// <param name="context"></param>
        private void deleteAuthor(HttpContext context)
        {
            string ID = context.Request["ID"].ToString();//ID

            Maticsoft.BLL.PaperManage BPaperManage = new Maticsoft.BLL.PaperManage();
            if (ID.Contains(","))//批量删除
            {
                if (BPaperManage.DeleteList(Common.Function.DelLastComma(ID)))
                {
                    context.Response.Write("{\"status\": 1, \"msg\": \"删除成功！\"}");
                    return;
                }
                else
                {
                    context.Response.Write("{\"status\": 0, \"msg\": \"删除失败！\"}");
                    return;
                }
            }
            else//单个删除
            {
                if (BPaperManage.Delete(int.Parse(ID)))
                {
                    context.Response.Write("{\"status\": 1, \"msg\": \"删除成功！\"}");
                    return;
                }
                else
                {
                    context.Response.Write("{\"status\": 0, \"msg\": \"删除失败！\"}");
                    return;
                }
            }
        }

        /// <summary>
        /// List转成json 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="jsonName"></param>
        /// <param name="list"></param>
        /// <returns></returns>
        public string ListToJson<T>(IList<T> list, string jsonName)
        {
            StringBuilder Json = new StringBuilder();
            if (string.IsNullOrEmpty(jsonName))
                jsonName = list[0].GetType().Name;
            Json.Append("{\"" + jsonName + "\":[");
            if (list.Count > 0)
            {
                for (int i = 0; i < list.Count; i++)
                {
                    T obj = Activator.CreateInstance<T>();
                    PropertyInfo[] pi = obj.GetType().GetProperties();
                    Json.Append("{");
                    for (int j = 0; j < pi.Length; j++)
                    {
                        Type type = pi[j].GetValue(list[i], null).GetType();
                        Json.Append("\"" + pi[j].Name.ToString() + "\":" + StringFormat(pi[j].GetValue(list[i], null).ToString(), type));

                        if (j < pi.Length - 1)
                        {
                            Json.Append(",");
                        }
                    }
                    Json.Append("}");
                    if (i < list.Count - 1)
                    {
                        Json.Append(",");
                    }
                }
            }
            Json.Append("]}");
            return Json.ToString();
        }

        /// <summary>
        /// List转成json 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="list"></param>
        /// <returns></returns>
        public string ListToJson<T>(IList<T> list)
        {
            object obj = list[0];
            return ListToJson<T>(list, obj.GetType().Name);
        }

        /// <summary> 
        /// 对象转换为Json字符串 
        /// </summary> 
        /// <param name="jsonObject">对象</param> 
        /// <returns>Json字符串</returns> 
        public string ToJson(object jsonObject)
        {
            string jsonString = "{";
            PropertyInfo[] propertyInfo = jsonObject.GetType().GetProperties();
            for (int i = 0; i < propertyInfo.Length; i++)
            {
                object objectValue = propertyInfo[i].GetGetMethod().Invoke(jsonObject, null);
                string value = string.Empty;
                if (objectValue is DateTime || objectValue is Guid || objectValue is TimeSpan)
                {
                    value = "'" + objectValue.ToString() + "'";
                }
                else if (objectValue is string)
                {
                    value = "'" + ToJson(objectValue.ToString()) + "'";
                }
                else if (objectValue is IEnumerable)
                {
                    value = ToJson((IEnumerable)objectValue);
                }
                else
                {
                    value = ToJson(objectValue.ToString());
                }
                jsonString += "\"" + ToJson(propertyInfo[i].Name) + "\":" + value + ",";
            }
            jsonString.Remove(jsonString.Length - 1, jsonString.Length);
            return jsonString + "}";
        }

        /// <summary> 
        /// 对象集合转换Json 
        /// </summary> 
        /// <param name="array">集合对象</param> 
        /// <returns>Json字符串</returns> 
        public string ToJson(IEnumerable array)
        {
            string jsonString = "[";
            foreach (object item in array)
            {
                jsonString += ToJson(item) + ",";
            }
            jsonString.Remove(jsonString.Length - 1, jsonString.Length);
            return jsonString + "]";
        }

        /// <summary> 
        /// 普通集合转换Json 
        /// </summary> 
        /// <param name="array">集合对象</param> 
        /// <returns>Json字符串</returns> 
        public string ToArrayString(IEnumerable array)
        {
            string jsonString = "[";
            foreach (object item in array)
            {
                jsonString = ToJson(item.ToString()) + ",";
            }
            jsonString.Remove(jsonString.Length - 1, jsonString.Length);
            return jsonString + "]";
        }

        /// <summary> 
        /// Datatable转换为Json 
        /// </summary> 
        /// <param name="table">Datatable对象</param> 
        /// <returns>Json字符串</returns> 
        public string ToJson(DataTable dt)
        {
            StringBuilder jsonString = new StringBuilder();
            jsonString.Append("[");
            DataRowCollection drc = dt.Rows;
            for (int i = 0; i < drc.Count; i++)
            {
                jsonString.Append("{");
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    string strKey = dt.Columns[j].ColumnName;
                    string strValue = drc[i][j].ToString();
                    Type type = dt.Columns[j].DataType;
                    jsonString.Append("\"" + strKey + "\":");
                    strValue = StringFormat(strValue, type);
                    if (j < dt.Columns.Count - 1)
                    {
                        jsonString.Append(strValue + ",");
                    }
                    else
                    {
                        jsonString.Append(strValue);
                    }
                }
                jsonString.Append("},");
            }
            jsonString.Remove(jsonString.Length - 1, 1);
            jsonString.Append("]");
            return jsonString.ToString();
        }

        /// <summary>
        /// DataTable转成Json 
        /// </summary>
        /// <param name="jsonName"></param>
        /// <param name="dt"></param>
        /// <returns></returns>
        public string ToJson(DataTable dt, string jsonName)
        {
            StringBuilder Json = new StringBuilder();
            if (string.IsNullOrEmpty(jsonName))
                jsonName = dt.TableName;
            Json.Append("{\"" + jsonName + "\":[");
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Json.Append("{");
                    for (int j = 0; j < dt.Columns.Count; j++)
                    {
                        Type type = dt.Rows[i][j].GetType();
                        Json.Append("\"" + dt.Columns[j].ColumnName.ToString() + "\":" + StringFormat(dt.Rows[i][j].ToString(), type));
                        if (j < dt.Columns.Count - 1)
                        {
                            Json.Append(",");
                        }
                    }
                    Json.Append("}");
                    if (i < dt.Rows.Count - 1)
                    {
                        Json.Append(",");
                    }
                }
            }
            Json.Append("]}");
            return Json.ToString();
        }

        /// <summary> 
        /// DataReader转换为Json 
        /// </summary> 
        /// <param name="dataReader">DataReader对象</param> 
        /// <returns>Json字符串</returns> 
        public string ToJson(DbDataReader dataReader)
        {
            StringBuilder jsonString = new StringBuilder();
            jsonString.Append("[");
            while (dataReader.Read())
            {
                jsonString.Append("{");
                for (int i = 0; i < dataReader.FieldCount; i++)
                {
                    Type type = dataReader.GetFieldType(i);
                    string strKey = dataReader.GetName(i);
                    string strValue = dataReader[i].ToString();
                    jsonString.Append("\"" + strKey + "\":");
                    strValue = StringFormat(strValue, type);
                    if (i < dataReader.FieldCount - 1)
                    {
                        jsonString.Append(strValue + ",");
                    }
                    else
                    {
                        jsonString.Append(strValue);
                    }
                }
                jsonString.Append("},");
            }
            dataReader.Close();
            jsonString.Remove(jsonString.Length - 1, 1);
            jsonString.Append("]");
            return jsonString.ToString();
        }

        /// <summary> 
        /// DataSet转换为Json 
        /// </summary> 
        /// <param name="dataSet">DataSet对象</param> 
        /// <returns>Json字符串</returns> 
        public string ToJson(DataSet dataSet)
        {
            string jsonString = "{";
            foreach (DataTable table in dataSet.Tables)
            {
                jsonString += "\"" + table.TableName + "\":" + ToJson(table) + ",";
            }
            jsonString = jsonString.TrimEnd(',');
            return jsonString + "}";
        }

        /// <summary>
        /// 过滤特殊字符
        /// </summary>
        /// <param name="s"></param>
        /// <returns></returns>
        public string String2Json(String s)
        {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < s.Length; i++)
            {
                char c = s.ToCharArray()[i];
                switch (c)
                {
                    case '\"':
                        sb.Append("\\\""); break;
                    case '\\':
                        sb.Append("\\\\"); break;
                    case '/':
                        sb.Append("\\/"); break;
                    case '\b':
                        sb.Append("\\b"); break;
                    case '\f':
                        sb.Append("\\f"); break;
                    case '\n':
                        sb.Append("\\n"); break;
                    case '\r':
                        sb.Append("\\r"); break;
                    case '\t':
                        sb.Append("\\t"); break;
                    default:
                        sb.Append(c); break;
                }
            }
            return sb.ToString();
        }

        /// <summary>
        /// 格式化字符型、日期型、布尔型
        /// </summary>
        /// <param name="str"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        public string StringFormat(string str, Type type)
        {
            if (type == typeof(string))
            {
                str = String2Json(str);
                str = "\"" + str + "\"";
            }
            else if (type == typeof(DateTime))
            {
                str = "\"" + str + "\"";
            }
            else if (type == typeof(bool))
            {
                str = str.ToLower();
            }
            return str;
        }



        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}