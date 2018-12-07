using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    /// <summary>
    /// 试卷选项表
    /// </summary>
    public class PapersOptionsList
    {
        DAL.PapersOptionsList dal = new DAL.PapersOptionsList();
        /// <summary>
        /// 添加
        /// </summary>
        public void Add(Model.PapersOptionsList model)
        {
            if (dal.Add(model) > 0)
            { }
            else
            { }
        }
        /// <summary>
        /// 显示所有
        /// </summary>
        /// <param name="TitleListID">TitleListID</param>
        /// <param name="PapersID">PapersID</param>
        /// <param name="OpenBook">是否开卷</param>
        /// <returns></returns>
        public List<Model.PapersOptionsList> GetList(int TitleListID, int PapersID,bool OpenBook)
        {
            if (OpenBook)
            {
                List<Model.PapersOptionsList> list = new List<Model.PapersOptionsList>();
                list = dal.GetList(TitleListID, PapersID);
                for (int i = 0; i < list.Count; i++)
                {
                    if (list[i].T_F == "")
                    {
                        list[i].T_F = "";
                    }
                    else
                    {
                        list[i].T_F = "(" + list[i].T_F + ")";
                    }
                    list[i].Num = i + 65;
                }
                return list;
            }
            else
            {
                List<Model.PapersOptionsList> list = new List<Model.PapersOptionsList>();
                list = dal.GetList(TitleListID, PapersID);
                for (int i = 0; i < list.Count; i++)
                {
                    list[i].T_F = "";
                    list[i].Num = i + 65;
                }
                return list;
            }
        }
    }
}
