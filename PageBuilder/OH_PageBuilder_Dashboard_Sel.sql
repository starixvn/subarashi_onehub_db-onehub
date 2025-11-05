/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[OH_PageBuilder_Dashboard_Sel]
AS
/*
	Created: 20251105@Danny
	DB: DBOH-ONEHub
	Task: Page management dashboard
	Revisions:
		- 20251105@Danny: Initial version [RedmineID: #241764]
*/
BEGIN
	SET NOCOUNT ON;

	SELECT COUNT(*) AS TotalCampaigns
          ,SUM(CASE WHEN StatusId = 0 THEN 1 ELSE 0 END) AS DraftCampaigns
          ,SUM(CASE WHEN StatusId = 1 THEN 1 ELSE 0 END) AS ActiveCampaigns
          ,SUM(CASE WHEN StatusId = 2 THEN 1 ELSE 0 END) AS InactiveCampaigns
	FROM dbo.PageBuilder WITH (NOLOCK);

END
GO


