using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    /// <summary>
    /// 题目表
    /// </summary>
    public class TitleList
    {
        public TitleList()
        { }
        /// <summary>
        /// ID
        /// </summary>
        public int ID
        { set; get; }
        /// <summary>
        /// 所属课程ID
        /// </summary>
        public int CourseID
        { set; get; }
        /// <summary>
        /// 行共数
        /// </summary>
        public int RowTotal
        { set; get; }
        /// <summary>
        /// True or False(判断题时才有效)
        /// </summary>
        public string T_F
        { set; get; }
        /// <summary>
        /// 类型：单选/多选/不定项选/判断/值选项
        /// </summary>
        public string Type
        { set; get; }
        /// <summary>
        ///标题
        /// </summary>
        public string Title
        { set; get; }
        /// <summary>
        /// 分析
        /// </summary>
        public string Analysis
        { set; get; }
        /// <summary>
        /// 程度：简单，适中，困难
        /// </summary>
        public string Extent
        { set; get; }
        /// <summary>
        /// 类别：商业模式/战略规划/公司治理/公司运营...
        /// </summary>
        public int? Status_id
        { get; set; }
    }
}
