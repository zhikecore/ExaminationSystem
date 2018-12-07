
using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Maticsoft.DBUtility;//Please add references
namespace Maticsoft.DAL
{
	/// <summary>
	/// 数据访问类:Company
	/// </summary>
	public partial class Company
	{
		public Company()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSQL.GetMaxID("ID", "Company"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int ID)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from Company");
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
		public int Add(Maticsoft.Model.Company model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into Company(");
			strSql.Append("Name,Website,Address,Tel,Industry,EnterpriseType,Principal,CreateTime,obj_ID)");
			strSql.Append(" values (");
			strSql.Append("@Name,@Website,@Address,@Tel,@Industry,@EnterpriseType,@Principal,@CreateTime,@obj_ID)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@Name", SqlDbType.VarChar,20),
					new SqlParameter("@Website", SqlDbType.VarChar,20),
					new SqlParameter("@Address", SqlDbType.VarChar,50),
					new SqlParameter("@Tel", SqlDbType.VarChar,20),
					new SqlParameter("@Industry", SqlDbType.VarChar,20),
					new SqlParameter("@EnterpriseType", SqlDbType.VarChar,20),
					new SqlParameter("@Principal", SqlDbType.VarChar,20),
					new SqlParameter("@CreateTime", SqlDbType.DateTime),
                    new SqlParameter("@obj_ID",SqlDbType.Int,4)
            };
			parameters[0].Value = model.Name;
			parameters[1].Value = model.Website;
			parameters[2].Value = model.Address;
			parameters[3].Value = model.Tel;
			parameters[4].Value = model.Industry;
			parameters[5].Value = model.EnterpriseType;
			parameters[6].Value = model.Principal;
			parameters[7].Value = model.CreateTime;
            parameters[8].Value = model.obj_ID;

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
		public bool Update(Maticsoft.Model.Company model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update Company set ");
			strSql.Append("Name=@Name,");
			strSql.Append("Website=@Website,");
			strSql.Append("Address=@Address,");
			strSql.Append("Tel=@Tel,");
			strSql.Append("Industry=@Industry,");
			strSql.Append("EnterpriseType=@EnterpriseType,");
			strSql.Append("Principal=@Principal,");
			strSql.Append("CreateTime=@CreateTime,");
            strSql.Append("obj_ID=@obj_ID");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@Name", SqlDbType.VarChar,20),
					new SqlParameter("@Website", SqlDbType.VarChar,20),
					new SqlParameter("@Address", SqlDbType.VarChar,50),
					new SqlParameter("@Tel", SqlDbType.VarChar,20),
					new SqlParameter("@Industry", SqlDbType.VarChar,20),
					new SqlParameter("@EnterpriseType", SqlDbType.VarChar,20),
					new SqlParameter("@Principal", SqlDbType.VarChar,20),
					new SqlParameter("@CreateTime", SqlDbType.DateTime),
                    new SqlParameter("@obj_ID", SqlDbType.DateTime),
                    new SqlParameter("@ID", SqlDbType.Int,4)};
			parameters[0].Value = model.Name;
			parameters[1].Value = model.Website;
			parameters[2].Value = model.Address;
			parameters[3].Value = model.Tel;
			parameters[4].Value = model.Industry;
			parameters[5].Value = model.EnterpriseType;
			parameters[6].Value = model.Principal;
			parameters[7].Value = model.CreateTime;
            parameters[8].Value = model.obj_ID;
            parameters[9].Value = model.ID;

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
			strSql.Append("delete from Company ");
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
			strSql.Append("delete from Company ");
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
		public Maticsoft.Model.Company GetModel(int ID)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 ID,Name,Website,Address,Tel,Industry,EnterpriseType,Principal,CreateTime,obj_ID from Company ");
			strSql.Append(" where ID=@ID");
			SqlParameter[] parameters = {
					new SqlParameter("@ID", SqlDbType.Int,4)
			};
			parameters[0].Value = ID;

			Maticsoft.Model.Company model=new Maticsoft.Model.Company();
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
		public Maticsoft.Model.Company DataRowToModel(DataRow row)
		{
			Maticsoft.Model.Company model=new Maticsoft.Model.Company();
			if (row != null)
			{
				if(row["ID"]!=null && row["ID"].ToString()!="")
				{
					model.ID=int.Parse(row["ID"].ToString());
				}
				if(row["Name"]!=null)
				{
					model.Name=row["Name"].ToString();
				}
				if(row["Website"]!=null)
				{
					model.Website=row["Website"].ToString();
				}
				if(row["Address"]!=null)
				{
					model.Address=row["Address"].ToString();
				}
				if(row["Tel"]!=null)
				{
					model.Tel=row["Tel"].ToString();
				}
				if(row["Industry"]!=null)
				{
					model.Industry=row["Industry"].ToString();
				}
				if(row["EnterpriseType"]!=null)
				{
					model.EnterpriseType=row["EnterpriseType"].ToString();
				}
				if(row["Principal"]!=null)
				{
					model.Principal=row["Principal"].ToString();
				}
				if(row["CreateTime"]!=null && row["CreateTime"].ToString()!="")
				{
					model.CreateTime=DateTime.Parse(row["CreateTime"].ToString());
				}
                if (row["obj_ID"] != null && row["obj_ID"].ToString() != "")
                {
                    model.obj_ID = int.Parse(row["obj_ID"].ToString());
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
			strSql.Append("select ID,Name,Website,Address,Tel,Industry,EnterpriseType,Principal,CreateTime,obj_ID ");
			strSql.Append(" FROM Company ");
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
			strSql.Append(" ID,Name,Website,Address,Tel,Industry,EnterpriseType,Principal,CreateTime,obj_ID ");
			strSql.Append(" FROM Company ");
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
			strSql.Append("select count(1) FROM Company ");
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
			strSql.Append(")AS Row, T.*  from Company T ");
			if (!string.IsNullOrEmpty(strWhere.Trim()))
			{
				strSql.Append(" WHERE " + strWhere);
			}
			strSql.Append(" ) TT");
			strSql.AppendFormat(" WHERE TT.Row between {0} and {1}", startIndex, endIndex);
			return DbHelperSQL.Query(strSql.ToString());
		}

        /// <summary>
		/// 分页获取数据列表
		/// </summary>
		public DataSet GetListByPage(string strWhere, string orderby, int pageSize, int pageIndex, out int recordCount)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select * FROM Company");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            recordCount = Convert.ToInt32(DbHelperSQL.GetSingle(Common.PagingHelper.CreateCountingSql(strSql.ToString())));
            return DbHelperSQL.Query(Common.PagingHelper.CreatePagingSql(recordCount, pageSize, pageIndex, strSql.ToString(), orderby));
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
			parameters[0].Value = "Company";
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

