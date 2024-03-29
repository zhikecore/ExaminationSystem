USE [TMS]
GO
/****** Object:  Table [TMS].[Assessment]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[Assessment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LecturerID] [int] NULL,
	[TrainingID] [int] NULL,
	[CourseID] [int] NULL,
	[Hours] [nvarchar](50) NULL,
	[Date] [nvarchar](50) NULL,
	[Total] [int] NULL,
	[Text] [text] NULL,
	[STime] [nvarchar](50) NULL,
	[ETime] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[AssessmentOptionsList]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[AssessmentOptionsList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AssessmentTitleListID] [int] NULL,
	[Name] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TMS].[AssessmentTest]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[AssessmentTest](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AssessmentID] [int] NULL,
	[AssessmentTitleListID] [int] NULL,
	[AssessmentOptionsList] [int] NULL,
	[UsersID] [int] NULL,
	[Name] [nvarchar](500) NULL,
	[TestDate] [nvarchar](50) NULL,
 CONSTRAINT [PK_AssessmentTest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [TMS].[AssessmentTitleList]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[AssessmentTitleList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AssessmentID] [int] NULL,
	[Type] [nvarchar](50) NULL,
	[MTitle] [nvarchar](500) NULL,
	[DTitle] [nvarchar](500) NULL,
	[PTitle] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TMS].[Budget]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[Budget](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProgramID] [int] NULL,
	[CourseID] [int] NULL,
	[Money] [int] NULL,
	[Total] [int] NULL,
	[Title] [nvarchar](50) NULL,
	[UserID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TMS].[Cantbe]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[Cantbe](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [text] NULL,
	[GroupID] [int] NULL,
	[UsersID] [int] NULL,
	[OrganizationStructure] [int] NULL,
	[CourseLb] [int] NULL,
	[Position] [int] NULL,
	[Staff] [int] NULL,
	[News] [int] NULL,
	[Module] [int] NULL,
	[sGroup] [int] NULL,
	[Notice] [int] NULL,
	[MyInformation] [int] NULL,
	[PersonalData] [int] NULL,
	[TrainingNeeds] [int] NULL,
	[TrainingProgram] [int] NULL,
	[CurriculumStudy] [int] NULL,
	[TrainingRecords] [int] NULL,
	[CaseStudy] [int] NULL,
	[QuestionnaireSurvey] [int] NULL,
	[Examination] [int] NULL,
	[EvaluationCenter] [int] NULL,
	[Assessment] [int] NULL,
	[ApplicationsForTraining] [int] NULL,
	[CaseShare] [int] NULL,
	[TrainingForum] [int] NULL,
	[AskYour] [int] NULL,
	[MySuggestion] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[ClassAttendance]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[ClassAttendance](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NULL,
	[AddUsersID] [int] NULL,
	[AddTime] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Text] [text] NULL,
	[Remarks] [text] NULL,
	[Total] [int] NULL,
	[nTotal] [int] NULL,
	[yTotal] [int] NULL,
	[URL] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[ClassEvaluation]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[ClassEvaluation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NULL,
	[AddUsersID] [int] NULL,
	[AddTime] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Text] [text] NULL,
	[Remarks] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[ClassNotice]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[ClassNotice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NULL,
	[AddUsersID] [int] NULL,
	[AddTime] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Text] [text] NULL,
	[Remarks] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[ClassQuestionnaire]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[ClassQuestionnaire](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NULL,
	[AddUsersID] [int] NULL,
	[AddTime] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Text] [text] NULL,
	[Remarks] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[Contact]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SuppliersID] [int] NULL,
	[cnName] [nvarchar](50) NULL,
	[enName] [nvarchar](50) NULL,
	[Sex] [nvarchar](50) NULL,
	[isPosition] [nvarchar](50) NULL,
	[Position] [nvarchar](50) NULL,
	[Birthday] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[IDCard] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Extension] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Remarks] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[CooperationRecord]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[CooperationRecord](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ObjectID] [int] NULL,
	[UsersID] [int] NULL,
	[StartTime] [nvarchar](50) NULL,
	[EndTime] [nvarchar](50) NULL,
	[AddTime] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Reasons] [text] NULL,
	[Results] [text] NULL,
	[Remarks] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[Course]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[Course](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseLbID] [int] NULL,
	[Type] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[Abstract] [nvarchar](500) NULL,
	[Outline] [text] NULL,
	[Credit] [int] NULL,
	[Money] [int] NULL,
	[Open] [int] NULL,
	[Target] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[CourseLb]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[CourseLb](
	[ID] [int] IDENTITY(101,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [text] NULL,
	[Up] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[Group]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[Group](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[Lecturer]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[Lecturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseLbID] [int] NULL,
	[Type] [nvarchar](50) NULL,
	[cnName] [nvarchar](50) NULL,
	[enName] [nvarchar](50) NULL,
	[Expertise] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](50) NULL,
	[Resume] [text] NULL,
	[Remarks] [text] NULL,
	[RemarksURL] [nvarchar](50) NULL,
	[Money] [int] NULL,
	[SuppliersID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[Materials]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[Materials](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NULL,
	[Type] [nvarchar](50) NULL,
	[URL] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TMS].[Message]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[Message](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NewsID] [int] NULL,
	[StaffID] [int] NULL,
	[Text] [text] NULL,
	[Reply] [text] NULL,
	[ReplyID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[News]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[News](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NewsLbID] [int] NULL,
	[Title] [nvarchar](50) NULL,
	[Keyword] [nvarchar](50) NULL,
	[PubTime] [nvarchar](50) NULL,
	[StaffID] [int] NULL,
	[View] [int] NULL,
	[Abstract] [nvarchar](500) NULL,
	[Image] [nvarchar](50) NULL,
	[Text] [text] NULL,
	[Annex] [nvarchar](50) NULL,
	[Remarks] [nvarchar](500) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[mytest]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[mytest](
	[Title] [nvarchar](50) NULL,
	[StartTime] [nvarchar](50) NULL,
	[EndTime] [nvarchar](50) NULL,
	[CourseID] [int] NULL,
	[CourseTitle] [nvarchar](50) NULL,
	[LecturerID] [int] NULL,
	[cnName] [nvarchar](50) NULL,
	[enName] [nvarchar](50) NULL,
	[ClassID] [int] NOT NULL,
	[ClassName] [nvarchar](50) NULL,
	[UsersID] [int] NULL,
	[State] [nvarchar](50) NULL,
	[ProgramID] [int] NOT NULL,
	[Credit] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TMS].[NewsLb]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[NewsLb](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TMS].[Module]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[Module](
	[News] [nvarchar](50) NULL,
	[Notice] [nvarchar](50) NULL,
	[MyInformation] [nvarchar](50) NULL,
	[PersonalData] [nvarchar](50) NULL,
	[TrainingNeeds] [nvarchar](50) NULL,
	[TrainingProgram] [nvarchar](50) NULL,
	[CurriculumStudy] [nvarchar](50) NULL,
	[TrainingRecords] [nvarchar](50) NULL,
	[CaseStudy] [nvarchar](50) NULL,
	[QuestionnaireSurvey] [nvarchar](50) NULL,
	[Examination] [nvarchar](50) NULL,
	[EvaluationCenter] [nvarchar](50) NULL,
	[Assessment] [nvarchar](50) NULL,
	[ApplicationsForTraining] [nvarchar](50) NULL,
	[CaseShare] [nvarchar](50) NULL,
	[TrainingForum] [nvarchar](50) NULL,
	[AskYour] [nvarchar](50) NULL,
	[MySuggestion] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TMS].[OrganizationStructure]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[OrganizationStructure](
	[ID] [int] IDENTITY(101,1) NOT NULL,
	[cnName] [nvarchar](50) NULL,
	[enName] [nvarchar](50) NULL,
	[Up] [int] NULL,
	[Text] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[Position]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[Position](
	[ID] [int] IDENTITY(101,1) NOT NULL,
	[OrganizationStructureID] [int] NULL,
	[Title] [nvarchar](50) NULL,
	[PostCode] [nvarchar](50) NULL,
	[Rank] [nvarchar](50) NULL,
	[Department] [nvarchar](50) NULL,
	[Complier] [nvarchar](50) NULL,
	[VerifierDe] [nvarchar](50) NULL,
	[VerifierHr] [nvarchar](50) NULL,
	[ApprovedBy] [nvarchar](50) NULL,
	[ApprovedDate] [nvarchar](50) NULL,
	[ImmediateBoss] [nvarchar](50) NULL,
	[NumberOfDirectAndIndirectSubordinates] [nvarchar](50) NULL,
	[CategoriesOfDirectAndIndirectSubordinates] [nvarchar](50) NULL,
	[MajorInternalClients] [nvarchar](50) NULL,
	[MajorExternalClients] [nvarchar](50) NULL,
	[OutlineOfThePosition] [text] NULL,
	[Workplace] [nvarchar](50) NULL,
	[OccupationalSafety] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[PeopleJoin]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[PeopleJoin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UsersID] [int] NULL,
	[CourseLbID] [int] NULL,
	[CourseID] [int] NULL,
	[JoinDate] [nvarchar](50) NULL,
	[IsPass] [nvarchar](50) NULL,
	[Tpye] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[P_DelAllUserTableData]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROC   [dbo].[P_DelAllUserTableData]   
  as   
  Begin   
  declare   @name   varchar(20)   
  Declare   Cur   Cursor   For     
            select   Name   from   sysobjects   where   xtype='u'   and   status>=0   and   Name   like   '%WQ_%'   
  declare   @SQL   Varchar(20)   
  Open   Cur     
  Fetch   Cur   Into   @name   
  While   @@FETCH_STATUS=0   
                    BEGIN   
                                  Set   @sql='DELETE   '+@name+''   
  Exec(@sql)   
                                  Fetch   Cur   Into   @name   
                    End   
  Close   Cur   
  Deallocate   cur   
  End
GO
/****** Object:  Table [TMS].[PositionDIY]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[PositionDIY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Text] [text] NULL,
	[PositionID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[PositionItemsOfAssessment]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[PositionItemsOfAssessment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PositionID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[pp1Name] [text] NULL,
	[pp2Name] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[PositionJobResponsibilities]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[PositionJobResponsibilities](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PrimaryResponsibilities] [nvarchar](50) NULL,
	[Independence] [nvarchar](50) NULL,
	[Frequency] [nvarchar](50) NULL,
	[PositionID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TMS].[PositionBasicKnowledge]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[PositionBasicKnowledge](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PositionID] [int] NULL,
	[CourseID] [int] NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TMS].[PositionPermissions]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[PositionPermissions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PositionID] [int] NULL,
	[Text] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[PositionQualification]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[PositionQualification](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PositionID] [int] NULL,
	[Age] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[MinimumAcademicRequirements] [nvarchar](50) NULL,
	[MinimumPositionalTitle] [nvarchar](50) NULL,
	[MajorRequirement] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[PositionQualificationProfessionalKnowledgeAndSkills]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[PositionQualificationProfessionalKnowledgeAndSkills](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PositionID] [int] NULL,
	[CourseID] [int] NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TMS].[PositionQualificationWorkAbilities]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[PositionQualificationWorkAbilities](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PositionID] [int] NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TMS].[PositionQualificationWorkExperience]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[PositionQualificationWorkExperience](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PositionID] [int] NULL,
	[WorkExperienceAll] [nvarchar](50) NULL,
	[WorkExperienceProfessional] [nvarchar](50) NULL,
	[WorkExperienceOther] [nvarchar](50) NULL,
	[WorkExperienceText] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[PositionTrainingCoursesThatRequired]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[PositionTrainingCoursesThatRequired](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PositionID] [int] NULL,
	[CourseID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TMS].[PositionPromotion]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[PositionPromotion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PositionID] [int] NULL,
	[CourseID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TMS].[QCModel]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[QCModel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QCModelLbID] [int] NULL,
	[Name] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TMS].[QCModelForCourse]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[QCModelForCourse](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QCModelID] [int] NULL,
	[CourseID] [int] NULL,
	[QCModelLbID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TMS].[QCModelLb]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[QCModelLb](
	[ID] [int] IDENTITY(101,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [text] NULL,
	[Up] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[Staff]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[Staff](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Group] [int] NULL,
	[cnName] [nvarchar](50) NULL,
	[enName] [nvarchar](50) NULL,
	[MemberCode] [nvarchar](50) NULL,
	[PositionCode] [nvarchar](50) NULL,
	[Sex] [nvarchar](50) NULL,
	[LoginName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Company] [nvarchar](50) NULL,
	[Department] [nvarchar](50) NULL,
	[Position] [nvarchar](50) NULL,
	[Boss] [nvarchar](50) NULL,
	[isPosition] [nvarchar](50) NULL,
	[TimePosition] [nvarchar](50) NULL,
	[LayerPosition] [nvarchar](50) NULL,
	[Birthday] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[IDCard] [nvarchar](50) NULL,
	[FriendName] [nvarchar](50) NULL,
	[FriendPhone] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Extension] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[UsersType] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TMS].[Schedule]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[Schedule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[ProgramID] [int] NULL,
	[Program] [int] NULL,
	[Lecturer] [int] NULL,
	[Venues] [int] NULL,
	[Class] [int] NULL,
	[Notice] [int] NULL,
	[Questionnaire] [int] NULL,
	[Papers] [int] NULL,
	[Assessment] [int] NULL,
	[Budget] [int] NULL,
	[Record] [int] NULL,
	[Complete] [int] NULL,
	[CourseID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TMS].[TrainingApplication]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[TrainingApplication](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UsersIDApplication] [int] NULL,
	[UsersIDManager] [int] NULL,
	[UsersIDHr] [int] NULL,
	[CourseID] [int] NULL,
	[CourseLbID] [int] NULL,
	[Title] [nvarchar](50) NULL,
	[TimeApplication] [nvarchar](50) NULL,
	[TimeManager] [nvarchar](50) NULL,
	[TimeHr] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[AcuteOrRelief] [nvarchar](50) NULL,
	[ReasonApplication] [text] NULL,
	[ReasonAgreeManager] [text] NULL,
	[ReasonDenyManager] [text] NULL,
	[ReasonAgreeHr] [text] NULL,
	[ReasonDenyHr] [text] NULL,
	[Remarks] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[tempAddProgramUsers]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[tempAddProgramUsers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NULL,
	[UsersCount] [int] NULL,
	[Maybe] [nvarchar](50) NULL,
	[CourseLbID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TMS].[tempAddProgram]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[tempAddProgram](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LbID] [int] NULL,
	[Future] [nvarchar](50) NULL,
	[Count] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TMS].[SysInfo]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[SysInfo](
	[IsPinyin] [int] NULL,
	[CantbeOrganizationStructure] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TMS].[Suppliers]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[Suppliers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Grade] [nvarchar](500) NULL,
	[Established] [nvarchar](500) NULL,
	[Address] [nvarchar](500) NULL,
	[Nature] [nvarchar](500) NULL,
	[Scale] [nvarchar](500) NULL,
	[FullTimeLecturers] [nvarchar](500) NULL,
	[ExternalLecturers] [nvarchar](500) NULL,
	[BrandProducts] [nvarchar](500) NULL,
	[BrandConsultant] [nvarchar](500) NULL,
	[BusinessScope] [nvarchar](500) NULL,
	[Advantage] [nvarchar](500) NULL,
	[CooperativePosit] [nvarchar](500) NULL,
	[CollaboratedWithTheTypicalCustomer] [nvarchar](500) NULL,
	[AreasOfExpertise] [nvarchar](500) NULL,
	[Price] [nvarchar](500) NULL,
	[SpecialService] [nvarchar](500) NULL,
	[Remarks] [nvarchar](500) NULL,
	[Total] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TMS].[TrainingClass]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[TrainingClass](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UsersID] [int] NULL,
	[Total] [int] NULL,
	[ObjectID] [int] NULL,
	[Remarks] [text] NULL,
	[Title] [nvarchar](50) NULL,
	[Money] [int] NULL,
	[CourseName] [nvarchar](50) NULL,
	[AddTime] [nvarchar](50) NULL,
	[ProgramID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[TrainingMoney]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[TrainingMoney](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TrainingID] [int] NULL,
	[LecturerID] [int] NULL,
	[VenuesID] [int] NULL,
	[CourseID] [int] NULL,
	[ClassID] [int] NULL,
	[Other] [int] NULL,
	[Total] [int] NULL,
	[UsersID] [int] NULL,
	[Remarks] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[TrainingClassUsers]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[TrainingClassUsers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UsersID] [int] NULL,
	[ClassID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TMS].[TrainingProgram]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[TrainingProgram](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NULL,
	[LecturerID] [int] NULL,
	[Total] [int] NULL,
	[UsersID] [int] NULL,
	[VenuesID] [int] NULL,
	[Object] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[StartTime] [nvarchar](50) NULL,
	[EndTime] [nvarchar](50) NULL,
	[AddTime] [nvarchar](50) NULL,
	[Reasons] [text] NULL,
	[Request] [text] NULL,
	[Remarks] [text] NULL,
	[OrganizationStructureID] [int] NULL,
	[PositionID] [int] NULL,
	[State] [nvarchar](50) NULL,
	[ClassCount] [int] NULL,
	[Time] [nvarchar](50) NULL,
	[s_Time] [nvarchar](50) NULL,
	[Money] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [TMS].[TrainingProgramUsers]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[TrainingProgramUsers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UsersID] [int] NULL,
	[ObjectID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [TMS].[Venues]    Script Date: 07/16/2009 11:10:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TMS].[Venues](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Area] [nvarchar](50) NULL,
	[Picture] [nvarchar](50) NULL,
	[Total] [nvarchar](50) NULL,
	[Remarks] [text] NULL,
	[Money] [int] NULL,
	[SuppliersID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [TMS].[Venues_Del]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Venues_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists (Select [ID] From [Venues] Where [ID]=@ID )
    begin
	Delete [Venues] Where [ID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Venues_Add]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Venues_Add]
	@Money int,
	@Type nvarchar(50),
	@Name nvarchar(50),
	@Address nvarchar(50),
	@Area nvarchar(50),
	@Picture nvarchar(50),
	@Total nvarchar(50),
	@Remarks text,
	@SuppliersID int,
	@ReturnValue int output
AS
	INSERT INTO [Venues] ([SuppliersID],[Money],[Type],[Name],[Address],[Area],[Picture],[Total],[Remarks])
	VALUES(@SuppliersID,@Money,@Type,@Name,@Address,@Area,@Picture,@Total,@Remarks)
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[TrainingProgramUsers_Add]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[TrainingProgramUsers_Add]
	@UsersID int,
	@ObjectID int,
	@ReturnValue int output
AS

if exists (Select [UsersID] From [TrainingProgramUsers] Where [UsersID]=@UsersID and [ObjectID]=@ObjectID)
	begin
	set @ReturnValue=0
	end
else
	if (Select [State] From [TrainingProgram] Where [ID]=@ObjectID )!='接受报名'
		begin
		set @ReturnValue=2
		end
	else
		begin
		INSERT INTO [TrainingProgramUsers] ([UsersID],[ObjectID])
		VALUES(@UsersID,@ObjectID)
		INSERT INTO [TrainingClassUsers] ([UsersID],[ClassID])
		VALUES(@UsersID,@ObjectID)
		set @ReturnValue=1
		end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[TrainingProgram_Updata]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[TrainingProgram_Updata]
	@ID int,
	@CourseID int,
	@LecturerID int,
	@Total int,
	@UsersID int,
	@VenuesID int,
	@Object nvarchar(50),
	@Type nvarchar(50),
	@Title nvarchar(50),
	@StartTime nvarchar(50),
	@EndTime nvarchar(50),
	@AddTime nvarchar(50),
	@Reasons text,
	@Request text,
	@Remarks text,
	@PositionID int,
	@OrganizationStructureID int,
	@State nvarchar(50),
	@ReturnValue int output
AS
Set
	@ReturnValue=0
	update [TrainingProgram] set
	[CourseID]=@CourseID,
	[LecturerID]=@LecturerID,
	[Total]=@Total,
	[UsersID]=@UsersID,
	[VenuesID]=@VenuesID,
	[Object]=@Object,
	[Type]=@Type,
	[Title]=@Title,
	[StartTime]=@StartTime,
	[EndTime]=@EndTime,
	[AddTime]=@AddTime,
	[Reasons]=@Reasons,
	[Request]=@Request,
	[PositionID]=@PositionID,
	[OrganizationStructureID]=@OrganizationStructureID,
	[State]=@State,
	[Remarks]=@Remarks
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[TrainingProgram_Del]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[TrainingProgram_Del]
	@ID int,
	@ReturnValue int output
AS

if (select COUNT(ID) from TrainingProgramUsers where ObjectID=@ID)>0
	begin
	set @ReturnValue=2
	end
else
if exists (Select [ID] From [TrainingProgram] Where [ID]=@ID )
    begin
	Delete [TrainingProgram] Where [ID]=@ID
	set @ReturnValue=1
	end
else
	begin
	set @ReturnValue=0
end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[TrainingProgram_Add1]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[TrainingProgram_Add1]
	@CourseID int,
	@Total int,
	@UsersID int,
	@ClassCount int,
	@Type nvarchar(50),
	@Title nvarchar(50),
	@Time nvarchar(50),
	@s_Time nvarchar(50),
	@ReturnValue int output
AS
set @ReturnValue=0
	INSERT INTO [TrainingProgram] ([CourseID],[Total],[UsersID],[Type],[Title],[ClassCount],[Time],[s_Time])
	VALUES(@CourseID,@Total,@UsersID,@Type,@Title,@ClassCount,@Time,@s_Time)
	insert into Schedule(ProgramID,[Type],CourseID)
	values(@@IDENTITY,'培训计划',@CourseID)
	-- @@identity
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[TrainingProgram_Add]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[TrainingProgram_Add]
	@CourseID int,
	@LecturerID int,
	@Total int,
	@UsersID int,
	@VenuesID int,
	@PositionID int,
	@OrganizationStructureID int,
	@Object nvarchar(50),
	@Type nvarchar(50),
	@Title nvarchar(50),
	@StartTime nvarchar(50),
	@EndTime nvarchar(50),
	@AddTime nvarchar(50),
	@Reasons text,
	@Request text,
	@Remarks text,
	@State nvarchar(50),
	@ReturnValue int output
AS
set @ReturnValue=0
	INSERT INTO [TrainingProgram] ([State],[OrganizationStructureID],[PositionID],[CourseID],[LecturerID],[Total],[UsersID],[VenuesID],[Object],[Type],[Title],[StartTime],[EndTime],[AddTime],[Reasons],[Request],[Remarks])
	VALUES(@State,@OrganizationStructureID,@PositionID,@CourseID,@LecturerID,@Total,@UsersID,@VenuesID,@Object,@Type,@Title,@StartTime,@EndTime,@AddTime,@Reasons,@Request,@Remarks)
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[TrainingMoney_Updata]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[TrainingMoney_Updata]
	@TrainingID int,
	@LecturerID int,
	@VenuesID int,
	@CourseID int,
	@ClassID int,
	@Other int,
	@Total int,
	@UsersID int,
	@ID int,
	@Remarks text,
	@ReturnValue int output
AS
Set
	@ReturnValue=0
	update [TrainingMoney] set
	[TrainingID]=@TrainingID,
	[LecturerID]=@LecturerID,
	[VenuesID]=@VenuesID,
	[CourseID]=@CourseID,
	[ClassID]=@ClassID,
	[Other]=@Other,
	[Total]=@Total,
	[Remarks]=@Remarks,
	[UsersID]=@UsersID
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[TrainingMoney_Del]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[TrainingMoney_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists(Select [ID] From [TrainingMoney] Where [ID] =@ID)
    begin
	Delete [TrainingMoney] Where [ID] =@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[TrainingMoney_Add]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[TrainingMoney_Add]
	@TrainingID int,
	@LecturerID int,
	@VenuesID int,
	@CourseID int,
	@ClassID int,
	@Other int,
	@Total int,
	@UsersID int,
	@Remarks text,
	@ReturnValue int output
AS
	INSERT INTO [TrainingMoney] ([Remarks],[TrainingID],[LecturerID],[VenuesID],[CourseID],[ClassID],[Other],[Total],[UsersID])
	VALUES(@Remarks,@TrainingID,@LecturerID,@VenuesID,@CourseID,@ClassID,@Other,@Total,@UsersID)
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[TrainingClass_Updata]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[TrainingClass_Updata]
	@Money int,
	@ID int,
	@UsersID int,
	@AddTime nvarchar(50),
	@Total int,
	@Remarks text,
	@Title nvarchar(50),
	@ReturnValue int output
AS
set @ReturnValue=0
	update [TrainingClass] set
	[Money]=@Money,
	[AddTime]=@AddTime,
	[Total]=@Total,
	[UsersID]=@UsersID,
	[Title]=@Title,
	[Remarks]=@Remarks
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[TrainingClass_Del]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[TrainingClass_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists (Select [ID] From [TrainingClass] Where [ID]=@ID )
    begin
	Delete TrainingClassUsers Where ClassID=(Select ObjectID from TrainingClass where ID=@ID)
	Delete [TrainingClass] Where [ID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[TrainingClass_Add]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[TrainingClass_Add]
	@Money int,
	@UsersID int,
	@ObjectID int,
	@Total int,
	@Remarks text,
	@Title nvarchar(50),
	@CourseName nvarchar(50),
	@AddTime nvarchar(50),
	@ProgramID int,
	@ReturnValue int output
AS
set @ReturnValue=0
	INSERT INTO [TrainingClass] ([ProgramID],[Money],[UsersID],[ObjectID],[Total],[Remarks],[Title],[CourseName],[AddTime])
	VALUES(@ProgramID,@Money,@UsersID,@ObjectID,@Total,@Remarks,@Title,@CourseName,@AddTime)
	update [Schedule] set [Class]='1' where [ProgramID]=@ProgramID
	set @ReturnValue=@@identity
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[TrainingApplication_Updata]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[TrainingApplication_Updata]
	@ID int,
	@UsersIDApplication int,
	@UsersIDManager int,
	@UsersIDHr int,
	@CourseID int,
	@CourseLbID int,
	@Title nvarchar(50),
	@TimeApplication nvarchar(50),
	@TimeManager nvarchar(50),
	@TimeHr nvarchar(50),
	@State nvarchar(50),
	@AcuteOrRelief nvarchar(50),
	@ReasonApplication text,
	@ReasonAgreeManager text,
	@ReasonDenyManager text,
	@ReasonAgreeHr text,
	@ReasonDenyHr text,
	@Remarks text,
	@ReturnValue int output
AS
set @ReturnValue=0
	update [TrainingApplication] set
	[UsersIDApplication]=@UsersIDApplication,
	[UsersIDManager]=@UsersIDManager,
	[UsersIDHr]=@UsersIDHr,
	[CourseID]=@CourseID,
	[CourseLbID]=@CourseLbID,
	[Title]=@Title,
	[TimeApplication]=@TimeApplication,
	[TimeManager]=@TimeManager,
	[TimeHr]=@TimeHr,
	[State]=@State,
	[AcuteOrRelief]=@AcuteOrRelief,
	[ReasonApplication]=@ReasonApplication,
	[ReasonAgreeManager]=@ReasonAgreeManager,
	[ReasonDenyManager]=@ReasonDenyManager,
	[ReasonAgreeHr]=@ReasonAgreeHr,
	[ReasonDenyHr]=@ReasonDenyHr,
	[Remarks]=@Remarks
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[TrainingApplication_Del]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[TrainingApplication_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists (Select [ID] From [TrainingApplication] Where [ID]=@ID )
    begin
    if ((Select [TimeManager] From [TrainingApplication] Where [ID]=@ID )!='')
		begin
		set @ReturnValue=2
        end
    else
		begin    
			Delete [TrainingApplication] Where [ID]=@ID
			set @ReturnValue=1
		end
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[TrainingApplication_Add]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[TrainingApplication_Add]
	@UsersIDApplication int,
	@UsersIDManager int,
	@UsersIDHr int,
	@CourseID int,
	@CourseLbID int,
	@Title nvarchar(50),
	@TimeApplication nvarchar(50),
	@TimeManager nvarchar(50),
	@TimeHr nvarchar(50),
	@State nvarchar(50),
	@AcuteOrRelief nvarchar(50),
	@ReasonApplication text,
	@ReasonAgreeManager text,
	@ReasonDenyManager text,
	@ReasonAgreeHr text,
	@ReasonDenyHr text,
	@Remarks text,
	@ReturnValue int output
AS
set @ReturnValue=0
	INSERT INTO [TrainingApplication] ([CourseLbID],[UsersIDApplication],[UsersIDManager],[UsersIDHr],[CourseID],[Title],[TimeApplication],[TimeManager],[TimeHr],[State],[AcuteOrRelief],[ReasonApplication],[ReasonAgreeManager],[ReasonDenyManager],[ReasonAgreeHr],[ReasonDenyHr],[Remarks])
	VALUES(@CourseLbID,@UsersIDApplication,@UsersIDManager,@UsersIDHr,@CourseID,@Title,@TimeApplication,@TimeManager,@TimeHr,@State,@AcuteOrRelief,@ReasonApplication,@ReasonAgreeManager,@ReasonDenyManager,@ReasonAgreeHr,@ReasonDenyHr,@Remarks)
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Staff_Updata]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Staff_Updata]
	@ID int,
	@Group int,
	@cnName nvarchar(50),
	@enName nvarchar(50),
	@PositionCode nvarchar(50),
	@Sex nvarchar(50),
	@Company nvarchar(50),
	@Department nvarchar(50),
	@Position nvarchar(50),
	@Boss nvarchar(50),
	@isPosition nvarchar(50),
	@TimePosition nvarchar(50),
	@LayerPosition nvarchar(50),
	@Birthday nvarchar(50),
	@Country nvarchar(50),
	@ZipCode nvarchar(50),
	@Address nvarchar(50),
	@IDCard nvarchar(50),
	@FriendName nvarchar(50),
	@FriendPhone nvarchar(50),
	@Mobile nvarchar(50),
	@Phone nvarchar(50),
	@Extension nvarchar(50),
	@Email nvarchar(50),
	@UsersType nvarchar(50),
	@ReturnValue int output
AS
Set
	@ReturnValue=0
	update [Staff] set
	[Group]=@Group,
	[cnName]=@cnName,
	[enName]=@enName,
	[PositionCode]=@PositionCode,
	[Sex]=@Sex,
	[Company]=@Company,
	[Department]=@Department,
	[Position]=@Position,
	[Boss]=@Boss,
	[isPosition]=@isPosition,
	[TimePosition]=@TimePosition,
	[LayerPosition]=@LayerPosition,
	[Birthday]=@Birthday,
	[Country]=@Country,
	[ZipCode]=@ZipCode,
	[Address]=@Address,
	[IDCard]=@IDCard,
	[FriendName]=@FriendName,
	[FriendPhone]=@FriendPhone,
	[Mobile]=@Mobile,
	[Phone]=@Phone,
	[Extension]=@Extension,
	[Email]=@Email,
	[UsersType]=@UsersType
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[Staff_Del]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Staff_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists(Select * From [Staff] Where [ID] =@ID)
    begin
	Delete [Staff] Where [ID] =@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Staff_Add]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Staff_Add]
	@Group int,
	@cnName nvarchar(50),
	@enName nvarchar(50),
	@MemberCode nvarchar(50),
	@PositionCode nvarchar(50),
	@Sex nvarchar(50),
	@Company nvarchar(50),
	@Department nvarchar(50),
	@Position nvarchar(50),
	@Boss nvarchar(50),
	@isPosition nvarchar(50),
	@TimePosition nvarchar(50),
	@LayerPosition nvarchar(50),
	@Birthday nvarchar(50),
	@Country nvarchar(50),
	@ZipCode nvarchar(50),
	@Address nvarchar(50),
	@IDCard nvarchar(50),
	@FriendName nvarchar(50),
	@FriendPhone nvarchar(50),
	@Mobile nvarchar(50),
	@Phone nvarchar(50),
	@Extension nvarchar(50),
	@Email nvarchar(50),
	@UsersType nvarchar(50),
	@LoginName nvarchar(50),
	@ReturnValue int output
AS
set @ReturnValue=0
if not exists(Select [MemberCode] From [Staff] Where [MemberCode] =@MemberCode)
    begin
	INSERT INTO [Staff] ([Group],[cnName],[enName],[MemberCode],[PositionCode],[Sex],[Company],[Department],[Position],[Boss],[isPosition],[TimePosition],[LayerPosition],[Birthday],[Country],[ZipCode],[Address],[IDCard],[FriendName],[FriendPhone],[Mobile],[Phone],[Extension],[Email],[UsersType],[LoginName])
	VALUES(@Group,@cnName,@enName,@MemberCode,@PositionCode,@Sex,@Company,@Department,@Position,@Boss,@isPosition,@TimePosition,@LayerPosition,@Birthday,@Country,@ZipCode,@Address,@IDCard,@FriendName,@FriendPhone,@Mobile,@Phone,@Extension,@Email,@UsersType,@LoginName)
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Suppliers_Updata]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Suppliers_Updata]
	@ID int,
	@Name nvarchar(500),
	@Grade nvarchar(500),
	@Established nvarchar(500),
	@Address nvarchar(500),
	@Nature nvarchar(500),
	@Scale nvarchar(500),
	@FullTimeLecturers nvarchar(500),
	@ExternalLecturers nvarchar(500),
	@BrandProducts nvarchar(500),
	@BrandConsultant nvarchar(500),
	@BusinessScope nvarchar(500),
	@Advantage nvarchar(500),
	@CooperativePosit nvarchar(500),
	@CollaboratedWithTheTypicalCustomer nvarchar(500),
	@AreasOfExpertise nvarchar(500),
	@Price nvarchar(500),
	@SpecialService nvarchar(500),
	@Remarks nvarchar(500),
	@Total nvarchar(500),
	@ReturnValue int output
AS
	update [Suppliers] set
	[Name]=@Name,
	[Grade]=@Grade,
	[Established]=@Established,
	[Address]=@Address,
	[Nature]=@Nature,
	[Scale]=@Scale,
	[FullTimeLecturers]=@FullTimeLecturers,
	[ExternalLecturers]=@ExternalLecturers,
	[BrandProducts]=@BrandProducts,
	[BrandConsultant]=@BrandConsultant,
	[BusinessScope]=@BusinessScope,
	[Advantage]=@Advantage,
	[CooperativePosit]=@CooperativePosit,
	[CollaboratedWithTheTypicalCustomer]=@CollaboratedWithTheTypicalCustomer,
	[AreasOfExpertise]=@AreasOfExpertise,
	[Price]=@Price,
	[SpecialService]=@SpecialService,
	[Remarks]=@Remarks,
	[Total]=@Total
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[Suppliers_Del]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Suppliers_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists (Select [ID] From [Suppliers] Where [ID]=@ID )
    begin
	Delete [Suppliers] Where [ID]=@ID
	Delete [Lecturer] Where [SuppliersID]=@ID
	Delete [Contact] Where [SuppliersID]=@ID
	Delete [Venues] Where [SuppliersID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Suppliers_Add]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Suppliers_Add]
	@Name nvarchar(500),
	@Grade nvarchar(500),
	@Established nvarchar(500),
	@Address nvarchar(500),
	@Nature nvarchar(500),
	@Scale nvarchar(500),
	@FullTimeLecturers nvarchar(500),
	@ExternalLecturers nvarchar(500),
	@BrandProducts nvarchar(500),
	@BrandConsultant nvarchar(500),
	@BusinessScope nvarchar(500),
	@Advantage nvarchar(500),
	@CooperativePosit nvarchar(500),
	@CollaboratedWithTheTypicalCustomer nvarchar(500),
	@AreasOfExpertise nvarchar(500),
	@Price nvarchar(500),
	@SpecialService nvarchar(500),
	@Remarks nvarchar(500),
	@Total nvarchar(500),
	@ReturnValue int output
AS
	INSERT INTO [Suppliers] ([Total],[Name],[Grade],[Established],[Address],[Nature],[Scale],[FullTimeLecturers],[ExternalLecturers],[BrandProducts],[BrandConsultant],[BusinessScope],[Advantage],[CooperativePosit],[CollaboratedWithTheTypicalCustomer],[AreasOfExpertise],[Price],[SpecialService],[Remarks])
	VALUES(@Total,@Name,@Grade,@Established,@Address,@Nature,@Scale,@FullTimeLecturers,@ExternalLecturers,@BrandProducts,@BrandConsultant,@BusinessScope,@Advantage,@CooperativePosit,@CollaboratedWithTheTypicalCustomer,@AreasOfExpertise,@Price,@SpecialService,@Remarks)
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[QCModelLb_Updata]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[QCModelLb_Updata]
	@ID int,
	@Name nvarchar(50),
	@Description text,
	@Up int,
	@ReturnValue int output
AS
Set
	@ReturnValue=0
	update [QCModelLb] set
	[Name]=@Name,
	[Description]=@Description,
	[Up]=@Up
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[QCModelLb_Del]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[QCModelLb_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if (Select COUNT([ID]) From [QCModelLb] Where [Up]=@ID )>0
    begin
	set @ReturnValue=2
	end
	else
if exists (Select [ID] From [QCModelLb] Where [ID]=@ID )
    begin
	Delete [QCModelLb] Where [ID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[QCModelLb_Add]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[QCModelLb_Add]
	@Name nvarchar(50),
	@Description text,
	@Up int,
	@ReturnValue int output
AS
set @ReturnValue=0
if not exists(Select [Name] From [QCModelLb] Where [Name] =@Name and [Up]=@Up)
    begin
	INSERT INTO [QCModelLb] ([Name],[Description],[Up])
	VALUES(@Name,@Description,@Up)
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[QCModelForCourse_Del]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[QCModelForCourse_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
	Delete [QCModelForCourse] Where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[QCModelForCourse_Add]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[QCModelForCourse_Add]
	@QCModelID int,
	@CourseID int,
	@QCModelLbID int,
	@ReturnValue int output
AS
set @ReturnValue=0
	INSERT INTO [QCModelForCourse] ([QCModelLbID],[QCModelID],[CourseID])
	VALUES(@QCModelLbID,@QCModelID,@CourseID)
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[QCModel_Updata]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[QCModel_Updata]
	@Name nvarchar(500),
	@QCModelLbID int,
	@ID int,
	@ReturnValue int output
AS
Set
	@ReturnValue=0
	update [QCModel] set
	[Name]=@Name,
	[QCModelLbID]=@QCModelLbID
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[QCModel_Del]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[QCModel_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists (Select [ID] From [QCModel] Where [ID]=@ID )
    begin
	Delete [QCModel] Where [ID]=@ID
	Delete [QCModelForCourse] Where [QCModelID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[QCModel_Add]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[QCModel_Add]
	@Name nvarchar(500),
	@QCModelLbID int,
	@ReturnValue int output
AS
set @ReturnValue=0
	INSERT INTO [QCModel] ([Name],[QCModelLbID])
	VALUES(@Name,@QCModelLbID)
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[PositionTrainingCoursesThatRequired_Update]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionTrainingCoursesThatRequired_Update]
	@CourseID int,
	@PositionID int,
	@ID int,
	@ReturnValue int output
AS
	Set
	@ReturnValue=0
	update [PositionTrainingCoursesThatRequired] set
	[CourseID]=@CourseID,
	[PositionID]=@PositionID
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[PositionTrainingCoursesThatRequired_Del]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionTrainingCoursesThatRequired_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists(Select * From [PositionTrainingCoursesThatRequired] Where [ID] =@ID )
    begin
	Delete [PositionTrainingCoursesThatRequired] Where [ID] =@ID 
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[PositionTrainingCoursesThatRequired_Add]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionTrainingCoursesThatRequired_Add]
	@CourseID int,
	@PositionID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if not exists(Select * From [PositionTrainingCoursesThatRequired] Where [PositionID] =@PositionID and  [CourseID]=@CourseID)
    begin
	INSERT INTO [PositionTrainingCoursesThatRequired]([PositionID],[CourseID])
	VALUES(@PositionID,@CourseID)
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[PositionPermissions_Updata]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionPermissions_Updata]
	@PositionID int,
	@Text text,
	@ReturnValue int output
AS
Set
	@ReturnValue=0
	update [PositionPermissions] set
	[Text]=@Text
	where [PositionID]=@PositionID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[PositionPermissions_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionPermissions_Del]
	@PositionID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists(Select * From [PositionPermissions] Where [PositionID] =@PositionID )
    begin
	Delete [PositionPermissions] Where [PositionID] =@PositionID 
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[PositionPermissions_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionPermissions_Add]
	@PositionID int,
	@Text text,
	@ReturnValue int output
AS
	INSERT INTO [PositionPermissions] (PositionID,[Text])
	VALUES(@PositionID,@Text)
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[PositionQualificationWorkExperience_Update]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionQualificationWorkExperience_Update]
	@PositionID int,
	@WorkExperienceAll nvarchar(50),
	@WorkExperienceProfessional nvarchar(50),
	@WorkExperienceOther nvarchar(50),
	@WorkExperienceText text,
	@ReturnValue int output
AS
Set
	@ReturnValue=0
	update [PositionQualificationWorkExperience] set
	[WorkExperienceAll]=@WorkExperienceAll,
	[WorkExperienceProfessional]=@WorkExperienceProfessional,
	[WorkExperienceOther]=@WorkExperienceOther,
	[WorkExperienceText]=@WorkExperienceText
	where [PositionID]=@PositionID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[PositionQualificationWorkExperience_Del]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionQualificationWorkExperience_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
--if (Select COUNT([ID]) From [Position] Where [Up]=@ID )>0
--    begin
--	set @ReturnValue=2
--	end
--	else
if exists (Select [ID] From [PositionQualificationWorkExperience] Where [ID]=@ID )
    begin
	Delete [PositionQualificationWorkExperience] Where [ID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[PositionQualificationWorkExperience_Add]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionQualificationWorkExperience_Add]
	@PositionID int,
	@WorkExperienceAll nvarchar(50),
	@WorkExperienceProfessional nvarchar(50),
	@WorkExperienceOther nvarchar(50),
	@WorkExperienceText text,
	@ReturnValue int output
AS
set @ReturnValue=0
	INSERT INTO [PositionQualificationWorkExperience]([PositionID],[WorkExperienceAll],[WorkExperienceProfessional],[WorkExperienceOther],[WorkExperienceText])
	VALUES(@PositionID,@WorkExperienceAll,@WorkExperienceProfessional,@WorkExperienceOther,@WorkExperienceText)
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[PositionQualificationWorkAbilities_Update]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionQualificationWorkAbilities_Update]
	@Name nvarchar(50),
	@ID int,
	@ReturnValue int output
AS
	Set
	@ReturnValue=0
	update [PositionQualificationWorkAbilities] set
	[Name]=@Name
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[PositionQualificationWorkAbilities_Del]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionQualificationWorkAbilities_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
--if (Select COUNT([ID]) From [Position] Where [Up]=@ID )>0
--    begin
--	set @ReturnValue=2
--	end
--	else
if exists (Select [ID] From [PositionQualificationWorkAbilities] Where [ID]=@ID )
    begin
	Delete [PositionQualificationWorkAbilities] Where [ID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[PositionQualificationWorkAbilities_Add]    Script Date: 07/16/2009 11:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionQualificationWorkAbilities_Add]
	@Name nvarchar(50),
	@PositionID int,
	@ReturnValue int output
AS
set @ReturnValue=0
	INSERT INTO [PositionQualificationWorkAbilities]([Name],[PositionID])
	VALUES(@Name,@PositionID)
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[PositionQualificationProfessionalKnowledgeAndSkills_Update]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionQualificationProfessionalKnowledgeAndSkills_Update]
	@CourseID int,
	@PositionID int,
	@ID int,
	@ReturnValue int output
AS
	Set
	@ReturnValue=0
	update [PositionQualificationProfessionalKnowledgeAndSkills] set
	[CourseID]=@CourseID,
	[PositionID]=@PositionID
	where [PositionID]=@PositionID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[PositionQualificationProfessionalKnowledgeAndSkills_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionQualificationProfessionalKnowledgeAndSkills_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists(Select * From [PositionQualificationProfessionalKnowledgeAndSkills] Where [ID] =@ID )
    begin
	Delete [PositionQualificationProfessionalKnowledgeAndSkills] Where [ID] =@ID 
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[PositionQualificationProfessionalKnowledgeAndSkills_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionQualificationProfessionalKnowledgeAndSkills_Add]
	@Name nvarchar(50),
	@PositionID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if not exists(Select * From [PositionQualificationProfessionalKnowledgeAndSkills] Where [PositionID] =@PositionID and  [Name]=@Name)
    begin
	INSERT INTO [PositionQualificationProfessionalKnowledgeAndSkills]([PositionID],[Name])
	VALUES(@PositionID,@Name)
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[PositionQualification_Updata]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionQualification_Updata]
	@Age nvarchar(50),
	@Gender nvarchar(50),
	@MinimumAcademicRequirements nvarchar(50),
	@MinimumPositionalTitle nvarchar(50),
	@MajorRequirement text,
	@PositionID int,
	@ReturnValue int output
AS
	Set
	@ReturnValue=0
	update [PositionQualification] set
	[Age]=@Age,
	[Gender]=@Gender,
	[MinimumAcademicRequirements]=@MinimumAcademicRequirements,
	[MinimumPositionalTitle]=@MinimumPositionalTitle,
	[MajorRequirement]=@MajorRequirement
	where [PositionID]=@PositionID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[PositionQualification_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionQualification_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
--if (Select COUNT([ID]) From [Position] Where [Up]=@ID )>0
--    begin
--	set @ReturnValue=2
--	end
--	else
if exists (Select [ID] From [PositionQualification] Where [ID]=@ID )
    begin
	Delete [PositionQualification] Where [ID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[PositionQualification_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionQualification_Add]
	@Age nvarchar(50),
	@Gender nvarchar(50),
	@MinimumAcademicRequirements nvarchar(50),
	@MinimumPositionalTitle nvarchar(50),
	@MajorRequirement text,
	@PositionID int,
	@ReturnValue int output
AS
	INSERT INTO [PositionQualification]([PositionID],[Age],[Gender],[MinimumAcademicRequirements],[MinimumPositionalTitle],[MajorRequirement])
	VALUES(@PositionID,@Age,@Gender,@MinimumAcademicRequirements,@MinimumPositionalTitle,@MajorRequirement)
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[PositionPromotion_Update]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionPromotion_Update]
	@CourseID int,
	@PositionID int,
	@ID int,
	@ReturnValue int output
AS
	Set
	@ReturnValue=0
	update [PositionPromotion] set
	[CourseID]=@CourseID,
	[PositionID]=@PositionID
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[PositionPromotion_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionPromotion_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists(Select * From [PositionPromotion] Where [ID] =@ID )
    begin
	Delete [PositionPromotion] Where [ID] =@ID 
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[PositionPromotion_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionPromotion_Add]
	@CourseID int,
	@PositionID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if not exists(Select * From [PositionPromotion] Where [PositionID] =@PositionID and  [CourseID]=@CourseID)
    begin
	INSERT INTO [PositionPromotion]([PositionID],[CourseID])
	VALUES(@PositionID,@CourseID)
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[PositionJobResponsibilities_Updata]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionJobResponsibilities_Updata]
	@PrimaryResponsibilities nvarchar(50),
	@Independence nvarchar(50),
	@Frequency nvarchar(50),
	@ID int,
	@ReturnValue int output
AS
	Set
	@ReturnValue=0
	update [PositionJobResponsibilities] set
	[PrimaryResponsibilities]=@PrimaryResponsibilities,
	[Independence]=@Independence,
	[Frequency]=@Frequency
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[PositionJobResponsibilities_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionJobResponsibilities_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists (Select [ID] From [PositionJobResponsibilities] Where [ID]=@ID )
    begin
	Delete [PositionJobResponsibilities] Where [ID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[PositionJobResponsibilities_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionJobResponsibilities_Add]
	@PrimaryResponsibilities nvarchar(50),
	@Independence nvarchar(50),
	@Frequency nvarchar(50),
	@PositionID int,
	@ReturnValue int output
AS
set @ReturnValue=0
	INSERT INTO [PositionJobResponsibilities] ([PrimaryResponsibilities],[Independence],[Frequency],[PositionID])
	VALUES(@PrimaryResponsibilities,@Independence,@Frequency,@PositionID)
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Position_Updata]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Position_Updata]
	@Title nvarchar(50),
	@PostCode nvarchar(50),
	@Rank nvarchar(50),
	@Department nvarchar(50),
	@Complier nvarchar(50),
	@VerifierDe nvarchar(50),
	@VerifierHr nvarchar(50),
	@ApprovedBy nvarchar(50),
	@ApprovedDate nvarchar(50),
	@ImmediateBoss nvarchar(50),
	@NumberOfDirectAndIndirectSubordinates nvarchar(50),
	@CategoriesOfDirectAndIndirectSubordinates nvarchar(50),
	@MajorInternalClients nvarchar(50),
	@MajorExternalClients nvarchar(50),
	@OutlineOfThePosition text,
	@Workplace nvarchar(50),
	@OccupationalSafety nvarchar(50),
	@OrganizationStructureID int,
	@ID int,
	@ReturnValue int output
AS
	Set
	@ReturnValue=0
	update [Position] set
	[OrganizationStructureID]=@OrganizationStructureID,
	[Title]=@Title,
	[PostCode]=@PostCode,
	[Rank]=@Rank,
	[Department]=@Department,
	[Complier]=@Complier,
	[VerifierDe]=@VerifierDe,
	[VerifierHr]=@VerifierHr,
	[ApprovedBy]=@ApprovedBy,
	[ApprovedDate]=@ApprovedDate,
	[ImmediateBoss]=@ImmediateBoss,
	[NumberOfDirectAndIndirectSubordinates]=@NumberOfDirectAndIndirectSubordinates,
	[CategoriesOfDirectAndIndirectSubordinates]=@CategoriesOfDirectAndIndirectSubordinates,
	[MajorInternalClients]=@MajorInternalClients,
	[MajorExternalClients]=@MajorExternalClients,
	[OutlineOfThePosition]=@OutlineOfThePosition,
	[Workplace]=@Workplace,
	[OccupationalSafety]=@OccupationalSafety
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[Position_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Position_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
--if (Select COUNT([ID]) From [Position] Where [Up]=@ID )>0
--    begin
--	set @ReturnValue=2
--	end
--	else
if exists (Select [ID] From [Position] Where [ID]=@ID )
    begin
    --删除[Position]表
	Delete [Position] Where [ID]=@ID
	--删除[PositionDIY]表
	Delete [PositionDIY] Where [PositionID]=@ID
	--删除[PositionItemsOfAssessment]表
	Delete [PositionItemsOfAssessment] Where [PositionID]=@ID
	--删除[PositionJobResponsibilities]表
	Delete [PositionJobResponsibilities] Where [PositionID]=@ID
	--删除[PositionQualification]表
	Delete [PositionQualification] Where [PositionID]=@ID
	--删除[PositionQualificationProfessionalKnowledgeAndSkills]表
	Delete [PositionQualificationProfessionalKnowledgeAndSkills] Where [PositionID]=@ID
	--删除[PositionQualificationWorkAbilities]表
	Delete [PositionQualificationWorkAbilities] Where [PositionID]=@ID
	--删除[PositionQualificationWorkExperience]表
	Delete [PositionQualificationWorkExperience] Where [PositionID]=@ID
	--删除[PositionTrainingCoursesThatRequired]表
	Delete [PositionTrainingCoursesThatRequired] Where [PositionID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Position_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Position_Add]
	@Title nvarchar(50),
	@PostCode nvarchar(50),
	@Rank nvarchar(50),
	@Department nvarchar(50),
	@Complier nvarchar(50),
	@VerifierDe nvarchar(50),
	@VerifierHr nvarchar(50),
	@ApprovedBy nvarchar(50),
	@ApprovedDate nvarchar(50),
	@OrganizationStructureID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if not exists(Select [Title] From [Position] Where [Title] =@Title )
    begin
	INSERT INTO [Position] ([OrganizationStructureID],[Title],[PostCode],[Rank],[Department],[Complier],[VerifierDe],[VerifierHr],[ApprovedBy],[ApprovedDate])
	VALUES(@OrganizationStructureID,@Title,@PostCode,@Rank,@Department,@Complier,@VerifierDe,@VerifierHr,@ApprovedBy,@ApprovedDate)
	set @ReturnValue=@@IDENTITY
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[PositionItemsOfAssessment_Updata]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionItemsOfAssessment_Updata]
	@Name nvarchar(50),
	@PositionID int,
	@ID int,
	@pp1Name text,
	@pp2Name nvarchar(50),
	@ReturnValue int output
AS
	Set
	@ReturnValue=0
	update [PositionItemsOfAssessment] set
	[Name]=@Name,
	[pp1Name]=@pp1Name,
	[pp2Name]=@pp2Name,
	[PositionID]=@PositionID
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[PositionItemsOfAssessment_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionItemsOfAssessment_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
--if (Select COUNT([ID]) From [Position] Where [Up]=@ID )>0
--    begin
--	set @ReturnValue=2
--	end
--	else
if exists (Select [ID] From [PositionItemsOfAssessment] Where [ID]=@ID )
    begin
	Delete [PositionItemsOfAssessment] Where [ID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[PositionItemsOfAssessment_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionItemsOfAssessment_Add]
	@Name nvarchar(50),
	@PositionID int,
	@pp1Name text,
	@pp2Name nvarchar(50),
	@ReturnValue int output
AS
set @ReturnValue=0
	INSERT INTO [PositionItemsOfAssessment]([pp1Name],[pp2Name],[PositionID],[Name])
	VALUES(@pp1Name,@pp2Name,@PositionID,@Name)
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[PositionDIY_Updata]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionDIY_Updata]
	@Title nvarchar(50),
	@Text text,
	@PositionID int,
	@ID int,
	@ReturnValue int output
AS
	Set
	@ReturnValue=0
	update [PositionDIY] set
	[Title]=@Title,
	[Text]=@Text,
	[PositionID]=@PositionID
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[PositionDIY_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionDIY_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
--if (Select COUNT([ID]) From [Position] Where [Up]=@ID )>0
--    begin
--	set @ReturnValue=2
--	end
--	else
if exists (Select [ID] From [PositionDIY] Where [ID]=@ID )
    begin
	Delete [PositionDIY] Where [ID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[PositionDIY_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionDIY_Add]
	@Title nvarchar(50),
	@Text text,
	@PositionID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if not exists(Select [Title] From [PositionDIY] Where [Title] =@Title )
    begin
	INSERT INTO [PositionDIY]([PositionID],[Title],[Text])
	VALUES(@PositionID,@Title,@Text)
	set @ReturnValue=@@IDENTITY
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[PositionBasicKnowledge_Update]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionBasicKnowledge_Update]
	@CourseID int,
	@PositionID int,
	@ID int,
	@ReturnValue int output
AS
	Set
	@ReturnValue=0
	update [PositionBasicKnowledge] set
	[CourseID]=@CourseID,
	[PositionID]=@PositionID
	where [PositionID]=@PositionID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[PositionBasicKnowledge_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionBasicKnowledge_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists(Select * From [PositionBasicKnowledge] Where [ID] =@ID )
    begin
	Delete [PositionBasicKnowledge] Where [ID] =@ID 
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[PositionBasicKnowledge_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[PositionBasicKnowledge_Add]
	@Name nvarchar(50),
	@PositionID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if not exists(Select * From [PositionBasicKnowledge] Where [PositionID] =@PositionID and  [Name]=@Name)
    begin
	INSERT INTO [PositionBasicKnowledge]([PositionID],[Name])
	VALUES(@PositionID,@Name)
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[OrganizationStructure_Updata]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [TMS].[OrganizationStructure_Updata]
	@cnName nvarchar(50),
	@enName nvarchar(50),
	@Up int,
	@ID int,
	@ReturnValue int output
AS
	Set
	@ReturnValue=0
	update [OrganizationStructure] set
	[cnName]=@cnName,
	[enName]=@enName,
	[Up]=@Up
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[OrganizationStructure_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [TMS].[OrganizationStructure_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if (Select COUNT([ID]) From [OrganizationStructure] Where [Up]=@ID )>0
    begin
	set @ReturnValue=2
	end
	else
	if (Select COUNT([ID]) From [Position] Where [OrganizationStructureID]=@ID )>0
    begin
	set @ReturnValue=3
	end
	else
if exists (Select [ID] From [OrganizationStructure] Where [ID]=@ID )
    begin
	Delete [OrganizationStructure] Where [ID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[OrganizationStructure_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [TMS].[OrganizationStructure_Add]
	@cnName nvarchar(50),
	@enName nvarchar(50),
	@Up int,
	@ReturnValue int output
AS
set @ReturnValue=0
	INSERT INTO [OrganizationStructure] ([cnName],[enName],[Up])
	VALUES(@cnName,@enName,@Up)
	set @ReturnValue=1

	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[NewsLb_Updata]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[NewsLb_Updata]
	@ID int,
	@Name nvarchar(50),
	@ReturnValue int output
AS
Set
	@ReturnValue=0
	update [NewsLb] set
	[Name]=@Name
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[NewsLb_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [TMS].[NewsLb_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if (Select COUNT([ID]) From [News] Where [NewsLbID]=@ID )>0
    begin
	set @ReturnValue=2
	end
	else
if exists (Select [ID] From [NewsLb] Where [ID]=@ID )
    begin
	Delete [NewsLb] Where [ID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[NewsLb_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [TMS].[NewsLb_Add]
	@Name nvarchar(50),
	@ReturnValue int output
AS
set @ReturnValue=0
if not exists(Select [Name] From [NewsLb] Where [Name] =@Name )
    begin
	INSERT INTO [NewsLb] ([Name])
	VALUES(@Name)
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Message_Updata]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Message_Updata]
	@ID int,
	@ReplyID int,
	@Reply text,
	@ReturnValue int output
AS
Set
	@ReturnValue=0
	update [Message] set
	[ReplyID]=@ReplyID,
	[Reply]=@Reply
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[Message_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Message_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists (Select [ID] From [Message] Where [ID]=@ID )
    begin
	Delete [Message] Where [ID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Message_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Message_Add]
	@NewsID int,
	@StaffID int,
	@Text text,
	@ReturnValue int output
AS
	INSERT INTO [Message] ([NewsID],[StaffID],[Text])
	VALUES(@NewsID,@StaffID,@Text)
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[News_Updata_View]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[News_Updata_View]
	@ID int,
	@ReturnValue int output
AS
Set
	@ReturnValue=0
	update [News] set
	[View]=[View]+1
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[News_Updata_Image]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [TMS].[News_Updata_Image]
	@ID int,
	@Image varchar(50),
	@ReturnValue int output
AS
Set
	@ReturnValue=0
	update [News] set
	[Image]=@Image
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[News_Updata_Annex]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [TMS].[News_Updata_Annex]
	@ID int,
	@Annex varchar(50),
	@ReturnValue int output
AS
Set
	@ReturnValue=0
	update [News] set
	[Annex]=@Annex
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[News_Updata]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[News_Updata]
	@ID int,
	@NewsLbID int,
	@StaffID int,
	@Title nvarchar(50),
	@Keyword nvarchar(50),
	@PubTime nvarchar(50),
	@Abstract nvarchar(500),
	@Image nvarchar(50),
	@Annex nvarchar(50),
	@Remarks nvarchar(500),
	@Text text,
	@ReturnValue int output
AS
Set
	@ReturnValue=0
	update [News] set
	[NewsLbID]=@NewsLbID,
	[Title]=@Title,
	[Keyword]=@Keyword,
	[PubTime]=@PubTime,
	[StaffID]=@StaffID,
	[Abstract]=@Abstract,
	[Image]=@Image,
	[Text]=@Text,
	[Annex]=@Annex,
	[Remarks]=@Remarks
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[News_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [TMS].[News_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists(Select * From [News] Where [ID] =@ID)
    begin
	Delete [News] Where [ID] =@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[News_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [TMS].[News_Add]
	@NewsLbID int,
	@StaffID int,
	@Title nvarchar(50),
	@Keyword nvarchar(50),
	@PubTime nvarchar(50),
	@Abstract nvarchar(500),
	@Image nvarchar(50),
	@Annex nvarchar(50),
	@Remarks nvarchar(500),
	@Text text,
	@ReturnValue int output
AS
	INSERT INTO [News] ([NewsLbID],[Title],[Keyword],[PubTime],[StaffID],[Abstract],[Image],[Text],[Annex],[Remarks])
	VALUES(@NewsLbID,@Title,@Keyword,@PubTime,@StaffID,@Abstract,@Image,@Text,@Annex,@Remarks)
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Module_Updata]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Module_Updata]
	@News nvarchar(50),
	@Notice nvarchar(50) ,
	@MyInformation nvarchar(50) ,
	@PersonalData nvarchar(50) ,
	@TrainingNeeds nvarchar(50) ,
	@TrainingProgram nvarchar(50) ,
	@CurriculumStudy nvarchar(50) ,
	@TrainingRecords nvarchar(50) ,
	@CaseStudy nvarchar(50) ,
	@QuestionnaireSurvey nvarchar(50) ,
	@Examination nvarchar(50) ,
	@EvaluationCenter nvarchar(50) ,
	@Assessment nvarchar(50) ,
	@ApplicationsForTraining nvarchar(50) ,
	@CaseShare nvarchar(50) ,
	@TrainingForum nvarchar(50) ,
	@AskYour nvarchar(50) ,
	@MySuggestion nvarchar(50),
	@ReturnValue int output
AS
Set
	@ReturnValue=0
	update [Module] set
	[News]=@News,
	[Notice]=@Notice,
	[MyInformation]=@MyInformation,
	[PersonalData]=@PersonalData,
	[TrainingNeeds]=@TrainingNeeds,
	[TrainingProgram]=@TrainingProgram,
	[CurriculumStudy]=@CurriculumStudy,
	[TrainingRecords]=@TrainingRecords,
	[CaseStudy]=@CaseStudy,
	[QuestionnaireSurvey]=@QuestionnaireSurvey,
	[Examination]=@Examination,
	[EvaluationCenter]=@EvaluationCenter,
	[Assessment]=@Assessment,
	[ApplicationsForTraining]=@ApplicationsForTraining,
	[CaseShare]=@CaseShare,
	[TrainingForum]=@TrainingForum,
	[AskYour]=@AskYour,
	[MySuggestion]=@MySuggestion
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[Materials_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Materials_Add]
	@CourseID int,
	@Type nvarchar(50),
	@URL nvarchar(50),
	@ReturnValue int output
AS
	INSERT INTO [Materials] ([CourseID],[Type],[URL])
	VALUES(@CourseID,@Type,@URL)
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Login]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Login]
	@Password nvarchar(50),
	@cnName nvarchar(50),
	@ReturnValue int output
AS
	set @ReturnValue=0
--if exists(Select * From [Staff] Where [cnName] =@cnName or [enName]=@cnName or [LoginName]=@cnName and [Password]=@Password)
--    begin
--    set @ReturnValue=(Select [ID] From [Staff] Where [cnName] =@cnName or [enName]=@cnName or [LoginName]=@cnName and [Password]=@Password)
--	end
--	return @ReturnValue
if exists(Select * From [Staff] Where [cnName]=@cnName and [Password]=@Password)
	begin
	set @ReturnValue=(Select [ID] From [Staff] Where [cnName]=@cnName and [Password]=@Password)
	end
else
	if exists(Select * From [Staff] Where [enName]=@cnName and [Password]=@Password)
	begin
	set @ReturnValue=(Select [ID] From [Staff] Where [enName]=@cnName and [Password]=@Password)
	end
else
	if exists(Select * From [Staff] Where [LoginName]=@cnName and [Password]=@Password)
	begin
	set @ReturnValue=(Select [ID] From [Staff] Where [LoginName]=@cnName and [Password]=@Password)
	end
return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Lecturer_Updata]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Lecturer_Updata]
	@Money int,
	@ID int,
	@Type nvarchar(50),
	@cnName nvarchar(50),
	@enName nvarchar(50),
	@Expertise nvarchar(50),
	@Phone nvarchar(50),
	@Mobile nvarchar(50),
	@Email nvarchar(50),
	@Address nvarchar(50),
	@ZipCode nvarchar(50),
	@Resume text,
	@Remarks text,
	@RemarksURL nvarchar(50),
	@SuppliersID int,
	@ReturnValue int output
AS
Set
	@ReturnValue=0
	update [Lecturer] set
	[Money]=@Money,
	[Type]=@Type,
	[cnName]=@cnName,
	[enName]=@enName,
	[Expertise]=@Expertise,
	[Phone]=@Phone,
	[Mobile]=@Mobile,
	[Email]=@Email,
	[Address]=@Address,
	[ZipCode]=@ZipCode,
	[Resume]=@Resume,
	[Remarks]=@Remarks,
	[SuppliersID]=@SuppliersID,
	[RemarksURL]=@RemarksURL
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[Lecturer_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Lecturer_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists (Select [ID] From [Lecturer] Where [ID]=@ID )
    begin
	Delete [Lecturer] Where [ID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Lecturer_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Lecturer_Add]
	@Money int,
	@Type nvarchar(50),
	@cnName nvarchar(50),
	@enName nvarchar(50),
	@Expertise nvarchar(50),
	@Phone nvarchar(50),
	@Mobile nvarchar(50),
	@Email nvarchar(50),
	@Address nvarchar(50),
	@ZipCode nvarchar(50),
	@Resume text,
	@Remarks text,
	@RemarksURL nvarchar(50),
	@SuppliersID int,
	@ReturnValue int output
AS
	INSERT INTO [Lecturer] ([SuppliersID],[Money],[Type],[cnName],[enName],[Expertise],[Phone],[Mobile],[Email],[Address],[ZipCode],[Resume],[Remarks],[RemarksURL])
	VALUES(@SuppliersID,@Money,@Type,@cnName,@enName,@Expertise,@Phone,@Mobile,@Email,@Address,@ZipCode,@Resume,@Remarks,@RemarksURL)
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Group_Updata]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Group_Updata]
	@ID int,
	@Name nvarchar(50),
	@Description text,
	@ReturnValue int output
AS
Set
	@ReturnValue=0
	update [Group] set
	[Name]=@Name,
	[Description]=@Description
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[Group_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Group_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists (Select [ID] From [Group] Where [ID]=@ID )
    begin
	Delete [Group] Where [ID]=@ID
	Delete [Cantbe] Where [GroupID]=@ID
	Update [Staff] set [Group]=0 where [Group]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Group_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Group_Add]
	@Name nvarchar(50),
	@Description text,
	@ReturnValue int output
AS
set @ReturnValue=0
if not exists(Select [Name] From [Group] Where [Name] =@Name)
    begin
	INSERT INTO [Group] ([Name],[Description])
	VALUES(@Name,@Description)
	set @ReturnValue=@@IDENTITY
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[CourseLb_Updata]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[CourseLb_Updata]
	@ID int,
	@Name nvarchar(50),
	@Description text,
	@Up int,
	@ReturnValue int output
AS
Set
	@ReturnValue=0
	update [CourseLb] set
	[Name]=@Name,
	[Description]=@Description,
	[Up]=@Up
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[CourseLb_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[CourseLb_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if (Select COUNT([ID]) From [CourseLb] Where [Up]=@ID )>0
    begin
	set @ReturnValue=2
	end
	else
if exists (Select [ID] From [CourseLb] Where [ID]=@ID )
    begin
	Delete [CourseLb] Where [ID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[CourseLb_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[CourseLb_Add]
	@Name nvarchar(50),
	@Description text,
	@Up int,
	@ReturnValue int output
AS
set @ReturnValue=0
if not exists(Select [Name] From [CourseLb] Where [Name] =@Name and [Up]=@Up)
    begin
	INSERT INTO [CourseLb] ([Name],[Description],[Up])
	VALUES(@Name,@Description,@Up)
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Course_Updata]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Course_Updata]
	@Money int,
	@ID int,
	@CourseLbID int,
	@Type nvarchar(50),
	@Title nvarchar(50),
	@Abstract nvarchar(500),
	@Outline text,
	@Credit int,
	@Open int,
	@Target text,
	@ReturnValue int output
AS
	update [Course] set
	[Money]=@Money,
	[CourseLbID]=@CourseLbID,
	[Type]=@Type,
	[Title]=@Title,
	[Abstract]=@Abstract,
	[Outline]=@Outline,
	[Credit]=@Credit,
	[Target]=@Target,
	[Open]=@Open
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Course_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Course_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists (Select [ID] From [Course] Where [ID]=@ID )
    begin
	Delete [Course] Where [ID]=@ID
	Delete [Materials] Where [CourseID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Course_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Course_Add]
	@Money int,
	@CourseLbID int,
	@Type nvarchar(50),
	@Title nvarchar(50),
	@Abstract nvarchar(500),
	@Outline text,
	@Credit int,
	@Open int,
	@Target text,
	@ReturnValue int output
AS
	set @ReturnValue=0
	INSERT INTO [Course] ([Target],[Money],[CourseLbID],[Type],[Title],[Abstract],[Outline],[Credit],[Open])
	VALUES(@Target,@Money,@CourseLbID,@Type,@Title,@Abstract,@Outline,@Credit,@Open)
	set @ReturnValue=@@IDENTITY
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[CooperationRecord_Updata]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[CooperationRecord_Updata]
	@ID	int,
	@ObjectID int,
	@UsersID int,
	@StartTime nvarchar(50),
	@EndTime nvarchar(50),
	@AddTime nvarchar(50),
	@Type nvarchar(50),
	@Reasons text,
	@Results text,
	@Remarks text,
	@ReturnValue int output
AS
Set
	@ReturnValue=0
	update [CooperationRecord] set
	[ObjectID]=@ObjectID,
	[UsersID]=@UsersID,
	[StartTime]=@StartTime,
	[EndTime]=@EndTime,
	[AddTime]=@AddTime,
	[Type]=@Type,
	[Reasons]=@Reasons,
	[Results]=@Results,
	[Remarks]=@Remarks
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[CooperationRecord_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[CooperationRecord_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists (Select [ID] From [CooperationRecord] Where [ID]=@ID )
    begin
	Delete [CooperationRecord] Where [ID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[CooperationRecord_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[CooperationRecord_Add]
	@ObjectID int,
	@UsersID int,
	@StartTime nvarchar(50),
	@EndTime nvarchar(50),
	@AddTime nvarchar(50),
	@Type nvarchar(50),
	@Reasons text,
	@Results text,
	@Remarks text,
	@ReturnValue int output
AS
set @ReturnValue=0
	INSERT INTO [CooperationRecord] ([ObjectID],[UsersID],[StartTime],[EndTime],[AddTime],[Type],[Reasons],[Results],[Remarks])
	VALUES(@ObjectID,@UsersID,@StartTime,@EndTime,@AddTime,@Type,@Reasons,@Results,@Remarks)
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Contact_Updata]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Contact_Updata]
	@ID int,
	@cnName nvarchar(50),
	@enName nvarchar(50),
	@Sex nvarchar(50),
	@Position nvarchar(50),
	@Birthday nvarchar(50),
	@Country nvarchar(50),
	@ZipCode nvarchar(50),
	@Address nvarchar(50),
	@IDCard nvarchar(50),
	@Mobile nvarchar(50),
	@Phone nvarchar(50),
	@Extension nvarchar(50),
	@Email nvarchar(50),
	@Remarks text,
	@isPosition nvarchar(50),
	@ReturnValue int output
AS
	set	@ReturnValue=0
	update [Contact] set
	[cnName]=@cnName,
	[enName]=@enName,
	[Sex]=@Sex,
	[Position]=@Position,
	[Birthday]=@Birthday,
	[Country]=@Country,
	[ZipCode]=@ZipCode,
	[Address]=@Address,
	[IDCard]=@IDCard,
	[Mobile]=@Mobile,
	[Phone]=@Phone,
	[Extension]=@Extension,
	[Email]=@Email,
	[Remarks]=@Remarks,
	[isPosition]=@isPosition
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[Contact_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Contact_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists(Select * From [Contact] Where [ID] =@ID)
    begin
	Delete [Contact] Where [ID] =@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Contact_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Contact_Add]
	@SuppliersID int,
	@cnName nvarchar(50),
	@enName nvarchar(50),
	@Sex nvarchar(50),
	@Position nvarchar(50),
	@Birthday nvarchar(50),
	@Country nvarchar(50),
	@ZipCode nvarchar(50),
	@Address nvarchar(50),
	@IDCard nvarchar(50),
	@Mobile nvarchar(50),
	@Phone nvarchar(50),
	@Extension nvarchar(50),
	@Email nvarchar(50),
	@Remarks text,
	@isPosition nvarchar(50),
	@ReturnValue int output
AS
	set @ReturnValue=0
	INSERT INTO [Contact] ([isPosition],[SuppliersID],[cnName],[enName],[Sex],[Position],[Birthday],[Country],[ZipCode],[Address],[IDCard],[Mobile],[Phone],[Extension],[Email],[Remarks])
	VALUES(@isPosition,@SuppliersID,@cnName,@enName,@Sex,@Position,@Birthday,@Country,@ZipCode,@Address,@IDCard,@Mobile,@Phone,@Extension,@Email,@Remarks)
	set @ReturnValue=@@IDENTITY
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[ClassQuestionnaire_Updata]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[ClassQuestionnaire_Updata]
	@ID int,
	@ClassID int,
	@AddUsersID int,
	@AddTime nvarchar(50),
	@Name nvarchar(50),
	@Text text,
	@Remarks text,
	@ReturnValue int output
AS
	Set
	@ReturnValue=0
	update [ClassQuestionnaire] set
	[ClassID]=@ClassID,
	[AddUsersID]=@AddUsersID,
	[AddTime]=@AddTime,
	[Name]=@Name,
	[Text]=@Text,
	[Remarks]=@Remarks
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[ClassQuestionnaire_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[ClassQuestionnaire_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists (Select [ID] From [ClassQuestionnaire] Where [ID]=@ID )
    begin
	Delete [ClassQuestionnaire] Where [ID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[ClassQuestionnaire_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[ClassQuestionnaire_Add]
	@ClassID int,
	@AddUsersID int,
	@AddTime nvarchar(50),
	@Name nvarchar(50),
	@Text text,
	@Remarks text,
	@ReturnValue int output
AS
	INSERT INTO [ClassQuestionnaire] ([ClassID],[AddUsersID],[AddTime],[Name],[Text],[Remarks])
	VALUES(@ClassID,@AddUsersID,@AddTime,@Name,@Text,@Remarks)
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[ClassNotice_Updata]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[ClassNotice_Updata]
	@ID int,
	@ClassID int,
	@AddUsersID int,
	@AddTime nvarchar(50),
	@Name nvarchar(50),
	@Text text,
	@Remarks text,
	@ReturnValue int output
AS
	Set
	@ReturnValue=0
	update [ClassNotice] set
	[ClassID]=@ClassID,
	[AddUsersID]=@AddUsersID,
	[AddTime]=@AddTime,
	[Name]=@Name,
	[Text]=@Text,
	[Remarks]=@Remarks
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[ClassNotice_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[ClassNotice_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists (Select [ID] From [ClassNotice] Where [ID]=@ID )
    begin
	Delete [ClassNotice] Where [ID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[ClassNotice_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[ClassNotice_Add]
	@ClassID int,
	@AddUsersID int,
	@AddTime nvarchar(50),
	@Name nvarchar(50),
	@Text text,
	@Remarks text,
	@ProgramID int,
	@ReturnValue int output
AS
	INSERT INTO [ClassNotice] ([ClassID],[AddUsersID],[AddTime],[Name],[Text],[Remarks])
	VALUES(@ClassID,@AddUsersID,@AddTime,@Name,@Text,@Remarks)
	update [Schedule] set [Notice]='1' where [ProgramID]=@ProgramID
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[ClassEvaluation_Updata]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[ClassEvaluation_Updata]
	@ID int,
	@ClassID int,
	@AddUsersID int,
	@AddTime nvarchar(50),
	@Name nvarchar(50),
	@Text text,
	@Remarks text,
	@ReturnValue int output
AS
	Set
	@ReturnValue=0
	update [ClassEvaluation] set
	[ClassID]=@ClassID,
	[AddUsersID]=@AddUsersID,
	[AddTime]=@AddTime,
	[Name]=@Name,
	[Text]=@Text,
	[Remarks]=@Remarks
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[ClassEvaluation_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[ClassEvaluation_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists (Select [ID] From [ClassEvaluation] Where [ID]=@ID )
    begin
	Delete [ClassEvaluation] Where [ID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[ClassEvaluation_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[ClassEvaluation_Add]
	@ClassID int,
	@AddUsersID int,
	@AddTime nvarchar(50),
	@Name nvarchar(50),
	@Text text,
	@Remarks text,
	@ReturnValue int output
AS
	INSERT INTO [ClassEvaluation] ([ClassID],[AddUsersID],[AddTime],[Name],[Text],[Remarks])
	VALUES(@ClassID,@AddUsersID,@AddTime,@Name,@Text,@Remarks)
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[ClassAttendance_Updata]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[ClassAttendance_Updata]
	@ID int,
	@Total int,
	@nTotal int,
	@yTotal int,
	@ClassID int,
	@AddUsersID int,
	@AddTime nvarchar(50),
	@Name nvarchar(50),
	@URL nvarchar(50),
	@Text text,
	@Remarks text,
	@ReturnValue int output
AS
	Set
	@ReturnValue=0
	update [ClassAttendance] set
	[ClassID]=@ClassID,
	[AddUsersID]=@AddUsersID,
	[AddTime]=@AddTime,
	[Name]=@Name,
	[Text]=@Text,
	[Total]=@Total,
	[yTotal]=@yTotal,
	[nTotal]=@nTotal,
	[URL]=@URL,
	[Remarks]=@Remarks
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[ClassAttendance_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[ClassAttendance_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists (Select [ID] From [ClassAttendance] Where [ID]=@ID )
    begin
	Delete [ClassAttendance] Where [ID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[ClassAttendance_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[ClassAttendance_Add]
	@ClassID int,
	@Total int,
	@yTotal int,
	@nTotal int,
	@AddUsersID int,
	@AddTime nvarchar(50),
	@Name nvarchar(50),
	@URL nvarchar(50),
	@Text text,
	@Remarks text,
	@ReturnValue int output
AS
	INSERT INTO [ClassAttendance] ([URL],[Total],[nTotal],[yTotal],[ClassID],[AddUsersID],[AddTime],[Name],[Text],[Remarks])
	VALUES(@URL,@Total,@nTotal,@yTotal,@ClassID,@AddUsersID,@AddTime,@Name,@Text,@Remarks)
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Cantbe_Updata]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Cantbe_Updata]
	@GroupID int,
	@UsersID int,
	@OrganizationStructure int,
	@CourseLb int,
	@Position int,
	@Staff int,
	@News int,
	@Module int,
	@sGroup int,
	@Notice int,
	@MyInformation int,
	@PersonalData int,
	@TrainingNeeds int,
	@TrainingProgram int,
	@CurriculumStudy int,
	@TrainingRecords int,
	@CaseStudy int,
	@QuestionnaireSurvey int,
	@Examination int,
	@EvaluationCenter int,
	@Assessment int,
	@ApplicationsForTraining int,
	@CaseShare int,
	@TrainingForum int,
	@AskYour int,
	@MySuggestion int,
	@ReturnValue int output
AS
Set
	@ReturnValue=0
	--如果组ID大于0，则以组ID更新组。
	if(@GroupID>0)
	begin
	update [Cantbe] set
	[UsersID]=0,
	[OrganizationStructure]=@OrganizationStructure,
	[CourseLb]=@CourseLb,
	[Position]=@Position,
	[Staff]=@Staff,
	[News]=@News,
	[Module]=@Module,
	[Notice]=@Notice,
	[MyInformation]=@MyInformation,
	[PersonalData]=@PersonalData,
	[TrainingNeeds]=@TrainingNeeds,
	[TrainingProgram]=@TrainingProgram,
	[CurriculumStudy]=@CurriculumStudy,
	[TrainingRecords]=@TrainingRecords,
	[CaseStudy]=@CaseStudy,
	[QuestionnaireSurvey]=@QuestionnaireSurvey,
	[Examination]=@Examination,
	[EvaluationCenter]=@EvaluationCenter,
	[Assessment]=@Assessment,
	[ApplicationsForTraining]=@ApplicationsForTraining,
	[CaseShare]=@CaseShare,
	[TrainingForum]=@TrainingForum,
	[AskYour]=@AskYour,
	[MySuggestion]=@MySuggestion,
	[sGroup]=@sGroup
	Where [GroupID]=@GroupID
	end 
	--否则以用户ID更新
	else
	update [Cantbe] set
	[GroupID]=0,
	[OrganizationStructure]=@OrganizationStructure,
	[CourseLb]=@CourseLb,
	[Position]=@Position,
	[Staff]=@Staff,
	[News]=@News,
	[Module]=@Module,
	[Notice]=@Notice,
	[MyInformation]=@MyInformation,
	[PersonalData]=@PersonalData,
	[TrainingNeeds]=@TrainingNeeds,
	[TrainingProgram]=@TrainingProgram,
	[CurriculumStudy]=@CurriculumStudy,
	[TrainingRecords]=@TrainingRecords,
	[CaseStudy]=@CaseStudy,
	[QuestionnaireSurvey]=@QuestionnaireSurvey,
	[Examination]=@Examination,
	[EvaluationCenter]=@EvaluationCenter,
	[Assessment]=@Assessment,
	[ApplicationsForTraining]=@ApplicationsForTraining,
	[CaseShare]=@CaseShare,
	[TrainingForum]=@TrainingForum,
	[AskYour]=@AskYour,
	[MySuggestion]=@MySuggestion,
	[sGroup]=@sGroup
	Where [UsersID]=@UsersID
	set @ReturnValue=1
	return @ReturnValue
	RETURN
GO
/****** Object:  StoredProcedure [TMS].[Cantbe_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Cantbe_Add]
	@GroupID int,
	@UsersID int,
	@OrganizationStructure int,
	@CourseLb int,
	@Position int,
	@Staff int,
	@News int,
	@Module int,
	@sGroup int,
	@Notice int,
	@MyInformation int,
	@PersonalData int,
	@TrainingNeeds int,
	@TrainingProgram int,
	@CurriculumStudy int,
	@TrainingRecords int,
	@CaseStudy int,
	@QuestionnaireSurvey int,
	@Examination int,
	@EvaluationCenter int,
	@Assessment int,
	@ApplicationsForTraining int,
	@CaseShare int,
	@TrainingForum int,
	@AskYour int,
	@MySuggestion int,
	@ReturnValue int output
AS
set @ReturnValue=0
if(@GroupID>0)
	begin
	INSERT INTO [Cantbe] ([GroupID],[OrganizationStructure],[CourseLb],[Position],[Staff],[News],[Module],[sGroup],[Notice],[MyInformation],[PersonalData],[TrainingNeeds],[TrainingProgram],[CurriculumStudy],[TrainingRecords],[CaseStudy],[QuestionnaireSurvey],[Examination],[EvaluationCenter],[Assessment],[ApplicationsForTraining],[CaseShare],[TrainingForum],[AskYour],[MySuggestion])
	VALUES(@GroupID,@OrganizationStructure,@CourseLb,@Position,@Staff,@News,@Module,@sGroup,@Notice,@MyInformation,@PersonalData,@TrainingNeeds,@TrainingProgram,@CurriculumStudy,@TrainingRecords,@CaseStudy,@QuestionnaireSurvey,@Examination,@EvaluationCenter,@Assessment,@ApplicationsForTraining,@CaseShare,@TrainingForum,@AskYour,@MySuggestion)
	set @ReturnValue=1
	end
else
	INSERT INTO [Cantbe] ([UsersID],[OrganizationStructure],[CourseLb],[Position],[Staff],[News],[Module],[sGroup],[Notice],[MyInformation],[PersonalData],[TrainingNeeds],[TrainingProgram],[CurriculumStudy],[TrainingRecords],[CaseStudy],[QuestionnaireSurvey],[Examination],[EvaluationCenter],[Assessment],[ApplicationsForTraining],[CaseShare],[TrainingForum],[AskYour],[MySuggestion])
	VALUES(@UsersID,@OrganizationStructure,@CourseLb,@Position,@Staff,@News,@Module,@sGroup,@Notice,@MyInformation,@PersonalData,@TrainingNeeds,@TrainingProgram,@CurriculumStudy,@TrainingRecords,@CaseStudy,@QuestionnaireSurvey,@Examination,@EvaluationCenter,@Assessment,@ApplicationsForTraining,@CaseShare,@TrainingForum,@AskYour,@MySuggestion)
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Budget_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Budget_Del]
	@ID int,
	@ReturnValue int output
AS
set @ReturnValue=0
if exists (Select [ID] From [Budget] Where [ID]=@ID )
    begin
	declare @ProgramID int
	set @ProgramID =(select ProgramID from Budget where ID=@ID)
	Delete [Budget] Where [ID]=@ID
	set @ReturnValue=1
	end
    if((select COUNT(*) from Budget where ProgramID=@ProgramID)=0)
    begin
    update Schedule set Budget=0 where ProgramID=@ProgramID
    end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Budget_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Budget_Add]
	@ProgramID int,
	@CourseID int,
	@Money int,
	@UserID int,
	@Title nvarchar(500),
	@ReturnValue int output
AS
	INSERT INTO [Budget] ([ProgramID],[CourseID],[Money],[Title],[UserID])
	VALUES(@ProgramID,@CourseID,@Money,@Title,@UserID)
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[AssessmentTitleList_Updata]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[AssessmentTitleList_Updata]
	@ID int,
	@MTitle nvarchar(500),
	@DTitle nvarchar(500),
	@PTitle nvarchar(500),
	@ReturnValue int output
AS
	set @ReturnValue=0
	update [AssessmentTitleList] set
	[MTitle]=@MTitle,
	[DTitle]=@DTitle,
	[PTitle]=@PTitle
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[AssessmentTitleList_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[AssessmentTitleList_Del]
	@ID int,
	@ReturnValue int output
AS
	set @ReturnValue=0
if exists (Select [ID] From [AssessmentTitleList] Where [ID]=@ID )
    begin
	Delete [AssessmentTitleList] Where [ID]=@ID
	Delete [AssessmentOptionsList] Where [AssessmentTitleListID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[AssessmentTitleList_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[AssessmentTitleList_Add]
	@AssessmentID int,
	@Type nvarchar(50),
	@MTitle nvarchar(500),
	@DTitle nvarchar(500),
	@PTitle nvarchar(500),
	@ReturnValue int output
AS
	set @ReturnValue=0
	if exists (Select [ID] From [AssessmentTitleList] Where MTitle=@MTitle and DTitle=@DTitle and PTitle=@PTitle )
    begin
    set @ReturnValue=0
	end
	else
	begin
	INSERT INTO [AssessmentTitleList] ([AssessmentID],[Type],[MTitle],[DTitle],[PTitle])
	VALUES(@AssessmentID,@Type,@MTitle,@DTitle,@PTitle)
	set @ReturnValue=@@IDENTITY
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[AssessmentTest_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[AssessmentTest_Del]
	@AssessmentID int,
	@UsersID int,
	@TestDate nvarchar(50),
	@ReturnValue int output
AS
	set @ReturnValue=0
	Delete [AssessmentTest] Where [TestDate]=@TestDate and [UsersID]=@UsersID and [AssessmentID]=@AssessmentID
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[AssessmentTest_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[AssessmentTest_Add]
	@AssessmentID int,
	@AssessmentTitleListID int,
	@AssessmentOptionsList int,
	@UsersID int,
	@Name nvarchar(500),
	@TestDate nvarchar(50),
	@ReturnValue int output
AS
	set @ReturnValue=0
	INSERT INTO [AssessmentTest] ([AssessmentTitleListID],[Name],[TestDate],[UsersID],[AssessmentOptionsList],[AssessmentID])
	VALUES(@AssessmentTitleListID,@Name,@TestDate,@UsersID,@AssessmentOptionsList,@AssessmentID)
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[AssessmentOptionsList_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[AssessmentOptionsList_Del]
	@ID int,
	@ReturnValue int output
AS
	set @ReturnValue=0
if exists (Select [ID] From [AssessmentOptionsList] Where [ID]=@ID )
    begin
	Delete [AssessmentOptionsList] Where [ID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[AssessmentOptionsList_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[AssessmentOptionsList_Add]
	@AssessmentTitleListID int,
	@Name nvarchar(500),
	@ReturnValue int output
AS
	set @ReturnValue=0
	INSERT INTO [AssessmentOptionsList] ([AssessmentTitleListID],[Name])
	VALUES(@AssessmentTitleListID,@Name)
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Assessment_Updata]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Assessment_Updata]
	@ID int,
	@LecturerID int,
	@TrainingID int,
	@CourseID int,
	@Total int,
	@Hours nvarchar(50),
	@Date nvarchar(50),
	@STime nvarchar(50),
	@ETime nvarchar(50),
	@ReturnValue int output
AS
	set @ReturnValue=0
	update [Assessment] set
	[LecturerID]=@LecturerID,
	[TrainingID]=@TrainingID,
	[CourseID]=@CourseID,
	[Hours]=@Hours,
	[Date]=@Date,
	[Total]=@Total,
	[STime]=@STime,
	[ETime]=@ETime
	where [ID]=@ID
	set @ReturnValue=1
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Assessment_Del]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Assessment_Del]
	@ID int,
	@ReturnValue int output
AS
	set @ReturnValue=0
if exists (Select [ID] From [Assessment] Where [ID]=@ID )
    begin
	Delete [Assessment] Where [ID]=@ID
	set @ReturnValue=1
	end
	return @ReturnValue
GO
/****** Object:  StoredProcedure [TMS].[Assessment_Add]    Script Date: 07/16/2009 11:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TMS].[Assessment_Add]
	@LecturerID int,
	@TrainingID int,
	@CourseID int,
	@Total int,
	@Hours nvarchar(50),
	@Date nvarchar(50),
	@STime nvarchar(50),
	@ETime nvarchar(50),
	@ReturnValue int output
AS
	set @ReturnValue=0
	INSERT INTO [Assessment] ([LecturerID],[TrainingID],[CourseID],[Total],[Hours],[Date],[STime],[ETime])
	VALUES(@LecturerID,@TrainingID,@CourseID,@Total,@Hours,@Date,@STime,@ETime)
	set @ReturnValue=@@IDENTITY
	return @ReturnValue
GO
/****** Object:  Default [DF_Staff_Password]    Script Date: 07/16/2009 11:10:11 ******/
ALTER TABLE [TMS].[Staff] ADD  CONSTRAINT [DF_Staff_Password]  DEFAULT ((888888)) FOR [Password]
GO
