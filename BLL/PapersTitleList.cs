using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace BLL
{
    /// <summary>
    /// 试卷题目表
    /// </summary>
    public class PapersTitleList
    {
        DAL.PapersTitleList dal = new DAL.PapersTitleList();
        /// <summary>
        /// 添加
        /// </summary>
        public int Add(Model.PapersTitleList model)
        {
            return dal.Add(model);
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
        /// 显示所有
        /// </summary>
        /// <param name="Type">类型(单选/多选/不定项选/判断题/值选项)</param>
        /// <param name="PapersID">试卷ID</param>
        /// <param name="OpenBook">是否开卷</param>
        /// <returns></returns>
        public List<Model.PapersTitleList> GetList(string Type, int PapersID, bool OpenBook)
        {
            if (OpenBook)
            {
                List<Model.PapersTitleList> list = new List<Model.PapersTitleList>();
                list = dal.GetList(Type, PapersID);
                for (int i = 0; i < list.Count; i++)
                {
                    if (list[i].T_F == "T")
                    {
                        list[i].T_F = "(正确)";
                    }
                    else
                    {
                        list[i].T_F = "(错误)";
                    }
                    list[i].Num = i + 1;
                }
                return list;
            }
            else
            {
                List<Model.PapersTitleList> list = new List<Model.PapersTitleList>();
                list = dal.GetList(Type, PapersID);
                for (int i = 0; i < list.Count; i++)
                {
                    list[i].T_F = "";
                    list[i].Num = i + 1;
                }
                return list;
            }
        }

        /// <summary>
        /// 显示所有
        /// </summary>
        /// <param name="Type">类型(单选/多选/不定项选/判断题/值选项)</param>
        /// <param name="PapersID">试卷ID</param>
        /// <param name="OpenBook">是否开卷</param>
        /// <returns></returns>
        public List<Model.PapersTitleList> GetList(string Type, int PapersID,int StatusID, bool OpenBook)
        {
            if (OpenBook)
            {
                List<Model.PapersTitleList> list = new List<Model.PapersTitleList>();
                list = dal.GetList(Type, PapersID, StatusID);
                for (int i = 0; i < list.Count; i++)
                {
                    if (list[i].T_F == "T")
                    {
                        list[i].T_F = "(正确)";
                    }
                    else
                    {
                        list[i].T_F = "(错误)";
                    }
                    list[i].Num = i + 1;
                }
                return list;
            }
            else
            {
                List<Model.PapersTitleList> list = new List<Model.PapersTitleList>();
                list = dal.GetList(Type, PapersID, StatusID);
                for (int i = 0; i < list.Count; i++)
                {
                    list[i].T_F = "";
                    list[i].Num = i + 1;
                }
                return list;
            }
        }

        /// <summary>
        /// 统计分值
        /// </summary>
        /// <param name="Type">类型(单选/多选/不定项选/判断)</param>
        /// <param name="PapersID">试卷ID</param>
        /// <returns></returns>
        public int SumScore(string Type, int PapersID)
        {
            return dal.SumScore(Type, PapersID);
        }
        /// <summary>
        /// 统计分值
        /// </summary>
        /// <param name="PapersID">试卷ID</param>
        /// <returns></returns>
        public int SumScore(int PapersID)
        {
            return dal.SumScore(PapersID);
        }
         /// <summary>
        /// 是否存在
        /// </summary>
        /// <param name="Type">类型(单选/多选/不定项选/判断题/值选项)</param>
        /// <param name="PapersID">试卷ID</param>
        /// <returns></returns>
        public bool nGetList(string Type, int PapersID)
        {
            return dal.nGetList(Type, PapersID);
        }

        /// <summary>
        /// 获得数据列表
        /// 获取该试卷题目所属StatusId
        /// </summary>
        /// <returns></returns>
        public DataTable GetList(int papersID)
        {
            return dal.GetList(papersID);
        }
    }
}