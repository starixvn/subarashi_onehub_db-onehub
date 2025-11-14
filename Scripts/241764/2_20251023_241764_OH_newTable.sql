/*<info serverAlias="DBOH-ONEHub"></info>*/
/*
    Created: 20250822@Sophia
    DB: DBOH-ONEHub
    Task: New Landing Page Setting [RedmineId : #236797]
        - Create new Landing Page tables (Module, MediaGallery, Setting)
        - Updated columns and datatypes per latest documentation/screenshots
*/

use ONEHub
GO
-- 1. Drop & Create Module
DROP TABLE IF EXISTS dbo.Module;
CREATE TABLE Module (
    ModuleId INT NOT NULL,
    ModuleName NVARCHAR(200) NOT NULL,
    ModuleType SMALLINT NOT NULL,
    Remark VARCHAR(200) NULL,
    NavigateTo INT NULL,
    IsMultipleUpload BIT NOT NULL,
    IsRequired BIT NOT NULL,
    IsUnique BIT NOT NULL,
    StatusId TINYINT NULL,
    CONSTRAINT PK_Module PRIMARY KEY CLUSTERED (ModuleId)
) 
ON [SETTING_DATA];

-- 2. Drop & Create MediaGallery
DROP TABLE IF EXISTS dbo.MediaGallery;
CREATE TABLE MediaGallery (
    MediaId INT IDENTITY(1,1) NOT NULL,
    MediaName VARCHAR(200) NOT NULL,
    FileName VARCHAR(200) NOT NULL,
    ModuleId INT NOT NULL,
    Dimension VARCHAR(20) NULL,
    StatusId TINYINT NULL,
    TargetCountryCode VARCHAR(50) NULL,
    MarketId VARCHAR(50) NULL,
    Creator INT NOT NULL,
    CreatedDate DATETIME NOT NULL,
    UpdatedBy INT NULL,
    UpdatedDate DATETIME NULL,
    RowVer rowversion NOT NULL,
    MediaCode VARCHAR(10) NULL,
    CONSTRAINT PK_MediaGallery PRIMARY KEY CLUSTERED (MediaId)
) 
ON [SETTING_DATA];

CREATE NONCLUSTERED INDEX IX_MediaGallery_MediaName 
ON MediaGallery (MediaName)
ON [SETTING_DATA];

CREATE NONCLUSTERED INDEX IX_MediaGallery_ModuleId 
ON MediaGallery (ModuleId)
ON [SETTING_DATA];

-- 2a. Create MediaCode
DROP TABLE IF EXISTS dbo.MediaCode;
CREATE TABLE MediaCode (
    MediaCodeId INT IDENTITY(1,1) NOT NULL,
    MediaCode VARCHAR(10) NOT NULL,
    MediaId INT NULL,
    CONSTRAINT PK_MediaCode PRIMARY KEY CLUSTERED (MediaCodeId)
) 
ON [SETTING_DATA];


-- 4. Drop & Create Builder
DROP TABLE IF EXISTS dbo.PageBuilder;
CREATE TABLE PageBuilder (
    PageId INT IDENTITY(1,1) NOT NULL,
    PageName VARCHAR(200) NOT NULL,
    PageCode VARCHAR(100) NOT NULL,
    CampaignId INT NULL,
    TargetCountryCode VARCHAR(50) NOT NULL,
    MarketId VARCHAR(50) NOT NULL,
    StatusId TINYINT NULL,
    Creator INT NOT NULL,
    CreatedDate DATETIME NOT NULL,
    UpdatedBy INT NULL,
    UpdatedDate DATETIME NULL,
    RowVer ROWVERSION NOT NULL,
    CONSTRAINT PK_Builder PRIMARY KEY CLUSTERED (PageId)
) 
ON [SETTING_DATA];

-- Create nonclustered index on PageCode
CREATE NONCLUSTERED INDEX IX_PageBuilder_PageCode
ON PageBuilder (PageCode)
ON [SETTING_DATA];
GO

