using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    /// <summary>
    /// 试卷选项表
    /// </summary>
    public class PapersOptionsList
    {
        public PapersOptionsList()
        { }
        /// <summary>
        /// ID
        /// </summary>
        public int ID
        { set; get; }
        /// <summary>
        /// 所属题目ID
        /// </summary>
        public int TitleListID
        { set; get; }
        /// <summary>
        /// 行共数
        /// </summary>
        public int RowTotal
        { set; get; }
        /// <summary>
        /// 名称
        /// </summary>
        public string Name
        { set; get; }
        /// <summary>
        /// True or False(选择题时才有效)
        /// </summary>
        public string T_F
        { set; get; }
        /// <summary>
        /// 试卷表ID
        /// </summary>
        public int PapersID
        { set; get; }
        /// <summary>
        /// 编号(随机查询后的新编号)
        /// </summary>
        public int Num
        { set; get; }
        /// <summary>
        /// 分值(值选项有效)
        /// </summary>
        public int Score
        { set; get; }
    }
}
