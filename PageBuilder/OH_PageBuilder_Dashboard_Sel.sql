/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE [dbo].[OH_PageBuilder_Dashboard_Sel]
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

	SELECT COUNT(*) AS TotalPageBuilders
          ,SUM(CASE WHEN p.StatusId = 0 THEN 1 ELSE 0 END) AS DraftPageBuilders
          ,SUM(CASE WHEN p.StatusId = 1 THEN 1 ELSE 0 END) AS ActivePageBuilders
          ,SUM(CASE WHEN p.StatusId = 2 THEN 1 ELSE 0 END) AS InactivePageBuilders
	FROM dbo.PageBuilder p WITH (NOLOCK)

END
GO


