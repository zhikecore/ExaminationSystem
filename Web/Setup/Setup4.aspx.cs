using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Setup
{
    public partial class Setup4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
            }
        }

        protected void bt_Yes_Click(object sender, EventArgs e)
        {
            BLL.SystemInfo bll = new BLL.SystemInfo();
            Model.SystemInfo model = new Model.SystemInfo();
            string UserSys, CourseSys, SN;
            UserSys = Session["UserSys"].ToString();
            CourseSys = Session["CourseSys"].ToString();
            SN = Session["SN"].ToString();
            Session.RemoveAll();
            model.HardInfo = "1";
            model.UserSys = UserSys;
            model.CourseSys = CourseSys;
            model.SN = SN;
            model.sPassword = tb_Password.Text.Trim();
            bll.Add(model);
        }
    }
}
