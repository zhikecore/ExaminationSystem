using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    /// <summary>
    /// 课程体系
    /// </summary>
    public class CourseSystem
    {
        public CourseSystem()
        { }
        /// <summary>
        /// ID
        /// </summary>
        public int ID
        { set; get; }
        /// <summary>
        /// 类别ID
        /// </summary>
        public int CourseLbID
        { set; get; }
        /// <summary>
        /// 上级
        /// </summary>
        public int Up
        { set; get; }
        /// <summary>
        /// 行共数
        /// </summary>
        public int RowTotal
        { set; get; }
        /// <summary>
        /// 课程标题
        /// </summary>
        public string Title
        { set; get; }
        /// <summary>
        /// 摘要
        /// </summary>
        public string Abstract
        { set; get; }
        /// <summary>
        /// 课程大纲
        /// </summary>
        public string Outline
        { set; get; }
        /// <summary>
        /// 类别名称
        /// </summary>
        public string Name
        { set; get; }
        /// <summary>
        /// 类别描述
        /// </summary>
        public string Description
        { set; get; }
        /// <summary>
        /// 课程数
        /// </summary>
        public int CourseCount
        { set; get; }
        /// <summary>
        /// 学分
        /// </summary>
        public int Credit
        { set; get; }
        /// <summary>
        /// 费用
        /// </summary>
        public int Money
        { set; get; }
    }
}