USE [PaperLessOffice_ir]
GO
/****** Object:  UserDefinedFunction [dbo].[f1]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[f1] (@Param1 int)
RETURNS int
AS
BEGIN
    DECLARE @Result int;

    IF @param1 > 100
        SET @Result = 1;
    ELSE
        SET @Result = 0;

    RETURN @Result;
END
GO
/****** Object:  UserDefinedFunction [dbo].[f2]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[f2] (@Param1 int)
RETURNS int
AS
BEGIN
    DECLARE @Result int;

    IF @param1 < 100
        SET @Result = 10;
    ELSE
        SET @Result = 20;

    RETURN @Result;
END
GO
/****** Object:  UserDefinedFunction [dbo].[MyFunction]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[MyFunction] (@param1 INT, @param2 VARCHAR(50))
RETURNS INT
AS
BEGIN
    -- Your function logic here
    DECLARE @result INT;
    SET @result = @param1 + LEN(@param2);
    RETURN @result;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[TESTfNetSale]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TESTfNetSale](
    @quantity INT,
    @list_price DEC(10,2),
    @discount DEC(4,2)
)
RETURNS DEC(10,2)
AS 
BEGIN
    RETURN @quantity * @list_price * (1 - @discount);
END;
GO
/****** Object:  Table [dbo].[FunctionTable]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FunctionTable](
	[fnid] [int] NULL,
	[FunctionName] [varchar](100) NULL,
	[Parameter1] [int] NULL,
	[Parameter2] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ref_JobType]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ref_JobType](
	[JobType_id] [int] IDENTITY(1,1) NOT NULL,
	[JobTypeDesc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Ref_JobType] PRIMARY KEY CLUSTERED 
(
	[JobType_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ref_wfStatus]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ref_wfStatus](
	[code] [int] IDENTITY(1,1) NOT NULL,
	[wfstatus] [nvarchar](50) NULL,
	[wfsactive] [bit] NULL,
 CONSTRAINT [PK_Ref_wfStatus] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tab_FindNextJob]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tab_FindNextJob](
	[FindNextJob_id] [bigint] NOT NULL,
	[option_id] [bigint] NULL,
	[resultVaue] [nvarchar](50) NULL,
	[NextJob_id] [bigint] NULL,
 CONSTRAINT [PK_tab_FindNextJob] PRIMARY KEY CLUSTERED 
(
	[FindNextJob_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tab_jobs]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tab_jobs](
	[jobid] [bigint] IDENTITY(1,1) NOT NULL,
	[jobname] [nvarchar](50) NULL,
	[wuid] [bigint] NULL,
	[active] [bit] NULL,
	[maxhours] [int] NULL,
	[jobType] [int] NULL,
	[RefrenceId] [bigint] NULL,
 CONSTRAINT [PK_Tab_jobs] PRIMARY KEY CLUSTERED 
(
	[jobid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tab_Options]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tab_Options](
	[optionid] [bigint] NOT NULL,
	[OptName] [nvarchar](150) NULL,
	[Option_Type] [int] NULL,
	[Query_id] [int] NULL,
	[Procedure_name] [nvarchar](150) NULL,
	[Procedure_Param] [nvarchar](150) NULL,
	[pjid] [bigint] NULL,
	[procid] [bigint] NULL,
	[jobid] [bigint] NULL,
	[nextjob] [bigint] NULL,
	[optactive] [bit] NULL,
	[nxtstatus] [int] NULL,
	[nxtmaxtime] [bigint] NULL,
	[WCF_id] [bigint] NULL,
	[WCF_method] [bigint] NULL,
	[WCF_Param] [nvarchar](1500) NULL,
	[CallFunction] [nvarchar](50) NULL,
	[FunctionParamList] [nvarchar](150) NULL,
	[AutomaticOpt] [bit] NULL,
 CONSTRAINT [PK_Tab_Options] PRIMARY KEY CLUSTERED 
(
	[optionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tab_Orgmapp]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tab_Orgmapp](
	[unit_code] [decimal](11, 0) NOT NULL,
	[parent_code] [decimal](11, 0) NOT NULL,
	[INSERT_DATE] [datetime] NULL,
	[unit_level] [decimal](5, 0) NULL,
	[unit_type] [decimal](5, 0) NULL,
	[parent_level] [decimal](5, 0) NULL,
	[parent_type] [decimal](5, 0) NULL,
	[active] [decimal](1, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tab_Orgstruct]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tab_Orgstruct](
	[unit_code] [decimal](11, 0) NOT NULL,
	[parent_unit] [decimal](11, 0) NULL,
	[unit_name] [nvarchar](100) NULL,
	[unit_level] [decimal](5, 0) NULL,
	[unit_type] [decimal](5, 0) NULL,
	[unit_discode] [decimal](11, 0) NULL,
	[tender_master] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tab_Process]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tab_Process](
	[procid] [bigint] IDENTITY(30,1) NOT NULL,
	[procname] [nvarchar](50) NULL,
	[procactive] [bit] NULL,
	[startjob] [bigint] NULL,
	[ProcType] [int] NULL,
	[startjobtime] [bigint] NULL,
	[procwu] [bigint] NULL,
	[ToBeArchived] [bit] NULL,
	[helplink] [nvarchar](150) NULL,
 CONSTRAINT [PK_Tab_process] PRIMARY KEY CLUSTERED 
(
	[procid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tab_role]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tab_role](
	[roleid] [bigint] NULL,
	[userid] [bigint] NULL,
	[active] [bit] NULL,
	[powerUser] [bit] NULL,
	[ViewSubWU] [bit] NULL,
	[deptDocClassified] [bit] NULL,
	[SubDeptClassified] [bit] NULL,
	[search_result] [bit] NULL,
	[edit] [bit] NULL,
	[archive] [bit] NULL,
	[template] [bit] NULL,
	[wf] [bit] NULL,
	[todo] [bit] NULL,
	[late] [bit] NULL,
	[inbox] [bit] NULL,
	[adduser] [bit] NULL,
	[addwf] [bit] NULL,
	[addjob] [bit] NULL,
	[addWU] [bit] NULL,
	[addOption] [bit] NULL,
	[bypass] [bit] NULL,
	[docSave] [bit] NULL,
	[docPrint] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tab_Template]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tab_Template](
	[template_id] [bigint] IDENTITY(10,1) NOT NULL,
	[Procid] [bigint] NULL,
	[tempname] [nvarchar](50) NULL,
	[tempURL] [nvarchar](1500) NULL,
	[temppath] [nvarchar](1500) NULL,
	[tempactive] [bit] NULL,
	[version] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tab_template] PRIMARY KEY CLUSTERED 
(
	[template_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tab_UserJob]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tab_UserJob](
	[ujid] [bigint] IDENTITY(373,1) NOT NULL,
	[userid] [bigint] NOT NULL,
	[jobid] [bigint] NOT NULL,
	[ujActive] [bit] NULL,
	[onlyLate] [bit] NULL,
 CONSTRAINT [PK_Tab_UserJob] PRIMARY KEY CLUSTERED 
(
	[ujid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tab_userProcess]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tab_userProcess](
	[upid] [bigint] IDENTITY(10,1) NOT NULL,
	[userid] [bigint] NULL,
	[procid] [bigint] NULL,
	[upactive] [bit] NULL,
 CONSTRAINT [PK_Tab_userProcess] PRIMARY KEY CLUSTERED 
(
	[upid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tab_users]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tab_users](
	[userid] [bigint] NOT NULL,
	[username] [nvarchar](50) NULL,
	[pwd] [nvarchar](50) NULL,
	[fullname] [nvarchar](50) NULL,
	[wu] [bigint] NULL,
	[position] [int] NULL,
	[active] [bit] NULL,
	[inbox] [bigint] NULL,
	[reportTo] [bigint] NULL,
	[viewWU] [bigint] NULL,
	[email] [nchar](50) NULL,
	[mobile] [nchar](13) NULL,
	[cid] [decimal](12, 0) NULL,
	[location] [nchar](50) NULL,
	[fpid] [int] NULL,
 CONSTRAINT [PK_Tab_users] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tab_wfTransactions]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tab_wfTransactions](
	[wftid] [bigint] IDENTITY(10,1) NOT NULL,
	[wfid] [bigint] NULL,
	[transdate] [datetime] NULL,
	[optionselected] [bigint] NULL,
	[note] [nvarchar](1000) NULL,
	[userid] [bigint] NULL,
	[VerDoc] [nvarchar](1500) NULL,
 CONSTRAINT [PK_Tab_wfTransactions] PRIMARY KEY CLUSTERED 
(
	[wftid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tab_workflow]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tab_workflow](
	[wfid] [bigint] IDENTITY(13,1) NOT NULL,
	[userid] [bigint] NULL,
	[procid] [bigint] NULL,
	[template_id] [bigint] NULL,
	[InitialJob] [bigint] NULL,
	[doc] [nvarchar](1500) NULL,
	[wfstatusCode] [int] NULL,
	[wfcurrentjob] [bigint] NULL,
	[lastOption] [bigint] NULL,
	[isopen] [bit] NULL,
	[timeJobStart] [datetime] NULL,
	[alarmtime] [datetime] NULL,
	[viewed] [bit] NULL,
	[processStartTime] [smalldatetime] NULL,
	[processEndTime] [smalldatetime] NULL,
	[tokenUID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Tab_workflow] PRIMARY KEY CLUSTERED 
(
	[wfid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_fnParameters]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_fnParameters](
	[Param_id] [bigint] NOT NULL,
	[fn_id] [bigint] NULL,
	[ParamName] [nvarchar](50) NULL,
	[ParamType] [nvarchar](50) NULL,
	[ParamValue] [nvarchar](50) NULL,
	[ParamSeq] [int] NULL,
	[ParamActive] [bit] NULL,
 CONSTRAINT [PK_Table_fnParameters] PRIMARY KEY CLUSTERED 
(
	[Param_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Functions]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Functions](
	[fn_id] [bigint] NOT NULL,
	[FnName] [nvarchar](50) NULL,
	[ParamCount] [int] NULL,
	[fnActive] [bit] NULL,
	[fnResultDatatype] [nvarchar](50) NULL,
	[fnResult] [nvarchar](max) NULL,
 CONSTRAINT [PK_Table_Functions] PRIMARY KEY CLUSTERED 
(
	[fn_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_J_JobFunction]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_J_JobFunction](
	[JobFn_id] [bigint] NULL,
	[jobID] [bigint] NULL,
	[FnID] [bigint] NULL,
	[JFActive] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tab_FindNextJob]  WITH CHECK ADD  CONSTRAINT [FK_tab_FindNextJob_Tab_jobs] FOREIGN KEY([NextJob_id])
REFERENCES [dbo].[Tab_jobs] ([jobid])
GO
ALTER TABLE [dbo].[tab_FindNextJob] CHECK CONSTRAINT [FK_tab_FindNextJob_Tab_jobs]
GO
ALTER TABLE [dbo].[tab_FindNextJob]  WITH CHECK ADD  CONSTRAINT [FK_tab_FindNextJob_tab_Options] FOREIGN KEY([option_id])
REFERENCES [dbo].[tab_Options] ([optionid])
GO
ALTER TABLE [dbo].[tab_FindNextJob] CHECK CONSTRAINT [FK_tab_FindNextJob_tab_Options]
GO
ALTER TABLE [dbo].[Tab_jobs]  WITH CHECK ADD  CONSTRAINT [FK_Tab_jobs_Ref_JobType] FOREIGN KEY([jobType])
REFERENCES [dbo].[Ref_JobType] ([JobType_id])
GO
ALTER TABLE [dbo].[Tab_jobs] CHECK CONSTRAINT [FK_Tab_jobs_Ref_JobType]
GO
ALTER TABLE [dbo].[tab_Options]  WITH CHECK ADD  CONSTRAINT [FK_tab_Options_Ref_wfStatus] FOREIGN KEY([nxtstatus])
REFERENCES [dbo].[Ref_wfStatus] ([code])
GO
ALTER TABLE [dbo].[tab_Options] CHECK CONSTRAINT [FK_tab_Options_Ref_wfStatus]
GO
ALTER TABLE [dbo].[tab_Options]  WITH CHECK ADD  CONSTRAINT [FK_tab_Options_Tab_jobs] FOREIGN KEY([jobid])
REFERENCES [dbo].[Tab_jobs] ([jobid])
GO
ALTER TABLE [dbo].[tab_Options] CHECK CONSTRAINT [FK_tab_Options_Tab_jobs]
GO
ALTER TABLE [dbo].[tab_Options]  WITH CHECK ADD  CONSTRAINT [FK_tab_Options_Tab_jobs1] FOREIGN KEY([nextjob])
REFERENCES [dbo].[Tab_jobs] ([jobid])
GO
ALTER TABLE [dbo].[tab_Options] CHECK CONSTRAINT [FK_tab_Options_Tab_jobs1]
GO
ALTER TABLE [dbo].[tab_Options]  WITH CHECK ADD  CONSTRAINT [FK_tab_Options_Tab_Process] FOREIGN KEY([procid])
REFERENCES [dbo].[Tab_Process] ([procid])
GO
ALTER TABLE [dbo].[tab_Options] CHECK CONSTRAINT [FK_tab_Options_Tab_Process]
GO
ALTER TABLE [dbo].[Tab_Template]  WITH CHECK ADD  CONSTRAINT [FK_Tab_Template_Tab_Process] FOREIGN KEY([Procid])
REFERENCES [dbo].[Tab_Process] ([procid])
GO
ALTER TABLE [dbo].[Tab_Template] CHECK CONSTRAINT [FK_Tab_Template_Tab_Process]
GO
ALTER TABLE [dbo].[Tab_UserJob]  WITH CHECK ADD  CONSTRAINT [FK_Tab_UserJob_Tab_jobs] FOREIGN KEY([jobid])
REFERENCES [dbo].[Tab_jobs] ([jobid])
GO
ALTER TABLE [dbo].[Tab_UserJob] CHECK CONSTRAINT [FK_Tab_UserJob_Tab_jobs]
GO
ALTER TABLE [dbo].[Tab_UserJob]  WITH CHECK ADD  CONSTRAINT [FK_Tab_UserJob_Tab_users] FOREIGN KEY([userid])
REFERENCES [dbo].[Tab_users] ([userid])
GO
ALTER TABLE [dbo].[Tab_UserJob] CHECK CONSTRAINT [FK_Tab_UserJob_Tab_users]
GO
ALTER TABLE [dbo].[Tab_userProcess]  WITH CHECK ADD  CONSTRAINT [FK_Tab_userProcess_Tab_Process] FOREIGN KEY([procid])
REFERENCES [dbo].[Tab_Process] ([procid])
GO
ALTER TABLE [dbo].[Tab_userProcess] CHECK CONSTRAINT [FK_Tab_userProcess_Tab_Process]
GO
ALTER TABLE [dbo].[Tab_userProcess]  WITH CHECK ADD  CONSTRAINT [FK_Tab_userProcess_Tab_users] FOREIGN KEY([userid])
REFERENCES [dbo].[Tab_users] ([userid])
GO
ALTER TABLE [dbo].[Tab_userProcess] CHECK CONSTRAINT [FK_Tab_userProcess_Tab_users]
GO
ALTER TABLE [dbo].[Tab_wfTransactions]  WITH NOCHECK ADD  CONSTRAINT [FK_Tab_wfTransactions_Tab_Options] FOREIGN KEY([optionselected])
REFERENCES [dbo].[tab_Options] ([optionid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Tab_wfTransactions] NOCHECK CONSTRAINT [FK_Tab_wfTransactions_Tab_Options]
GO
ALTER TABLE [dbo].[Tab_wfTransactions]  WITH NOCHECK ADD  CONSTRAINT [FK_Tab_wfTransactions_Tab_users] FOREIGN KEY([userid])
REFERENCES [dbo].[Tab_users] ([userid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Tab_wfTransactions] NOCHECK CONSTRAINT [FK_Tab_wfTransactions_Tab_users]
GO
ALTER TABLE [dbo].[Tab_wfTransactions]  WITH NOCHECK ADD  CONSTRAINT [FK_Tab_wfTransactions_Tab_workflow] FOREIGN KEY([wfid])
REFERENCES [dbo].[Tab_workflow] ([wfid])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Tab_wfTransactions] NOCHECK CONSTRAINT [FK_Tab_wfTransactions_Tab_workflow]
GO
ALTER TABLE [dbo].[Tab_workflow]  WITH CHECK ADD  CONSTRAINT [FK_Tab_workflow_Ref_wfStatus] FOREIGN KEY([wfstatusCode])
REFERENCES [dbo].[Ref_wfStatus] ([code])
GO
ALTER TABLE [dbo].[Tab_workflow] CHECK CONSTRAINT [FK_Tab_workflow_Ref_wfStatus]
GO
ALTER TABLE [dbo].[Tab_workflow]  WITH CHECK ADD  CONSTRAINT [FK_Tab_workflow_Tab_jobs] FOREIGN KEY([wfcurrentjob])
REFERENCES [dbo].[Tab_jobs] ([jobid])
GO
ALTER TABLE [dbo].[Tab_workflow] CHECK CONSTRAINT [FK_Tab_workflow_Tab_jobs]
GO
ALTER TABLE [dbo].[Tab_workflow]  WITH CHECK ADD  CONSTRAINT [FK_Tab_workflow_tab_Options] FOREIGN KEY([lastOption])
REFERENCES [dbo].[tab_Options] ([optionid])
GO
ALTER TABLE [dbo].[Tab_workflow] CHECK CONSTRAINT [FK_Tab_workflow_tab_Options]
GO
ALTER TABLE [dbo].[Tab_workflow]  WITH CHECK ADD  CONSTRAINT [FK_Tab_workflow_Tab_Process] FOREIGN KEY([procid])
REFERENCES [dbo].[Tab_Process] ([procid])
GO
ALTER TABLE [dbo].[Tab_workflow] CHECK CONSTRAINT [FK_Tab_workflow_Tab_Process]
GO
ALTER TABLE [dbo].[Tab_workflow]  WITH CHECK ADD  CONSTRAINT [FK_Tab_workflow_Tab_Template] FOREIGN KEY([template_id])
REFERENCES [dbo].[Tab_Template] ([template_id])
GO
ALTER TABLE [dbo].[Tab_workflow] CHECK CONSTRAINT [FK_Tab_workflow_Tab_Template]
GO
ALTER TABLE [dbo].[Tab_workflow]  WITH CHECK ADD  CONSTRAINT [FK_Tab_workflow_Tab_users] FOREIGN KEY([userid])
REFERENCES [dbo].[Tab_users] ([userid])
GO
ALTER TABLE [dbo].[Tab_workflow] CHECK CONSTRAINT [FK_Tab_workflow_Tab_users]
GO
/****** Object:  StoredProcedure [dbo].[EmpOptions]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[EmpOptions] 
	( 
	@procid bigint, 
	@jobid bigint
	)
AS
declare 
@jobtype as int

select @jobtype = jobtype from tab_jobs where jobid = @jobid
----------------------------------------------
if @jobtype = 1 
-- ارسال الى JOBID محدد 	
	Begin (	SELECT        optionid, OptName
			FROM            dbo.Tab_Options
			WHERE  optionid in (42,43,44,45,46,47,48,49,50,10130,20499,20500) --(اذا كان المستقبل اسم شخص فخياراته محددة)
 ) End else
 begin
 -- هذا الخيار المعتاد و المعرف عندتعريف تاعمليات
  if @jobid <> 0
   begin 
   ( SELECT optionid, OptName FROM   dbo.Tab_Options 	
			WHERE     (procid = @procid ) AND (jobid = @jobid)
	) end
  else 

  begin if @procid in (35) begin( SELECT 0 as optionid , 'تابع' as OptName union 	SELECT -1 as optionid , 'إرسل الى' as OptName  ) end
  else SELECT 0 as optionid , 'تابع' as OptName  -- عملية البداية من النظامالسابق ولا نحتاجها
   end
 end
		




GO
/****** Object:  StoredProcedure [dbo].[EvaluateFunctionByID]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EvaluateFunctionByID]
    @fnid int
AS
BEGIN
    DECLARE @functionName VARCHAR(100);
    DECLARE @param1 INT;
    DECLARE @param2 VARCHAR(50);

    -- Step 1: Get the Function details based on the provided fnid
    SELECT @functionName = FunctionName, @param1 = Parameter1, @param2 = Parameter2
    FROM FunctionTable
    WHERE fnid = @fnid;


	print @functionName;
    -- Step 2: Check if a valid function was found
    IF @functionName IS NULL
    BEGIN
        -- Handle the case when the provided fnid is invalid or no function is found
        RETURN; -- Exit the procedure if no valid function is found
    END;

    -- Step 3: Call the Dynamic Function
    DECLARE @dynamicSql NVARCHAR(MAX);
	
    SET @dynamicSql = 'SELECT dbo.' + QUOTENAME(@functionName) + '(' + CAST(@param1 AS NVARCHAR(100)) + ',' + QUOTENAME(@param2, '''') + ');';
	select @dynamicSql
    DECLARE @result INT;
    EXEC sp_executesql @dynamicSql, N'@result INT OUTPUT', @result OUTPUT;

    -- Step 4: Process the Result
    IF @result = 1
    BEGIN
        select 'YES it is working'
    END;
END;
GO
/****** Object:  StoredProcedure [dbo].[EvaluateJobFunctions]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EvaluateJobFunctions]
    @jobid bigint,
    @Param1 int,
    @Param2 varchar(50)
AS
BEGIN
    -- Create a temporary table to store the evaluation results.
    CREATE TABLE #FunctionEvaluationResult (
        FunctionName nvarchar(50),
        ResultValue nvarchar(max)
    );

    -- Declare variables to store function evaluation data.
    DECLARE @fnID bigint;
    DECLARE @fnName nvarchar(50);
    DECLARE @fnActive bit;
    DECLARE @fnResult nvarchar(max);
    DECLARE @paramID bigint;
    DECLARE @paramName nvarchar(50);
    DECLARE @paramType nvarchar(50);
    DECLARE @paramValue nvarchar(50);
    DECLARE @paramSeq int;
    DECLARE @paramActive bit;

    -- Get the functions associated with the given job ID.
    INSERT INTO #FunctionEvaluationResult (FunctionName, ResultValue)
    SELECT TF.FnName, '' AS ResultValue
    FROM Table_Functions TF
    WHERE TF.fn_id IN (
        SELECT TJJF.FnID
        FROM Table_J_JobFunction TJJF
        WHERE TJJF.jobID = @jobid
    );

    -- Loop through the functions and evaluate each one.
    DECLARE cur CURSOR FOR
    SELECT fn_id, FnName, fnActive, fnResult
    FROM Table_Functions
    WHERE fn_id IN (
        SELECT FnID FROM Table_J_JobFunction WHERE jobID = @jobid
    );

    OPEN cur;

    FETCH NEXT FROM cur INTO @fnID, @fnName, @fnActive, @fnResult;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Check if the function is active.
        IF @fnActive = 1
        BEGIN
            -- Prepare the function call dynamically based on the parameters.
            DECLARE @sql NVARCHAR(MAX);
            SET @sql = 'SELECT @result = dbo.' + QUOTENAME(@fnName) + '('
                        + CAST(@Param1 AS NVARCHAR(100)) + ', '
                        + QUOTENAME(@Param2, '''') + ');';

            -- Declare and execute the dynamic SQL to call the function and get the result.
            DECLARE @result nvarchar(max);
            EXEC sp_executesql @sql, N'@result nvarchar(max) OUTPUT', @result = @result OUTPUT;

            -- Update the result value in the temporary table.
            UPDATE #FunctionEvaluationResult
            SET ResultValue = @result
            WHERE FunctionName = @fnName;
        END

        FETCH NEXT FROM cur INTO @fnID, @fnName, @fnActive, @fnResult;
    END

    CLOSE cur;
    DEALLOCATE cur;

    -- Return the evaluation results.
    SELECT FunctionName, ResultValue
    FROM #FunctionEvaluationResult;

    -- Clean up temporary table.
    DROP TABLE #FunctionEvaluationResult;
END;
GO
/****** Object:  StoredProcedure [dbo].[Get_WfHistory]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_WfHistory] 
 (
 @wfid bigint
 )
AS
BEGIN

SELECT       dbo.Tab_wfTransactions.wfid, dbo.Tab_wfTransactions.transdate, dbo.Tab_wfTransactions.note, dbo.Tab_jobs.jobname
--    Tab_wfTransactions.wfid, Tab_wfTransactions.note, Tab_wfTransactions.transdate, tab_Options.OptName, Tab_jobs.jobname, Tab_jobs_1.jobname AS Expr1, Tab_users.fullname
FROM            Tab_jobs INNER JOIN
                         tab_Options ON Tab_jobs.jobid = tab_Options.jobid INNER JOIN
                         Tab_wfTransactions ON tab_Options.optionid = Tab_wfTransactions.optionselected INNER JOIN
                         Tab_jobs AS Tab_jobs_1 ON tab_Options.nextjob = Tab_jobs_1.jobid INNER JOIN
                         Tab_users ON Tab_wfTransactions.userid = Tab_users.userid
WHERE        (Tab_wfTransactions.wfid = @wfid)
order by Tab_wfTransactions.transdate asc
/*
SELECT        dbo.Ref_wfStatus.wfstatus, dbo.Tab_workflow.wfid, dbo.Tab_wfTransactions.transdate, dbo.Tab_wfTransactions.note, dbo.Tab_jobs.jobname
FROM            dbo.Tab_wfTransactions INNER JOIN
                         dbo.Tab_Options ON dbo.Tab_wfTransactions.optionselected = dbo.Tab_Options.optionid INNER JOIN
                         dbo.Tab_workflow ON dbo.Tab_wfTransactions.wfid = dbo.Tab_workflow.wfid INNER JOIN
                         dbo.Ref_wfStatus ON dbo.Tab_workflow.wfstatusCode = dbo.Ref_wfStatus.code INNER JOIN
                         dbo.Tab_jobs ON dbo.Tab_Options.jobid = dbo.Tab_jobs.jobid AND dbo.Tab_workflow.wfcurrentjob = dbo.Tab_jobs.jobid
       where dbo.Tab_workflow.wfid =@wfid
       order by dbo.Tab_wfTransactions.transdate asc 
	   */
