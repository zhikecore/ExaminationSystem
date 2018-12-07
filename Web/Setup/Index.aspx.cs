using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.Setup
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    BLL.SystemInfo bll = new BLL.SystemInfo();
                    List<Model.SystemInfo> list = new List<Model.SystemInfo>();
                    list = bll.GetList();
                    if (list.Count > 0)
                    {
                        gv01.DataSource = list;
                        gv01.DataBind();
                        lb_Msg.Text = "您已成功安装过此系统！";
                        bt_Yes.Enabled = false;
                    }
                    else
                    {

                    }
                }
                catch
                { }
            }
        }

        protected void bt_Yes_Click(object sender, EventArgs e)
        {
            //使用方法    
            string str = TextBox1.Text + TextBox2.Text + TextBox3.Text + TextBox4.Text;
            if (str.Length < 32)
            {
                lb_Msg.Text = "请输入正确的CD-Key！";
            }
            else
            {
                if (Common.SN.Compare(str))
                {
                    //SN正确
                    Session["SN"] = str;
                    //Response.Redirect("Setup1.aspx");
                    Response.Redirect("InsertDB.aspx");
                }
                else
                {
                    //SN不对
                    Common.Function.Alert("无法激法此CD-Key！请联系管理员！");
                }
            }
        }
    }
}
