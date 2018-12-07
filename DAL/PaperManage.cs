
using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Maticsoft.DBUtility;//Please add references
namespace Maticsoft.DAL
{
	/// <summary>
	/// 数据访问类:PaperManage
	/// </summary>
	public partial class PaperManage
	{
		public PaperManage()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSQL.GetMaxID("ID", "PaperManage"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int ID)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from PaperManage");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			return DbHelperSQL.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(Maticsoft.Model.PaperManage model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into PaperManage(");
			strSql.Append("PaperID,CompanyID,StartTime,EndTime,AuthorUser,IsLongTime,Num,CreateDateTime,Title,Used,Assigned)");
			strSql.Append(" values (");
			strSql.Append("@PaperID,@CompanyID,@StartTime,@EndTime,@AuthorUser,@IsLongTime,@Num,@CreateDateTime,@Title,@Used,@Assigned)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@PaperID", SqlDbType.Int,4),
					new SqlParameter("@CompanyID", SqlDbType.Int,4),
					new SqlParameter("@StartTime", SqlDbType.DateTime),
					new SqlParameter("@EndTime", SqlDbType.DateTime),
					new SqlParameter("@AuthorUser", SqlDbType.VarChar,20),
					new SqlParameter("@IsLongTime", SqlDbType.Bit,1),
					new SqlParameter("@Num", SqlDbType.Int,4),
                    new SqlParameter("@CreateDateTime", SqlDbType.DateTime),
                    new SqlParameter("@Title", SqlDbType.VarChar,100),
                    new SqlParameter("@Used", SqlDbType.Int,4),
                    new SqlParameter("@Assigned", SqlDbType.Int,4),
            };
			parameters[0].Value = model.PaperID;
			parameters[1].Value = model.CompanyID;
			parameters[2].Value = model.StartTime;
			parameters[3].Value = model.EndTime;
			parameters[4].Value = model.AuthorUser;
			parameters[5].Value = model.IsLongTime;
			parameters[6].Value = model.Num;
            parameters[7].Value = model.CreateDateTime;
            parameters[8].Value = model.Title;
            parameters[9].Value = model.Used;
            parameters[10].Value = model.Assigned;

            object obj = DbHelperSQL.GetSingle(strSql.ToString(),parameters);
			if (obj == null)
			{
				return 0;
			}
			else
			{
				return Convert.ToInt32(obj);
			}
		}
		/// <summary>
		/// 更新一条数据
		/// </summary>
		public bool Update(Maticsoft.Model.PaperManage model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update PaperManage set ");
			strSql.Append("PaperID=@PaperID,");
			strSql.Append("CompanyID=@CompanyID,");
			strSql.Append("StartTime=@StartTime,");
			strSql.Append("EndTime=@EndTime,");
			strSql.Append("AuthorUser=@AuthorUser,");
			strSql.Append("IsLongTime=@IsLongTime,");
			strSql.Append("Num=@Num,");
            strSql.Append("CreateDateTime=@CreateDateTime,");
            strSql.Append("Title=@Title,");
            strSql.Append("Used=@Used,");
            strSql.Append("Assigned=@Assigned");
            strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@PaperID", SqlDbType.Int,4),
					new SqlParameter("@CompanyID", SqlDbType.Int,4),
					new SqlParameter("@StartTime", SqlDbType.DateTime),
					new SqlParameter("@EndTime", SqlDbType.DateTime),
					new SqlParameter("@AuthorUser", SqlDbType.VarChar,20),
					new SqlParameter("@IsLongTime", SqlDbType.Bit,1),
					new SqlParameter("@Num", SqlDbType.Int,4),
                    new SqlParameter("@CreateDateTime", SqlDbType.DateTime),
                    new SqlParameter("@Title", SqlDbType.VarChar,50),
                    new SqlParameter("@Used", SqlDbType.Int,4),
                    new SqlParameter("@Assigned", SqlDbType.Int,4),
                    new SqlParameter("@ID", SqlDbType.Int,4)
            };
			parameters[0].Value = model.PaperID;
			parameters[1].Value = model.CompanyID;
			parameters[2].Value = model.StartTime;
			parameters[3].Value = model.EndTime;
			parameters[4].Value = model.AuthorUser;
			parameters[5].Value = model.IsLongTime;
			parameters[6].Value = model.Num;
            parameters[7].Value = model.CreateDateTime;
            parameters[8].Value = model.Title;
            parameters[9].Value = model.Used;
            parameters[10].Value = model.Assigned;
            parameters[11].Value = model.ID;

			int rows=DbHelperSQL.ExecuteSql(strSql.ToString(),parameters);
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool Delete(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from PaperManage ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			int rows=DbHelperSQL.ExecuteSql(strSql.ToString(),parameters);
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		/// <summary>
		/// 批量删除数据
		/// </summary>
		public bool DeleteList(string IDlist )
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from PaperManage ");
			strSql.Append(" where ID in ("+IDlist + ")  ");
			int rows=DbHelperSQL.ExecuteSql(strSql.ToString());
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}


		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public Maticsoft.Model.PaperManage GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 ID,PaperID,CompanyID,StartTime,EndTime,AuthorUser,IsLongTime,Num,CreateDateTime,Title,Used,Assigned from PaperManage ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			Maticsoft.Model.PaperManage model=new Maticsoft.Model.PaperManage();
			DataSet ds=DbHelperSQL.Query(strSql.ToString(),parameters);
			if(ds.Tables[0].Rows.Count>0)
			{
				return DataRowToModel(ds.Tables[0].Rows[0]);
			}
			else
			{
				return null;
			}
		}


		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public Maticsoft.Model.PaperManage DataRowToModel(DataRow row)
		{
			Maticsoft.Model.PaperManage model=new Maticsoft.Model.PaperManage();
			if (row != null)
			{
				if(row["ID"]!=null && row["ID"].ToString()!="")
				{
					model.ID=int.Parse(row["ID"].ToString());
				}
				if(row["PaperID"]!=null && row["PaperID"].ToString()!="")
				{
					model.PaperID=int.Parse(row["PaperID"].ToString());
				}
				if(row["CompanyID"]!=null && row["CompanyID"].ToString()!="")
				{
					model.CompanyID=int.Parse(row["CompanyID"].ToString());
				}
				if(row["StartTime"]!=null && row["StartTime"].ToString()!="")
				{
					model.StartTime=DateTime.Parse(row["StartTime"].ToString());
				}
				if(row["EndTime"]!=null && row["EndTime"].ToString()!="")
				{
					model.EndTime=DateTime.Parse(row["EndTime"].ToString());
				}
				if(row["AuthorUser"]!=null)
				{
					model.AuthorUser=row["AuthorUser"].ToString();
				}
				if(row["IsLongTime"]!=null && row["IsLongTime"].ToString()!="")
				{
					if((row["IsLongTime"].ToString()=="1")||(row["IsLongTime"].ToString().ToLower()=="true"))
					{
						model.IsLongTime=true;
					}
					else
					{
						model.IsLongTime=false;
					}
				}
				if(row["Num"]!=null && row["Num"].ToString()!="")
				{
					model.Num=int.Parse(row["Num"].ToString());
				}
                if (row["CreateDateTime"] != null && row["CreateDateTime"].ToString() != "")
                {
                    model.CreateDateTime = DateTime.Parse(row["CreateDateTime"].ToString());
                }
                if (row["Title"] != null)
                {
                    model.Title = row["Title"].ToString();
                }
                if (row["Used"] != null && row["Used"].ToString() != "")
                {
                    model.Used = int.Parse(row["Used"].ToString());
                }
                if (row["Assigned"] != null && row["Assigned"].ToString() != "")
                {
                    model.Assigned = int.Parse(row["Assigned"].ToString());
                }


            }
			return model;
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select ID,PaperID,CompanyID,StartTime,EndTime,AuthorUser,IsLongTime,Num,CreateDateTime,Title,Used,Assigned ");
			strSql.Append(" FROM PaperManage ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			return DbHelperSQL.Query(strSql.ToString());
		}

		/// <summary>
		/// 获得前几行数据
		/// </summary>
		public DataSet GetList(int Top,string strWhere,string filedOrder)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select ");
			if(Top>0)
			{
				strSql.Append(" top "+Top.ToString());
			}
			strSql.Append(" ID,PaperID,CompanyID,StartTime,EndTime,AuthorUser,IsLongTime,Num,CreateDateTime,Title,Used,Assigned ");
			strSql.Append(" FROM PaperManage ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			strSql.Append(" order by " + filedOrder);
			return DbHelperSQL.Query(strSql.ToString());
		}

		/// <summary>
		/// 获取记录总数
		/// </summary>
		public int GetRecordCount(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) FROM PaperManage ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			object obj = DbHelperSQL.GetSingle(strSql.ToString());
			if (obj == null)
			{
				return 0;
			}
			else
			{
				return Convert.ToInt32(obj);
			}
		}
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public DataSet GetListByPage(string strWhere, string orderby, int startIndex, int endIndex)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("SELECT * FROM ( ");
			strSql.Append(" SELECT ROW_NUMBER() OVER (");
			if (!string.IsNullOrEmpty(orderby.Trim()))
			{
				strSql.Append("order by T." + orderby );
			}
			else
			{
				strSql.Append("order by T.ID desc");
			}
			strSql.Append(")AS Row, T.*  from PaperManage T ");
			if (!string.IsNullOrEmpty(strWhere.Trim()))
			{
				strSql.Append(" WHERE " + strWhere);
			}
			strSql.Append(" ) TT");
			strSql.AppendFormat(" WHERE TT.Row between {0} and {1}", startIndex, endIndex);
			return DbHelperSQL.Query(strSql.ToString());
		}

		/*
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public DataSet GetList(int PageSize,int PageIndex,string strWhere)
		{
			SqlParameter[] parameters = {
					new SqlParameter("@tblName", SqlDbType.VarChar, 255),
					new SqlParameter("@fldName", SqlDbType.VarChar, 255),
					new SqlParameter("@PageSize", SqlDbType.Int),
					new SqlParameter("@PageIndex", SqlDbType.Int),
					new SqlParameter("@IsReCount", SqlDbType.Bit),
					new SqlParameter("@OrderType", SqlDbType.Bit),
					new SqlParameter("@strWhere", SqlDbType.VarChar,1000),
					};
			parameters[0].Value = "PaperManage";
			parameters[1].Value = "ID";
			parameters[2].Value = PageSize;
			parameters[3].Value = PageIndex;
			parameters[4].Value = 0;
			parameters[5].Value = 0;
			parameters[6].Value = strWhere;	
			return DbHelperSQL.RunProcedure("UP_GetRecordByPage",parameters,"ds");
		}*/

		#endregion  BasicMethod
		#region  ExtensionMethod

		#endregion  ExtensionMethod
	}
}

