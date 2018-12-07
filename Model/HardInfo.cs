using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    /// <summary>
    /// 硬件信息
    /// </summary>
    public class HardInfo
    {
        public HardInfo()
        { }
        /// <summary>
        /// 机器名
        /// </summary>
        public string HostName
        { set; get; }
        /// <summary>
        /// CPU编号
        /// </summary>
        public string CpuID
        { set; get; }
        /// <summary>
        /// 硬盘编号
        /// </summary>
        public string HardDiskID
        { set; get; }
        /// <summary>
        /// 网卡MAC
        /// </summary>
        public string NetCardMAC
        { set; get; }
        /// <summary>
        /// 盘符信息
        /// </summary>
        public string VolOf
        { set; get; }
        /// <summary>
        /// 网卡IP
        /// </summary>
        public string NetCardIP
        { set; get; }
    }
}
