using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    /// <summary>
    /// 试卷表
    /// </summary>
    public class Papers
    {
        public Papers()
        { }
        /// <summary>
        /// ID
        /// </summary>
        public int ID
        { set; get; }
        /// <summary>
        /// 是否锁定(0为锁定,1为没锁)
        /// </summary>
        public int Lock
        { set; get; }
        /// <summary>
        /// 试卷名
        /// </summary>
        public string Name
        { set; get; }
        /// <summary>
        /// 行共数
        /// </summary>
        public int RowTotal
        { set; get; }
        /// <summary>
        /// 课程ID
        /// </summary>
        public int CourseID
        { set; get; }
        /// <summary>
        /// 类型：试卷？问卷
        /// </summary>
        public string Type
        { set; get; }
    }
}
