/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[OH_LandingPage_Status_Sel]
AS
/*
	Created: 20250826@Sophia
	DB: DBOH-ONEHub
	Task: Select Landing Page Status List
	Revisions:
		- 20250826@Sophia: Initial version [RedmineID: #236797]
		- 20250826@Copilot: Refactored to use fn_LandingPage_Status
*/
BEGIN
	SET NOCOUNT ON;

	SELECT StatusId, Status
	FROM dbo.OH_f_LandingPage_Status()
	ORDER BY StatusId ASC;
END;
GO
