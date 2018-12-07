using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace BLL
{
    /// <summary>
    /// 题目表
    /// </summary>
    public class TitleList
    {
        DAL.TitleList dal = new DAL.TitleList();
        /// <summary>
        /// 添加
        /// </summary>
        public int Add(Model.TitleList model)
        {
            return dal.Add(model);
        }
        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="model"></param>
        public void Updata(Model.TitleList model)
        {
            if (dal.Updata(model) > 0)
            {
                Common.Function.AlertRedirect("成功！", "/Aspx/Success.htm");
            }
            else
            {
                Common.Function.AlertRedirect("失败！", "/Aspx/Failure.htm");
            }
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
        public List<Model.TitleList> GetList(int PageCount, int PageSize, string Type, int CourseID)
        {
            return dal.GetList(PageCount, PageSize, Type, CourseID);
        }
        public List<Model.TitleList> GetList(int PageCount, int PageSize, string Type)
        {
            return dal.GetList(PageCount, PageSize, Type);
        }

        /// <summary>
        /// 显示所有
        /// </summary>
        /// <param name="PageCount">PageCount</param>
        /// <param name="PageSize">PageSize</param>
        /// <param name="Type">类型(单选/多选/不定项选/判断)</param>
        /// <param name="CourseID">课程ID</param>
        /// <param name="Extent">程度</param>
        /// <returns></returns>
        public List<Model.TitleList> GetList(int PageCount, int PageSize, string Type, int CourseID, string Extent)
        {
            return dal.GetList(PageCount, PageSize, Type, CourseID, Extent);
        }
        public List<Model.TitleList> GetList(int PageCount, int PageSize, string Type, string Extent)
        {
            return dal.GetList(PageCount, PageSize, Type, Extent);
        }
        /// <summary>
        /// 显示所有
        /// </summary>
        /// <param name="Type">类型(单选/多选/不定项选/判断题/值选项)</param>
        /// <param name="CourseID">课程ID</param>
        /// <returns></returns>
        public List<Model.TitleList> GetList(string Type, int CourseID)
        {
            return dal.GetList(Type,CourseID);
        }
        /// <summary>
        /// 显示所有
        /// add by wangke 2016-11-23 添加返回datatable类型
        /// </summary>
        /// <param name="Type">类型(单选/多选/不定项选/判断题/值选项)</param>
        /// <param name="CourseID">课程ID</param>
        /// <returns></returns>
        public DataTable GetList(string Type, int CourseID, int Status_id)
        {
            return dal.GetList(Type, CourseID,Status_id);
        }
        /// <summary>
        /// 显示所有
        /// </summary>
        /// <param name="Type">类型(单选/多选/不定项选/判断)</param>
        /// <param name="CourseID">课程ID</param>
        /// <param name="Top">条数</param>
        /// <param name="Extent">程度</param>
        /// <returns></returns>
        public List<Model.TitleList> GetList(string Type, int CourseID, int Top, string Extent)
        {
            return dal.GetList(Type, CourseID, Top, Extent);
        }
        /// <summary>
        /// 显示所有
        /// </summary>
        /// <param name="Type">类型(单选/多选/不定项选/判断题/值选项)</param>
        /// <param name="CourseID">课程ID</param>
        /// <param name="Extent">程度</param>
        /// <returns></returns>
        public List<Model.TitleList> GetList(string Type, int CourseID, string Extent)
        {
            return dal.GetList(Type, CourseID, Extent);
        }
        /// <summary>
        /// 详细信息
        /// </summary>
        /// <param name="ID">ID</param>
        /// <returns></returns>
        public List<Model.TitleList> Details(int ID)
        {
            List<Model.TitleList> list = new List<Model.TitleList>();
            list = dal.Details(ID);
            list[0].T_F = Common.Function.T_F_TitleList(list[0].T_F);
            return list;
        }
        /// <summary>
        /// 总数
        /// </summary>
        /// <param name="Type">类型(单选/多选/不定项选/判断)</param>
        /// <param name="CourseID">课程ID</param>
        /// <param name="Extent">程度</param>
        /// <returns></returns>
        public int Count(string Type, int CourseID, string Extent)
        {
            return dal.Count(Type, CourseID, Extent);
        }
    }
}
