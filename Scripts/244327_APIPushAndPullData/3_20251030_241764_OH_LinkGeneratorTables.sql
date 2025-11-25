/*<info serverAlias="DBOH-ONEHub"></info>*/
/*
    Created: 20251030
    DB: DBOH-ONEHub
    Task: Create Domain Management Tables [RedmineId : #241764]
         
*/

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
    Date DATE NULL,
    UpdatedBy INT NULL,
    UpdatedDate DATETIME NULL,
    CONSTRAINT PK_LinkGenerator PRIMARY KEY CLUSTERED (LinkId)
) 
ON [SETTING_DATA];

CREATE NONCLUSTERED INDEX IX_LinkGenerator_Date
ON LinkGenerator (Date);

CREATE NONCLUSTERED INDEX IX_LinkGenerator_LinkName
ON LinkGenerator (LinkName);

CREATE NONCLUSTERED INDEX IX_LinkGenerator_IDCode
ON LinkGenerator (IDCode);


GO
 