/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE [dbo].[OH_LandingPage_Sel]
AS
/*
	Created: 20251031@Danny
	DB: DBOH-ONEHub
	Task: Select Landing Page - Link generator

	Revisions:  
		- 20251031@Danny: Initialize SP [RedmineID: #241764]
*/
BEGIN
	SET NOCOUNT ON;
	
	; WITH t AS
	(
		SELECT  PageCode, 
				PageName, 
				'Mobile' Category, 
				1 as CategoryId,
				0 AS IsComponent,
				TargetCountryCode,
				MarketId,
				CampaignId
		FROM 	PageBuilder WITH(NOLOCK)
		WHERE 	StatusId = 1 
		UNION ALL
		SELECT 	ComponentCode AS PageCode, 
				ComponentName AS PageName, 
				CASE WHEN CategoryType = 1 THEN 'Mobile' ELSE 'Mobile & Desktop' END Category, 
				CASE WHEN CategoryType = 1 THEN 1 ELSE 2 END CategoryId, 
				1 AS IsComponent,
				'' AS TargetCountryCode,
				'' AS MarketId,
				'' AS CampaignId
		FROM 	Component WITH(NOLOCK)
		WHERE 	ComponentTypeId = 6
				AND StatusId = 1
	)
	SELECT PageCode, PageName, Category, IsComponent
	FROM t
	ORDER BY Category ASC, PageName ASC
END
GO

