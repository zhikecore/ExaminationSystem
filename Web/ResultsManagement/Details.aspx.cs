using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.ResultsManagement
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int UserID= int.Parse(Request.QueryString["UserID"].ToString());
                int PapersID = int.Parse(Request.QueryString["PapersID"].ToString());
                string Time = Request.QueryString["Time"];

                gv01_Bind(UserID, PapersID, Time);
            }
        }
        private void gv01_Bind(int UserID, int PapersID, string Time)
        {
            BLL.Results bll = new BLL.Results();
            List<Model.Results> list = new List<Model.Results>();

            list = bll.Details(UserID, PapersID, Time);
            gv01.DataSource = list;
            gv01.DataBind();
        }

        protected void imgbt_Back_Click(object sender, ImageClickEventArgs e)
        {
            Response.Write("<script language='javascript'>history.go(-2);</script>");
        }
    }
}
