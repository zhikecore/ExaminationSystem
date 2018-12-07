using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace BLL
{
    /// <summary>
    /// 试卷表
    /// </summary>
    public class Papers
    {
        DAL.Papers dal = new DAL.Papers();
        /// <summary>
        /// 添加
        /// </summary>
        public int Add(Model.Papers model)
        {
            return dal.Add(model);
        }
        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="model"></param>
        public int Updata(Model.Papers model)
        {
            return dal.Updata(model);
        }
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="ID"></param>
        public int Del(int ID)
        {
            return dal.Del(ID);
        }
        /// <summary>
        /// 显示所有
        /// </summary>
        /// <param name="PageCount">PageCount</param>
        /// <param name="PageSize">PageSize</param>
        /// <param name="Type">类型(单选/多选/不定项选/判断)</param>
        /// <param name="CourseID">课程ID</param>
        /// <returns></returns>
        public List<Model.Papers> GetList(int PageCount, int PageSize, string Type, int CourseID)
        {
            return dal.GetList(PageCount, PageSize, Type, CourseID);
        }

        /// <summary>
        /// 显示所有
        /// </summary>
        /// <param name="strWhere"></param>
        /// <returns></returns>
        public DataSet GetList(string strWhere)
        {
            return dal.GetList(strWhere);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="PageCount"></param>
        /// <param name="PageSize"></param>
        /// <param name="Type"></param>
        /// <returns></returns>
        public List<Model.Papers> GetList(int PageCount, int PageSize, string Type)
        {
            return dal.GetList(PageCount, PageSize, Type);
        }
        /// <summary>
        /// 详细信息
        /// </summary>
        /// <param name="ID">ID</param>
        /// <returns></returns>
        public List<Model.Papers> Details(int ID)
        {
            return dal.Details(ID);
        }
    }
}
