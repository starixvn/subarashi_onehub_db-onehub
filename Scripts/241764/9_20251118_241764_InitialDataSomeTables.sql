/*<info serverAlias="DBOH-ONEHub"></info>*/
/*
    Created: 20251118@Danny
    DB:DBOH-ONEHub
    Task: 
*/

USE ONEHub;
GO

INSERT INTO Country(CountryCode, CountryName)
SELECT CountryCode, CountryName
FROM Affiliate_12B.dbo.Country ct WITH(NOLOCK)
WHERE NOT EXISTS (SELECT TOP 1 1 FROM Country c WITH(NOLOCK) WHERE c.CountryCode = ct.CountryCode);

TRUNCATE TABLE Module
INSERT INTO Module (ModuleId,	ModuleName,	ModuleType,	Remark,	NavigateTo,	IsMultipleUpload,	IsRequired,	IsUnique,	StatusId)
SELECT ModuleId,	ModuleName,	ModuleType,	Remark,	NavigateTo,	IsMultipleUpload,	IsRequired,	IsUnique,	StatusId
FROM Affiliate_12B.dbo.LandingPage_Module ct WITH(NOLOCK)

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