END



GO
/****** Object:  StoredProcedure [dbo].[GetJobInfo]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetJobInfo]
    @jobid BIGINT
AS
BEGIN
    SELECT
        jobid,
        jobname,
        active
    FROM
        Tab_jobs
    WHERE
        jobid = @jobid  AND ACTIVE = 1;
    
    SELECT
        U.userid,
        U.username
    FROM
        Tab_users U
    JOIN
        Tab_UserJob UJ ON U.userid = UJ.userid
    WHERE
        UJ.jobid = @jobid
        AND UJ.ujActive = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[GetJobsDropdown]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetJobsDropdown]
AS
BEGIN

SELECT [jobid]
      ,[jobname]
     
  FROM [dbo].[Tab_jobs]
  where [active] = 1


END
GO
/****** Object:  StoredProcedure [dbo].[GetJobsWithUserCount]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetJobsWithUserCount]
AS
BEGIN
    SELECT
        J.jobid,
        J.jobname,
        J.active,
        COUNT(UJ.userid) AS UsersAllowed
    FROM
        Tab_jobs J
    LEFT JOIN
        Tab_UserJob UJ ON J.jobid = UJ.jobid
    WHERE
        J.active = 1
    GROUP BY
        J.jobid, J.jobname, J.active
    ORDER BY
        J.jobname;
END

GO
/****** Object:  StoredProcedure [dbo].[GetOptionList]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[GetOptionList] 
	( 
	@procid bigint, 
	@jobid bigint,
	@wfid bigint,
	@userid bigint, 
	@wfStatusCode bigint,
	@lastJobId bigint,
	@LastOptid bigint
	)
AS
declare 
	@jobtype as int,
	@Option_Type as int

--old
		select @jobtype = jobtype from tab_jobs where jobid = @jobid

--new
		select top 1 @Option_Type = Option_Type from tab_Options where jobid = @jobid and @procid=procid
----------------------------------------------
if @Option_Type = 1  
			-- first type of options normal type opt : job , proc
	Begin 
			SELECT optionid, OptName 
			FROM   dbo.Tab_Options 	
			WHERE     (procid = @procid ) AND (jobid = @jobid)
	End

if @Option_Type = 2  
			-- 2nd type of options refrance opt :
			-- based on query or procedure like select names or titles or locations
	Begin 
            SELECT optionid, OptName 
			FROM   dbo.Tab_Options  opt	,dbo.Tab_jobs j
			WHERE        opt.procid = @procid 
					 AND  opt.jobid = @jobid
					 AND  opt.optactive = 1
					 AND  j.active = 1
			         AND  opt.jobid = j.jobid
					 AND  j.jobType = 1  -- example 1: usernames ( if else  end)
	      								 -- example 2: position title
										 -- example 3: Locations

										 --ADD IF STATMENTS DEPENDING ON THE JOB TYPES

	 End	


if @Option_Type = 3
			 -- 3rd type of options fixed opt : based on static jobs
			 --(اذا كان المستقبل اسم شخص فخياراته محددة)
	Begin 
           	SELECT  optionid, OptName
			FROM    dbo.Tab_Options
			WHERE   optionid in (42,43,44,45,46,47,48,49,50,10130,20499,20500) 
			
	End

if @Option_Type = 4

	 begin
	 ( SELECT 0 as optionid , 'تابع' as OptName 
	   union 	
	   SELECT -1 as optionid , 'إرسل الى' as OptName 
	  ) end
 




GO
/****** Object:  StoredProcedure [dbo].[GetUsersAllowedForJob]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUsersAllowedForJob]
    @jobid BIGINT
AS
BEGIN
    SELECT
        U.userid,
        U.username
    FROM
        Tab_users U
    JOIN
        Tab_UserJob UJ ON U.userid = UJ.userid
    WHERE
        UJ.jobid = @jobid
        AND UJ.ujActive = 1;
END

GO
/****** Object:  StoredProcedure [dbo].[Pro_ExecuteWf]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[Pro_ExecuteWf] ( 
       -- Add the parameters for the stored procedure here
 @uid bigint,
 @procid bigint,   -- no need if i have the wfid
 @wfid bigint,   -- if 0  then it is new
 @doc nvarchar (1500),
 @note nvarchar(1000)= ' ', -- set default to '..' space
 @optionid bigint,
 @sendto bigint
 
 )
AS
       -- creating a new record in wf and wftrans

declare 
	@username nvarchar(50),
	@nextjob bigint,
	@procname nvarchar(50),
	@optionname nvarchar(150),
	@maxduration int,
	@newWfid bigint,
	@nxtstatus int,
	@TobeArchived bit,            -- GIVE OPTION FOR ARCHIVING THE END RESULT
	@jobType int			      -- added in 26-8-2014

BEGIN
 --select @wfid wfid, @doc+'1' doc
--  get the full name of the user To save it in transaction log
( select @username = fullname from dbo.Tab_users where userid = @uid )
( Select @optionname = OptName from tab_Options where optionid =  @optionid )

 INSERT INTO [dbo].[Tab_wfTransactions]
						        ([wfid]    
							    ,[transdate]
								,[optionselected]
								,[note]
							    ,[userid])
					      VALUES
								(@Wfid
							    ,getdate()
								 ,@optionid
								 ,@username + ' : ' + @optionname + ' : ' + ISNULL( @note, ' ')
								 ,@uid
								 --, @OldDoc if version is needed
								 )
		   
--begin
								SELECT          @nextjob = nextjob,
										    	@optionname =  OptName,
												@nxtstatus = nxtstatus,
												@maxduration = nxtmaxtime
								FROM            dbo.Tab_Options
								WHERE           (optionid = @optionid) AND (optactive = 1)
--		end

--update  tab wf
			UPDATE [dbo].[Tab_workflow]
						 SET   
								 [doc] = @doc -- for versioning must save old doc in WFtransactions
								 ,[wfstatusCode] = @nxtstatus 
								 ,[wfcurrentjob] = @nextjob
							     ,[lastOption] =  @optionid        -- changed 27-8-2014 old value = commented
								 ,[isopen] = 0
								 ,[timeJobStart] = GETDATE()
								 ,[alarmtime] = DATEADD(mi,@maxduration, GETDATE() )  -- fix dateadd
								 ,[viewed] = 0
						 WHERE wfid = @wfid

 SELECT TOP 1 [wftid]
      ,[wfid]
      ,[transdate]
      ,[optionselected]
      ,[note]
      ,[userid]
      ,[VerDoc]
  FROM [PaperLessOffice_ir].[dbo].[Tab_wfTransactions] where wfid = @wfid
  order by [transdate] desc
END

 --begin
--commit;
--end





GO
/****** Object:  StoredProcedure [dbo].[Pro_GetActiveUsers]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Pro_GetActiveUsers]

AS
BEGIN
	SELECT        Tab_users.userid, Tab_users.fullname, tab_Orgstruct.unit_code, tab_Orgstruct.unit_name
FROM            Tab_users ,tab_Orgstruct
                         where Tab_users.active = 1
						 AND   Tab_users.wu = tab_Orgstruct.unit_code
END
GO
/****** Object:  StoredProcedure [dbo].[Pro_GetFinishedProc]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[Pro_GetFinishedProc]
(
	@userid bigint
)
AS
BEGIN
	SELECT        dbo.Tab_workflow.wfid
				, dbo.Tab_process.procid
				, dbo.Tab_users.username
				, dbo.Tab_process.procname
				, dbo.Ref_wfStatus.wfstatus
				, dbo.Tab_workflow.timeJobStart
				, dbo.Tab_users.userid
				, ISNULL(dbo.Tab_users.reportTo , ' ') reportTo
			    , dbo.Tab_workflow.doc
FROM            dbo.Tab_users INNER JOIN
                         dbo.Tab_workflow ON dbo.Tab_users.userid = dbo.Tab_workflow.userid INNER JOIN
                         dbo.Tab_process ON dbo.Tab_workflow.procid = dbo.Tab_process.procid INNER JOIN
                         dbo.Ref_wfStatus ON dbo.Tab_workflow.wfstatusCode = dbo.Ref_wfStatus.code
						 
WHERE        (dbo.Ref_wfStatus.code = 3) AND ((dbo.Tab_users.userid = @userid) OR (dbo.Tab_users.reportTo = @userid))



END




GO
/****** Object:  StoredProcedure [dbo].[Pro_GetJobsUserAllowed]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[Pro_GetJobsUserAllowed]
	(@userid bigint)
AS
BEGIN
	SELECT        Tab_jobs.jobid,
	              Tab_jobs.jobname,
				  Tab_jobs.active,
				  Tab_UserJob.ujid,
				  Tab_UserJob.userid,
				  Tab_UserJob.ujActive
FROM            Tab_jobs ,Tab_UserJob



                          WHERE 
        (Tab_jobs.active = 1) 
		AND (Tab_UserJob.ujActive = 1) 
		AND Tab_jobs.jobid = Tab_UserJob.jobid 
		AND (Tab_UserJob.userid =  @userid)

END

	
GO
/****** Object:  StoredProcedure [dbo].[Pro_GetJobsUserNotAllowed]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[Pro_GetJobsUserNotAllowed]
	(@userid bigint)
AS
BEGIN
	SELECT        Tab_jobs.jobid,
	              Tab_jobs.jobname,
				  Tab_jobs.active,
				  Tab_UserJob.ujid,
				  Tab_UserJob.userid,
				  Tab_UserJob.ujActive
FROM            Tab_jobs ,Tab_UserJob



  WHERE 
        (Tab_jobs.active = 1) 
		AND (Tab_UserJob.ujActive = 1) 
		AND Tab_jobs.jobid = Tab_UserJob.jobid 
		AND (Tab_UserJob.userid =  @userid)

END

	
GO
/****** Object:  StoredProcedure [dbo].[Pro_GetLateWf]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Pro_GetLateWf] 
	(
	 @userid as bigint
	)

AS
BEGIN
SELECT       
			  dbo.Tab_users.fullname
			, dbo.Tab_process.procname
			, dbo.Tab_workflow.wfid
			, dbo.Tab_workflow.procid
			, dbo.Ref_wfStatus.wfstatus
			, dbo.Tab_workflow.timeJobStart
			, dbo.Tab_workflow.doc
			, dbo.Tab_workflow.wfcurrentjob
			, dbo.Tab_jobs.jobname
			, dbo.Tab_workflow.alarmtime
			, dbo.Tab_workflow.wfstatusCode
FROM            dbo.Tab_workflow INNER JOIN
                         dbo.Tab_users ON dbo.Tab_workflow.userid = dbo.Tab_users.userid INNER JOIN
                         dbo.Tab_process ON dbo.Tab_workflow.procid = dbo.Tab_process.procid INNER JOIN
                         dbo.Ref_wfStatus ON dbo.Tab_workflow.wfstatusCode = dbo.Ref_wfStatus.code INNER JOIN
                         dbo.Tab_jobs ON dbo.Tab_workflow.wfcurrentjob = dbo.Tab_jobs.jobid
WHERE         ((dbo.Tab_users.userid = @userid) OR (dbo.Tab_users.reportTo = @userid))
			 AND (dbo.Tab_workflow.alarmtime <= GETDATE())
			 AND (dbo.Tab_workflow.wfstatusCode <> 3)

END






GO
/****** Object:  StoredProcedure [dbo].[Pro_GetMyInprogressProc]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Pro_GetMyInprogressProc]
(
	@userid bigint
)
AS
BEGIN
SELECT        dbo.Tab_workflow.wfid,
				dbo.Tab_Process.procid,
			 dbo.Tab_Process.procname,
			  dbo.Tab_workflow.alarmtime,
			   dbo.Tab_jobs.jobname,
			    dbo.Ref_wfStatus.wfstatus,
				 dbo.Tab_users.fullname
FROM            dbo.Tab_workflow INNER JOIN
                         dbo.Tab_Process ON dbo.Tab_workflow.procid = dbo.Tab_Process.procid INNER JOIN
                         dbo.Ref_wfStatus ON dbo.Tab_workflow.wfstatusCode = dbo.Ref_wfStatus.code INNER JOIN
                         dbo.Tab_jobs ON dbo.Tab_workflow.wfcurrentjob = dbo.Tab_jobs.jobid INNER JOIN
                         dbo.Tab_users ON dbo.Tab_workflow.userid = dbo.Tab_users.userid
WHERE        (dbo.Ref_wfStatus.code = 2) AND (dbo.Tab_users.userid = @userid) 
order by dbo.Tab_workflow.alarmtime desc



END




GO
/****** Object:  StoredProcedure [dbo].[Pro_GetMyJob]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[Pro_GetMyJob]
	-- Add the parameters for the stored procedure here
	(
	@userid int
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT        dbo.Tab_users.fullname, dbo.Tab_Process.procname, dbo.Tab_workflow.wfid, dbo.Tab_workflow.procid, dbo.Ref_wfStatus.wfstatus, dbo.Tab_workflow.timeJobStart,ISNULL( dbo.Tab_workflow.alarmtime, GETDATE())alarmtime , dbo.Tab_workflow.doc, 
                         dbo.Tab_workflow.wfcurrentjob, dbo.Tab_workflow.wfstatusCode, dbo.Tab_jobs.jobname
FROM            dbo.Tab_workflow INNER JOIN
                         dbo.Ref_wfStatus ON dbo.Tab_workflow.wfstatusCode = dbo.Ref_wfStatus.code INNER JOIN
                         dbo.Tab_users ON dbo.Tab_workflow.userid = dbo.Tab_users.userid INNER JOIN
                         dbo.Tab_Process ON dbo.Tab_workflow.procid = dbo.Tab_Process.procid INNER JOIN
                         dbo.Tab_jobs ON dbo.Tab_workflow.wfcurrentjob = dbo.Tab_jobs.jobid
WHERE      (
					  (dbo.Ref_wfStatus.wfsactive = 1) AND (dbo.Tab_workflow.isopen = 0) AND /* (dbo.Tab_workflow.alarmtime > GETDATE()) AND */ (dbo.Tab_workflow.wfstatusCode <> 3) AND (dbo.Tab_workflow.wfcurrentjob IN
                             (SELECT        jobid
                                FROM            dbo.Tab_UserJob
                                WHERE        (userid = @userid and ujActive = 1 and onlyLate = 0)))
			) 
			OR
			(
			 (dbo.Ref_wfStatus.wfsactive = 1) AND (dbo.Tab_workflow.isopen = 0) AND  (dbo.Tab_workflow.alarmtime <= GETDATE()) AND (dbo.Tab_workflow.wfstatusCode <> 3) AND (dbo.Tab_workflow.wfcurrentjob IN
                             (SELECT        jobid
                                FROM            dbo.Tab_UserJob
                                WHERE        (userid = @userid and ujActive = 1 and onlyLate = 1)))
			)

