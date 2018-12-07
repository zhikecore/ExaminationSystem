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
    /// add by wangke 2016-11-23 出题类别
    /// </summary>
    public class Status
    {

        /// <summary>
        /// 获取所有列表
        /// </summary>
        /// <returns></returns>
        public List<Model.Status> GetList(string Ys_Code)
        {
            string strSql = "";
            strSql = "Select * FROM [Status] WHERE [YS_TYPE]='" + Ys_Code + "'";
            List<Model.Status> List = new List<Model.Status>();
            SqlParameter[] parameters = {
                };
            using (SqlDataReader DR = ExamSys.ExecuteReader(strSql.ToString(), parameters))
            {
                while (DR.Read())
                {
                    Model.Status model = new Model.Status();
                    model.YS_ID = int.Parse(DR["YS_ID"].ToString());
                    model.YS_CODE = DR["YS_CODE"].ToString();
                    model.YS_DESC = DR["YS_DESC"].ToString();
                    model.YS_SEQ = int.Parse(DR["YS_SEQ"].ToString());
                    List.Add(model);
                }
                DR.Close();
                DR.Dispose();
            }

            return List;
        }

        /// <summary>
        /// 返回题目类别
        /// </summary>
        /// <returns></returns>
        public List<Model.Status> GetCategory()
        {
            string strSql = "";
            strSql = "Select YS_TYPE,YS_REMARK FROM [Status] GROUP BY YS_TYPE,YS_REMARK";
            List<Model.Status> List = new List<Model.Status>();
            SqlParameter[] parameters = {
                };
            using (SqlDataReader DR = ExamSys.ExecuteReader(strSql.ToString(), parameters))
            {
                while (DR.Read())
                {
                    Model.Status model = new Model.Status();
                    model.YS_TYPE = DR["YS_TYPE"].ToString();
                    model.YS_REMARK = DR["YS_REMARK"].ToString();
                    List.Add(model);
                }
                DR.Close();
                DR.Dispose();
            }

            return List;
        }

        /// <summary>
		/// 获得数据列表
		/// </summary>
		public DataTable GetStatusList(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select YS_CODE,YS_DESC,YS_TYPE,YS_REMARK,YS_SEQ,YS_ID ");
            strSql.Append(" FROM Status ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            List<Model.Status> List = new List<Model.Status>();
            SqlParameter[] parameters = {
                };
            DataTable dt = ExamSys.Query(strSql.ToString(), parameters).Tables[0];
            return dt;
        }
    }
}
