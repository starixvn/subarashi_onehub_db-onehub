/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE [dbo].[OH_LandingPage_Sel]
AS
/*
	Created: 20251031@Danny
	DB: DBOH-ONEHub
	Task: Select Landing Page - Link generator

	Note: PageType values:
		1: Mobile & Desktop from Component
		2: Mobile from Component
		3: Mobile from LandingPage

	Revisions:  
		- 20251031@Danny: Initialize SP [RedmineID: #241764]
*/
BEGIN
	SET NOCOUNT ON;
	
	; WITH t AS
	(
		SELECT  pb.PageCode, 
				pb.PageName, 
				'Mobile' Category, 				
				3 AS PageType,
				pb.TargetCountryCode,
				pb.MarketId,
				pb.CampaignId,
				c.CampaignCode
		FROM 	PageBuilder pb WITH(NOLOCK)
		LEFT JOIN Campaign c WITH(NOLOCK) ON pb.CampaignId = c.CampaignId
		WHERE 	pb.StatusId = 1 
		UNION ALL
		SELECT 	ComponentCode AS PageCode, 
				ComponentName AS PageName, 
				CASE WHEN CategoryType = 1 THEN 'Mobile' ELSE 'Mobile & Desktop' END Category, 
				CASE WHEN CategoryType = 1 THEN 2 ELSE 1 END AS PageType,
				'' AS TargetCountryCode,
				'' AS MarketId,
				'' AS CampaignId,
				'' AS CampaignCode
		FROM 	Component WITH(NOLOCK)
		WHERE 	ComponentTypeId = 6
				AND StatusId = 1
	)
	SELECT PageCode, PageName, Category, PageType, TargetCountryCode, MarketId, CampaignId, CampaignCode
	FROM t
	ORDER BY Category ASC, PageName ASC
END
GO

