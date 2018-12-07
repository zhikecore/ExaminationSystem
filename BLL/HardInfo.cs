using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    /// <summary>
    /// 硬件信息
    /// </summary>
    public class HardInfo
    {
        DAL.HardInfo dal = new DAL.HardInfo();
        /// <summary>
        /// 添加
        /// </summary>
        public void Add(Model.HardInfo md)
        {
            Model.HardInfo model = new Model.HardInfo();
            model.HostName = Common.Function.ToASCII(md.HostName);
            model.CpuID = Common.Function.ToASCII(md.CpuID);
            model.HardDiskID = Common.Function.ToASCII(md.HardDiskID);
            model.NetCardIP = Common.Function.ToASCII(md.NetCardIP);
            model.NetCardMAC = Common.Function.ToASCII(md.NetCardMAC);
            model.VolOf = Common.Function.ToASCII(md.VolOf);
            if (dal.Add(model) > 0)
            {
                Common.Function.Redirect("Setup2.aspx");
            }
            else
            {
                Common.Function.AlertRedirect("添加失败！系统繁忙请稍后再试！", "/Aspx/Failure.htm");
            }
        }
        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="model"></param>
        public void Updata(Model.HardInfo md)
        {
            Model.HardInfo model = new Model.HardInfo();
            model.HostName = Common.Function.ToASCII(md.HostName);
            model.CpuID = Common.Function.ToASCII(md.CpuID);
            model.HardDiskID = Common.Function.ToASCII(md.HardDiskID);
            model.NetCardIP = Common.Function.ToASCII(md.NetCardIP);
            model.NetCardMAC = Common.Function.ToASCII(md.NetCardMAC);
            model.VolOf = Common.Function.ToASCII(md.VolOf);
            if (dal.Updata(model) > 0)
            {
                Common.Function.AlertRedirect("成功！", "/Aspx/Success.htm");
            }
            else
            {
                Common.Function.AlertRedirect("失败！", "/Aspx/Failure.htm");
            }
        }
        /// <summary>
        /// 显示所有
        /// </summary>
        /// <returns></returns>
        public List<Model.HardInfo> GetList()
        {
            return dal.GetList();
        }
    }
}
