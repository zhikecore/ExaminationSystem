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
    /// 试卷选项表
    /// </summary>
    public class PapersOptionsList
    {
        /// <summary>
        /// 添加
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Add(Model.PapersOptionsList model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
                new SqlParameter("@ReturnValue", SqlDbType.Int),
                new SqlParameter("@TitleListID", SqlDbType.Int),
                new SqlParameter("@Name",SqlDbType.NVarChar,500),
                new SqlParameter("@T_F",SqlDbType.NVarChar,50),
                new SqlParameter("@ID", SqlDbType.Int),
                new SqlParameter("@PapersID", SqlDbType.Int),
                new SqlParameter("@Score", SqlDbType.Int),
            };
            parameters[0].Direction = ParameterDirection.Output;
            parameters[1].Value = model.TitleListID;
            parameters[2].Value = model.Name;
            parameters[3].Value = model.T_F;
            parameters[4].Value = model.ID;
            parameters[5].Value = model.PapersID;
            parameters[6].Value = model.Score;
            ExamSys.RunProcedure("PapersOptionsList_Add", parameters, out rowsAffected);
            return (int)parameters[0].Value;
        }
        /// <summary>
        /// 显示所有
        /// </summary>
        /// <param name="TitleListID">题目ID</param>
        /// <returns></returns>
        public List<Model.PapersOptionsList> GetList(int TitleListID, int PapersID)
        {
            string strSql = "";
            //strSql = "Select * FROM [PapersOptionsList] Where [TitleListID]='" + TitleListID + "' and [PapersID]='" + PapersID + "' order by newid()";

            strSql = "Select * FROM [PapersOptionsList] Where [TitleListID]='" + TitleListID + "' and [PapersID]='" + PapersID + "' order by ID";
            List<Model.PapersOptionsList> List = new List<Model.PapersOptionsList>();
            SqlParameter[] parameters = {
                };
            SqlDataReader DR;
            DR = ExamSys.ExecuteReader(strSql.ToString(), parameters);
            using (DR)
            {
                while (DR.Read())
                {
                    Model.PapersOptionsList model = new Model.PapersOptionsList();
                    model.Name = DR["Name"].ToString();
                    model.T_F = DR["T_F"].ToString();
                    model.PapersID = int.Parse(DR["PapersID"].ToString());
                    model.TitleListID = int.Parse(DR["TitleListID"].ToString());
                    model.ID = int.Parse(DR["ID"].ToString());
                    model.Score = int.Parse(DR["Score"].ToString());
                    List.Add(model);
                }
                DR.Close();
                DR.Dispose();
            }
            return List;
        }
    }
}