order by alarmtime asc 


END



GO
/****** Object:  StoredProcedure [dbo].[Pro_GetMyJobShortList]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mahdi
-- Create date: 20-8-2023
-- Description:	group inbox based on the jobs
-- =============================================
CREATE PROCEDURE [dbo].[Pro_GetMyJobShortList] 
	(@userid bigint,
	@Sort int)   /*  (1) order by job name ASC , (2) order by total Desc */
AS
BEGIN


IF @Sort = 1
    	SELECT        Tab_workflow.wfcurrentjob,
			          Tab_jobs.jobname,
			          count(1) total
		FROM            Tab_UserJob ,Tab_jobs,Tab_workflow
                          
		WHERE        (Tab_UserJob.ujActive = 1)
				AND (Tab_jobs.active = 1) 
				AND (Tab_workflow.wfstatusCode = 2) 
                AND (Tab_UserJob.userid = @userid)
				AND Tab_UserJob.jobid = Tab_jobs.jobid 
                AND Tab_jobs.jobid = Tab_workflow.wfcurrentjob
		group by   Tab_workflow.wfcurrentjob,Tab_jobs.jobname
		order by 2 ;
ELSE 
     	SELECT        Tab_workflow.wfcurrentjob,
			          Tab_jobs.jobname,
			          count(1) total
        FROM            Tab_UserJob ,Tab_jobs,Tab_workflow
                          
		WHERE        (Tab_UserJob.ujActive = 1)
				AND (Tab_jobs.active = 1) 
				AND (Tab_workflow.wfstatusCode = 2) 
                AND (Tab_UserJob.userid = @userid)
				AND Tab_UserJob.jobid = Tab_jobs.jobid 
                AND Tab_jobs.jobid = Tab_workflow.wfcurrentjob
       group by   Tab_workflow.wfcurrentjob,Tab_jobs.jobname
       order by 3  desc;
