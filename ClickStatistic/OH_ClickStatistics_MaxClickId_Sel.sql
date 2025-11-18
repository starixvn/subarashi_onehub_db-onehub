/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" viewers="" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[OH_ClickStatistics_MaxClickId_Sel]
AS
/*
	Created: 20251110@Danny
	DB:DBOH-ONEHub
	Task: select max ClickId

	Revisions:  
		- 20251110@Danny: Initialize SP [RedmineID: #241764]
*/
BEGIN
    SET NOCOUNT ON;
    SELECT MAX(ClickId) AS MaxClickId FROM dbo.ClickStatistics WITH (NOLOCK);
END