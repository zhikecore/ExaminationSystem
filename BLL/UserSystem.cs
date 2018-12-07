using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    /// <summary>
    /// 用户系统
    /// </summary>
    public class UserSystem
    {
        DAL.UserSystem dal = new DAL.UserSystem();
        /// <summary>
        /// 查询所有
        /// </summary>
        /// <param name="CourseLbID">类别ID</param>
        /// <returns></returns>
        public List<Model.UserSystem> GetList(int PageCount, int PageSize)
        {
            return dal.GetList(PageCount, PageSize);
        }
        /// <summary>
        /// 显示详细
        /// </summary>
        /// <param name="ID">ID</param>
        /// <returns></returns>
        public List<Model.UserSystem> Details(int ID)
        {
            return dal.Details(ID);
        }
        /// <summary>
        /// 查询所有
        /// </summary>
        /// <param name="UserName">用户名(可中可英)</param>
        /// <returns></returns>
        public List<Model.UserSystem> GetList(string UserName)
        {
            return dal.GetList(UserName);
        }
    }
}
