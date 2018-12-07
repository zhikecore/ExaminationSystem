using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net; 
using System.Runtime.InteropServices;
using System.Management; //需要在解决方案中引用System.Management.DLL文件 

namespace Common
{
    /// <summary>
    /// 计算机硬件信息类
    /// </summary>
    public class HardInfoClass
    {
        [DllImport("kernel32.dll")]
        private static extern int GetVolumeInformation(
         string lpRootPathName,
         string lpVolumeNameBuffer,
         int nVolumeNameSize,
         ref int lpVolumeSerialNumber,
         int lpMaximumComponentLength,
         int lpFileSystemFlags,
         string lpFileSystemNameBuffer,
         int nFileSystemNameSize
         );
        public HardInfoClass()
        {
            // 
            // TODO: 在此处添加构造函数逻辑 
            // 
        }
        /// <summary>
        /// 获取机器名
        /// </summary>
        /// <returns></returns>
        public string GetHostName()
        {
            return System.Net.Dns.GetHostName();
        }
        /// <summary>
        /// 获取CPU编号
        /// </summary>
        /// <returns></returns>
        public string GetCpuID()
        {
            try
            {
                ManagementClass mc = new ManagementClass("Win32_Processor");
                ManagementObjectCollection moc = mc.GetInstances();
                string strCpuID = null;
                foreach (ManagementObject mo in moc)
                {
                    strCpuID = mo.Properties["ProcessorId"].Value.ToString();
                    break;
                }
                return strCpuID;
            }
            catch
            {
                return "";
            }
        }//end method  
        /// <summary>
        /// 获取第一块硬盘编号
        /// </summary>
        /// <returns></returns>
        public string GetHardDiskID()
        {
            try
            {
                ManagementObjectSearcher searcher = new ManagementObjectSearcher("SELECT * FROM Win32_PhysicalMedia");
                string strHardDiskID = null;
                foreach (ManagementObject mo in searcher.Get())
                {
                    strHardDiskID = mo["SerialNumber"].ToString().Trim();
                    break;
                }
                return strHardDiskID;
            }
            catch
            {
                return "";
            }
        }
        /// <summary>
        /// 获取网卡MAC地址 
        /// </summary>
        /// <returns></returns>
        public string GetNetCardMAC()
        {
            try
            {
                string stringMAC = "";
                ManagementClass MC = new ManagementClass("Win32_NetworkAdapterConfiguration");
                ManagementObjectCollection MOC = MC.GetInstances();

                foreach (ManagementObject MO in MOC)
                {
                    if ((bool)MO["IPEnabled"] == true)
                    {
                        stringMAC += MO["MACAddress"].ToString();

                    }
                }
                return stringMAC;
            }
            catch
            {
                return "";
            }
        }
        /// <summary>
        /// 获取硬盘信息的代码
        /// </summary>
        /// <param name="drvID">drvID</param>
        /// <returns></returns>
        public string GetVolOf(string drvID)
        {
            try
            {
                const int MAX_FILENAME_LEN = 256;
                int retVal = 0;
                int a = 0;
                int b = 0;
                string str1 = null;
                string str2 = null;

                int i = GetVolumeInformation(
                 drvID + @":\",
                 str1,
                 MAX_FILENAME_LEN,
                 ref retVal,
                 a,
                 b,
                 str2,
                 MAX_FILENAME_LEN
                 );
                return retVal.ToString("x");
            }
            catch
            {
                return "";
            }
        }
        /// <summary>
        /// 获取当前网卡IP地址 
        /// </summary>
        /// <returns></returns>
        public string GetNetCardIP()
        {
            try
            {
                string stringIP = "";
                ManagementClass MC = new ManagementClass("Win32_NetworkAdapterConfiguration");
                ManagementObjectCollection MOC = MC.GetInstances();

                foreach (ManagementObject MO in MOC)
                {
                    if ((bool)MO["IPEnabled"] == true)
                    {
                        string[] IPAddresses = (string[])MO["IPAddress"];
                        if (IPAddresses.Length > 0)
                            stringIP = IPAddresses[0].ToString();

                    }
                }
                return stringIP;
            }
            catch
            {
                return "";
            }
        }
    }
}
