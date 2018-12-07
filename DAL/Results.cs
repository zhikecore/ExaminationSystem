using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using DBUtility;
using Maticsoft.DBUtility;

namespace DAL
{
    /// <summary>
    /// 成绩单
    /// </summary>
    public class Results
    {
        /// <summary>
        /// 添加
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Add(Model.Results model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
                new SqlParameter("@ReturnValue", SqlDbType.Int),
                new SqlParameter("@UserID", SqlDbType.Int),
                new SqlParameter("@PapersID", SqlDbType.Int),
                new SqlParameter("@TitleListID", SqlDbType.Int),
                new SqlParameter("@Answer",SqlDbType.NVarChar,50),
                new SqlParameter("@Time",SqlDbType.NVarChar,50)
            };
            parameters[0].Direction = ParameterDirection.Output;
            parameters[1].Value = model.UserID;
            parameters[2].Value = model.PapersID;
            parameters[3].Value = model.TitleListID;
            parameters[4].Value = model.Answer;
            parameters[5].Value = model.Time;
            ExamSys.RunProcedure("Results_Add", parameters, out rowsAffected);
            return (int)parameters[0].Value;
        }

        /// <summary>
        /// 添加
        /// 扩展
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int AddExtend(Model.Results model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into Company(");
            strSql.Append("UserID,PapersID,TitleListID,Answer,Time,SubmitTime)");
            strSql.Append(" values (");
            strSql.Append("@UserID,@PapersID,@TitleListID,@Answer,@Time,@SubmitTime)");
            strSql.Append(";select @@IDENTITY"); 
            SqlParameter[] parameters = {
                new SqlParameter("@UserID", SqlDbType.Int),
                new SqlParameter("@PapersID", SqlDbType.Int),
                new SqlParameter("@TitleListID", SqlDbType.Int),
                new SqlParameter("@Answer",SqlDbType.NVarChar,50),
                new SqlParameter("@Time",SqlDbType.NVarChar,50),
                new SqlParameter("@SubmitTime",SqlDbType.DateTime)//添加提交时间
            };
            parameters[0].Value = model.UserID;
            parameters[1].Value = model.PapersID;
            parameters[2].Value = model.TitleListID;
            parameters[3].Value = model.Answer;
            parameters[4].Value = model.Time;
            parameters[5].Value = model.SubmitTime;
            object obj = DbHelperSQL.GetSingle(strSql.ToString(), parameters);
            if (obj == null)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(obj);
            }
        }

