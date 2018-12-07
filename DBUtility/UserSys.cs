using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DBUtility
{
    /// <summary>
    /// 用户系统
    /// </summary>
    public class UserSys
    {
        public UserSys()
        { }
        /// <summary>
        /// 连接语句
        /// </summary>
        /// <returns></returns>
        private static string strSqlConnection()
        {
            //BLL.Db bll = new BLL.Db();
            //List<Model.Db> list = new List<Model.Db>();
            //list = bll.GetList("UserSys");
            ////server=127.0.0.1\MSSQLSERVER,1433;database=ExaminationSystem;User ID=elearning;password=elearning;
            //string Str = "server=" + list[0].Server + "\\" + list[0].Instance + "," + list[0].Port + ";database=" + list[0].Database + ";User ID=" + list[0].User + ";password=" + list[0].Password + ";";

            //////调试时使用
            string Str = ConfigurationSettings.AppSettings["YunZhiSys"];

            return Str;

            ///return ConfigurationSettings.AppSettings["ExaminationSystem"];
        }

        public static string connectionString = strSqlConnection();
        public static SqlConnection sql()
        {
            SqlConnection db = new SqlConnection(strSqlConnection());
            db.Open();
            return db;
        }
        /// <summary>
        ///执行SQL语句
        /// </summary>
        /// <param name="str">SQL语句</param>
        public static void non(string str)
        {
            SqlConnection sql = ExamSys.sql();
            SqlCommand cmd = new SqlCommand(str, sql);
            cmd.ExecuteNonQuery();
            sql.Close();
        }
        /// <summary>
        /// 返回DataTable集
        /// </summary>
        /// <param name="str">SQL语句</param>
        /// <returns></returns>
        public static DataTable gettb(string str)
        {
            SqlConnection sql = ExamSys.sql();
            SqlDataAdapter sda = new SqlDataAdapter(str, sql);
            DataSet dbds = new DataSet();
            sda.Fill(dbds);
            sql.Close();
            return dbds.Tables[0];
        }
        public static int RunProcedure(string storedProcName, IDataParameter[] parameters, out int rowsAffected)
        {

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                int result;
                connection.Open();
                SqlCommand command = BuildIntCommand(connection, storedProcName, parameters);
                rowsAffected = command.ExecuteNonQuery();
                result = (int)command.Parameters["ReturnValue"].Value;
                connection.Close();
                return result;
            }
        }
        private static SqlCommand BuildIntCommand(SqlConnection connection, string storedProcName, IDataParameter[] parameters)
        {
            SqlCommand command = BuildQueryCommand(connection, storedProcName, parameters);
            command.Parameters.Add(new SqlParameter("ReturnValue", SqlDbType.Int, 4, ParameterDirection.ReturnValue, false, 0, 0, string.Empty, DataRowVersion.Default, null));
            return command;
        }
        private static SqlCommand BuildQueryCommand(SqlConnection connection, string storedProcName, IDataParameter[] parameters)
        {
            SqlCommand command = new SqlCommand(storedProcName, connection);
            command.CommandType = CommandType.StoredProcedure;
            foreach (SqlParameter parameter in parameters)
            {
                if (parameter != null)
                {
                    // 检查未分配值的输出参数,将其分配以DBNull.Value.
                    if ((parameter.Direction == ParameterDirection.InputOutput || parameter.Direction == ParameterDirection.Input) && (parameter.Value == null))
                    {
                        parameter.Value = DBNull.Value;
                    }
                    command.Parameters.Add(parameter);
                }
            }
            return command;
        }
        public static SqlDataReader RunProcedure(string storedProcName, IDataParameter[] parameters)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlDataReader returnReader;
            try
            {
                connection.Open();
                SqlCommand command = BuildQueryCommand(connection, storedProcName, parameters);
                command.CommandType = CommandType.StoredProcedure;
                returnReader = command.ExecuteReader(CommandBehavior.CloseConnection);
                return returnReader;
            }
            catch
            {
                connection.Close();
                throw;
            }
        }
        /// <summary>
        /// 执行查询语句，返回SqlDataReader ( 注意：使用后一定要对SqlDataReader进行Close )
        /// </summary>
        /// <param name="strSQL">查询语句</param>
        /// <returns>SqlDataReader</returns>
        public static SqlDataReader ExecuteReader(string SQLString, params SqlParameter[] cmdParms)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand();
            try
            {
                PrepareCommand(cmd, connection, null, SQLString, cmdParms);
                SqlDataReader myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                cmd.Parameters.Clear();
                return myReader;
            }
            catch (System.Data.SqlClient.SqlException e)
            {
                cmd.Dispose();
                connection.Close();
                throw new Exception(e.Message);
            }


        }
        private static void PrepareCommand(SqlCommand cmd, SqlConnection conn, SqlTransaction trans, string cmdText, SqlParameter[] cmdParms)
        {
            if (conn.State != ConnectionState.Open)
                conn.Open();
            cmd.Connection = conn;
            cmd.CommandText = cmdText;
            if (trans != null)
                cmd.Transaction = trans;
            cmd.CommandType = CommandType.Text;//cmdType;
            if (cmdParms != null)
            {


                foreach (SqlParameter parameter in cmdParms)
                {
                    if ((parameter.Direction == ParameterDirection.InputOutput || parameter.Direction == ParameterDirection.Input) &&
                        (parameter.Value == null))
                    {
                        parameter.Value = DBNull.Value;
                    }
                    cmd.Parameters.Add(parameter);
                }
            }
        }
    }
}
