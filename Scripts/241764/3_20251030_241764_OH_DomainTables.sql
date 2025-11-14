/*<info serverAlias="DBOH-ONEHub"></info>*/
/*
    Created: 20251030
    DB: DBOH-ONEHub
    Task: Create Domain Management Tables [RedmineId : #241764]
        - Create Domain table with identity primary key
        - Create DomainDetail table with country scoring
        - Create DomainLog table for domain booking tracking
*/



SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

USE ONEHub;
GO


-- 1. Drop & Create Domain Table
IF EXISTS (SELECT TOP 1 1  FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Domain]') AND type IN (N'U'))
BEGIN
    DROP TABLE [dbo].[Domain];
END
GO

CREATE TABLE Domain (
    Id INT IDENTITY(1,1) NOT NULL,
    DomainName VARCHAR(200) NOT NULL,
    DomainType TINYINT NULL,
    Note NVARCHAR(200) NULL,
    CreatedDate DATETIME NOT NULL,
    SiteId SMALLINT NULL,
    CONSTRAINT PK_Domain PRIMARY KEY NONCLUSTERED (Id)
) 
ON [SETTING_DATA]
WITH (DATA_COMPRESSION = PAGE);

-- Create UNIQUE clustered index on DomainName for performance & uniqueness
CREATE UNIQUE CLUSTERED INDEX IX_Domain_DomainName 
ON Domain (DomainName);

-- 2. Drop & Create DomainDetail Table  
IF EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DomainDetail]') AND type IN (N'U'))
BEGIN
    DROP TABLE [dbo].[DomainDetail];
END
GO

CREATE TABLE DomainDetail (
    Id INT IDENTITY(1,1) NOT NULL,
    DomainName VARCHAR(200) NOT NULL,
    CountryCode VARCHAR(20) NOT NULL,
    Score SMALLINT NULL,
    DomainType TINYINT NULL,
    SiteId SMALLINT NULL,
    CONSTRAINT PK_DomainDetail PRIMARY KEY NONCLUSTERED (Id)
) 
ON [SETTING_DATA]
WITH (DATA_COMPRESSION = PAGE);

-- Create indexes for performance
CREATE CLUSTERED INDEX IX_DomainDetail_DomainName 
ON DomainDetail (DomainName);

CREATE NONCLUSTERED INDEX IX_DomainDetail_Country 
ON DomainDetail (CountryCode);

 
-- 4. Drop & Create LinkGenerator Table
IF EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LinkGenerator]') AND type IN (N'U'))
BEGIN
    DROP TABLE [dbo].[LinkGenerator];
END
GO

CREATE TABLE LinkGenerator (
    LinkId INT IDENTITY(1,1) NOT NULL,
    LinkName VARCHAR(200) NULL,
    IDCode VARCHAR(20) NULL,
    CampaignId INT NULL,
    CountryCode VARCHAR(50) NULL,
    MarketId VARCHAR(50) NULL,
    EventIds VARCHAR(1000) NULL,
    GroupId INT NULL,
    ChannelId INT NULL,
    AgencyId INT NULL,
    TypeId INT NULL,
    PageCode VARCHAR(100) NULL,
    PageType TINYINT NULL,
    Note NVARCHAR(500) NULL,
    DomainName VARCHAR(200) NULL,
    ShortDomain VARCHAR(500) NULL,
    ShortPath VARCHAR(50) NULL,
    FullLink VARCHAR(1000) NULL,
    SiteId SMALLINT NULL,
    StatusId TINYINT NULL,
    Creator INT NULL,
    CreatedDate DATETIME NOT NULL,
    UpdatedBy INT NULL,
    UpdatedDate DATETIME NULL,
    CONSTRAINT PK_LinkGenerator PRIMARY KEY NONCLUSTERED (LinkId)
) 
ON [SETTING_DATA]
WITH (DATA_COMPRESSION = PAGE);

CREATE CLUSTERED INDEX IX_LinkGenerator_LinkName
ON LinkGenerator (LinkName);

CREATE NONCLUSTERED INDEX IX_LinkGenerator_IDCode
ON LinkGenerator (IDCode);

CREATE NONCLUSTERED INDEX IX_LinkGenerator_Site_Status
ON LinkGenerator (SiteId, StatusId);

GO

-- 5. Drop & Create IDCode Table
IF EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IDCode]') AND type IN (N'U'))
BEGIN
    DROP TABLE [dbo].[IDCode];
END
GO

CREATE TABLE IDCode (
    Id INT IDENTITY(100,1) NOT NULL,
    IDCode VARCHAR(20) NOT NULL,
    StatusId TINYINT NULL,
    CreatedDate DATETIME NOT NULL CONSTRAINT DF_IDCode_CreatedDate DEFAULT GETDATE(),
    SiteId SMALLINT NULL,
    CONSTRAINT PK_IDCode PRIMARY KEY NONCLUSTERED (Id)
) 
ON [SETTING_DATA]
WITH (DATA_COMPRESSION = PAGE);

CREATE UNIQUE CLUSTERED INDEX IX_IDCode_Code
ON IDCode (IDCode);

GO
