using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace BLL
{
    /// <summary>
    /// add by wangke 2016-11-23 出题类别
    /// </summary>
    public class Status
    {
        DAL.Status dal = new DAL.Status();
        /// <summary>
        /// 查询所有
        /// </summary>
        /// <param name="Ys_Code">编码</param>
        /// <returns></returns>
        public List<Model.Status> GetList(string Ys_Code)
        {
            return dal.GetList(Ys_Code);
        }

        /// <summary>
        /// 返回试卷类型
        /// </summary>
        /// <returns></returns>
        public List<Model.Status> GetCategory()
        {
            return dal.GetCategory();
        }

        /// <summary>
        /// 获得数据列表
        /// </summary>
        /// <returns></returns>
        public DataTable GetStatusList(string strWhere)
        {
            return dal.GetStatusList(strWhere);
        }
    }
}
