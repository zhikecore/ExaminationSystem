
using System;
namespace Maticsoft.Model
{
	/// <summary>
	/// PaperManage:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class PaperManage
	{
		public PaperManage()
		{}
		#region Model
		private int _id;
		private int? _paperid;
		private int? _companyid;
		private DateTime? _starttime;
		private DateTime? _endtime;
		private string _authoruser;
		private bool _islongtime;
		private int? _num;
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
		public int? CompanyID
		{
			set{ _companyid=value;}
			get{return _companyid;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? StartTime
		{
			set{ _starttime=value;}
			get{return _starttime;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? EndTime
		{
			set{ _endtime=value;}
			get{return _endtime;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string AuthorUser
		{
			set{ _authoruser=value;}
			get{return _authoruser;}
		}
		/// <summary>
		/// 
		/// </summary>
		public bool IsLongTime
		{
			set{ _islongtime=value;}
			get{return _islongtime;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? Num
		{
			set{ _num=value;}
			get{return _num;}
		}
        #endregion Model

        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime CreateDateTime { get; set; }

        /// <summary>
        /// 授权名称
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// 已使用
        /// </summary>
        public int Used { get; set; }

        /// <summary>
        /// 已分配
        /// </summary>
        public int Assigned { get; set; }

    }
}

