/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" viewers="" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE [dbo].[OH_ClickStatistics_BulkCache]
AS
/*
	Created: 20251107@Danny
	DB: DBAFF12B-Affiliate_12B
	Task: Cache data

	Revisions:  
		- 20251107@Danny: Initialize SP [RedmineID: #241764]

*/
BEGIN
    SET NOCOUNT ON;

	SELECT	ShortLink, 
			FullLink, 
			LinkId
	FROM  LinkGenerator WITH(NOLOCK)

END
GO

