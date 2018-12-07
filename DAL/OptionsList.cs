using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBUtility;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    /// <summary>
    /// 选择表
    /// </summary>
    public class OptionsList
    {
        /// <summary>
        /// 添加
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Add(Model.OptionsList model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
                new SqlParameter("@ReturnValue", SqlDbType.Int),
                new SqlParameter("@TitleListID", SqlDbType.Int),
                new SqlParameter("@Name",SqlDbType.NVarChar,500),
                new SqlParameter("@T_F",SqlDbType.NVarChar,50),
            };
            parameters[0].Direction = ParameterDirection.Output;
            parameters[1].Value = model.TitleListID;
            parameters[2].Value = model.Name;
            parameters[3].Value = model.T_F;
            ExamSys.RunProcedure("OptionsList_Add", parameters, out rowsAffected);
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
            ExamSys.RunProcedure("OptionsList_Del", parameters, out rowsAffected);
            return (int)parameters[0].Value;
        }
        /// <summary>
        /// 删除TitleListID
        /// </summary>
        /// <param name="ID">所属题目ID</param>
        /// <returns></returns>
        public int Del_TitleListID(int ID)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
                new SqlParameter("@ReturnValue", SqlDbType.Int),
                new SqlParameter("@ID",SqlDbType.Int),
            };
            parameters[0].Direction = ParameterDirection.Output;
            parameters[1].Value = ID;
            ExamSys.RunProcedure("OptionsList_Del_TitleListID", parameters, out rowsAffected);
            return (int)parameters[0].Value;
        }
        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Updata(Model.OptionsList model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
                new SqlParameter("@ReturnValue", SqlDbType.Int),
                new SqlParameter("@TitleListID", SqlDbType.Int),
                new SqlParameter("@Name",SqlDbType.NVarChar,500),
                new SqlParameter("@T_F",SqlDbType.NVarChar,50),
                new SqlParameter("@ID", SqlDbType.Int),
            };
            parameters[0].Direction = ParameterDirection.Output;
            parameters[1].Value = model.TitleListID;
            parameters[2].Value = model.Name;
            parameters[3].Value = model.T_F;
            parameters[4].Value = model.ID;
            ExamSys.RunProcedure("OptionsList_Updata", parameters, out rowsAffected);
            return (int)parameters[0].Value;
        }
        /// <summary>
        /// 详细信息
        /// </summary>
        /// <param name="TitleListID">题目ID</param>
        /// <returns></returns>
        public List<Model.OptionsList> Details(int TitleListID)
        {
            string strSql = "";
            strSql = "Select * FROM [OptionsList] Where [TitleListID]='" + TitleListID + "'";
            List<Model.OptionsList> List = new List<Model.OptionsList>();
            SqlParameter[] parameters = {
                };
            SqlDataReader DR;
                DR = ExamSys.ExecuteReader(strSql.ToString(), parameters);
            using (DR)
            {
                while (DR.Read())
                {
                    Model.OptionsList model = new Model.OptionsList();
                    model.Name = DR["Name"].ToString();
                    model.T_F = DR["T_F"].ToString();
                    model.ID = int.Parse(DR["ID"].ToString());
                    List.Add(model);
                }
                DR.Close();
                DR.Dispose();
            }
            return List;
        }
    }
}
