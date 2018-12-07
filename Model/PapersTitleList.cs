using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    /// <summary>
    /// 试卷题目表
    /// </summary>
    public class PapersTitleList
    {
        public PapersTitleList()
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
        /// 分数
        /// </summary>
        public int Score
        { set; get; }
        /// <summary>
        /// 试卷ID
        /// </summary>
        public int PapersID
        { set; get; }
        /// <summary>
        /// 编号(随机查询后的新编号)
        /// </summary>
        public int Num
        { set; get; }
        //类别
        public int Status_id
        { set; get; }
    }
}
