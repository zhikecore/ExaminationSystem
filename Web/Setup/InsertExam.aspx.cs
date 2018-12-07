using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Collections;


namespace Web.Setup
{
    public partial class InsertExam : System.Web.UI.Page
    {
        private static string ConStr = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
            }
        }
        #region   属性
        private string ConString
        {
            get
            {
                //    if (ConStr == "")
                //    {
                //        try
                //        {
                //            XmlDocument doc = new XmlDocument();
                //            doc.Load("ServerConfig.xml");

                //            string userid = doc.SelectSingleNode("ServerConfig/UserId").InnerText;
                //            string password = doc.SelectSingleNode("ServerConfig/PassWord").InnerText;
                //            string servername = doc.SelectSingleNode("ServerConfig/ServerName").InnerText;
                //            string database = doc.SelectSingleNode("ServerConfig/DataBase").InnerText;
                //            ConStr = "server   =   " + servername + ";uid   =   "
                //            + userid + ";pwd   =   " + password + ";database   =   " + database;
                //        }
                //        catch (Exception ex)
                //        {
                //            throw ex;
                //        }
                //    }
                //ConStr = "server = .;uid = sa;pwd = wen;database = Test";

                string Str = "server=" + tb_Server_UserSys.Text.Trim() + "\\";
                Str = Str + tb_Instance_UserSys.Text.Trim() + ",";
                Str = Str + tb_Port_UserSys.Text.Trim() + ";database=";
                Str = Str + tb_Database_UserSys.Text.Trim() + ";User ID=";
                Str = Str + tb_User_UserSys.Text.Trim() + ";password=";
                Str = Str + tb_Password_UserSys.Text.Trim() + ";";

                ConStr = Str;
                return ConStr;
            }
        }
        private static SqlConnection Con;
        public SqlConnection MyConnection
        {
            get
            {
                if (Con == null)
                {
                    Con = new SqlConnection(ConString);
                }
                return Con;
            }
        }
        #endregion
        ///   <summary>   
        ///   执行Sql文件   
        ///   </summary>   
        ///   <param   name="varFileName"></param>   
        ///   <returns></returns>   
        public bool ExecuteSqlFile(string varFileName)
        {
            if (!File.Exists(varFileName))
            {
                return false;
            }

            StreamReader sr = File.OpenText(varFileName);

            ArrayList alSql = new ArrayList();

            string commandText = "";

            string varLine = "";

            while (sr.Peek() > -1)
            {
                varLine = sr.ReadLine();
                if (varLine == "")
                {
                    continue;
                }
                if (varLine != "GO")
                {
                    commandText += varLine;
                    commandText += "\r\n";
                }
                else
                {
                    alSql.Add(commandText);
                    commandText = "";
                }
            }

            sr.Close();

            try
            {
                ExecuteCommand(alSql);
            }
            catch
            {
                return false;
            }

            return true;
        }
        private void ExecuteCommand(ArrayList varSqlList)
        {
            MyConnection.Open();
            SqlTransaction varTrans = MyConnection.BeginTransaction();

            SqlCommand command = new SqlCommand();
            command.Connection = MyConnection;
            command.Transaction = varTrans;

            try
            {
                foreach (string varcommandText in varSqlList)
                {
                    command.CommandText = varcommandText;
                    command.ExecuteNonQuery();
                }
                varTrans.Commit();
            }
            catch (Exception ex)
            {
                varTrans.Rollback();
                throw ex;
            }
            finally
            {
                MyConnection.Close();
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
                Common.Function.Alert("连接成功！");
            }
            catch
            {
                Common.Function.Alert("连接错误！");
            }
            finally
            {
                db.Close();
            }
        }

        protected void bt_Yes_Click(object sender, EventArgs e)
        {
            //ExecuteSqlFile(@"C:\Documents and Settings\Administrator\桌面\TMS.sql");
            if (ExecuteSqlFile(Server.MapPath("/Setup/Exam.sql")))
            {
                Response.Redirect("Setup1.aspx");
            }
            else
            {
                Common.Function.Alert("数据库还没准备好！");
            }
        }
    }
}