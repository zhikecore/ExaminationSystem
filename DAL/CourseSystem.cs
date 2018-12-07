using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using DBUtility;

namespace DAL
{
    /// <summary>
    /// 课程体系
    /// </summary>
    public class CourseSystem
    {
        /// <summary>
        /// 取得课程系统的安装信息(是否外部)
        /// </summary>
        /// <returns></returns>
        private bool GetCourseSysSetupInfo()
        {
            DAL.SystemInfo dal = new SystemInfo();
            List<Model.SystemInfo> list = new List<Model.SystemInfo>();
            list = dal.GetList();
            if (list.Count > 0)
            {
                string ii = "48,";//0
                for (int i = 0; i < list.Count; i++)
                {
                    ii = list[i].CourseSys;
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
        public List<Model.CourseSystem> GetList()
        {
            string strSql = "";
            strSql = "Select * FROM [AP_COURSE_CATEGORY]";
            List<Model.CourseSystem> List = new List<Model.CourseSystem>();
            SqlParameter[] parameters = {
				};
            SqlDataReader DR;

            if (GetCourseSysSetupInfo())
            {
                DR = CourseSys.ExecuteReader(strSql.ToString(), parameters);
            }
            else
            {
                DR = ExamSys.ExecuteReader(strSql.ToString(), parameters);
            }

            using (DR)
            {
                while (DR.Read())
                {
                    Model.CourseSystem model = new Model.CourseSystem();
                    model.CourseLbID = int.Parse(DR["CRC_ID"].ToString());
                    model.Name = DR["CRC_CATEGORY_NAME"].ToString();
                    model.Up = int.Parse(DR["CRC_PARENT_ID"].ToString());
                    model.CourseCount = GetCourseCount(int.Parse(DR["CRC_ID"].ToString()));
                    //model.CourseCount = 1;
                    List.Add(model);
                }
                DR.Close();
                DR.Dispose();
            }
            return List;
        }

        /// <summary>
        /// 取得课程数
        /// </summary>
        /// <returns></returns>
        public int GetCourseCount(int CRC_ID)
        {
            string strSql = "";
            strSql = "Select * FROM [AP_COURSE] where CR_CATEGORY_ID='" + CRC_ID +"'";
            SqlParameter[] parameters = {
                };
            int count = CourseSys.ExecuteCount(strSql, parameters);
            return count;
        }

        /// <summary>
        /// 取得课程体系名称
        /// </summary>
        /// <param name="CourseLbID">课程体系ID</param>
        /// <returns></returns>
        public List<Model.CourseSystem> GetList(int CourseLbID)
        {
            string strSql = "";
            strSql = "Select * FROM [AP_COURSE_CATEGORY] where [CRC_ID]='" + CourseLbID + "'";
            List<Model.CourseSystem> List = new List<Model.CourseSystem>();
            SqlParameter[] parameters = {
				};
            SqlDataReader DR;

            if (GetCourseSysSetupInfo())
            {
                DR = CourseSys.ExecuteReader(strSql.ToString(), parameters);
            }
            else
            {
                DR = ExamSys.ExecuteReader(strSql.ToString(), parameters);
            }

            using (DR)
            {
                while (DR.Read())
                {
                    Model.CourseSystem model = new Model.CourseSystem();
                    //model.CourseLbID = int.Parse(DR["ID"].ToString());
                    model.Name = DR["CRC_CATEGORY_NAME"].ToString();
                    //model.Up = int.Parse(DR["Up"].ToString());
                    //model.CourseCount = int.Parse(DR["CourseCount"].ToString());
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
        /// <param name="CourseLbID">类别ID</param>
        /// <returns></returns>
        public List<Model.CourseSystem> GetList(int PageCount, int PageSize,int CourseLbID)
        {
            string strSql = "";
            string RedCountsql = "";
            int RowTotal = (PageCount - 1) * PageSize;//
            RedCountsql = "(select count(CR_ID) from [AP_COURSE] where [CR_CATEGORY_ID]='" + CourseLbID + "' ) as RowTotal";
            strSql = "Select Top " + PageSize + " *," + RedCountsql + " FROM [AP_COURSE]  where [CR_ID] not in (Select Top " + RowTotal + " [CR_ID] from [AP_COURSE] Where [CR_CATEGORY_ID]='" + CourseLbID + "' ORDER BY CR_ID DESC ) And [CR_CATEGORY_ID]='" + CourseLbID + "' ORDER BY CR_ID DESC";
            List<Model.CourseSystem> List = new List<Model.CourseSystem>();
            SqlParameter[] parameters = {
				};

            SqlDataReader DR;

            if (GetCourseSysSetupInfo())
            {
                DR = CourseSys.ExecuteReader(strSql.ToString(), parameters);
            }
            else
            {
                DR = ExamSys.ExecuteReader(strSql.ToString(), parameters);
            }

            using (DR)
            {
                while (DR.Read())
                {
                    Model.CourseSystem model = new Model.CourseSystem();
                    model.ID = int.Parse(DR["CR_ID"].ToString());
                    model.Title = DR["CR_COURSE_NAME"].ToString();
                    model.RowTotal = int.Parse(DR["RowTotal"].ToString());
                    model.Credit = int.Parse(DR["CR_CREDIT"].ToString());
                    model.Money = int.Parse(DR["CR_MONEY"].ToString());
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
        public List<Model.CourseSystem> Details(int ID)
        {
            string strSql = "";
            strSql = "Select * FROM [AP_COURSE] Where [CR_ID]='" + ID + "'";
            List<Model.CourseSystem> List = new List<Model.CourseSystem>();
            SqlParameter[] parameters = {
                };
            SqlDataReader DR;

            if (GetCourseSysSetupInfo())
            {
                DR = CourseSys.ExecuteReader(strSql.ToString(), parameters);
            }
            else
            {
                DR = ExamSys.ExecuteReader(strSql.ToString(), parameters);
            }

            using (DR)
            {
                while (DR.Read())
                {
                    Model.CourseSystem model = new Model.CourseSystem();
                    model.ID = int.Parse(DR["CR_ID"].ToString());
                    model.Title = DR["CR_COURSE_NAME"].ToString();
                    model.Abstract = DR["CR_DESC"].ToString();
                    model.Outline = DR["CR_OUTLINE"].ToString();
                    List.Add(model);
                }
                DR.Close();
                DR.Dispose();
            }
            return List;
        }
    }
}
