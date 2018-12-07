using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    /// <summary>
    /// 选项表
    /// </summary>
    public class OptionsList
    {
        DAL.OptionsList dal = new DAL.OptionsList();
        /// <summary>
        /// 添加
        /// </summary>
        public int Add(Model.OptionsList model)
        {
            return dal.Add(model);
        }
        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="model"></param>
        public void Updata(Model.OptionsList model)
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
        public void Del(int ID)
        {
            if (dal.Del(ID) > 0)
            {

                Common.Function.AlertRedirect("删除成功！", "/Aspx/Success.htm");
            }
            else
            {
                Common.Function.AlertRedirect("删除失败！", "/Aspx/Failure.htm");
            }
        }
        /// <summary>
        /// 删除TitleListID
        /// </summary>
        /// <param name="ID">所属题目ID</param>
        public void Del_TitleListID(int ID)
        {
            dal.Del_TitleListID(ID);
        }
        /// <summary>
        /// 详细信息
        /// </summary>
        /// <param name="TitleListID">题目ID</param>
        /// <returns></returns>
        public List<Model.OptionsList> Details(int TitleListID)
        {
            List<Model.OptionsList> list = new List<Model.OptionsList>();
            list = dal.Details(TitleListID);
            for (int i = 0; i < list.Count; i++)
            {
                list[i].T_F = Common.Function.T_F_OptionsList(list[i].T_F);
            }
            return list;
        }
    }
}
