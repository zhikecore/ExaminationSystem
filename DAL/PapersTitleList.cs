using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using DBUtility;

namespace DAL
{
    /// <summary>
    /// 试卷题目表
    /// </summary>
    public class PapersTitleList
    {
        /// <summary>
        /// 添加
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Add(Model.PapersTitleList model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
                new SqlParameter("@ReturnValue", SqlDbType.Int),
                new SqlParameter("@CourseID", SqlDbType.Int),
                new SqlParameter("@Type",SqlDbType.NVarChar,50),
                new SqlParameter("@Title",SqlDbType.NVarChar,500),
                new SqlParameter("@T_F", SqlDbType.NVarChar,50),
                new SqlParameter("@Analysis",SqlDbType.Text),
                new SqlParameter("@ID", SqlDbType.Int),
                new SqlParameter("@Score", SqlDbType.Int),
                new SqlParameter("@PapersID", SqlDbType.Int),
                new SqlParameter("@Status_id",SqlDbType.Int)
            };
            parameters[0].Direction = ParameterDirection.Output;
            parameters[1].Value = model.CourseID;
            parameters[2].Value = model.Type;
            parameters[3].Value = model.Title;
            parameters[4].Value = model.T_F;
            parameters[5].Value = model.Analysis;
            parameters[6].Value = model.ID;
            parameters[7].Value = model.Score;
            parameters[8].Value = model.PapersID;
            parameters[9].Value = model.Status_id;
            ExamSys.RunProcedure("PapersTitleList_Add", parameters, out rowsAffected);
            return (int)parameters[0].Value;
        }
        /// <summary>
        /// 显示所有
        /// </summary>
        /// <param name="Type">类型(单选/多选/不定项选/判断)</param>
        /// <param name="PapersID">试卷ID</param>
        /// <returns></returns>
        public List<Model.PapersTitleList> GetList(string Type, int PapersID)
        {
            string strSql = "";
            strSql = "Select * FROM [PapersTitleList] Where [Type]='" + Type + "' AND [PapersID]='" + PapersID + "' order by newid()";
            List<Model.PapersTitleList> List = new List<Model.PapersTitleList>();
            SqlParameter[] parameters = {
                };
            SqlDataReader DR;
            DR = ExamSys.ExecuteReader(strSql.ToString(), parameters);
            using (DR)
            {
                while (DR.Read())
                {
                    Model.PapersTitleList model = new Model.PapersTitleList();
                    model.Title = DR["Title"].ToString();
                    model.T_F = DR["T_F"].ToString();
                    model.ID = int.Parse(DR["ID"].ToString());
                    model.Score = int.Parse(DR["Score"].ToString());
                    List.Add(model);
                }
                DR.Close();
                DR.Dispose();
            }
            return List;
        }

        /// <summary>
        /// add by wangke
		/// 执行SQL语句
		/// </summary>
		public DataTable ExecSQL(string strSql, params SqlParameter[] parames)
        {

            DataTable dt = ExamSys.Query(strSql.ToString(), parames).Tables[0];
            return dt;
        }

        /// <summary>
        /// 显示所有
        /// </summary>
        /// <param name="Type">类型(单选/多选/不定项选/判断)</param>
        /// <param name="PapersID">试卷ID</param>
        /// <returns></returns>
        public List<Model.PapersTitleList> GetList(string Type, int PapersID,int StatusID)
        {
            string strSql = "";
            //strSql = "Select * FROM [PapersTitleList] Where [Type]='" + Type + "' AND [PapersID]='" + PapersID + "' AND Status_id='"+ StatusID + "' order by newid()";

            //add by wangke 2016-12-13 题目排序调整
            strSql = "Select * FROM [PapersTitleList] Where [Type]='" + Type + "' AND [PapersID]='" + PapersID + "' AND Status_id='" + StatusID + "' order by ID";

            List<Model.PapersTitleList> List = new List<Model.PapersTitleList>();
            SqlParameter[] parameters = {
                };
            SqlDataReader DR;
            DR = ExamSys.ExecuteReader(strSql.ToString(), parameters);
            using (DR)
            {
                while (DR.Read())
                {
                    Model.PapersTitleList model = new Model.PapersTitleList();
                    model.Title = DR["Title"].ToString();
                    model.T_F = DR["T_F"].ToString();
                    model.ID = int.Parse(DR["ID"].ToString());
                    model.Score = int.Parse(DR["Score"].ToString());
                    List.Add(model);
                }
                DR.Close();
                DR.Dispose();
            }
            return List;
        }

