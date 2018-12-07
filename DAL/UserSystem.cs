using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using DBUtility;

namespace DAL
{
    /// <summary>
    /// 用户系统
    /// </summary>
    public class UserSystem
    {   
        /// <summary>
        /// 取得用户系统的安装信息(是否外部)
        /// </summary>
        /// <returns></returns>
        private bool GetUserSysSetupInfo()
        {
            DAL.SystemInfo dal = new SystemInfo();
            List<Model.SystemInfo> list = new List<Model.SystemInfo>();
            list = dal.GetList();
            if (list.Count > 0)
            {
                string ii = "48,";//0
                for (int i = 0; i < list.Count; i++)
                {
                    ii = list[i].UserSys;
                }
                if (ii == "49,")//1
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// 查询所有
        /// </summary>
        /// <returns></returns>
        public List<Model.UserSystem> GetList(int PageCount, int PageSize)
        {
            string strSql = "";
            string RedCountsql = "";
            int RowTotal = (PageCount - 1) * PageSize;//
            RedCountsql = "(select count(TR_ID) from [AP_TRAINEE_USER]) as RowTotal";
            strSql = "Select Top " + PageSize + " [TR_ID],[TR_POSITION],[TR_NICKNAME],[TR_NAME],[TR_SEX],[TR_CITY],[TR_PHONE],[TR_EMAIL],[TR_COMPANY_TEL],[TR_QR_CODE]," + RedCountsql + " FROM AP_TRAINEE_USER  where [TR_ID] not in (Select Top " + RowTotal + " [TR_ID] from AP_TRAINEE_USER ORDER BY TR_ID DESC) ORDER BY TR_ID DESC";
            List<Model.UserSystem> List = new List<Model.UserSystem>();
            SqlParameter[] parameters = {
				};
            SqlDataReader DR;

            if (GetUserSysSetupInfo())
            {
                DR = UserSys.ExecuteReader(strSql.ToString(), parameters);
            }
            else
            {
                DR = ExamSys.ExecuteReader(strSql.ToString(), parameters);
            }

            using (DR)
            {
                while (DR.Read())
                {
                    Model.UserSystem model = new Model.UserSystem();
                    model.ID = int.Parse(DR["TR_ID"].ToString());
                    model.cnName = DR["TR_NAME"].ToString();
                    model.enName = DR["TR_NICKNAME"].ToString();
                    model.Sex = DR["TR_SEX"].ToString();
                    model.ZipCode = DR["TR_QR_CODE"].ToString();
                    model.Address = DR["TR_CITY"].ToString();
                    model.Mobile = DR["TR_COMPANY_TEL"].ToString();
                    model.Phone = DR["TR_PHONE"].ToString();
                    model.Email = DR["TR_EMAIL"].ToString();
                    model.RowTotal = int.Parse(DR["RowTotal"].ToString());
                    List.Add(model);
                }
                DR.Close();
                DR.Dispose();
            }
            return List;
        }
        /// <summary>
        /// 显示详细
        /// </summary>
        /// <param name="ID">ID</param>
        /// <returns></returns>
        public List<Model.UserSystem> Details(int ID)
        {
            string strSql = "";
            strSql = "Select * FROM [AP_TRAINEE_USER] WHERE [TR_ID]='" + ID+"'";
            List<Model.UserSystem> List = new List<Model.UserSystem>();
            SqlParameter[] parameters = {
				};
            SqlDataReader DR;

            if (GetUserSysSetupInfo())
            {
                DR = UserSys.ExecuteReader(strSql.ToString(), parameters);
            }
            else
            {
                DR = ExamSys.ExecuteReader(strSql.ToString(), parameters);
            }

            using (DR)
            {
                while (DR.Read())
                {
                    Model.UserSystem model = new Model.UserSystem();
                    model.ID = int.Parse(DR["TR_ID"].ToString());
                    model.cnName = DR["TR_NAME"].ToString();
                    model.enName = DR["TR_NICKNAME"].ToString();
                    model.Sex = DR["TR_SEX"].ToString();
                    model.ZipCode = DR["TR_QR_CODE"].ToString();
                    model.Address = DR["TR_CITY"].ToString();
                    model.Mobile = DR["TR_COMPANY_TEL"].ToString();
                    model.Phone = DR["TR_PHONE"].ToString();
                    model.Email = DR["TR_EMAIL"].ToString();
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
        /// <param name="UserName">用户名(可中可英)</param>
        /// <returns></returns>
        public List<Model.UserSystem> GetList(string UserName)
        {
            string strSql = "";
            strSql = "Select * FROM [AP_TRAINEE_USER] Where [TR_NAME] like '%" + UserName+ "%' or [TR_NICKNAME] like '%" + UserName+"%'";
            List<Model.UserSystem> List = new List<Model.UserSystem>();
            SqlParameter[] parameters = {
				};
            SqlDataReader DR;

            if (GetUserSysSetupInfo())
            {
                DR = UserSys.ExecuteReader(strSql.ToString(), parameters);
            }
            else
            {
                DR = ExamSys.ExecuteReader(strSql.ToString(), parameters);
            }

            using (DR)
            {
                while (DR.Read())
                {
                    Model.UserSystem model = new Model.UserSystem();
                    model.ID = int.Parse(DR["TR_ID"].ToString());
                    model.cnName = DR["TR_NAME"].ToString();
                    model.enName = DR["TR_NICKNAME"].ToString();
                    model.Sex = DR["TR_SEX"].ToString();
                    model.ZipCode = DR["TR_QR_CODE"].ToString();
                    model.Address = DR["TR_CITY"].ToString();
                    model.Mobile = DR["TR_COMPANY_TEL"].ToString();
                    model.Phone = DR["TR_PHONE"].ToString();
                    model.Email = DR["TR_EMAIL"].ToString();
                    List.Add(model);
                }
                DR.Close();
                DR.Dispose();
            }
            return List;
        }
    }
}
