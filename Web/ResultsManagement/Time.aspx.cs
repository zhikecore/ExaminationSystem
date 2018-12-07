using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.ResultsManagement
{
    public partial class Time :Common.OLPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            string Time = Calendar1.SelectedDate.ToString("yyyyMMdd");
            string rul;
            //rul = "List.aspx?Time=" + Time + "&TitleType=" + Request.QueryString["TitleType"];
            //rul = "/R-M/List" + Time + "-" + Request.QueryString["TitleType"] + ".html";
            rul = "/ResultsManagement/List.aspx?TitleType=" + Time + "&CourseID" + Request.QueryString["TitleType"];
            Common.Function.Redirect(rul, "Iframe_Div_Mid_Mid");
        }
    }
}