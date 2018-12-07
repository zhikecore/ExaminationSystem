using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.ItemBankManagement
{
    public partial class T_F : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }

        protected void bt_Yes_Click(object sender, EventArgs e)
        {
            try
            {
                int k = 0;
                int l = 0;
                string del_Work = "";
                del_Work = Request.Form["del_Work"].ToString();
                int num = int.Parse(Request.Form["WorkExpNum"].ToString());
                for (int i = 1; i <= num; i++)
                {
                    if (del_Work.IndexOf(i.ToString()) <= 0)
                    {
                        //Response.Write(i + "：" + Request.Form["Name" + i] + Request.Form["radio" + i] + "<br/>");
                        string Name = Request.Form["Name" + i];
                        string Analysis = Request.Form["textfield" + i];
                        if (Name == "")
                        { }
                        else
                        {
                            BLL.TitleList bll = new BLL.TitleList();
                            Model.TitleList model = new Model.TitleList();
                            model.CourseID = int.Parse(Request.QueryString["CourseID"]);
                            model.Type = Request.QueryString["TitleType"];
                            model.Title = Common.Function.StringEncode(Name);
                            model.T_F = Request.Form["radio" + i];
                            model.Analysis = Common.Function.StringEncode(Analysis);
                            model.Extent = rbl_Extent.SelectedValue.ToString();
                            if (bll.Add(model) > 0)
                            {
                                k = k + 1;
                            }
                            else
                            {
                                l = l + 1;
                            }
                        }
                    }
                }
                lb_msg.Text = "题目添加成功，选择成功添加[" + k + "]条,失败[" + l + "]条！";
            }
            catch
            {
                lb_msg.Text = "题目添加失败！";
            }
        }
    }
}