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
    /// 硬件信息
    /// </summary>
    public class HardInfo
    {
        /// <summary>
        /// 添加
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Add(Model.HardInfo model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
                new SqlParameter("@ReturnValue", SqlDbType.Int),
                new SqlParameter("@HostName",SqlDbType.NVarChar,500),
                new SqlParameter("@CpuID",SqlDbType.NVarChar,500),
                new SqlParameter("@HardDiskID",SqlDbType.NVarChar,500),
                new SqlParameter("@NetCardMAC",SqlDbType.NVarChar,500),
                new SqlParameter("@VolOf",SqlDbType.NVarChar,500),
                new SqlParameter("@NetCardIP",SqlDbType.NVarChar,500),
            };
            parameters[0].Direction = ParameterDirection.Output;
            parameters[1].Value = model.HostName;
            parameters[2].Value = model.CpuID;
            parameters[3].Value = model.HardDiskID;
            parameters[4].Value = model.NetCardMAC;
            parameters[5].Value = model.VolOf;
            parameters[6].Value = model.NetCardIP;
            ExamSys.RunProcedure("HardInfo_Add", parameters, out rowsAffected);
            return (int)parameters[0].Value;
        }
        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public int Updata(Model.HardInfo model)
        {
            int rowsAffected;
            SqlParameter[] parameters = {
                new SqlParameter("@ReturnValue", SqlDbType.Int),
                new SqlParameter("@HostName",SqlDbType.NVarChar,500),
                new SqlParameter("@CpuID",SqlDbType.NVarChar,500),
                new SqlParameter("@HardDiskID",SqlDbType.NVarChar,500),
                new SqlParameter("@NetCardMAC",SqlDbType.NVarChar,500),
                new SqlParameter("@VolOf",SqlDbType.NVarChar,500),
                new SqlParameter("@NetCardIP",SqlDbType.NVarChar,500),
            };
            parameters[0].Direction = ParameterDirection.Output;
            parameters[1].Value = model.HostName;
            parameters[2].Value = model.CpuID;
            parameters[3].Value = model.HardDiskID;
            parameters[4].Value = model.NetCardMAC;
            parameters[5].Value = model.VolOf;
            parameters[6].Value = model.NetCardIP;
            ExamSys.RunProcedure("HardInfo_Updata", parameters, out rowsAffected);
            return (int)parameters[0].Value;
        }
        /// <summary>
        /// 查询所有
        /// </summary>
        /// <returns></returns>
        public List<Model.HardInfo> GetList()
        {
            string strSql = "";
            strSql = "Select * FROM HardInfo";
            List<Model.HardInfo> List = new List<Model.HardInfo>();
            SqlParameter[] parameters = {
				};
            using (SqlDataReader DR = ExamSys.ExecuteReader(strSql.ToString(), parameters))
            {
                while (DR.Read())
                {
                    Model.HardInfo model = new Model.HardInfo();
                    model.HostName = DR["HostName"].ToString();
                    model.CpuID = DR["CpuID"].ToString();
                    model.HardDiskID = DR["HardDiskID"].ToString();
                    model.NetCardMAC = DR["NetCardMAC"].ToString();
                    model.NetCardIP = DR["NetCardIP"].ToString();
                    model.VolOf = DR["VolOf"].ToString();
                    List.Add(model);
                }
                DR.Close();
                DR.Dispose();
            }
            return List;
        }
    }
}
