using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using DBUtility;
using System.Data;

namespace DAL
{
    /// <summary>
    /// 试卷表
    /// </summary>
    public class Papers
    {
        /// <summary>
        /// 添加
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Add(Model.Papers model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
                new SqlParameter("@ReturnValue", SqlDbType.Int),
                new SqlParameter("@Name", SqlDbType.NVarChar,50),
                new SqlParameter("@Type", SqlDbType.NVarChar,50),
                new SqlParameter("@CourseID", SqlDbType.Int),
            };
            parameters[0].Direction = ParameterDirection.Output;
            parameters[1].Value = model.Name;
            parameters[2].Value = model.Type;
            parameters[3].Value = model.CourseID;
            ExamSys.RunProcedure("Papers_Add", parameters, out rowsAffected);
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
            ExamSys.RunProcedure("Papers_Del", parameters, out rowsAffected);
            return (int)parameters[0].Value;
        }
        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Updata(Model.Papers model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
                new SqlParameter("@ReturnValue", SqlDbType.Int),
                new SqlParameter("@Lock", SqlDbType.Int),
                new SqlParameter("@Name",SqlDbType.NVarChar,50),
                new SqlParameter("@ID", SqlDbType.Int),
            };
            parameters[0].Direction = ParameterDirection.Output;
            parameters[1].Value = model.Lock;
            parameters[2].Value = model.Name;
            parameters[3].Value = model.ID;
            ExamSys.RunProcedure("Papers_Updata", parameters, out rowsAffected);
            return (int)parameters[0].Value;
        }
        /// <summary>
        /// 显示所有
        /// </summary>
        /// <param name="PageCount">PageCount</param>
        /// <param name="PageSize">PageSize</param>
        /// <param name="Type">类型(试卷?问卷)</param>
        /// <param name="CourseID">课程ID</param>
        /// <returns></returns>
        public List<Model.Papers> GetList(int PageCount, int PageSize, string Type, int CourseID)
        {
            string strSql = "";
            string RedCountsql = "";
            int RowTotal = (PageCount - 1) * PageSize;//
            RedCountsql = "(select count(ID) from [Papers] Where [CourseID]='" + CourseID + "' and [Type]='"+Type+"' ) as RowTotal";
            strSql = "Select Top " + PageSize + " *," + RedCountsql + " FROM [Papers]  where [ID] not in (Select Top " + RowTotal + " [ID] from [Papers] Where [CourseID]='" + CourseID + "' and [Type]='" + Type + "' ORDER BY ID DESC) and [CourseID]='" + CourseID + "' and [Type]='" + Type + "' ORDER BY ID DESC";
            List<Model.Papers> List = new List<Model.Papers>();
            SqlParameter[] parameters = {
				};
            using (SqlDataReader DR = ExamSys.ExecuteReader(strSql.ToString(), parameters))
            {
                while (DR.Read())
                {
                    Model.Papers model = new Model.Papers();
                    model.RowTotal = int.Parse(DR["RowTotal"].ToString());
                    model.ID = int.Parse(DR["ID"].ToString());
                    model.Name = DR["Name"].ToString();
                    model.CourseID = int.Parse(DR["CourseID"].ToString());
                    model.Type = DR["Type"].ToString();
                    model.Lock = int.Parse(DR["Lock"].ToString());
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
        /// <returns></returns>
        public DataSet GetList(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select ID,Name,Type ");
            strSql.Append(" FROM Papers ");
            SqlParameter[] parameters = {
                };
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            return ExamSys.Query(strSql.ToString());
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="PageCount"></param>
        /// <param name="PageSize"></param>
        /// <param name="Type"></param>
        /// <returns></returns>
        public List<Model.Papers> GetList(int PageCount, int PageSize, string Type)
        {
            string strSql = "";
            string RedCountsql = "";
            int RowTotal = (PageCount - 1) * PageSize;//
            RedCountsql = "(select count(ID) from [Papers] Where [Type]='" + Type + "' ) as RowTotal";
            strSql = "Select Top " + PageSize + " *," + RedCountsql + " FROM [Papers]  where [ID] not in (Select Top " + RowTotal + " [ID] from [Papers] Where [Type]='" + Type + "' ORDER BY ID DESC) and [Type]='" + Type + "' ORDER BY ID DESC";
            List<Model.Papers> List = new List<Model.Papers>();
            SqlParameter[] parameters = {
				};
            using (SqlDataReader DR = ExamSys.ExecuteReader(strSql.ToString(), parameters))
            {
                while (DR.Read())
                {
                    Model.Papers model = new Model.Papers();
                    model.RowTotal = int.Parse(DR["RowTotal"].ToString());
                    model.ID = int.Parse(DR["ID"].ToString());
                    model.Name = DR["Name"].ToString();
                    model.CourseID = int.Parse(DR["CourseID"].ToString());
                    model.Type = DR["Type"].ToString();
                    model.Lock = int.Parse(DR["Lock"].ToString());
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
        public List<Model.Papers> Details(int ID)
        {
            string strSql = "";
            strSql = "Select * FROM [Papers] Where [ID]='" + ID + "'";
            List<Model.Papers> List = new List<Model.Papers>();
            SqlParameter[] parameters = {
                };
            SqlDataReader DR;
            DR = ExamSys.ExecuteReader(strSql.ToString(), parameters);
            using (DR)
            {
                while (DR.Read())
                {
                    Model.Papers model = new Model.Papers();
                    model.ID = int.Parse(DR["ID"].ToString());
                    model.Name = DR["Name"].ToString();
                    model.CourseID = int.Parse(DR["CourseID"].ToString());
                    model.Type = DR["Type"].ToString();
                    model.Lock = int.Parse(DR["Lock"].ToString());
                    List.Add(model);
                }
                DR.Close();
                DR.Dispose();
            }
            return List;
        }
    }
}
