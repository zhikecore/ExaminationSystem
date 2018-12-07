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
    /// 数据库
    /// </summary>
    public class Db
    {
        /// <summary>
        /// 添加
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Add(Model.Db model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
                new SqlParameter("@ReturnValue", SqlDbType.Int),
                new SqlParameter("@Server",SqlDbType.NVarChar,500),
                new SqlParameter("@Database",SqlDbType.NVarChar,500),
                new SqlParameter("@Password",SqlDbType.NVarChar,500),
                new SqlParameter("@Instance",SqlDbType.NVarChar,500),
                new SqlParameter("@Port",SqlDbType.NVarChar,500),
                new SqlParameter("@User",SqlDbType.NVarChar,500),
                new SqlParameter("@Key",SqlDbType.NVarChar,500),
            };
            parameters[0].Direction = ParameterDirection.Output;
            parameters[1].Value = model.Server;
            parameters[2].Value = model.Database;
            parameters[3].Value = model.Password;
            parameters[4].Value = model.Instance;
            parameters[5].Value = model.Port;
            parameters[6].Value = model.User;
            parameters[7].Value = model.Key;
            ExamSys.RunProcedure("Db_Add", parameters, out rowsAffected);
            return (int)parameters[0].Value;
        }
        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Updata(Model.Db model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
                new SqlParameter("@ReturnValue", SqlDbType.Int),
                new SqlParameter("@Server",SqlDbType.NVarChar,500),
                new SqlParameter("@Database",SqlDbType.NVarChar,500),
                new SqlParameter("@Password",SqlDbType.NVarChar,500),
                new SqlParameter("@Instance",SqlDbType.NVarChar,500),
                new SqlParameter("@Port",SqlDbType.NVarChar,500),
                new SqlParameter("@User",SqlDbType.NVarChar,500),
                new SqlParameter("@Key",SqlDbType.NVarChar,500),
            };
            parameters[0].Direction = ParameterDirection.Output;
            parameters[1].Value = model.Server;
            parameters[2].Value = model.Database;
            parameters[3].Value = model.Password;
            parameters[4].Value = model.Instance;
            parameters[5].Value = model.Port;
            parameters[6].Value = model.User;
            parameters[7].Value = model.Key;
            ExamSys.RunProcedure("Db_Updata", parameters, out rowsAffected);
            return (int)parameters[0].Value;
        }
        /// <summary>
        /// 查询所有
        /// </summary>
        /// <returns></returns>
        public List<Model.Db> GetList()
        {
            string strSql = "";
            strSql = "Select * FROM Db";
            List<Model.Db> List = new List<Model.Db>();
            SqlParameter[] parameters = {
				};
            using (SqlDataReader DR = ExamSys.ExecuteReader(strSql.ToString(), parameters))
            {
                while (DR.Read())
                {
                    Model.Db model = new Model.Db();
                    model.Server = DR["Server"].ToString();
                    model.Database = DR["Database"].ToString();
                    model.Password = DR["Password"].ToString();
                    model.Instance = DR["Instance"].ToString();
                    model.Port = DR["Port"].ToString();
                    model.User = DR["User"].ToString();
                    model.Key = DR["Key"].ToString();
                    List.Add(model);
                }
                DR.Close();
                DR.Dispose();
            }
            return List;
        }
        /// <summary>
        /// 查询所有
        /// </summary>
        /// <param name="Key">标识</param>
        /// <returns></returns>
        public List<Model.Db> GetList(string Key)
        {
            string strSql = "";
            strSql = "Select * FROM Db where [Key]='" + Key + "'";
            List<Model.Db> List = new List<Model.Db>();
            SqlParameter[] parameters = {
				};
            using (SqlDataReader DR = ExamSys.ExecuteReader(strSql.ToString(), parameters))
            {
                while (DR.Read())
                {
                    Model.Db model = new Model.Db();
                    model.Server = DR["Server"].ToString();
                    model.Database = DR["Database"].ToString();
                    model.Password = DR["Password"].ToString();
                    model.Instance = DR["Instance"].ToString();
                    model.Port = DR["Port"].ToString();
                    model.User = DR["User"].ToString();
                    model.Key = DR["Key"].ToString();
                    List.Add(model);
                }
                DR.Close();
                DR.Dispose();
            }
            return List;
        }
    }
}
