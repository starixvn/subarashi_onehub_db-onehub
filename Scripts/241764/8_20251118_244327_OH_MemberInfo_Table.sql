/*<info serverAlias="DBOH-ONEHub"></info>*/
/*
    Created: 20251118@Sophia
    DB: DBOH-ONEHub
    Task: Create MemberInfo table for ONEHub database to store member information [RedmineId: #244327]
        - Create AccInfoIndex filegroup
        - Create MemberInfo table with clustered PK on CustId and SiteId
        - Create non-clustered indexes on RegDate, FTDDate, and ClickId
        - Add extended properties for documentation
*/

USE [ONEHub]
GO

 
ALTER DATABASE [ONEHub] ADD FILEGROUP [AccInfoIndex]  
GO 

IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = 'MemberInfo' AND schema_id = SCHEMA_ID('dbo'))
BEGIN
	CREATE TABLE [dbo].[MemberInfo](
		[CustId] [int] NOT NULL,
		[UserName] [varchar](30) NULL,
		[FirstName] [nvarchar](100) NULL,
		[LastName] [nvarchar](100) NULL,
		[Email] [nvarchar](100) NULL,
		[Currency] [int] NULL,
		[ActStatus] [tinyint] NULL,
		[Status] [tinyint] NULL,
		[IsRemoved] [bit] NULL,
		[RegisteredDate] [datetime] NULL,
		[RegDate] [date] NULL,
		[IDCode] [varchar](20) NULL,
		[CreatedDate] [datetime] NULL,
		[ClickId] [bigint] NULL,
		[FirstDepositDate] [datetime] NULL,
		[FTDDate] [date] NULL,
		[FirstDepositAmount] [money] NULL,
		[SiteId] [smallint] NOT NULL,
		CONSTRAINT [PK_MemberInfo] PRIMARY KEY CLUSTERED ([CustId] ASC, [SiteId] ASC)
	) ON [AccInfoIndex]

	-- Create non-clustered indexes
	CREATE NONCLUSTERED INDEX [IX_MemberInfo_RegDate] ON [dbo].[MemberInfo]
	(
		[RegDate] ASC
	) ON [AccInfoIndex]

	CREATE NONCLUSTERED INDEX [IX_MemberInfo_FTDDate] ON [dbo].[MemberInfo]
	(
		[FTDDate] ASC
	) ON [AccInfoIndex]

	CREATE NONCLUSTERED INDEX [IX_MemberInfo_ClickId] ON [dbo].[MemberInfo]
	(
		[ClickId] ASC
	) ON [AccInfoIndex]
END
GO
