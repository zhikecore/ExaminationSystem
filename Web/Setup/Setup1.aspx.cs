using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;
using System.Data;

namespace Web.Setup
{
    public partial class Setup1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getHardInfo();
            }
        }

        /// <summary>
        /// 取得硬件信息
        /// </summary>
        private void getHardInfo()
        {
            HardInfoClass myHardInfo = new HardInfoClass();
            lb_CpuID.Text = myHardInfo.GetCpuID();
            lb_HardDiskID.Text = myHardInfo.GetHardDiskID();
            lb_HostName.Text = myHardInfo.GetHostName();
            lb_NetCardIP.Text = myHardInfo.GetNetCardIP();
            lb_NetCardMAC.Text = myHardInfo.GetNetCardMAC();
            lb_VolOf.Text = myHardInfo.GetVolOf("C");
        }

        protected void bt_Yes_Click(object sender, EventArgs e)
        {
            BLL.HardInfo bll = new BLL.HardInfo();
            Model.HardInfo model = new Model.HardInfo();
            model.CpuID = lb_CpuID.Text;
            model.HardDiskID = lb_HardDiskID.Text;
            model.HostName = lb_HostName.Text;
            model.NetCardIP = lb_NetCardIP.Text;
            model.NetCardMAC = lb_NetCardMAC.Text;
            model.VolOf = lb_VolOf.Text;
            bll.Add(model);
        }
    }
}
