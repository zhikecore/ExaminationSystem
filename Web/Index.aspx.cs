using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Web
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            try
            {
                DataTable dt = DBUtility.ExamSys.gettb("Select * From [Papers]");
                DataTable dt1 = DBUtility.CourseSys.gettb("Select * From [AP_COURSE]");
            }
            catch
            {
                Response.Redirect("/Setup/Index.aspx");
            }
        }
    }
}