        /// <summary>
		/// 更新一条数据
		/// </summary>
		public bool Update(Model.Results model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update Results set ");
            strSql.Append("Answer=@Answer,");
            strSql.Append("Time=@Time");
            strSql.Append(" where UserID=@UserID and PapersID=@PapersID and TitleListID=@TitleListID");

            SqlParameter[] parameters = {
                new SqlParameter("@Answer",SqlDbType.NVarChar,50),
                new SqlParameter("@Time",SqlDbType.NVarChar,50),
                new SqlParameter("@UserID", SqlDbType.Int),
                new SqlParameter("@PapersID", SqlDbType.Int),
                new SqlParameter("@TitleListID", SqlDbType.Int)
            };
            parameters[0].Value = model.Answer;
            parameters[1].Value = model.Time;
            parameters[2].Value = model.UserID;
            parameters[3].Value = model.PapersID;
            parameters[4].Value = model.TitleListID;
            

            int rows = DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
		/// 更新一条数据
		/// </summary>
		public bool UpdateExtend(Model.Results model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update Results set ");
            //strSql.Append("Answer=@Answer,");
            strSql.Append("SubmitTime=@SubmitTime");
            strSql.Append(" where UserID=@UserID and PapersID=@PapersID and TitleListID=@TitleListID");

            SqlParameter[] parameters = {
                new SqlParameter("@SubmitTime",SqlDbType.DateTime),
                new SqlParameter("@UserID", SqlDbType.Int),
                new SqlParameter("@PapersID", SqlDbType.Int),
                new SqlParameter("@TitleListID", SqlDbType.Int)
            };
            parameters[0].Value = model.SubmitTime;
            parameters[1].Value = model.UserID;
            parameters[2].Value = model.PapersID;
            parameters[3].Value = model.TitleListID;


            int rows = DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 升序
        /// </summary>
        /// <param name="list"></param>
        private void Sort(int[] list)
        {
            int i, j, temp;
            bool done = false;
            j = 1;
            while ((j < list.Length) && (!done))
            {
                done = true;
                for (i = 0; i < list.Length - j; i++)
                {
                    if (list[i] > list[i + 1])
                    {
                        done = false;
                        temp = list[i];
                        list[i] = list[i + 1];
                        list[i + 1] = temp;
                    }
                }
                j++;
            }
        }

        /// <summary>
		/// 执行SQL语句
		/// </summary>
		public DataTable ExecSQL(string strSql,params SqlParameter[] parames)
        {
            
            DataTable dt = ExamSys.Query(strSql.ToString(), parames).Tables[0];
            return dt;
        }

        /// <summary>
        /// String转成Int[]
        /// </summary>
        /// <param name="Str">字符串</param>
        /// <returns></returns>
        private int[] StringToInt(string Str)
        {
            string[] strs = Str.Split(',');
            int[] a = new int[strs.Length];
            for (int i = 0; i < strs.Length; i++)
            {
                a[i] = Convert.ToInt32(strs[i]);
            }
            Sort(a);
            return a;
        }
        /// <summary>
        /// 详细信息
        /// </summary>
        /// <param name="UserID">用户ID</param>
        /// <param name="PapersID">试卷ID</param>
        /// <returns></returns>
        public List<Model.Results> Details(int UserID, int PapersID,string Time)
        {
            DataTable dt = DBUtility.ExamSys.gettb("SELECT SUM(Score)FROM [Results] WHERE [UserID]='" + UserID + "' AND [PapersID]='" + PapersID + "' AND [Time]='" + Time + "'");
            //改卷
            if (dt.Rows[0][0].ToString() == "")
            {
                //根据用户ID和试卷ID查询[成绩单]中所有题目
                DataTable dt_Results = DBUtility.ExamSys.gettb("SELECT [TitleListID],[Answer] FROM [Results] WHERE [UserID]='" + UserID + "' AND [PapersID]='" + PapersID + "' AND [Time]='" + Time + "'");
                int Count = dt_Results.Rows.Count;
                for (int i = 0; i < Count; i++)
                {
                    //题目ID
                    int TitleListID = int.Parse(dt_Results.Rows[i][0].ToString());
                    //用户答案
                    string Answer = dt_Results.Rows[i][1].ToString();
                    

                    if (Answer == "T" || Answer == "F")
                    {
                        //判断题
                        DataTable dt_TitleList = DBUtility.ExamSys.gettb("SELECT [T_F],[Score] FROM [PapersTitleList] WHERE ID='" + TitleListID + "' AND PapersID='" + PapersID + "'");
                        string SysScore = dt_TitleList.Rows[0]["Score"].ToString();

                        if (dt_TitleList.Rows[0]["T_F"].ToString() == Answer)
                        {
                            //用户答案正确
                            DBUtility.ExamSys.non("update Results set [Score]='" + SysScore + "',[SysScore]='" + SysScore + "' Where [TitleListID]='" + TitleListID + "' AND PapersID='" + PapersID + "' AND [Time]='" + Time + "'");
                        }
                        else
                        {
                            //用户答案错误
                            DBUtility.ExamSys.non("update Results set [Score]='0',[SysScore]='" + SysScore + "' Where [TitleListID]='" + TitleListID + "' AND PapersID='" + PapersID + "' AND [Time]='" + Time + "'");
                        }
                    }
                    else
                    {
                        if (Answer == "")
                        {
                            DataTable dt_TitleList = DBUtility.ExamSys.gettb("SELECT [Score],[Type] FROM [PapersTitleList] WHERE ID='" + TitleListID + "' AND PapersID='" + PapersID + "'");
                            string Type = dt_TitleList.Rows[0]["Type"].ToString();
                            string SysScore = dt_TitleList.Rows[0]["Score"].ToString();
                            if (Type == "单选")
                            {
                                //用户答案错误
                                DBUtility.ExamSys.non("update Results set [Score]='0',[SysScore]='" + SysScore + "' Where [TitleListID]='" + TitleListID + "' AND PapersID='" + PapersID + "' AND [Time]='" + Time + "'");
                            }
                            else
                            {
                                if (Type == "多选")
                                {

                                    //用户答案错误
                                    DBUtility.ExamSys.non("update Results set [Score]='0',[SysScore]='" + SysScore + "' Where [TitleListID]='" + TitleListID + "' AND PapersID='" + PapersID + "' AND [Time]='" + Time + "'");
                                }
                                else
                                {
                                    if (Type == "不定项选")
                                    {
                                        //用户答案错误
                                        DBUtility.ExamSys.non("update Results set [Score]='0',[SysScore]='" + SysScore + "' Where [TitleListID]='" + TitleListID + "' AND PapersID='" + PapersID + "' AND [Time]='" + Time + "'");
                                    }
                                    else
                                    {
                                        DBUtility.ExamSys.non("update Results set [Score]='0',[SysScore]='" + SysScore + "' Where [TitleListID]='" + TitleListID + "' AND PapersID='" + PapersID + "' AND [Time]='" + Time + "'");
                                    }
                                }
                            }
                        }
                        else
                        {
                            DataTable dt_TitleList = DBUtility.ExamSys.gettb("SELECT [Score],[Type] FROM [PapersTitleList] WHERE ID='" + TitleListID + "' AND PapersID='" + PapersID + "'");
                            string Type = dt_TitleList.Rows[0]["Type"].ToString();
                            string SysScore = dt_TitleList.Rows[0]["Score"].ToString();
                            if (Type == "单选")
                            {
                                int ID = int.Parse(Answer);
                                DataTable dt_PapersOptionsList = DBUtility.ExamSys.gettb("SELECT * FROM [PapersOptionsList] Where TitleListID='" + TitleListID + "' AND PapersID='" + PapersID + "' AND ID='" + ID + "'");
                                if (dt_PapersOptionsList.Rows[0]["T_F"].ToString() == "")
                                {
                                    //用户答案错误
                                    DBUtility.ExamSys.non("update Results set [Score]='0',[SysScore]='" + SysScore + "' Where [TitleListID]='" + TitleListID + "' AND PapersID='" + PapersID + "' AND [Time]='" + Time + "'");
                                }
                                else
                                {
                                    //用户答案正确
                                    DBUtility.ExamSys.non("update Results set [Score]='" + SysScore + "',[SysScore]='" + SysScore + "' Where [TitleListID]='" + TitleListID + "' AND PapersID='" + PapersID + "' AND [Time]='" + Time + "'");
                                }
                            }
                            else
                            {
                                if (Type == "多选")
                                {
                                    DataTable dt_PapersOptionsList = DBUtility.ExamSys.gettb("SELECT * FROM [PapersOptionsList] Where TitleListID='" + TitleListID + "' AND PapersID='" + PapersID + "' ORDER BY [ID] ASC");
                                    string sAnswer =null;
                                    for (int j = 0; j < dt_PapersOptionsList.Rows.Count; j++)
                                    {
                                        if (dt_PapersOptionsList.Rows[j]["T_F"].ToString() != "")
                                        {
                                            sAnswer = sAnswer + dt_PapersOptionsList.Rows[j]["ID"].ToString() + ",";
                                        }
                                    }
                                    int length = sAnswer.Length;
                                    sAnswer = sAnswer.Substring(0, length - 1);
                                    string myAnswer = Answer;
                                    int[] c = StringToInt(myAnswer);
                                    myAnswer = "";
                                    for (int ii = 0; ii < c.Count(); ii++)
                                    {
                                        myAnswer = myAnswer + c[ii] + ",";
                                    }
                                    int length1 = myAnswer.Length;
                                    myAnswer = myAnswer.Substring(0, length - 1);
                                    if (sAnswer == myAnswer)
                                    {
                                        //用户答案正确
                                        DBUtility.ExamSys.non("update Results set [Score]='" + SysScore + "',[SysScore]='" + SysScore + "' Where [TitleListID]='" + TitleListID + "' AND PapersID='" + PapersID + "' AND [Time]='" + Time + "'");
                                    }
                                    else
                                    {
                                        //用户答案错误
                                        DBUtility.ExamSys.non("update Results set [Score]='0',[SysScore]='" + SysScore + "' Where [TitleListID]='" + TitleListID + "' AND PapersID='" + PapersID + "' AND [Time]='" + Time + "'");
                                    }
                                }
                                else
                                {
                                    if (Type == "不定项选")
                                    {
                                        DataTable dt_PapersOptionsList = DBUtility.ExamSys.gettb("SELECT * FROM [PapersOptionsList] Where TitleListID='" + TitleListID + "' AND PapersID='" + PapersID + "' ORDER BY [ID] ASC");
                                        string sAnswer = "";
                                        for (int j = 0; j < dt_PapersOptionsList.Rows.Count; j++)
                                        {
                                            if (dt_PapersOptionsList.Rows[j]["T_F"].ToString() != "")
                                            {
                                                sAnswer = sAnswer + dt_PapersOptionsList.Rows[j]["ID"].ToString() + ",";
                                            }
                                        }
                                        int length = sAnswer.Length;
                                        sAnswer = sAnswer.Substring(0, length - 1);
                                        string myAnswer = Answer;
                                        int[] c = StringToInt(myAnswer);
                                        myAnswer = "";
                                        for (int ii = 0; ii < c.Count(); ii++)
                                        {
                                            myAnswer = myAnswer + c[ii] + ",";
                                        }
                                        int length1 = myAnswer.Length;
                                        myAnswer = myAnswer.Substring(0, length - 1);
                                        if (sAnswer == myAnswer)
                                        {
                                            //用户答案正确
                                            DBUtility.ExamSys.non("update Results set [Score]='" + SysScore + "',[SysScore]='" + SysScore + "' Where [TitleListID]='" + TitleListID + "' AND PapersID='" + PapersID + "' AND [Time]='" + Time + "'");
                                        }
                                        else
                                        {
                                            //用户答案错误
                                            DBUtility.ExamSys.non("update Results set [Score]='0',[SysScore]='" + SysScore + "' Where [TitleListID]='" + TitleListID + "' AND PapersID='" + PapersID + "' AND [Time]='" + Time + "'");
                                        }
                                    }
                                    else
                                    {
                                        //值选题
                                        int ID = int.Parse(Answer);
                                        DataTable dt_PapersOptionsList = DBUtility.ExamSys.gettb("SELECT * FROM [PapersOptionsList] Where TitleListID='" + TitleListID + "' AND PapersID='" + PapersID + "' AND ID='" + ID + "'");
                                        //用户值答案分值
                                        DBUtility.ExamSys.non("update Results set [Score]='" + dt_PapersOptionsList.Rows[0]["Score"].ToString() + "',[SysScore]='" + SysScore + "' Where [TitleListID]='" + TitleListID + "' AND PapersID='" + PapersID + "' AND [Time]='" + Time + "'");
                                    }
                                }
                            }
                        }
                    }
                }
                //For结束
                string strSql = "";
                strSql = "Select DISTINCT [UserID],[PapersID] FROM Results WHERE [UserID]='" + UserID + "' AND [PapersID]='" + PapersID + "' AND [Time]='" + Time + "'";
                List<Model.Results> List = new List<Model.Results>();
                SqlParameter[] parameters = {
				};
                using (SqlDataReader DR = ExamSys.ExecuteReader(strSql.ToString(), parameters))
                {
                    while (DR.Read())
                    {
                        Model.Results model = new Model.Results();
                        model.UserName = getUserName(UserID);
                        model.Score = getScore(UserID, PapersID,Time);
                        model.SysScore = getSysScore(UserID, PapersID,Time);
                        model.PapersName = getPapersName(PapersID);
                        model.Percentage = getPercentage(model.Score, model.SysScore);
                        List.Add(model);
                    }
                    DR.Close();
                    DR.Dispose();
                }
                return List;
            }
            else
            {
                string strSql = "";
                strSql = "Select DISTINCT [UserID],[PapersID],[Time] FROM Results WHERE [UserID]='" + UserID + "' AND [PapersID]='" + PapersID + "' AND [Time]='" + Time + "'";
                List<Model.Results> List = new List<Model.Results>();
                SqlParameter[] parameters = {
				};
                using (SqlDataReader DR = ExamSys.ExecuteReader(strSql.ToString(), parameters))
                {
                    while (DR.Read())
                    {
                        Model.Results model = new Model.Results();
                        model.UserName = getUserName(UserID);
                        model.Score = getScore(UserID, PapersID,Time);
                        model.SysScore = getSysScore(UserID, PapersID,Time);
                        model.PapersName = getPapersName(PapersID);
                        model.Percentage = getPercentage(model.Score, model.SysScore);
                        model.Time = DR["Time"].ToString();
                        List.Add(model);
                    }
                    DR.Close();
                    DR.Dispose();
                }
                return List;
            }

        }
        /// <summary>
        /// 取到用户名
        /// </summary>
        /// <param name="UserID">用户ID</param>
        /// <returns></returns>
        private string getUserName(int UserID)
        {
            List<Model.UserSystem> list = new List<Model.UserSystem>();
            DAL.UserSystem dal = new UserSystem();
            list = dal.Details(UserID);
            return list[0].cnName + "(" + list[0].enName + ")";
        }
        /// <summary>
        /// 取到用户得分
        /// </summary>
        /// <param name="UserID">用户ID</param>
        /// <param name="PapersID">试卷ID</param>
        /// <returns></returns>
        private int getScore(int UserID, int PapersID,string Time)
        {
            string strSql = "";
            strSql = "Select SUM([Score]) FROM [Results] Where [UserID]='" + UserID + "' and [PapersID]='" + PapersID + "' AND [Time]='" + Time + "'";
            DataTable dt = DBUtility.ExamSys.gettb(strSql);
            return int.Parse(dt.Rows[0][0].ToString());
        }
        /// <summary>
        /// 取到试卷总分
        /// </summary>
        /// <param name="UserID">用户ID</param>
        /// <param name="PapersID">试卷ID</param>
        /// <returns></returns>
        private int getSysScore(int UserID, int PapersID,string Time)
        {
            string strSql = "";
            strSql = "Select SUM([SysScore]) FROM [Results] Where [UserID]='" + UserID + "' and [PapersID]='" + PapersID + "' AND [Time]='" + Time + "'";
            DataTable dt = DBUtility.ExamSys.gettb(strSql);
            return int.Parse(dt.Rows[0][0].ToString());
        }
        /// <summary>
        /// 取到百分比
        /// </summary>
        /// <param name="Score">得分</param>
        /// <param name="SysScore">总分</param>
        /// <returns></returns>
        private string getPercentage(int Score, int SysScore)
        {
            //if (Score == 0)
            //{
            //    return "0.00%";
            //}
            //else
            //{
                double a, b;
                a = Score * 1.00;
                b = SysScore * 1.00;
                string c = (a / b).ToString("P");
                return c;
            //}
        }
        /// <summary>
        /// 取到试卷名
        /// </summary>
        /// <param name="PapersID">试卷ID</param>
        /// <returns></returns>
        private string getPapersName(int PapersID)
        {
            DAL.Papers dal = new Papers();
            List<Model.Papers> list = new List<Model.Papers>();
            list = dal.Details(PapersID);
            return list[0].Name;
        }
        /// <summary>
        /// 查询所有
        /// </summary>
        /// <param name="Time">考试时间</param>
        /// <returns></returns>
        public List<Model.Results> GetList(string Time)
        {
            List<Model.Results> List = new List<Model.Results>();
            DataTable dt_ResultaForTime = DBUtility.ExamSys.gettb("Select DISTINCT [Time] FROM Results Where Time like '%" + Time + "%'");
            string strSql = "";
            int dtCount=dt_ResultaForTime.Rows.Count;
            //DROP tempResultsForTime表
            try
            {
                strSql = "IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Exam].[tempResultsForTime]') AND type in (N'U')) DROP TABLE [Exam].[tempResultsForTime]";
                DBUtility.ExamSys.non(strSql);
            }
            catch
            { }
            if (dtCount > 0)
            {
                for (int i = 0; i < dtCount; i++)
                {
                    if (i == 0)
                    {
                        strSql = "Select Top 1 [Score],[UserID],[PapersID],[Time] Into tempResultsForTime FROM Results Where Time='" + dt_ResultaForTime.Rows[i][0] + "'";
                    }
                    else
                    {
                        strSql = "Insert Into tempResultsForTime([Score],[UserID],[PapersID],[Time]) Select Top 1 [Score],[UserID],[PapersID],[Time] FROM Results Where Time='" + dt_ResultaForTime.Rows[i][0] + "'";
                    }
                    DBUtility.ExamSys.non(strSql);
                }
                strSql = "Select * FROM tempResultsForTime ORDER BY Time DESC";
                SqlParameter[] parameters = { };
                using (SqlDataReader DR = ExamSys.ExecuteReader(strSql.ToString(), parameters))
                {
                    while (DR.Read())
                    {
                        Model.Results model = new Model.Results();
                        model.Time = DR["Time"].ToString();
                        model.UserID = int.Parse(DR["UserID"].ToString());
                        model.UserName = getUserName(model.UserID);
                        model.PapersID = int.Parse(DR["PapersID"].ToString());
                        model.PapersName = getPapersName(model.PapersID);

                        if (DR["Score"].ToString() == "")
                        {
                            model.Percentage = "";
                            model.Score = 0;
                            model.SysScore = 0;
                        }
                        else
                        {
                            model.Score = getScore(model.UserID, model.PapersID, model.Time);
                            model.SysScore = getSysScore(model.UserID, model.PapersID, model.Time);
                            model.Percentage = getPercentage(model.Score, model.SysScore);
                        }
                        List.Add(model);
                    }
                    DR.Close();
                    DR.Dispose();
                }
            }
            else
            { }
            return List;
        }
        /// <summary>
        /// 查询所有
        /// </summary>
        /// <param name="CourseID">课程ID</param>
        /// <returns></returns>
        public List<Model.Results> GetList(int CourseID)
        {
            string strSql = "";
            strSql = "SELECT DISTINCT Exam.Results.Time FROM Exam.Papers INNER JOIN Exam.Results ON Exam.Papers.ID = Exam.Results.PapersID WHERE (Exam.Papers.CourseID = '" + CourseID + "')";
            List<Model.Results> List = new List<Model.Results>();

            DataTable dt_ResultaForTime = DBUtility.ExamSys.gettb(strSql);
            int dtCount = dt_ResultaForTime.Rows.Count;
            //DROP tempResultsForTime表
            try
            {
                strSql = "IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Exam].[tempResultsForTime]') AND type in (N'U')) DROP TABLE [Exam].[tempResultsForTime]";
                DBUtility.ExamSys.non(strSql);
            }
            catch
            { }
            if (dtCount > 0)
            {
                for (int i = 0; i < dtCount; i++)
                {
                    if (i == 0)
                    {
                        strSql = "Select Top 1 [Score],[UserID],[PapersID],[Time] Into tempResultsForTime FROM Results Where Time='" + dt_ResultaForTime.Rows[i][0] + "'";
                    }
                    else
                    {
                        strSql = "Insert Into tempResultsForTime([Score],[UserID],[PapersID],[Time]) Select Top 1 [Score],[UserID],[PapersID],[Time] FROM Results Where Time='" + dt_ResultaForTime.Rows[i][0] + "'";
                    }
                    DBUtility.ExamSys.non(strSql);
                }
                strSql = "Select * FROM tempResultsForTime ORDER BY Time DESC";
                SqlParameter[] parameters = {
				};
                using (SqlDataReader DR = ExamSys.ExecuteReader(strSql.ToString(), parameters))
                {
                    while (DR.Read())
                    {
                        Model.Results model = new Model.Results();
                        model.Time = DR["Time"].ToString();
                        model.UserID = int.Parse(DR["UserID"].ToString());
                        model.UserName = getUserName(model.UserID);
                        model.PapersID = int.Parse(DR["PapersID"].ToString());
                        model.PapersName = getPapersName(model.PapersID);

                        if (DR["Score"].ToString() == "")
                        {
                            model.Percentage = "";
                            model.Score = 0;
                            model.SysScore = 0;
                        }
                        else
                        {
                            model.Score = getScore(model.UserID, model.PapersID, model.Time);
                            model.SysScore = getSysScore(model.UserID, model.PapersID, model.Time);
                            model.Percentage = getPercentage(model.Score, model.SysScore);
                        }
                        List.Add(model);
                    }
                    DR.Close();
                    DR.Dispose();
                }
            }
            else
            { }
            return List;
        }
        public List<Model.Results> GetList(int PageCount, int PageSize, string Sort, string Search, string Type)
        {
            string strSql = "";
            strSql = "SELECT DISTINCT Exam.Results.Time FROM Exam.Papers INNER JOIN Exam.Results ON Exam.Papers.ID = Exam.Results.PapersID ";
            List<Model.Results> List = new List<Model.Results>();

            DataTable dt_ResultaForTime = DBUtility.ExamSys.gettb(strSql);
            int dtCount = dt_ResultaForTime.Rows.Count;
            //DROP tempResultsForTime表
            try
            {
                strSql = "IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Exam].[tempResultsForTime]') AND type in (N'U')) DROP TABLE [Exam].[tempResultsForTime]";
                DBUtility.ExamSys.non(strSql);
            }
            catch
            { }
            if (dtCount > 0)
            {
                for (int i = 0; i < dtCount; i++)
                {
                    if (i == 0)
                    {
                        strSql = "Select Top 1 [Score],[UserID],[PapersID],[Time] Into tempResultsForTime FROM Results Where Time='" + dt_ResultaForTime.Rows[i][0] + "'";
                    }
                    else
                    {
                        strSql = "Insert Into tempResultsForTime([Score],[UserID],[PapersID],[Time]) Select Top 1 [Score],[UserID],[PapersID],[Time] FROM Results Where Time='" + dt_ResultaForTime.Rows[i][0] + "'";
                    }
                    DBUtility.ExamSys.non(strSql);
                }







                //string strSql = "";
                string RedCountsql = "";
                int RowTotal = (PageCount - 1) * PageSize;//
                RedCountsql = "(select count(*) from [tempResultsForTime] where " + Type + " like '%" + Search + "%') as RowTotal";
                strSql = "Select Top " + PageSize + " *," + RedCountsql + " FROM [tempResultsForTime]  where [Time] not in (Select Top " + RowTotal + " [Time] from [tempResultsForTime] where " + Type + " like '%" + Search + "%' ORDER BY " + Sort + ") and " + Type + " like '%" + Search + "%' ORDER BY " + Sort + "";



                //strSql = "Select * FROM tempResultsForTime ORDER BY Time DESC";
                SqlParameter[] parameters = {
				};
                using (SqlDataReader DR = ExamSys.ExecuteReader(strSql.ToString(), parameters))
                {
                    while (DR.Read())
                    {
                        Model.Results model = new Model.Results();
                        model.Time = DR["Time"].ToString();
                        model.UserID = int.Parse(DR["UserID"].ToString());
                        model.UserName = getUserName(model.UserID);
                        model.PapersID = int.Parse(DR["PapersID"].ToString());
                        model.PapersName = getPapersName(model.PapersID);

                        if (DR["Score"].ToString() == "")
                        {
                            model.Percentage = "";
                            model.Score = 0;
                            model.SysScore = 0;
                        }
                        else
                        {
                            model.Score = getScore(model.UserID, model.PapersID, model.Time);
                            model.SysScore = getSysScore(model.UserID, model.PapersID, model.Time);
                            model.Percentage = getPercentage(model.Score, model.SysScore);
                        }

                        model.RowTotal = int.Parse(DR["RowTotal"].ToString());

                        List.Add(model);
                    }
                    DR.Close();
                    DR.Dispose();
                }
            }
            else
            { }
            return List;
        }
        /// <summary>
        /// 查询所有
        /// </summary>
        /// <param name="UserID">用户ID</param>
        /// <returns></returns>
        public List<Model.Results> GetListUserID(int UserID)
        {
            string strSql = "";
            strSql = "Select DISTINCT [Time] FROM Results Where UserID='" + UserID + "'";
            List<Model.Results> List = new List<Model.Results>();
            DataTable dt_ResultaForTime = DBUtility.ExamSys.gettb(strSql);
            int dtCount=dt_ResultaForTime.Rows.Count;
            //DROP tempResultsForTime表
            try
            {
                strSql = "IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Exam].[tempResultsForTime]') AND type in (N'U')) DROP TABLE [Exam].[tempResultsForTime]";
                DBUtility.ExamSys.non(strSql);
            }
            catch
            { }
            if (dtCount > 0)
            {
                for (int i = 0; i < dtCount; i++)
                {
                    if (i == 0)
                    {
                        strSql = "Select Top 1 [Score],[UserID],[PapersID],[Time] Into tempResultsForTime FROM Results Where Time='" + dt_ResultaForTime.Rows[i][0] + "'";
                    }
                    else
                    {
                        strSql = "Insert Into tempResultsForTime([Score],[UserID],[PapersID],[Time]) Select Top 1 [Score],[UserID],[PapersID],[Time] FROM Results Where Time='" + dt_ResultaForTime.Rows[i][0] + "'";
                    }
                    DBUtility.ExamSys.non(strSql);
                }
                strSql = "Select * FROM tempResultsForTime ORDER BY Time DESC";
                SqlParameter[] parameters = {
				};
                using (SqlDataReader DR = ExamSys.ExecuteReader(strSql.ToString(), parameters))
                {
                    while (DR.Read())
                    {
                        Model.Results model = new Model.Results();
                        model.Time = DR["Time"].ToString();
                        model.UserID = int.Parse(DR["UserID"].ToString());
                        model.UserName = getUserName(model.UserID);
                        model.PapersID = int.Parse(DR["PapersID"].ToString());
                        model.PapersName = getPapersName(model.PapersID);

                        if (DR["Score"].ToString() == "")
                        {
                            model.Percentage = "";
                            model.Score = 0;
                            model.SysScore = 0;
                        }
                        else
                        {
                            model.Score = getScore(model.UserID, model.PapersID, model.Time);
                            model.SysScore = getSysScore(model.UserID, model.PapersID, model.Time);
                            model.Percentage = getPercentage(model.Score, model.SysScore);
                        }
                        List.Add(model);
                    }
                    DR.Close();
                    DR.Dispose();
                }
            }
            else
            { }
            return List;
        }
    }
}