END
GO
/****** Object:  StoredProcedure [dbo].[Pro_GetMySpecificJob]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pro_GetMySpecificJob]
	-- Add the parameters for the stored procedure here
	(
	
	@jobid bigint -- make change to where = @jobid
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT       dbo.Tab_users.fullname, dbo.Tab_Process.procname, dbo.Tab_workflow.wfid, dbo.Tab_workflow.procid, dbo.Ref_wfStatus.wfstatus, dbo.Tab_workflow.timeJobStart,ISNULL( dbo.Tab_workflow.alarmtime, GETDATE())alarmtime , dbo.Tab_workflow.doc, 
                         dbo.Tab_workflow.wfcurrentjob, dbo.Tab_workflow.wfstatusCode, dbo.Tab_jobs.jobname
FROM            dbo.Tab_workflow INNER JOIN
                         dbo.Ref_wfStatus ON dbo.Tab_workflow.wfstatusCode = dbo.Ref_wfStatus.code INNER JOIN
                         dbo.Tab_users ON dbo.Tab_workflow.userid = dbo.Tab_users.userid INNER JOIN
                         dbo.Tab_Process ON dbo.Tab_workflow.procid = dbo.Tab_Process.procid INNER JOIN
                         dbo.Tab_jobs ON dbo.Tab_workflow.wfcurrentjob = dbo.Tab_jobs.jobid
WHERE      
					  (dbo.Ref_wfStatus.wfsactive = 1)
					  AND (dbo.Tab_workflow.isopen = 0) 
					  AND /* (dbo.Tab_workflow.alarmtime > GETDATE()) AND */
					  (dbo.Tab_workflow.wfstatusCode <> 3)
					             AND (dbo.Tab_workflow.wfcurrentjob IN (@jobid) ) 
								 -- you want the wf of specific job  , added 3/9/2023
                   

