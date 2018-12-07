using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    /// <summary>
    /// 数据库
    /// </summary>
    public class Db
    {
        public Db()
        { }
        /// <summary>
        /// 服务器
        /// </summary>
        public string Server
        { set; get; }
        /// <summary>
        /// 数据库名称
        /// </summary>
        public string Database
        { set; get; }
        /// <summary>
        /// 密码
        /// </summary>
        public string Password
        { set; get; }
        /// <summary>
        /// 实例名:MSSQLSERVER
        /// </summary>
        public string Instance
        { set; get; }
        /// <summary>
        /// 端口号:1433
        /// </summary>
        public string Port
        { set; get; }
        /// <summary>
        /// 用户
        /// </summary>
        public string User
        { set; get; }
        /// <summary>
        /// 标识
        /// </summary>
        public string Key
        { set; get; }
    }
}