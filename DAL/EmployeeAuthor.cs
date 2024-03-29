﻿
using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Maticsoft.DBUtility;//Please add references
namespace Maticsoft.DAL
{
	/// <summary>
	/// 数据访问类:EmployeeAuthor
	/// </summary>
	public partial class EmployeeAuthor
	{
		public EmployeeAuthor()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSQL.GetMaxID("ID", "EmployeeAuthor"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int ID)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from EmployeeAuthor");
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
		public int Add(Maticsoft.Model.EmployeeAuthor model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into EmployeeAuthor(");
			strSql.Append("PaperID,PManageID,IsUsed,EmployeeID,CreateTime)");
			strSql.Append(" values (");
			strSql.Append("@PaperID,@PManageID,@IsUsed,@EmployeeID,@CreateTime)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@PaperID", SqlDbType.Int,4),
					new SqlParameter("@PManageID", SqlDbType.Int,4),
					new SqlParameter("@IsUsed", SqlDbType.Bit,1),
					new SqlParameter("@EmployeeID", SqlDbType.Int,4),
                    new SqlParameter("@CreateTime", SqlDbType.DateTime)
            };
			parameters[0].Value = model.PaperID;
			parameters[1].Value = model.PManageID;
			parameters[2].Value = model.IsUsed;
			parameters[3].Value = model.EmployeeID;
            parameters[4].Value = model.CreateTime;

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
		public bool Update(Maticsoft.Model.EmployeeAuthor model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update EmployeeAuthor set ");
			strSql.Append("PaperID=@PaperID,");
			strSql.Append("PManageID=@PManageID,");
			strSql.Append("IsUsed=@IsUsed,");
			strSql.Append("EmployeeID=@EmployeeID,");
            strSql.Append("CreateTime=@CreateTime");
            strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@PaperID", SqlDbType.Int,4),
					new SqlParameter("@PManageID", SqlDbType.Int,4),
					new SqlParameter("@IsUsed", SqlDbType.Bit,1),
					new SqlParameter("@EmployeeID", SqlDbType.Int,4),
                    new SqlParameter("@CreateTime", SqlDbType.DateTime),
                    new SqlParameter("@ID", SqlDbType.Int,4)
            };
			parameters[0].Value = model.PaperID;
			parameters[1].Value = model.PManageID;
			parameters[2].Value = model.IsUsed;
			parameters[3].Value = model.EmployeeID;
            parameters[4].Value = model.CreateTime;
            parameters[5].Value = model.ID;

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
			strSql.Append("delete from EmployeeAuthor ");
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
			strSql.Append("delete from EmployeeAuthor ");
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
		public Maticsoft.Model.EmployeeAuthor GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 ID,PaperID,PManageID,IsUsed,EmployeeID,CreateTime from EmployeeAuthor ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			Maticsoft.Model.EmployeeAuthor model=new Maticsoft.Model.EmployeeAuthor();
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
		public Maticsoft.Model.EmployeeAuthor DataRowToModel(DataRow row)
		{
			Maticsoft.Model.EmployeeAuthor model=new Maticsoft.Model.EmployeeAuthor();
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
				if(row["PManageID"]!=null && row["PManageID"].ToString()!="")
				{
					model.PManageID=int.Parse(row["PManageID"].ToString());
				}
				if(row["IsUsed"]!=null && row["IsUsed"].ToString()!="")
				{
					if((row["IsUsed"].ToString()=="1")||(row["IsUsed"].ToString().ToLower()=="true"))
					{
						model.IsUsed=true;
					}
					else
					{
						model.IsUsed=false;
					}
				}
				if(row["EmployeeID"]!=null && row["EmployeeID"].ToString()!="")
				{
					model.EmployeeID=int.Parse(row["EmployeeID"].ToString());
				}
                if (row["CreateTime"] != null && row["CreateTime"].ToString() != "")
                {
                    model.CreateTime = DateTime.Parse(row["CreateTime"].ToString());
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
			strSql.Append("select ID,PaperID,PManageID,IsUsed,EmployeeID,CreateTime ");
			strSql.Append(" FROM EmployeeAuthor ");
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
			strSql.Append(" ID,PaperID,PManageID,IsUsed,EmployeeID,CreateTime ");
			strSql.Append(" FROM EmployeeAuthor ");
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
			strSql.Append("select count(1) FROM EmployeeAuthor ");
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
			strSql.Append(")AS Row, T.*  from EmployeeAuthor T ");
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
			parameters[0].Value = "EmployeeAuthor";
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