order by alarmtime asc 


END
GO
/****** Object:  StoredProcedure [dbo].[Pro_GetProcessUserAllowed]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Pro_GetProcessUserAllowed]
	(@userid bigint)
AS
BEGIN
	SELECT        Tab_Process.procid,
					Tab_Process.procname,
					Tab_Process.procactive,
					Tab_userProcess.upid,
					Tab_userProcess.userid,
					Tab_userProcess.upactive
FROM            Tab_Process ,Tab_userProcess
                          
WHERE        Tab_Process.procactive = 1
			AND (Tab_userProcess.upactive = 1)
            AND Tab_Process.procid = Tab_userProcess.procid
			AND Tab_userProcess.userid = @userid

END
GO
/****** Object:  StoredProcedure [dbo].[Pro_GetProcessUserNotAllowed]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Pro_GetProcessUserNotAllowed]
	(@userid bigint)
AS
BEGIN
SELECT        procid, procname, procactive
FROM            Tab_Process
WHERE        (procactive = 1) and procid NOT IN
(

	SELECT        Tab_Process.procid
					
FROM            Tab_Process ,Tab_userProcess
                          
WHERE        Tab_Process.procactive = 1
			AND (Tab_userProcess.upactive = 1)
            AND Tab_Process.procid = Tab_userProcess.procid
			AND Tab_userProcess.userid = @userid
	)
END
GO
/****** Object:  StoredProcedure [dbo].[Pro_GetUserRole]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Mahdi>
-- Create date: <15/08/2019>
-- Description:	<RedMint>
-- =============================================
CREATE PROCEDURE [dbo].[Pro_GetUserRole]
	-- Add the parameters for the stored procedure here
(
@username	nvarchar(50)
,@pwd	nvarchar(50)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Tab_role 
	where userid in (select userid 
						from Tab_users 
						where username = @username
						      and @pwd = pwd and active = 1)
END



GO
/****** Object:  StoredProcedure [dbo].[Pro_NewWF]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Pro_NewWF] ( 
							-- Add the parameters for the stored procedure here
	@uid bigint, 
	@template_id	bigint	
	)
AS

							-- creating a new record in wf and wftrans
declare 
	@username nvarchar(50),
	@nextjob bigint,
	@procname nvarchar(50),
	@procid bigint,
	@startjob bigint,       --*** YOU HANE TO DECIDE IS STARTING JOB IS USER OR FROM PROCESS
	@maxduration int,
	@temppath nvarchar(1500),
	@nxtstatus int,
	@TobeArchived bit,            -- GIVE OPTION FOR ARCHIVING THE END RESULT
	@jobType int,			      -- added in 26-8-2014
	@tokenUID uniqueidentifier,   -- or varchar 
	@wfid bigint




BEGIN

SELECT     
		  @procid =  dbo.Tab_Process.procid,
		  @procname =  dbo.Tab_Process.procname,
	      @startjob = dbo.Tab_Process.startjob,  --*** YOU HANE TO DECIDE IS STARTING JOB IS USER OR FROM PROCESS
	      @TobeArchived = dbo.Tab_Process.ToBeArchived,
		  @temppath = dbo.Tab_Template.temppath
FROM          dbo.Tab_Process INNER JOIN
              dbo.Tab_Template ON dbo.Tab_Process.procid = dbo.Tab_Template.Procid
WHERE        (dbo.Tab_Template.template_id = @template_id) 
         AND (dbo.Tab_Template.tempactive = 1)
		 AND (dbo.Tab_Process.procactive = 1)


------------------------------------------------
set @tokenUID  = newid()


	INSERT INTO [dbo].[Tab_workflow]
           ([userid]
           ,[procid]
           ,[template_id]
           ,[doc]
           ,[wfstatusCode]
           ,[wfcurrentjob]   --*** YOU HANE TO DECIDE IS STARTING JOB IS USER OR FROM PROCESS
           ,[lastOption]
           ,[isopen]
           ,[timeJobStart]
           ,[alarmtime]
           ,[viewed]
           ,[processStartTime]
           ,[processEndTime]
		   ,[tokenUID])
     VALUES
           (@uid,
			@procid,
           @template_id, 
           convert(nvarchar(1500) , @tokenUID),
             1,						             -- status :starting

			 -------
			 -- @startJob uncooment 6april2019
           @startjob           -- @nextjob       --*** YOU HANE TO DECIDE IS STARTING JOB IS USER OR FROM PROCESS
          -- 1 --   @nextjob       --*** YOU HANE TO DECIDE IS STARTING JOB IS USER OR FROM PROCESS
                                              -- what is the user inbox
		  -----
		 
		 
		  , 16 -- تقديم طلب                  --@optionid       -- changed 27-8-2014 old value = 0
          , 0                  -- isopen is false)
		  , GETDATE()
		  , DATEADD(mi,@maxduration, GETDATE() )
		  ,1
		  , GETDATE()
		  ,null
		  ,@tokenUID ) 

         ---------------LOG transaction
		 --  get the full name of the user To save it in transaction log
       ( select @username = fullname from dbo.Tab_users where userid = @uid )
		 select  @wfid = wfid from Tab_workflow  where tokenUID =@tokenUID 

		 INSERT INTO [dbo].[Tab_wfTransactions]
						        ([wfid]    
							    ,[transdate]
								,[optionselected]
								,[note]
							    ,[userid])
					      VALUES
								(@wfid
							    ,getdate()
								 ,0  --@optionid  new
								 ,@username + ' : ' + @procname + ' : جديد' 
								 ,@uid
								 --, @OldDoc if version is needed
								 )
		 ---------   
		
	select  wfid, wfcurrentjob , doc from Tab_workflow  where tokenUID =@tokenUID 


END



GO
/****** Object:  StoredProcedure [dbo].[ProcessUserCanInitiate]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ProcessUserCanInitiate]
	(
	@userid int
	)
AS
BEGIN
SELECT        dbo.Tab_Process.procid, dbo.Tab_Process.procname, dbo.Tab_Template.Template_id, ISNULL(dbo.Tab_Template.tempURL , '') as tempURL, ISNULL(dbo.Tab_Template.temppath , '') as temppath, dbo.Tab_Template.tempname
FROM            dbo.Tab_Process INNER JOIN
                         dbo.Tab_userProcess ON dbo.Tab_Process.procid = dbo.Tab_userProcess.procid INNER JOIN
                         dbo.Tab_users ON dbo.Tab_userProcess.userid = dbo.Tab_users.userid INNER JOIN
                         dbo.Tab_Template ON dbo.Tab_Process.procid = dbo.Tab_Template.Procid
WHERE        (dbo.Tab_users.userid  = @userid)
END





GO
/****** Object:  StoredProcedure [dbo].[ProLogin]    Script Date: 9/3/2023 12:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <15/08/2019>
-- Description:	<RedMint>
-- =============================================
CREATE PROCEDURE [dbo].[ProLogin]
( 
	@username  nvarchar(20),
    @pwd as  nvarchar(20)
)
AS
BEGIN
	SELECT @username as username, count(*) as canLogin
    FROM [PaperLessOffice_ir].[dbo].[Tab_users]
	WHERE username = @username
	AND   pwd =  @pwd
	AND active = 1
END

------------------++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Saved Version of the Doc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tab_wfTransactions', @level2type=N'COLUMN',@level2name=N'VerDoc'
GO
