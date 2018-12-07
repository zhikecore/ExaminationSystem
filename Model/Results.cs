using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    /// <summary>
    /// 成绩单
    /// </summary>
    public class Results
    {
        public Results()
        { }
        /// <summary>
        /// 用户ID
        /// </summary>
        public int UserID
        { set; get; }
        /// <summary>
        /// 试卷ID
        /// </summary>
        public int PapersID
        { set; get; }
        /// <summary>
        /// 题目ID
        /// </summary>
        public int TitleListID
        { set; get; }
        /// <summary>
        /// 用户得分
        /// </summary>
        public int Score
        { set; get; }
        /// <summary>
        /// 试卷分值
        /// </summary>
        public int SysScore
        { set; get; }
        /// <summary>
        /// 用户答案
        /// </summary>
        public string Answer
        { set; get; }
        /// <summary>
        /// 真实答案
        /// </summary>
        public string TrueAnswer
        { set; get; }
        /// <summary>
        /// 行共数
        /// </summary>
        public int RowTotal
        { set; get; }
        /// <summary>
        /// 百分比
        /// </summary>
        public string Percentage
        { set; get; }
        /// <summary>
        /// 用户名
        /// </summary>
        public string UserName
        { set; get; }
        /// <summary>
        /// 试卷名
        /// </summary>
        public string PapersName
        { set; get; }
        /// <summary>
        /// 考试时间
        /// </summary>
        public string Time
        { set; get; }

        /// <summary>
        /// 提交时间
        /// </summary>
        public DateTime SubmitTime { get; set; }
    }
}
