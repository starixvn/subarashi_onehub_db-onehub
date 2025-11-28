/*<info serverAlias="DBOH-ONEHub"></info>*/
/*
    Created: 20251128@Danny
    DB: DBOH-ONEHub
    Task: Migrate data from AFF12B to ONEHub - Creator mapping

    Revisions:
        - 20251128@Sophia: Updated Creator mapping logic for Campaign, MediaGallery, and PageBuilder tables to map UserID from OH_User based on username from Affiliate_12B.dbo.Users
*/

 
USE ONEHub;
GO

-- Migrate new data

INSERT INTO Country(CountryCode, CountryName)
SELECT CountryCode, CountryName
FROM Affiliate_12B.dbo.Country ct WITH(NOLOCK)
WHERE NOT EXISTS (SELECT TOP 1 1 FROM Country c WITH(NOLOCK) WHERE c.CountryCode = ct.CountryCode);


INSERT INTO Exchange(ExchangeId,	Code,	MultipliedBy,	CountryCode)
SELECT ExchangeId,	Code,	MultipliedBy,	CountryCode FROM  Affiliate_12B.dbo.Exchange c WITH(NOLOCK)
WHERE NOT EXISTS (SELECT TOP 1 1 FROM Exchange e WITH(NOLOCK) WHERE c.ExchangeId = e.ExchangeId);

INSERT INTO TpExchange(TpExchangeId,	ExchangeId,	CountryCode)
SELECT TpExchangeId,	ExchangeId,	CountryCode FROM  Affiliate_12B.dbo.TpExchange c WITH(NOLOCK)
WHERE NOT EXISTS (SELECT TOP 1 1 FROM TpExchange e WITH(NOLOCK) WHERE c.ExchangeId = e.ExchangeId);

INSERT INTO Market( MarketId,	MarketName,	MarketNativeName,	ShortedCode,	DisplayName,	IsDeleted)
SELECT  MarketId,	MarketName,	MarketNativeName,	ShortedCode,	DisplayName,	IsDeleted FROM  Affiliate_12B.dbo.Market c WITH(NOLOCK)
WHERE NOT EXISTS (SELECT TOP 1 1 FROM Market e WITH(NOLOCK) WHERE c.MarketId = e.MarketId);

INSERT INTO TargetCountry( MarketID,	MarketName,	CountryCode,	CountryName,	OrderNo,	ShortedCode)
SELECT  MarketID,	MarketName,	CountryCode,	CountryName,	OrderNo,	ShortedCode FROM  Affiliate_12B.dbo.TargetCountry c WITH(NOLOCK)
WHERE NOT EXISTS (SELECT TOP 1 1 FROM TargetCountry e WITH(NOLOCK) WHERE c.MarketId = e.MarketId AND c.CountryCode = e.CountryCode);



-- truncate and Migrate data from AFF12B
TRUNCATE TABLE Domain
TRUNCATE TABLE DomainDetail
TRUNCATE TABLE Component
TRUNCATE TABLE Campaign
TRUNCATE TABLE MediaGallery
TRUNCATE TABLE PageBuilder
TRUNCATE TABLE PageBuilderDetail
TRUNCATE TABLE PageBuilderDetail_Preview
TRUNCATE TABLE PageBuilder_Preview
TRUNCATE TABLE ClickStatistics

TRUNCATE TABLE IDCode
TRUNCATE TABLE LinkGenerator

-- Reseed IDENTITY columns
DBCC CHECKIDENT ('IDCode', RESEED, 1);
DBCC CHECKIDENT ('LinkGenerator', RESEED, 1);



UPDATE MediaCode WITH(Rowlock, UpdLOCK) 
SET MediaId = NULL
WHERE MediaId IS NOT NULL


-- Campaign
SET  IDENTITY_INSERT Campaign ON 
INSERT INTO Campaign(CampaignId,	CampaignName,	CampaignCode,	Description,	Creator,	CreatedDate,	UpdatedBy,	UpdatedDate,	StatusId)
SELECT lc.CampaignId,	lc.CampaignName,	lc.CampaignCode,	lc.Description,	ISNULL(ou.UserID, 3) Creator,	lc.CreatedDate,	NULL UpdatedBy,	lc.UpdatedDate,	lc.StatusId
FROM Affiliate_12B.dbo.LandingPage_Campaign lc WITH(NOLOCK)
LEFT JOIN Affiliate_12B.dbo.Users u WITH(NOLOCK) ON lc.Creator = u.UserID
LEFT JOIN dbo.OH_User ou WITH(NOLOCK) ON u.Username = ou.Username;
SET  IDENTITY_INSERT Campaign OFF

-- MediaCode
UPDATE  m WITH(ROWLOCK, UPDLOCK)
SET m.MediaId = u.MediaId
FROM MediaCode m 
INNER JOIN Affiliate_12B.dbo.LandingPage_MediaCode u WITH(NOLOCK) ON m.MediaCodeId = u.MediaCodeId
WHERE u.MediaId IS NOT NULL

-- MediaGallery
SET  IDENTITY_INSERT MediaGallery ON 
INSERT INTO MediaGallery (MediaId,MediaName,FileName,ModuleId,Dimension,StatusId,TargetCountryCode,MarketId,Creator,CreatedDate,UpdatedBy,UpdatedDate,MediaCode)
SELECT mg.MediaId,mg.MediaName,mg.FileName,mg.ModuleId,mg.Dimension,mg.StatusId,mg.TargetCountryCode,mg.MarketId, ISNULL(ou.UserID, 3) Creator,mg.CreatedDate,NULL UpdatedBy,mg.UpdatedDate,mg.MediaCode
FROM  Affiliate_12B.dbo.LandingPage_MediaGallery mg WITH(NOLOCK)
LEFT JOIN Affiliate_12B.dbo.Users u WITH(NOLOCK) ON mg.Creator = u.UserID
LEFT JOIN dbo.OH_User ou WITH(NOLOCK) ON u.Username = ou.Username
SET  IDENTITY_INSERT MediaGallery OFF 

-- PageBuilder
SET  IDENTITY_INSERT PageBuilder ON 

INSERT INTO PageBuilder (PageId,PageName,PageCode,CampaignId,TargetCountryCode,MarketId,StatusId,Creator,CreatedDate,UpdatedBy,UpdatedDate	)
SELECT pb.PageId,pb.PageName,pb.PageCode,pb.CampaignId,pb.TargetCountryCode,pb.MarketId,pb.StatusId,
	ISNULL(ou.UserID, 3) AS Creator,
	pb.CreatedDate, NULL AS UpdatedBy,pb.UpdatedDate	
FROM  Affiliate_12B.dbo.LandingPage_Builder pb WITH(NOLOCK)
LEFT JOIN Affiliate_12B.dbo.Users u WITH(NOLOCK) ON pb.Creator = u.UserID
LEFT JOIN dbo.OH_User ou WITH(NOLOCK) ON u.Username = ou.Username

SET  IDENTITY_INSERT PageBuilder OFF 


-- PageBuilderDetail
INSERT INTO PageBuilderDetail (	PageId,	OrderId,	ModuleId,	MediaId,	ExtraInfo)
SELECT 	PageId,	OrderId,	ModuleId,	MediaId,	ExtraInfo
FROM  Affiliate_12B.dbo.LandingPage_BuilderDetail WITH(NOLOCK)




