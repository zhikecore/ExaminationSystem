
using System;
namespace Maticsoft.Model
{
	/// <summary>
	/// EmployeeAuthor:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class EmployeeAuthor
	{
		public EmployeeAuthor()
		{}
		#region Model
		private int _id;
		private int? _paperid;
		private int? _pmanageid;
		private bool _isused;
		private int? _employeeid;
		/// <summary>
		/// 
		/// </summary>
		public int ID
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? PaperID
		{
			set{ _paperid=value;}
			get{return _paperid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? PManageID
		{
			set{ _pmanageid=value;}
			get{return _pmanageid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public bool IsUsed
		{
			set{ _isused=value;}
			get{return _isused;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? EmployeeID
		{
			set{ _employeeid=value;}
			get{return _employeeid;}
		}

        public DateTime CreateTime { get; set; }
        #endregion Model

    }
}

