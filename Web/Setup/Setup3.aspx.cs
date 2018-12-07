using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Common;

namespace Web.Setup
{
    public partial class Setup3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
            }
        }

        protected void bt_Test_UserSys_Click(object sender, EventArgs e)
        {
            string Str = "server=" + tb_Server_UserSys.Text.Trim() + "\\";
            Str = Str + tb_Instance_UserSys.Text.Trim() + ",";
            Str = Str + tb_Port_UserSys.Text.Trim() + ";database=";
            Str = Str + tb_Database_UserSys.Text.Trim() + ";User ID=";
            Str = Str + tb_User_UserSys.Text.Trim() + ";password=";
            Str = Str + tb_Password_UserSys.Text.Trim() + ";";
            TestSqlConnection(Str);
        }
        /// <summary>
        /// 测试SQL链接字符串是否真实有效！
        /// </summary>
        /// <param name="Value"></param>
        public void TestSqlConnection(string Value)
        {
            //try 块中获取并使用资源，在 catch 块中处理异常情况，并在 finally 块中释放资源
            SqlConnection db = new SqlConnection(Value);
            try
            {
                db.Open();
                Function.Alert("连接成功！");
            }
            catch
            {
                Function.Alert("连接错误！");
            }
            finally
            {
                db.Close();
            }
        }

        protected void rbl_UserSys_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbl_UserSys.SelectedValue == "外部")
            {
                table_UserSys.Visible = true;
            }
            else
            {
                table_UserSys.Visible = false;
            }
        }

        protected void bt_Yes_Click(object sender, EventArgs e)
        {
            if (rbl_UserSys.SelectedValue == "外部")
            {
                BLL.Db bll = new BLL.Db();
                Model.Db model = new Model.Db();
                model.Server = tb_Server_UserSys.Text;
                model.Database = tb_Database_UserSys.Text;
                model.Password = tb_Password_UserSys.Text;
                model.Instance = tb_Instance_UserSys.Text;
                model.Port = tb_Port_UserSys.Text;
                model.User = tb_User_UserSys.Text;
                model.Key = lb_Key_UserSys.Text;

                //
                Session["CourseSys"] = "1";

                bll.Add(model);
            }
            else
            {
                //
                Session["CourseSys"] = "0";

                Response.Redirect("Setup4.aspx");
            }
        }
    }
}