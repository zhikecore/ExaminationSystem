using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    /// <summary>
    /// 选项表
    /// </summary>
    public class OptionsList
    {
        public OptionsList()
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
    }
}
