USE [ExaminationSystem]
GO
/****** Object:  Table [Exam].[HardInfo]    Script Date: 07/16/2009 11:11:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Exam].[HardInfo](
	[HostName] [nvarchar](500) NULL,
	[CpuID] [nvarchar](500) NULL,
	[HardDiskID] [nvarchar](500) NULL,
	[NetCardMAC] [nvarchar](500) NULL,
	[VolOf] [nvarchar](500) NULL,
	[NetCardIP] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Exam].[OptionsList]    Script Date: 07/16/2009 11:11:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Exam].[OptionsList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TitleListID] [int] NULL,
	[Name] [nvarchar](500) NULL,
	[T_F] [nvarchar](50) NULL,
 CONSTRAINT [PK_OptionsList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Exam].[Papers]    Script Date: 07/16/2009 11:11:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Exam].[Papers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Lock] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[CourseID] [int] NULL,
	[Type] [nvarchar](50) NULL,
	[ProgramID] [int] NULL,
	[Time] [nvarchar](50) NULL,
	[EndTime] [nvarchar](50) NULL,
	[isExamOne] [int] NULL,
 CONSTRAINT [PK_Papers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Exam].[PapersOptionsList]    Script Date: 07/16/2009 11:11:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Exam].[PapersOptionsList](
	[ID] [int] NULL,
	[TitleListID] [int] NULL,
	[Name] [nvarchar](500) NULL,
	[T_F] [nvarchar](50) NULL,
	[PapersID] [int] NULL,
	[Score] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Exam].[PapersTitleList]    Script Date: 07/16/2009 11:11:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Exam].[PapersTitleList](
	[ID] [int] NULL,
	[CourseID] [int] NULL,
	[Type] [nvarchar](50) NULL,
	[Title] [nvarchar](500) NULL,
	[T_F] [nvarchar](50) NULL,
	[Analysis] [text] NULL,
	[Score] [int] NULL,
	[PapersID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Exam].[Db]    Script Date: 07/16/2009 11:11:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Exam].[Db](
	[Server] [nvarchar](500) NULL,
	[Database] [nvarchar](500) NULL,
	[Password] [nvarchar](500) NULL,
	[Instance] [nvarchar](500) NULL,
	[Port] [nvarchar](500) NULL,
	[User] [nvarchar](500) NULL,
	[Key] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Exam].[Results]    Script Date: 07/16/2009 11:11:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Exam].[Results](
	[UserID] [int] NULL,
	[PapersID] [int] NULL,
	[TitleListID] [int] NULL,
	[Score] [int] NULL,
	[SysScore] [int] NULL,
	[Answer] [nvarchar](50) NULL,
	[TrueAnswer] [nvarchar](50) NULL,
	[Time] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Exam].[SystemInfo]    Script Date: 07/16/2009 11:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Exam].[SystemInfo](
	[HardInfo] [nvarchar](500) NULL,
	[UserSys] [nvarchar](500) NULL,
	[CourseSys] [nvarchar](500) NULL,
	[sPassword] [nvarchar](500) NULL,
	[Updata] [nvarchar](500) NULL,
	[UpdataUserSys] [nvarchar](500) NULL,
	[UpdataCourseSys] [nvarchar](500) NULL,
	[UpdataHardInfo] [nvarchar](500) NULL,
	[SN] [nvarchar](500) NULL,
	[UpdataSN] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Exam].[TitleList]    Script Date: 07/16/2009 11:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Exam].[TitleList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NULL,
	[Type] [nvarchar](50) NULL,
	[Title] [nvarchar](500) NULL,
	[T_F] [nvarchar](50) NULL,
	[Analysis] [text] NULL,
	[Extent] [nvarchar](50) NULL,
 CONSTRAINT [PK_TitleList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [Exam].[TitleList_Updata]    Script Date: 07/16/2009 11:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Exam].[TitleList_Updata]
	@ID int,
	@CourseID int,
	@Type nvarchar(50),
	@Title nvarchar(500),
	@T_F nvarchar(50),
	@Analysis text,
	@ReturnValue int output
AS
	update TitleList set
	[CourseID]=@CourseID,
	[Type]=@Type,
	[Title]=@Title,
	T_F=@T_F,
	[Analysis]=@Analysis
	where [ID]=@ID
	set @ReturnValue=@@ROWCOUNT
	return @ReturnValue
GO
/****** Object:  StoredProcedure [Exam].[TitleList_Del]    Script Date: 07/16/2009 11:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Exam].[TitleList_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists (Select [ID] From TitleList Where [ID]=@ID )
    begin
	Delete TitleList Where [ID]=@ID
	set @ReturnValue=@@ROWCOUNT
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [Exam].[TitleList_Add]    Script Date: 07/16/2009 11:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Exam].[TitleList_Add]
	@CourseID int,
	@Type nvarchar(50),
	@Title nvarchar(500),
	@T_F nvarchar(50),
	@Analysis text,
	@Extent nvarchar(50),
	@ReturnValue int output
AS
	INSERT INTO TitleList ([CourseID],[Type],[Title],T_F,[Analysis],[Extent])
	VALUES(@CourseID,@Type,@Title,@T_F,@Analysis,@Extent)
	set @ReturnValue=@@IDENTITY
	return @ReturnValue
GO
/****** Object:  StoredProcedure [Exam].[SystemInfo_Updata]    Script Date: 07/16/2009 11:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Exam].[SystemInfo_Updata]
	@HardInfo nvarchar(500),
	@UserSys nvarchar(500),
	@CourseSys nvarchar(500),
	@sPassword nvarchar(500),
	@Updata nvarchar(500),
	@UpdataUserSys nvarchar(500),
	@UpdataCourseSys nvarchar(500),
	@UpdataHardInfo nvarchar(500),
	@SN nvarchar(500),
	@UpdataSN nvarchar(500),
	@ReturnValue int output
AS
	update SystemInfo set
	[HardInfo]=@HardInfo,
	[UserSys]=@UserSys,
	[CourseSys]=@CourseSys,
	[sPassword]=@sPassword,
	[Updata]=@Updata,
	[UpdataUserSys]=@UpdataUserSys,
	[UpdataCourseSys]=@UpdataCourseSys,
	[UpdataHardInfo]=@UpdataHardInfo,
	[SN]=@SN,
	[UpdataSN]=@UpdataSN
	set @ReturnValue=@@ROWCOUNT
	return @ReturnValue
GO
/****** Object:  StoredProcedure [Exam].[SystemInfo_Add]    Script Date: 07/16/2009 11:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Exam].[SystemInfo_Add]
	@HardInfo nvarchar(500),
	@UserSys nvarchar(500),
	@CourseSys nvarchar(500),
	@sPassword nvarchar(500),
	@Updata nvarchar(500),
	@UpdataUserSys nvarchar(500),
	@UpdataCourseSys nvarchar(500),
	@UpdataHardInfo nvarchar(500),
	@SN nvarchar(500),
	@UpdataSN nvarchar(500),
	@ReturnValue int output
AS
	INSERT INTO SystemInfo ([HardInfo],[UserSys],[CourseSys],[sPassword],[Updata],[UpdataUserSys],[UpdataCourseSys],[UpdataHardInfo],[SN],[UpdataSN])
	VALUES(@HardInfo,@UserSys,@CourseSys,@sPassword,@Updata,@UpdataUserSys,@UpdataCourseSys,@UpdataHardInfo,@SN,@UpdataSN)
	set @ReturnValue=@@ROWCOUNT
	return @ReturnValue
GO
/****** Object:  StoredProcedure [Exam].[Results_Add]    Script Date: 07/16/2009 11:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Exam].[Results_Add]
	@UserID int,
	@PapersID int,
	@TitleListID int,
	@Answer nvarchar(50),
	@Time nvarchar(50),
	@ReturnValue int output
AS
	INSERT INTO [Results]([UserID],[PapersID],[TitleListID],[Answer],[Time])
	VALUES(@UserID,@PapersID,@TitleListID,@Answer,@Time)
	set @ReturnValue=@@ROWCOUNT
	return @ReturnValue
GO
/****** Object:  StoredProcedure [Exam].[PapersTitleList_Add]    Script Date: 07/16/2009 11:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Exam].[PapersTitleList_Add]
	@CourseID int,
	@Type nvarchar(50),
	@Title nvarchar(500),
	@T_F nvarchar(50),
	@Analysis text,
	@ID	int,
	@Score	int,
	@PapersID int,
	@ReturnValue int output
AS
	INSERT INTO PapersTitleList ([CourseID],[Type],[Title],T_F,[Analysis],[ID],[Score],[PapersID])
	VALUES(@CourseID,@Type,@Title,@T_F,@Analysis,@ID,@Score,@PapersID)
	set @ReturnValue=@@ROWCOUNT
	return @ReturnValue
GO
/****** Object:  StoredProcedure [Exam].[PapersOptionsList_Add]    Script Date: 07/16/2009 11:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Exam].[PapersOptionsList_Add]
	@ID int,
	@TitleListID int,
	@Name nvarchar(500),
	@T_F nvarchar(50),
	@PapersID int,
	@Score int,
	@ReturnValue int output
AS
	INSERT INTO PapersOptionsList (TitleListID,Name,T_F,ID,PapersID,Score)
	VALUES(@TitleListID,@Name,@T_F,@ID,@PapersID,@Score)
	set @ReturnValue=@@ROWCOUNT
	return @ReturnValue
GO
/****** Object:  StoredProcedure [Exam].[Papers_Updata]    Script Date: 07/16/2009 11:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Exam].[Papers_Updata]
	@Name nvarchar(50),
	@Lock int,
	@ID int,
	@ReturnValue int output
AS
	update Papers set
	[Lock]=@Lock,
	[Name]=@Name
	Where [ID]=@ID
	set @ReturnValue=@@ROWCOUNT
	return @ReturnValue
GO
/****** Object:  StoredProcedure [Exam].[Papers_Del]    Script Date: 07/16/2009 11:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Exam].[Papers_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists (Select [ID] From Papers Where [ID]=@ID )
    begin
	Delete [PapersOptionsList] Where [PapersID]=@ID
	Delete [PapersTitleList] Where [PapersID]=@ID
	Delete [Papers] Where [ID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [Exam].[Papers_Add]    Script Date: 07/16/2009 11:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Exam].[Papers_Add]
	@Name nvarchar(50),
	@CourseID int,
	@Type nvarchar(50),
	@ReturnValue int output
AS
	INSERT INTO Papers ([Name],[CourseID],[Type])
	VALUES(@Name,@CourseID,@Type)
	set @ReturnValue=@@IDENTITY
	return @ReturnValue
GO
/****** Object:  StoredProcedure [Exam].[OptionsList_Updata]    Script Date: 07/16/2009 11:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Exam].[OptionsList_Updata]
	@ID int,
	@TitleListID int,
	@Name nvarchar(500),
	@T_F nvarchar(50),
	@ReturnValue int output
AS
	update OptionsList set
	TitleListID=@TitleListID,
	[Name]=@Name,
	T_F=@T_F
	where [ID]=@ID
	set @ReturnValue=@@ROWCOUNT
	return @ReturnValue
GO
/****** Object:  StoredProcedure [Exam].[OptionsList_Del_TitleListID]    Script Date: 07/16/2009 11:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Exam].[OptionsList_Del_TitleListID]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists (Select [TitleListID] From OptionsList Where [TitleListID]=@ID )
    begin
	Delete OptionsList Where [TitleListID]=@ID
	set @ReturnValue=@@ROWCOUNT
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [Exam].[OptionsList_Del]    Script Date: 07/16/2009 11:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Exam].[OptionsList_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists (Select [ID] From OptionsList Where [ID]=@ID )
    begin
	Delete OptionsList Where [ID]=@ID
	set @ReturnValue=@@ROWCOUNT
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [Exam].[OptionsList_Add]    Script Date: 07/16/2009 11:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Exam].[OptionsList_Add]
	@TitleListID int,
	@Name nvarchar(500),
	@T_F nvarchar(50),
	@ReturnValue int output
AS
	INSERT INTO OptionsList (TitleListID,Name,T_F)
	VALUES(@TitleListID,@Name,@T_F)
	set @ReturnValue=@@ROWCOUNT
	return @ReturnValue
GO
/****** Object:  StoredProcedure [Exam].[HardInfo_Updata]    Script Date: 07/16/2009 11:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Exam].[HardInfo_Updata]
	@HostName nvarchar(500),
	@CpuID nvarchar(500),
	@HardDiskID nvarchar(500),
	@NetCardMAC nvarchar(500),
	@VolOf nvarchar(500),
	@NetCardIP nvarchar(500),
	@ReturnValue int output
AS
	update HardInfo set
	[HostName]=@HostName,
	[CpuID]=@CpuID,
	[HardDiskID]=@HardDiskID,
	[NetCardMAC]=@NetCardMAC,
	[VolOf]=@VolOf,
	[NetCardIP]=@NetCardIP
	set @ReturnValue=@@ROWCOUNT
	return @ReturnValue
GO
/****** Object:  StoredProcedure [Exam].[HardInfo_Add]    Script Date: 07/16/2009 11:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Exam].[HardInfo_Add]
	@HostName nvarchar(500),
	@CpuID nvarchar(500),
	@HardDiskID nvarchar(500),
	@NetCardMAC nvarchar(500),
	@VolOf nvarchar(500),
	@NetCardIP nvarchar(500),
	@ReturnValue int output
AS
	INSERT INTO HardInfo ([HostName],[CpuID],[HardDiskID],[NetCardMAC],[VolOf],[NetCardIP])
	VALUES(@HostName,@CpuID,@HardDiskID,@NetCardMAC,@VolOf,@NetCardIP)
	set @ReturnValue=@@ROWCOUNT
	return @ReturnValue
GO
/****** Object:  StoredProcedure [Exam].[Db_Updata]    Script Date: 07/16/2009 11:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Exam].[Db_Updata]
	@Server nvarchar(500),
	@Database nvarchar(500),
	@Password nvarchar(500),
	@Instance nvarchar(500),
	@Port nvarchar(500),
	@User nvarchar(500),
	@Key nvarchar(500),
	@ReturnValue int output
AS
	update [Db] set
	[Server]=@Server,
	[Database]=@Database,
	[Password]=@Password,
	[Instance]=@Instance,
	[Port]=@Port,
	[User]=@User
	Where [Key]=@Key
	set @ReturnValue=@@ROWCOUNT
	return @ReturnValue
GO
/****** Object:  StoredProcedure [Exam].[Db_Add]    Script Date: 07/16/2009 11:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Exam].[Db_Add]
	@Server nvarchar(500),
	@Database nvarchar(500),
	@Password nvarchar(500),
	@Instance nvarchar(500),
	@Port nvarchar(500),
	@User nvarchar(500),
	@Key nvarchar(500),
	@ReturnValue int output
AS
	INSERT INTO Db ([Server],[Database],[Password],[Instance],[Port],[User],[Key])
	VALUES(@Server,@Database,@Password,@Instance,@Port,@User,@Key)
	set @ReturnValue=@@ROWCOUNT
	return @ReturnValue
GO
/****** Object:  Default [DF_Papers_Lock]    Script Date: 07/16/2009 11:11:31 ******/
ALTER TABLE [Exam].[Papers] ADD  CONSTRAINT [DF_Papers_Lock]  DEFAULT ((0)) FOR [Lock]
GO
/****** Object:  Default [DF_Papers_ProgramID]    Script Date: 07/16/2009 11:11:31 ******/
ALTER TABLE [Exam].[Papers] ADD  CONSTRAINT [DF_Papers_ProgramID]  DEFAULT ((0)) FOR [ProgramID]
GO
/****** Object:  Default [DF_Papers_isExamOne]    Script Date: 07/16/2009 11:11:31 ******/
ALTER TABLE [Exam].[Papers] ADD  CONSTRAINT [DF_Papers_isExamOne]  DEFAULT ((0)) FOR [isExamOne]
GO
/****** Object:  Default [DF_PapersOptionsList_Score]    Script Date: 07/16/2009 11:11:31 ******/
ALTER TABLE [Exam].[PapersOptionsList] ADD  CONSTRAINT [DF_PapersOptionsList_Score]  DEFAULT ((0)) FOR [Score]
GO
