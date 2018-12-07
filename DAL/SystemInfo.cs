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
    /// 系统信息
    /// </summary>
    public class SystemInfo
    {
        /// <summary>
        /// 添加
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Add(Model.SystemInfo model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
                new SqlParameter("@ReturnValue", SqlDbType.Int),
                new SqlParameter("@HardInfo",SqlDbType.NVarChar,500),
                new SqlParameter("@UserSys",SqlDbType.NVarChar,500),
                new SqlParameter("@CourseSys",SqlDbType.NVarChar,500),
                new SqlParameter("@sPassword",SqlDbType.NVarChar,500),
                new SqlParameter("@Updata",SqlDbType.NVarChar,500),
                new SqlParameter("@UpdataUserSys",SqlDbType.NVarChar,500),
                new SqlParameter("@UpdataCourseSys",SqlDbType.NVarChar,500),
                new SqlParameter("@UpdataHardInfo",SqlDbType.NVarChar,500),
                new SqlParameter("@SN",SqlDbType.NVarChar,500),
                new SqlParameter("@UpdataSN",SqlDbType.NVarChar,500),
            };
            parameters[0].Direction = ParameterDirection.Output;
            parameters[1].Value = model.HardInfo;
            parameters[2].Value = model.UserSys;
            parameters[3].Value = model.CourseSys;
            parameters[4].Value = model.sPassword;
            parameters[5].Value = model.Updata;
            parameters[6].Value = model.UpdataUserSys;
            parameters[7].Value = model.UpdataCourseSys;
            parameters[8].Value = model.UpdataHardInfo;
            parameters[9].Value = model.SN;
            parameters[10].Value = model.UpdataSN;
            ExamSys.RunProcedure("SystemInfo_Add", parameters, out rowsAffected);
            return (int)parameters[0].Value;
        }
        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Updata(Model.SystemInfo model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
                new SqlParameter("@ReturnValue", SqlDbType.Int),
                new SqlParameter("@HardInfo",SqlDbType.NVarChar,500),
                new SqlParameter("@UserSys",SqlDbType.NVarChar,500),
                new SqlParameter("@CourseSys",SqlDbType.NVarChar,500),
                new SqlParameter("@sPassword",SqlDbType.NVarChar,500),
                new SqlParameter("@Updata",SqlDbType.NVarChar,500),
                new SqlParameter("@UpdataUserSys",SqlDbType.NVarChar,500),
                new SqlParameter("@UpdataCourseSys",SqlDbType.NVarChar,500),
                new SqlParameter("@UpdataHardInfo",SqlDbType.NVarChar,500),
                new SqlParameter("@SN",SqlDbType.NVarChar,500),
                new SqlParameter("@UpdataSN",SqlDbType.NVarChar,500),
            };
            parameters[0].Direction = ParameterDirection.Output;
            parameters[1].Value = model.HardInfo;
            parameters[2].Value = model.UserSys;
            parameters[3].Value = model.CourseSys;
            parameters[4].Value = model.sPassword;
            parameters[5].Value = model.Updata;
            parameters[6].Value = model.UpdataUserSys;
            parameters[7].Value = model.UpdataCourseSys;
            parameters[8].Value = model.UpdataHardInfo;
            parameters[9].Value = model.SN;
            parameters[10].Value = model.UpdataSN;
            ExamSys.RunProcedure("SystemInfo_Updata", parameters, out rowsAffected);
            return (int)parameters[0].Value;
        }
        /// <summary>
        /// 查询所有
        /// </summary>
        /// <returns></returns>
        public List<Model.SystemInfo> GetList()
        {
            string strSql = "";
            strSql = "Select * FROM SystemInfo";
            List<Model.SystemInfo> List = new List<Model.SystemInfo>();
            SqlParameter[] parameters = {
				};
            using (SqlDataReader DR = ExamSys.ExecuteReader(strSql.ToString(), parameters))
            {
                while (DR.Read())
                {
                    Model.SystemInfo model = new Model.SystemInfo();
                    model.CourseSys = DR["CourseSys"].ToString();
                    model.HardInfo = DR["HardInfo"].ToString();
                    model.SN = DR["SN"].ToString();
                    model.sPassword = DR["sPassword"].ToString();
                    model.Updata = DR["Updata"].ToString();
                    model.UpdataCourseSys = DR["UpdataCourseSys"].ToString();
                    model.UpdataHardInfo = DR["UpdataHardInfo"].ToString();
                    model.UpdataSN = DR["UpdataSN"].ToString();
                    model.UpdataUserSys = DR["UpdataUserSys"].ToString();
                    model.UserSys = DR["UserSys"].ToString();
                    List.Add(model);
                }
                DR.Close();
                DR.Dispose();
            }
            return List;
        }
    }
}