-- 5. Drop & Create Builder_Preview
DROP TABLE IF EXISTS dbo.PageBuilder_Preview;
CREATE TABLE PageBuilder_Preview (
    PageId INT IDENTITY(1,1) NOT NULL,
    PageName VARCHAR(200) NOT NULL,
    PageCode VARCHAR(100) NOT NULL,
    CampaignId INT NULL,
    TargetCountryCode VARCHAR(50) NOT NULL,
    MarketId VARCHAR(50) NOT NULL,
    StatusId TINYINT NULL,
    Creator INT NOT NULL,
    CreatedDate DATETIME NOT NULL,
    UpdatedBy INT NULL,
    UpdatedDate DATETIME NULL,
    RowVer ROWVERSION NOT NULL,
    CONSTRAINT PK_PageBuilder_Preview PRIMARY KEY CLUSTERED (PageId)
) 
ON [SETTING_DATA];
GO

-- 6. Drop & Create BuilderDetail
DROP TABLE IF EXISTS dbo.PageBuilderDetail;
CREATE TABLE PageBuilderDetail (
    PageDetailId INT NOT NULL IDENTITY(1,1),
    PageId INT NOT NULL,
    OrderId INT NULL,
    ModuleId INT NULL,
    MediaId INT NULL,
    ExtraInfo VARCHAR(8000) NULL,
    CONSTRAINT PK_PageBuilderDetail PRIMARY KEY NONCLUSTERED (PageDetailId)
) 
ON [SETTING_DATA];

CREATE CLUSTERED INDEX CIX_BuilderDetail_PageId
ON PageBuilderDetail (PageId)
ON [SETTING_DATA];
GO

-- 7. Drop & Create BuilderDetail_Preview
DROP TABLE IF EXISTS dbo.PageBuilderDetail_Preview;
CREATE TABLE PageBuilderDetail_Preview (
    PageDetailId INT NOT NULL IDENTITY(1,1),
    PageId INT NOT NULL,
    OrderId INT NULL,
    ModuleId INT NULL,
    MediaId INT NULL,
    ExtraInfo VARCHAR(8000) NULL,
    CONSTRAINT PK_PageBuilderDetail_Preview PRIMARY KEY NONCLUSTERED (PageDetailId)
) 
ON [SETTING_DATA];

CREATE CLUSTERED INDEX CIX_BuilderDetail_Preview_PageId
ON PageBuilderDetail_Preview (PageId)
ON [SETTING_DATA];
GO

-- 8. Drop & Create Campaign
DROP TABLE IF EXISTS dbo.Campaign;
CREATE TABLE Campaign (
    CampaignId INT NOT NULL IDENTITY(1000,1),
    CampaignName VARCHAR(500) NULL,
    CampaignCode VARCHAR(100) NULL, -- CAM_YYYYMMDD_CampaignId
    Description VARCHAR(500) NULL,
    Creator INT NULL,
    CreatedDate DATETIME NULL,
    UpdatedBy INT NULL,
    UpdatedDate DATETIME NULL,
    StatusId TINYINT NULL, -- 0: Draft, 1: Active, 2: Deactive, 3: Archived
    CONSTRAINT PK_Campaign PRIMARY KEY CLUSTERED (CampaignId)
) 
ON [SETTING_DATA];
GO


-- 9. Drop & Create ComponentType
DROP TABLE IF EXISTS dbo.ComponentType;
CREATE TABLE ComponentType (
    ComponentTypeId INT NOT NULL IDENTITY(1,1),
    ComponentTypeName VARCHAR(100) NULL,
    CONSTRAINT PK_ComponentType PRIMARY KEY CLUSTERED (ComponentTypeId)
) 
ON [SETTING_DATA];
GO

--10. Drop & Create Component
DROP TABLE IF EXISTS dbo.[Component];
CREATE TABLE [dbo].[Component](
	[ComponentId] [int] IDENTITY(1,1) NOT NULL,
	[ComponentName] [varchar](200) NULL,
	[ComponentTypeId] [int] NULL,
	[CategoryType] [tinyint] NULL,
	[Creator] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[StatusId] [tinyint] NULL,
	[ComponentCode] [varchar](200) NULL,
 CONSTRAINT [PK_LandingPage_Component] PRIMARY KEY CLUSTERED 
(
	[ComponentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SETTING_DATA]
) ON [SETTING_DATA]
GO


GO

DROP TABLE IF EXISTS dbo.[LogType];
CREATE TABLE [dbo].[LogType](
	[TypeId] [smallint] NOT NULL,
	[TypeName] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_LogType] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [LogData]
) ON [LogData]
GO

