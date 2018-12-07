using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    /// <summary>
    /// 课程系统
    /// </summary>
    public class CourseSystem
    {
        DAL.CourseSystem dal = new DAL.CourseSystem();
        /// <summary>
        /// 查询所有
        /// </summary>
        /// <returns></returns>
        public List<Model.CourseSystem> GetList()
        {
            return dal.GetList();
        }
        /// <summary>
        /// 查询所有
        /// </summary>
        /// <param name="CourseLbID">类别ID</param>
        /// <returns></returns>
        public List<Model.CourseSystem> GetList(int PageCount, int PageSize, int CourseLbID)
        {
            return dal.GetList(PageCount, PageSize, CourseLbID);
        }
        /// <summary>
        /// 显示详细
        /// </summary>
        /// <param name="ID">ID</param>
        /// <returns></returns>
        public List<Model.CourseSystem> Details(int ID)
        {
            return dal.Details(ID);
        }
        /// <summary>
        /// 取得课程体系名称
        /// </summary>
        /// <param name="CourseLbID">课程体系ID</param>
        /// <returns></returns>
        public List<Model.CourseSystem> GetList(int CourseLbID)
        {
            return dal.GetList(CourseLbID);
        }
    }
}
