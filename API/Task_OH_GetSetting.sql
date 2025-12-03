/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[Task_OH_GetSetting]
	@SName VARCHAR(50)
AS

/*
	Created: 20251028@Danny
	DB: DBOH-ONEHub
	Task: Core function get data in SystemSettings

	Revisions:
		- 20251028@Danny: Initialize SP [RedmineID: #241764]

*/

BEGIN
	SELECT dbo.OH_f_GetSystemSetting(@SName) AS SValue
END
GO


