using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace BLL
{
    /// <summary>
    /// 成绩单
    /// </summary>
    public class Results
    {
        DAL.Results dal = new DAL.Results();
        /// <summary>
        /// 添加
        /// </summary>
        public void Add(Model.Results model)
        {
            if (dal.Add(model) > 0)
            {
                //Common.Function.AlertRedirect("交卷成功！", "/Aspx/Success.htm");
            }
            else
            {
                //Common.Function.AlertRedirect("交卷失败！系统繁忙请稍后再试！", "/Aspx/Failure.htm");
            }
        }

        /// <summary>
        /// 添加
        /// add by wangke 2016-12-12
        /// </summary>
        public int AddResult(Model.Results model)
        {
            return dal.Add(model);
        }

        /// <summary>
		/// 更新一条数据
		/// </summary>
		public bool Update(Model.Results model)
        {
            return dal.Update(model);
        }

        /// <summary>
		/// 更新一条数据
		/// </summary>
		public bool UpdateExtend(Model.Results model)
        {
            return dal.UpdateExtend(model);
        }

        /// <summary>
        /// 执行SQL语句
        /// add by wangke 2016-12-12
        /// </summary>
        public DataTable ExecSQL(string strSql, params SqlParameter[] parames)
        {
            return dal.ExecSQL(strSql, parames);
        }

        /// <summary>
        /// 详细信息
        /// </summary>
        /// <param name="UserID">用户ID</param>
        /// <param name="PapersID">试卷ID</param>
        /// <param name="PapersID">考试时间</param>
        /// <returns></returns>
        public List<Model.Results> Details(int UserID, int PapersID,string Time)
        {
            return dal.Details(UserID, PapersID, Time);
        }
        /// <summary>
        /// 查询所有
        /// </summary>
        /// <param name="Time">考试时间</param>
        /// <returns></returns>
        public List<Model.Results> GetList(string Time)
        {
            return dal.GetList(Time);
        }
        /// <summary>
        /// 查询所有
        /// </summary>
        /// <param name="CourseID">课程ID</param>
        /// <returns></returns>
        public List<Model.Results> GetList(int CourseID)
        {
           return dal.GetList(CourseID);
        }
        public List<Model.Results> GetList(int PageCount, int PageSize, string Sort, string Search, string Type)
        {
            return dal.GetList(PageCount, PageSize, Sort, Search, Type);
        }
        /// <summary>
        /// 查询所有
        /// </summary>
        /// <param name="UserID">用户ID</param>
        /// <returns></returns>
        public List<Model.Results> GetListUserID(int UserID)
        {
            return dal.GetListUserID(UserID);
        }
    }
}
