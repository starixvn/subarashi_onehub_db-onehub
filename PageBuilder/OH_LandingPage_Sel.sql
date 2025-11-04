/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[OH_LandingPage_Sel]

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
		SELECT PageCode, PageName, 'Mobile' AS Category, 0 AS IsComponent
		FROM PageBuilder WITH(NOLOCK)
		UNION ALL
		SELECT ComponentCode AS PageCode, ComponentName AS PageName, CASE WHEN CategoryType = 1 THEN 'Mobile' ELSE 'Mobile & Desktop' END Category, 1 AS IsComponent
		FROM Component WITH(NOLOCK)
		WHERE ComponentTypeId = 6
	)
	SELECT PageCode, PageName, Category, IsComponent
	FROM t
	ORDER BY Category ASC, PageName ASC
END
GO

