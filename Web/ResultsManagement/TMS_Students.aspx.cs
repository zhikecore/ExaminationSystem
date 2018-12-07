using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.ResultsManagement
{
    public partial class TMS_Students : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void bt_Yes_Click(object sender, EventArgs e)
        {
            BLL.UserSystem bll = new BLL.UserSystem();
            List<Model.UserSystem> list = new List<Model.UserSystem>();
            list = bll.GetList(tb_UserName.Text.Trim());
            gv_01.DataSource = list;
            gv_01.DataBind();
            if (list.Count > 0)
            { }
            else
            {
                lb_Msg.Text = "没有 " + tb_UserName.Text + " 的相关信息！";
            }
        }
    }
}
