using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    /// <summary>
    /// 系统信息
    /// </summary>
    public class SystemInfo
    {
        DAL.SystemInfo dal = new DAL.SystemInfo();
        /// <summary>
        /// 添加
        /// </summary>
        public void Add(Model.SystemInfo md)
        {
            Model.SystemInfo model = new Model.SystemInfo();
            model.CourseSys = Common.Function.ToASCII(md.CourseSys);
            model.HardInfo = Common.Function.ToASCII(md.HardInfo);
            model.SN = Common.Function.ToASCII(md.SN);
            model.sPassword = Common.Function.md5(md.sPassword);
            model.Updata = Common.Function.ToASCII(md.Updata);
            model.UpdataCourseSys = Common.Function.ToASCII(md.UpdataCourseSys);
            model.UpdataHardInfo = Common.Function.ToASCII(md.UpdataHardInfo);
            model.UpdataSN = Common.Function.ToASCII(md.UpdataSN);
            model.UpdataUserSys = Common.Function.ToASCII(md.UpdataUserSys);
            model.UserSys = Common.Function.ToASCII(md.UserSys);
            if (dal.Add(model) > 0)
            {
                Common.Function.AlertRedirect("安装成功！", "/Aspx/Success.htm");
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
        public void Updata(Model.SystemInfo md)
        {
            Model.SystemInfo model = new Model.SystemInfo();
            model.CourseSys = Common.Function.ToASCII(md.CourseSys);
            model.HardInfo = Common.Function.ToASCII(md.HardInfo);
            model.SN = Common.Function.ToASCII(md.SN);
            model.sPassword = Common.Function.md5(md.sPassword);
            model.Updata = Common.Function.ToASCII(md.Updata);
            model.UpdataCourseSys = Common.Function.ToASCII(md.UpdataCourseSys);
            model.UpdataHardInfo = Common.Function.ToASCII(md.UpdataHardInfo);
            model.UpdataSN = Common.Function.ToASCII(md.UpdataSN);
            model.UpdataUserSys = Common.Function.ToASCII(md.UpdataUserSys);
            model.UserSys = Common.Function.ToASCII(md.UserSys);
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
        public List<Model.SystemInfo> GetList()
        {
            List<Model.SystemInfo> list = new List<Model.SystemInfo>();
            list = dal.GetList();
            for (int i = 0; i < list.Count; i++)
            {
                list[i].CourseSys = Common.Function.ToString(list[i].CourseSys);
                list[i].HardInfo = Common.Function.ToString(list[i].HardInfo);
                list[i].SN = Common.Function.ToString(list[i].SN);
                list[i].sPassword = "********";
                list[i].Updata = Common.Function.ToString(list[i].Updata);
                list[i].UpdataCourseSys = Common.Function.ToString(list[i].UpdataCourseSys);
                list[i].UpdataHardInfo = Common.Function.ToString(list[i].UpdataHardInfo);
                list[i].UpdataSN = Common.Function.ToString(list[i].UpdataSN);
                list[i].UpdataUserSys = Common.Function.ToString(list[i].UpdataUserSys);
                list[i].UserSys = Common.Function.ToString(list[i].UserSys);
            }
            return list;
        }
    }
}
