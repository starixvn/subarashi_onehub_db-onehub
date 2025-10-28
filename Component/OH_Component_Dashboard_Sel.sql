/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[OH_Component_Dashboard_Sel]
AS
/*
	Created: 20251029@Danny
	DB: DBOH-ONEHub
	Task:  All Component - Component Dashboard
	Revisions:
		- 20251029@Danny: Initialize SP [RedmineID: #241764]
*/
BEGIN
	SET NOCOUNT ON;

	SELECT  ct.ComponentTypeId, ct.ComponentTypename,
		  COUNT(*) AS Total
          ,SUM(CASE WHEN StatusId = 1 THEN 1 ELSE 0 END) AS Active
          ,SUM(CASE WHEN StatusId = 2 THEN 1 ELSE 0 END) AS Inactive
	FROM dbo.Component c WITH (NOLOCK)
	INNER JOIN dbo.ComponentType ct WITH (NOLOCK) ON c.ComponentTypeId = ct.ComponentTypeId
	GROUP BY ct.ComponentTypeId, ct.ComponentTypename;

END
GO
