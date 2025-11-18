/*<info serverAlias="DBOH-ONEHub"></info>*/
/*
    Created: 20251118@Danny
    DB:DBOH-ONEHub
    Task: 
*/

USE ONEHub;
GO

--ALTER TABLE OH_User add PasswordHash VARCHAR(60)
--ALTER TABLE OH_User add IsAdmin	TINYINT


--INSERT INTO SystemSettings (SName, SValue) VALUES ('TimeZone','8')

--TRUNCATE TABLE Country
--INSERT INTO Country (CountryCode, CountryName)
--SELECT CountryCode, CountryName FROM Affiliate_12B.dbo.Country WITH(NOLOCK)

--TRUNCATE TABLE Market
--INSERT INTO Market (MarketId,	MarketName,	MarketNativeName,	ShortedCode,	DisplayName,	IsDeleted)
--SELECT MarketId,	MarketName,	MarketNativeName,	ShortedCode,	DisplayName,	IsDeleted FROM Affiliate_12B.dbo.Market WITH(NOLOCK)

--TRUNCATE TABLE TargetCountry
--INSERT INTO TargetCountry (MarketID,	MarketName,	CountryCode,	CountryName,	OrderNo	,ShortedCode)
--SELECT MarketID,	MarketName,	CountryCode,	CountryName,	OrderNo	,ShortedCode FROM Affiliate_12B.dbo.TargetCountry WITH(NOLOCK)

Insert into OH_User ( UserId,	UserName,	PasswordHash,	IsAdmin)
SELECT 1,	'AACandy',	'$2a$11$HTcZL2kqL3t7Eq4GYuPTiejJZKV8cN.26ip.F7XaysnToF4TK0ffu',	1
UNION ALL
SELECT 1000000027,	'AAKai',	'$2a$11$lLr7xxWXwE0.LkJLwZSPh.BkLUZb7GxBd/OaZNR5r0maHU3z0toyu',	1