DROP TABLE IF EXISTS dbo.[LogAction];
CREATE TABLE [dbo].[LogAction](
	[ActionId] [int] NOT NULL,
	[ActionTypeId] [int] NULL,
	[SPName] [varchar](200) NULL,
	[Items] [varchar](max) NULL,
	[ActionName] [varchar](256) NULL,
 CONSTRAINT [PK_LogAction] PRIMARY KEY NONCLUSTERED 
(
	[ActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [LogData]
) ON [LogData] TEXTIMAGE_ON [LogData]
GO


DROP TABLE IF EXISTS dbo.[TargetCountry];
CREATE TABLE [dbo].[TargetCountry](
	[MarketID] [varchar](50) NOT NULL,
	[MarketName] [varchar](100) NULL,
	[CountryCode] [varchar](5) NOT NULL,
	[CountryName] [varchar](100) NULL,
	[OrderNo] [int] NULL,
	[ShortedCode] [varchar](20) NULL,
 CONSTRAINT [PK_CountryCode_MarketID] PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC,
	[MarketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [SETTING_DATA]
GO

--INSERT INTO TargetCountry (MarketID, MarketName, CountryCode, CountryName, OrderNo, ShortedCode)
--SELECT MarketID, MarketName, CountryCode, CountryName, OrderNo, ShortedCode
--FROM Affiliate_12B.dbo.TargetCountry WITH(NOLOCK)



GO
DROP TABLE IF EXISTS LandingPage
CREATE TABLE [dbo].[LandingPage](
	[PageId] [smallint] IDENTITY(1,1) NOT NULL,
	[PageName] [nvarchar](200) NULL,
	[PageCode] [nvarchar](100) NULL,
	[IsDeleted] [bit] NULL,
	[BlockTargetCountry] [varchar](200) NULL,
	[IsExcluded] [bit] NOT NULL,
	[IsMobile] [bit] NOT NULL,
	[StatusId] [tinyint] NULL,
 CONSTRAINT [PK_LandingPage] PRIMARY KEY CLUSTERED 
(
	[PageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Setting_Data]
) ON [Setting_Data] 
GO

ALTER TABLE [dbo].[LandingPage] ADD  CONSTRAINT [DF_LandingPage_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO

ALTER TABLE [dbo].[LandingPage] ADD  CONSTRAINT [DF_LandingPage_IsExcluded]  DEFAULT ((1)) FOR [IsExcluded]
GO

ALTER TABLE [dbo].[LandingPage] ADD  CONSTRAINT [DF_LandingPage_IsMobile]  DEFAULT ((0)) FOR [IsMobile]
GO


ALTER TABLE [dbo].[LandingPage] ADD  CONSTRAINT [DF_LandingPage_StatusId]  DEFAULT ((1)) FOR [StatusId]
GO

DROP TABLE IF EXISTS Market
CREATE TABLE [dbo].[Market](
	[MarketId] [nvarchar](10) NOT NULL,
	[MarketName] [nvarchar](50) NULL,
	[MarketNativeName] [nvarchar](50) NULL,
	[ShortedCode] [nvarchar](10) NULL,
	[DisplayName] [nvarchar](50) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Market] PRIMARY KEY CLUSTERED 
(
	[MarketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Setting_Data]
) ON [Setting_Data]
GO

ALTER TABLE [dbo].[Market] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO

DROP TABLE IF EXISTS Country
CREATE TABLE [dbo].[Country](
	[CountryCode] [varchar](5) NOT NULL,
	[CountryName] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [Setting_Data]
GO


DROP TABLE IF EXISTS Exchange
CREATE TABLE [dbo].[Exchange](
	[ExchangeId] [int] NOT NULL,
	[Code] [varchar](5) NULL,
	[MultipliedBy] [int] NULL,
	[CountryCode] [varchar](5) NULL,
 CONSTRAINT [PK_Exchange] PRIMARY KEY CLUSTERED 
(
	[ExchangeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Setting_Data]
) ON [Setting_Data]
GO

ALTER TABLE [dbo].[Exchange] ADD  CONSTRAINT [DF_Exchange_MultipliedBy]  DEFAULT ((0)) FOR [MultipliedBy]
GO


DROP TABLE IF EXISTS TpExchange
CREATE TABLE [dbo].[TpExchange](
	[TpExchangeId] [int] NOT NULL,
	[ExchangeId] [int] NULL,
	[CountryCode] [varchar](5) NULL,
 CONSTRAINT [PK_TpExchange] PRIMARY KEY NONCLUSTERED 
(
	[TpExchangeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Setting_Data]
) ON [Setting_Data]
GO


GO
DROP TABLE IF EXISTS  [dbo].[OH_User]
CREATE TABLE [dbo].[OH_User](
	[UserId] [int],
	[UserName] [varchar](30) NULL

 CONSTRAINT [PK_OH_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Setting_Data]
) ON [Setting_Data]
GO

DROP TABLE IF EXISTS  [dbo].[SystemSettings]
CREATE TABLE [dbo].[SystemSettings](
	[SID] [int] IDENTITY(1,1) NOT NULL,
	[SName] [varchar](50) NULL,
	[SValue] [varchar](200) NULL,
 CONSTRAINT [PK_SystemSettings] PRIMARY KEY CLUSTERED 
(
	[SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Setting_Data]
) ON [Setting_Data]
GO

--DROP TABLE IF EXISTS  [dbo].[ExchangeOanda]
--CREATE TABLE [dbo].[ExchangeOanda](
--	[ExchangeDate] [smalldatetime] NOT NULL,
--	[ExchangeId] [int] NOT NULL,
--	[Code] [varchar](5) NULL,
--	[ActualRate] [float] NULL,
--	[VND] [float] NULL,
--	[EUR] [float] NULL,
--	[USD] [float] NULL,
--	[CNY] [float] NULL,
--	[MYR] [float] NULL,
--	[THB] [float] NULL,
--	[IDR] [float] NULL,
--	[BDT] [float] NULL,
--	[INR] [float] NULL,
-- CONSTRAINT [PK_ExchangeOanda] PRIMARY KEY CLUSTERED 
--(
--	[ExchangeDate] ASC,
--	[ExchangeId] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Setting_Data]
--) ON [Setting_Data]
--GO


--DROP TABLE IF EXISTS  [dbo].[MemberInfo]
--CREATE TABLE [dbo].[MemberInfo](
--	[CustId] [int] NOT NULL,
--	[UserName] [varchar](30) NOT NULL,
--	[FirstName] [nvarchar](50) NULL,
--	[LastName] [nvarchar](50) NULL,
--	[Email] [nvarchar](50) NULL,
--	[Currency] [int] NULL,
--	[ActStatus] [tinyint] NULL,
--	[Status] [tinyint] NULL,
--	[RegisteredDate] [datetime] NULL,
--	[IDCode] [varchar](20) NOT NULL,
--	[IBCCustId] [int] NULL,
--	[IBCUserName] [varchar](30) NULL,
--	[CreatedDate] [datetime] NULL,
--	[IsRemoved] [bit] NULL,
--	[Recommend] [int] NULL,
--	[ClickId] [bigint] NULL,
--	[FirstDepositDate] [datetime] NULL,
--	[FirstDepositAmount] [money] NULL,
--	[AffMediaLinkId] [int] NULL,
--	[TagList] [nvarchar](max) NULL,
-- CONSTRAINT [PK_MemberInfo] PRIMARY KEY CLUSTERED 
--(
--	[CustId] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Report_Data]
--) ON [Report_Data] TEXTIMAGE_ON [Report_Data]
--GO

--ALTER TABLE [dbo].[MemberInfo] ADD  CONSTRAINT [DF_MemberInfo_IsRemoved]  DEFAULT ((0)) FOR [IsRemoved]
--GO

--ALTER TABLE [dbo].[MemberInfo] ADD  CONSTRAINT [DF_MemberInfo_ClickId]  DEFAULT ((0)) FOR [ClickId]
--GO