        /// <summary>
        /// 统计分值
        /// </summary>
        /// <param name="Type">类型(单选/多选/不定项选/判断)</param>
        /// <param name="PapersID">试卷ID</param>
        /// <returns></returns>
        public int SumScore(string Type, int PapersID)
        {
            List<Model.PapersTitleList> list = new List<Model.PapersTitleList>();
            list = nSumScore(Type, PapersID);
            return list[0].Score;
        }
        /// <summary>
        /// 统计分值
        /// </summary>
        /// <param name="Type">类型(单选/多选/不定项选/判断)</param>
        /// <param name="PapersID">试卷ID</param>
        /// <returns></returns>
        private List<Model.PapersTitleList> nSumScore(string Type, int PapersID)
        {
            string strSql = "";
            if (Type != "")
            {
                strSql = "SELECT SUM([Score]) as sumscore FROM [ExaminationSystem].[Exam].[PapersTitleList] where PapersID='" + PapersID + "' and Type='" + Type + "'";
            }
            else
            {
                strSql = "SELECT SUM([Score]) as sumscore FROM [ExaminationSystem].[Exam].[PapersTitleList] where PapersID='" + PapersID + "'";
            }
            List<Model.PapersTitleList> List = new List<Model.PapersTitleList>();
            SqlParameter[] parameters = {
                };
            SqlDataReader DR;
            DR = ExamSys.ExecuteReader(strSql.ToString(), parameters);
            using (DR)
            {
                while (DR.Read())
                {
                    Model.PapersTitleList model = new Model.PapersTitleList();
                    if (DR["sumscore"].ToString() == "")
                    {
                        model.Score = 0;
                    }
                    else
                    {
                        model.Score = int.Parse(DR["sumscore"].ToString());
                    }
                    List.Add(model);
                }
                DR.Close();
                DR.Dispose();
            }
            return List;
        }
        /// <summary>
        /// 统计分值
        /// </summary>
        /// <param name="PapersID">试卷ID</param>
        /// <returns></returns>
        public int SumScore(int PapersID)
        {
            List<Model.PapersTitleList> list = new List<Model.PapersTitleList>();
            list = nSumScore("", PapersID);
            return list[0].Score;
        }
        /// <summary>
        /// 是否存在
        /// </summary>
        /// <param name="Type">类型(单选/多选/不定项选/判断)</param>
        /// <param name="PapersID">试卷ID</param>
        /// <returns></returns>
        public bool nGetList(string Type, int PapersID)
        {
            DataTable dt = DBUtility.ExamSys.gettb("SELECT * FROM [ExaminationSystem].[Exam].[PapersTitleList] where PapersID='" + PapersID + "' and Type='" + Type + "'");
            if (dt.Rows.Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// add by wangke 2016-12-8 
		/// 获得数据列表
        /// 获取该试卷题目所属StatusId
		/// </summary>
		public DataTable GetList(int  papersID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT Status_id FROM ExaminationSystem.Exam.PapersTitleList WHERE PapersID=@papersID GROUP BY Status_id ");
            List<Model.Status> List = new List<Model.Status>();
            SqlParameter[] parameters = {
                new SqlParameter("@papersID",SqlDbType.Int)
                };
            parameters[0].Value = papersID;

            DataTable dt = ExamSys.Query(strSql.ToString(), parameters).Tables[0];
            return dt;
        }
    }
}
