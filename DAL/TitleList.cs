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
    /// 题目表
    /// </summary>
    public class TitleList
    {
        /// <summary>
        /// 添加
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Add(Model.TitleList model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
                new SqlParameter("@ReturnValue", SqlDbType.Int),
                new SqlParameter("@CourseID", SqlDbType.Int),
                new SqlParameter("@Type",SqlDbType.NVarChar,50),
                new SqlParameter("@Title",SqlDbType.NVarChar,500),
                new SqlParameter("@T_F", SqlDbType.NVarChar,50),
                new SqlParameter("@Analysis",SqlDbType.Text),
                new SqlParameter("@Extent", SqlDbType.NVarChar,50),
                new SqlParameter("@Status_id",SqlDbType.Int)
            };
            parameters[0].Direction = ParameterDirection.Output;
            parameters[1].Value = model.CourseID;
            parameters[2].Value = model.Type;
            parameters[3].Value = model.Title;
            parameters[4].Value = model.T_F;
            parameters[5].Value = model.Analysis;
            parameters[6].Value = model.Extent;
            parameters[7].Value = model.Status_id;
            ExamSys.RunProcedure("TitleList_Add", parameters, out rowsAffected);
            return (int)parameters[0].Value;
        }
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="ID">ID</param>
        /// <returns></returns>
        public int Del(int ID)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
                new SqlParameter("@ReturnValue", SqlDbType.Int),
                new SqlParameter("@ID",SqlDbType.Int),
            };
            parameters[0].Direction = ParameterDirection.Output;
            parameters[1].Value = ID;
            ExamSys.RunProcedure("TitleList_Del", parameters, out rowsAffected);
            return (int)parameters[0].Value;
        }
        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Updata(Model.TitleList model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
                new SqlParameter("@ReturnValue", SqlDbType.Int),
                new SqlParameter("@CourseID", SqlDbType.Int),
                new SqlParameter("@Type",SqlDbType.NVarChar,50),
                new SqlParameter("@Title",SqlDbType.NVarChar,500),
                new SqlParameter("@T_F", SqlDbType.NVarChar,50),
                new SqlParameter("@ID", SqlDbType.Int),
                new SqlParameter("@Analysis",SqlDbType.Text),
            };
            parameters[0].Direction = ParameterDirection.Output;
            parameters[1].Value = model.CourseID;
            parameters[2].Value = model.Type;
            parameters[3].Value = model.Title;
            parameters[4].Value = model.T_F;
            parameters[5].Value = model.ID;
            parameters[6].Value = model.Analysis;
            ExamSys.RunProcedure("TitleList_Updata", parameters, out rowsAffected);
            return (int)parameters[0].Value;
        }
        /// <summary>
        /// 显示所有
        /// </summary>
        /// <param name="PageCount">PageCount</param>
        /// <param name="PageSize">PageSize</param>
        /// <param name="Type">类型(单选/多选/不定项选/判断)</param>
        /// <param name="CourseID">课程ID</param>
        /// <returns></returns>
        public List<Model.TitleList> GetList(int PageCount, int PageSize, string Type, int CourseID)
        {
            string strSql = "";
            string RedCountsql = "";
            int RowTotal = (PageCount - 1) * PageSize;//
            RedCountsql = "(select count(ID) from [TitleList] Where [Type]='" + Type + "' and [CourseID]='" + CourseID + "' ) as RowTotal";
            strSql = "Select Top " + PageSize + " *," + RedCountsql + " FROM [TitleList]  where [ID] not in (Select Top " + RowTotal + " [ID] from [TitleList] Where [Type]='" + Type + "' and [CourseID]='" + CourseID + "' ORDER BY ID DESC) and [Type]='" + Type + "' and [CourseID]='" + CourseID + "' ORDER BY ID DESC";
            List<Model.TitleList> List = new List<Model.TitleList>();
            SqlParameter[] parameters = {
				};
            using (SqlDataReader DR = ExamSys.ExecuteReader(strSql.ToString(), parameters))
            {
                while (DR.Read())
                {
                    Model.TitleList model = new Model.TitleList();
                    model.RowTotal = int.Parse(DR["RowTotal"].ToString());
                    model.ID = int.Parse(DR["ID"].ToString());
                    model.Type = DR["Type"].ToString();
                    model.Title = DR["Title"].ToString();
                    model.T_F = DR["T_F"].ToString();
                    model.CourseID = int.Parse(DR["CourseID"].ToString());
                    model.Extent = DR["Extent"].ToString();
                    List.Add(model);
                }
                DR.Close();
                DR.Dispose();
            }

            return List;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="PageCount"></param>
        /// <param name="PageSize"></param>
        /// <param name="Type"></param>
        /// <returns></returns>
        public List<Model.TitleList> GetList(int PageCount, int PageSize, string Type)
        {
            string strSql = "";
            string RedCountsql = "";
            int RowTotal = (PageCount - 1) * PageSize;//
            RedCountsql = "(select count(ID) from [TitleList] Where [Type]='" + Type + "' ) as RowTotal";
            strSql = "Select Top " + PageSize + " *," + RedCountsql + " FROM [TitleList]  where [ID] not in (Select Top " + RowTotal + " [ID] from [TitleList] Where [Type]='" + Type + "' ORDER BY ID DESC) and [Type]='" + Type + "' ORDER BY ID DESC";
            List<Model.TitleList> List = new List<Model.TitleList>();
            SqlParameter[] parameters = {
				};
            using (SqlDataReader DR = ExamSys.ExecuteReader(strSql.ToString(), parameters))
            {
                while (DR.Read())
                {
                    Model.TitleList model = new Model.TitleList();
                    model.RowTotal = int.Parse(DR["RowTotal"].ToString());
                    model.ID = int.Parse(DR["ID"].ToString());
                    model.Type = DR["Type"].ToString();
                    model.Title = DR["Title"].ToString();
                    model.T_F = DR["T_F"].ToString();
                    model.CourseID = int.Parse(DR["CourseID"].ToString());
                    model.Extent = DR["Extent"].ToString();
                    List.Add(model);
                }
                DR.Close();
                DR.Dispose();
            }

            return List;
        }
        /// <summary>
        /// 详细信息
        /// </summary>
        /// <param name="ID">ID</param>
        /// <returns></returns>
        public List<Model.TitleList> Details(int ID)
        {
            string strSql = "";
            strSql = "Select * FROM [TitleList] Where [ID]='" + ID + "'";
            List<Model.TitleList> List = new List<Model.TitleList>();
            SqlParameter[] parameters = {
                };
            SqlDataReader DR;
            DR = ExamSys.ExecuteReader(strSql.ToString(), parameters);
            using (DR)
            {
                while (DR.Read())
                {
                    Model.TitleList model = new Model.TitleList();
                    model.Title = DR["Title"].ToString();
                    model.T_F = DR["T_F"].ToString();
                    model.Analysis = DR["Analysis"].ToString();
                    model.ID = int.Parse(DR["ID"].ToString());
                    model.CourseID = int.Parse(DR["CourseID"].ToString());
                    model.Status_id = int.Parse(DR["Status_id"].ToString());
                    List.Add(model);
                }
                DR.Close();
                DR.Dispose();
            }
            return List;
        }
        /// <summary>
        /// 显示所有
        /// </summary>
        /// <param name="Type">类型(单选/多选/不定项选/判断)</param>
        /// <param name="CourseID">课程ID</param>
        /// <returns></returns>
        public List<Model.TitleList> GetList(string Type, int CourseID)
        {
            string strSql = "";
            strSql = "Select * FROM [TitleList] Where [Type]='" + Type + "' AND [CourseID]='" + CourseID + "'";
            List<Model.TitleList> List = new List<Model.TitleList>();
            SqlParameter[] parameters = {
                };
            SqlDataReader DR;
            DR = ExamSys.ExecuteReader(strSql.ToString(), parameters);
            using (DR)
            {
                while (DR.Read())
                {
                    Model.TitleList model = new Model.TitleList();
                    model.Title = DR["Title"].ToString();
                    model.T_F = DR["T_F"].ToString();
                    model.Analysis = DR["Analysis"].ToString();
                    model.ID = int.Parse(DR["ID"].ToString());
                    model.Extent = DR["Extent"].ToString();
                    List.Add(model);
                }
                DR.Close();
                DR.Dispose();
            }
            return List;
        }

        /// <summary>
        /// 显示所有
        /// add by wangke 2016-11-23 添加返回datatable类型
        /// </summary>
        /// <param name="Type">类型(单选/多选/不定项选/判断)</param>
        /// <param name="CourseID">课程ID</param>
        /// <returns></returns>
        public DataTable GetList(string Type, int CourseID,int Status_id)
        {
            string strSql = "";
            if (Status_id != 0)
            {
                strSql = "Select * FROM [TitleList] Where [Type]='" + Type + "' AND [CourseID]='" + CourseID + "' AND [Status_id]=" + Status_id;
            }
            else
            {
                strSql = "Select * FROM [TitleList] Where [Type]='" + Type + "' AND [CourseID]='" + CourseID+"'";
            }

            DataTable dt = new DataTable();
            dt.Columns.Add("Title");
            dt.Columns.Add("T_F");
            dt.Columns.Add("Analysis");
            dt.Columns.Add("ID");
            dt.Columns.Add("Extent");

            SqlParameter[] parameters = {
                };
            SqlDataReader DR;
            DR = ExamSys.ExecuteReader(strSql.ToString(), parameters);
            using (DR)
            {
                while (DR.Read())
                {
                    DataRow dr = dt.NewRow();
                    dr["Title"]= DR["Title"].ToString();
                    dr["T_F"] = DR["T_F"].ToString();
                    dr["Analysis"] = DR["Analysis"].ToString();
                    dr["ID"] = DR["ID"].ToString();
                    dr["Extent"] = DR["Extent"].ToString();
                    dt.Rows.Add(dr);
                }
                DR.Close();
                DR.Dispose();
            }
            return dt;
        }

        /// <summary>
        /// 显示所有
        /// </summary>
        /// <param name="Type">类型(单选/多选/不定项选/判断)</param>
        /// <param name="CourseID">课程ID</param>
        /// <param name="Top">条数</param>
        /// <param name="Extent">程度</param>
        /// <returns></returns>
        public List<Model.TitleList> GetList(string Type, int CourseID, int Top, string Extent)
        {
            string strSql = "";
            strSql = "Select TOP " + Top + " * FROM [TitleList] Where [Type]='" + Type + "' AND [CourseID]='" + CourseID + "' AND [Extent]='" + Extent + "' order by newid()";
            List<Model.TitleList> List = new List<Model.TitleList>();
            SqlParameter[] parameters = {
                };
            SqlDataReader DR;
            DR = ExamSys.ExecuteReader(strSql.ToString(), parameters);
            using (DR)
            {
                while (DR.Read())
                {
                    Model.TitleList model = new Model.TitleList();
                    model.Title = DR["Title"].ToString();
                    model.T_F = DR["T_F"].ToString();
                    model.Analysis = DR["Analysis"].ToString();
                    model.ID = int.Parse(DR["ID"].ToString());
                    model.Extent = DR["Extent"].ToString();
                    List.Add(model);
                }
                DR.Close();
                DR.Dispose();
            }
            return List;
        }
        /// <summary>
        /// 显示所有
        /// </summary>
        /// <param name="Type">类型(单选/多选/不定项选/判断)</param>
        /// <param name="CourseID">课程ID</param>
        /// <param name="Extent">程度</param>
        /// <returns></returns>
        public List<Model.TitleList> GetList(string Type, int CourseID, string Extent)
        {
            string strSql = "";
            strSql = "Select * FROM [TitleList] Where [Type]='" + Type + "' AND [CourseID]='" + CourseID + "' AND [Extent]='" + Extent + "'";
            List<Model.TitleList> List = new List<Model.TitleList>();
            SqlParameter[] parameters = {
                };
            SqlDataReader DR;
            DR = ExamSys.ExecuteReader(strSql.ToString(), parameters);
            using (DR)
            {
                while (DR.Read())
                {
                    Model.TitleList model = new Model.TitleList();
                    model.Title = DR["Title"].ToString();
                    model.T_F = DR["T_F"].ToString();
                    model.Analysis = DR["Analysis"].ToString();
                    model.ID = int.Parse(DR["ID"].ToString());
                    model.Extent = DR["Extent"].ToString();
                    List.Add(model);
                }
                DR.Close();
                DR.Dispose();
            }
            return List;
        }
        /// <summary>
        /// 总数
        /// </summary>
        /// <param name="Type">类型(单选/多选/不定项选/判断)</param>
        /// <param name="CourseID">课程ID</param>
        /// <param name="Extent">程度</param>
        /// <returns></returns>
        public int Count(string Type, int CourseID, string Extent)
        {
            DataTable dt = DBUtility.ExamSys.gettb("select count(*) FROM [TitleList] Where [Type]='" + Type + "' AND [CourseID]='" + CourseID + "' AND [Extent]='" + Extent + "'");
            return int.Parse(dt.Rows[0][0].ToString());
        }
        /// <summary>
        /// 显示所有
        /// </summary>
        /// <param name="PageCount">PageCount</param>
        /// <param name="PageSize">PageSize</param>
        /// <param name="Type">类型(单选/多选/不定项选/判断)</param>
        /// <param name="CourseID">课程ID</param>
        /// <param name="Extent">程度</param>
        /// <returns></returns>
        public List<Model.TitleList> GetList(int PageCount, int PageSize, string Type, int CourseID, string Extent)
        {
            string strSql = "";
            string RedCountsql = "";
            int RowTotal = (PageCount - 1) * PageSize;//
            RedCountsql = "(select count(ID) from [TitleList] Where [Type]='" + Type + "' and [CourseID]='" + CourseID + "' and [Extent]='" + Extent + "' ) as RowTotal";
            strSql = "Select Top " + PageSize + " *," + RedCountsql + " FROM [TitleList]  where [ID] not in (Select Top " + RowTotal + " [ID] from [TitleList] Where [Type]='" + Type + "' and [CourseID]='" + CourseID + "' and [Extent]='" + Extent + "' ORDER BY ID DESC) and [Type]='" + Type + "' and [CourseID]='" + CourseID + "' and [Extent]='" + Extent + "' ORDER BY ID DESC";
            List<Model.TitleList> List = new List<Model.TitleList>();
            SqlParameter[] parameters = {
				};
            using (SqlDataReader DR = ExamSys.ExecuteReader(strSql.ToString(), parameters))
            {
                while (DR.Read())
                {
                    Model.TitleList model = new Model.TitleList();
                    model.RowTotal = int.Parse(DR["RowTotal"].ToString());
                    model.ID = int.Parse(DR["ID"].ToString());
                    model.Type = DR["Type"].ToString();
                    model.Title = DR["Title"].ToString();
                    model.T_F = DR["T_F"].ToString();
                    model.CourseID = int.Parse(DR["CourseID"].ToString());
                    model.Extent = DR["Extent"].ToString();
                    List.Add(model);
                }
                DR.Close();
                DR.Dispose();
            }

            return List;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="PageCount"></param>
        /// <param name="PageSize"></param>
        /// <param name="Type"></param>
        /// <param name="Extent"></param>
        /// <returns></returns>
        public List<Model.TitleList> GetList(int PageCount, int PageSize, string Type, string Extent)
        {
            string strSql = "";
            string RedCountsql = "";
            int RowTotal = (PageCount - 1) * PageSize;//
            RedCountsql = "(select count(ID) from [TitleList] Where [Type]='" + Type + "' and [Extent]='" + Extent + "' ) as RowTotal";
            strSql = "Select Top " + PageSize + " *," + RedCountsql + " FROM [TitleList]  where [ID] not in (Select Top " + RowTotal + " [ID] from [TitleList] Where [Type]='" + Type + "' and [Extent]='" + Extent + "' ORDER BY ID DESC) and [Type]='" + Type + "' and [Extent]='" + Extent + "' ORDER BY ID DESC";
            List<Model.TitleList> List = new List<Model.TitleList>();
            SqlParameter[] parameters = {
				};
            using (SqlDataReader DR = ExamSys.ExecuteReader(strSql.ToString(), parameters))
            {
                while (DR.Read())
                {
                    Model.TitleList model = new Model.TitleList();
                    model.RowTotal = int.Parse(DR["RowTotal"].ToString());
                    model.ID = int.Parse(DR["ID"].ToString());
                    model.Type = DR["Type"].ToString();
                    model.Title = DR["Title"].ToString();
                    model.T_F = DR["T_F"].ToString();
                    model.CourseID = int.Parse(DR["CourseID"].ToString());
                    model.Extent = DR["Extent"].ToString();
                    List.Add(model);
                }
                DR.Close();
                DR.Dispose();
            }

            return List;
        }
    }
}
