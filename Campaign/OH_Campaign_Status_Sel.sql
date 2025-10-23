/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[OH_Campaign_Status_Sel]
AS
/*
	Created: 20250903@Eddie
	DB: DBOH-ONEHub
	Task: List of Campaign Status
	Revisions:
		- 20250903@Eddie: Initial version [RedmineID: #236797]
*/
BEGIN
	SET NOCOUNT ON;

	SELECT StatusId, Status
	FROM dbo.OH_f_Campaign_Status()
	ORDER BY StatusId ASC;
END
GO
