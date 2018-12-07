using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    /// <summary>
    /// 用户系统
    /// </summary>
    public class UserSystem
    {
        public UserSystem()
        { }
        /// <summary>
        /// ID
        /// </summary>
        public int ID
        { set; get; }
        /// <summary>
        /// 行共数
        /// </summary>
        public int RowTotal
        { set; get; }
        /// <summary>
        /// 中文名
        /// </summary>
        public string cnName
        { set; get; }
        /// <summary>
        /// 英文名
        /// </summary>
        public string enName
        { set; get; }
        /// <summary>
        /// 性别
        /// </summary>
        public string Sex
        { set; get; }
        /// <summary>
        /// 地址
        /// </summary>
        public string Address
        { set; get; }
        /// <summary>
        /// 邮政编码
        /// </summary>
        public string ZipCode
        { set; get; }
        /// <summary>
        /// 邮箱
        /// </summary>
        public string Email
        { set; get; }
        /// <summary>
        /// 手机
        /// </summary>
        public string Mobile
        { set; get; }
        /// <summary>
        /// 电话
        /// </summary>
        public string Phone
        { set; get; }
    }
}
