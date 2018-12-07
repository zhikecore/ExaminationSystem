using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    /// <summary>
    /// 系统信息
    /// </summary>
    public class SystemInfo
    {
        public SystemInfo()
        { }
        /// <summary>
        /// 硬件信息(1：已安装？0未安装)
        /// </summary>
        public string HardInfo
        { set; get; }
        /// <summary>
        /// 用户系统(1：外部？0内部)
        /// </summary>
        public string UserSys
        { set; get; }
        /// <summary>
        /// 课程系统(1：外部？0内部)
        /// </summary>
        public string CourseSys
        { set; get; }
        /// <summary>
        /// 系统管理员密码(32位)
        /// </summary>
        public string sPassword
        { set; get; }
        /// <summary>
        /// 授权码(32位)
        /// </summary>
        public string SN
        { set; get; }


        /// <summary>
        /// 更新系统(1：接受？0不接受)
        /// </summary>
        public string Updata = "0";
        /// <summary>
        /// 更新用户系统(1：允许？0不允许)
        /// </summary>
        public string UpdataUserSys = "0";
        /// <summary>
        /// 更新课程系统(1：允许？0不允许)
        /// </summary>
        public string UpdataCourseSys = "0";
        /// <summary>
        /// 更新硬件信息(1：允许？0不允许)
        /// </summary>
        public string UpdataHardInfo = "0";
        /// <summary>
        /// 更新授权码(32位)(1：允许？0不允许)
        /// </summary>
        public string UpdataSN = "0";
    }
}
