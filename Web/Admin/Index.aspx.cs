using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Admin
{
    public partial class Index : System.Web.UI.Page
    {
        public string UsersName;
        public string strLayer;
        public string sWidth;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //Common.Function.Alert(Request.QueryString["MyWidth"]);
                DivBind(Request.QueryString["MyWidth"]);
                Title = Common.Function.SetTitle("后台管理");
            }
        }

        private void DivBind(string Width)
        {
            if (Width == "0")
            {

                //Div_Mid.Style.Add("height", "565px");

                Div_Mid_Left.Style.Add("width", "12%");
                Div_Mid_Left.Style.Add("height", "99%");

                //Div_Mid_Mid.Style.Add("width", "20%");
                //Div_Mid_Mid.Style.Add("height", "99%");

                Div_Mid_Right.Style.Add("width", "86.3%");
                Div_Mid_Right.Style.Add("height", "99%");
            }
            else
            {
                int MyWidth = int.Parse(Width);
                double a = MyWidth * 0.12;
                double b = MyWidth * 0.563;
                double c = MyWidth * 0.28;

                //double a = MyWidth * 0.12;
                //double b = MyWidth * 0.5;
                //double c = MyWidth * 0.2;

                Div_Mid_Left.Style.Add("width", a + "px");
                Div_Mid_Left.Style.Add("height", "99%");

                Div_Mid_Mid.Style.Add("width", b + "px");
                Div_Mid_Mid.Style.Add("height", "99%");

                Div_Mid_Right.Style.Add("width", c + "px");
                Div_Mid_Right.Style.Add("height", "99%");
            }
        }
        protected void bt_logout_Click(object sender, ImageClickEventArgs e)
        {
        }
    }
}