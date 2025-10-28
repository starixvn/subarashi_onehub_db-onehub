/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="1" isNested="1"></info>*/
CREATE FUNCTION dbo.OH_f_GetSystemSetting
(
	@SName VARCHAR(50)
)
RETURNS VARCHAR(200)
AS

/*
	Created: 20251028@Danny
	DB: DBOH-ONEHub
	Task: Core function get data in SystemSettings

	Revisions:
		- 20251028@Danny: Initialize SP [RedmineID: #241764]
*/

BEGIN
	DECLARE @SValue VARCHAR(200) = ''
	SELECT  @SValue = SValue FROM dbo.SystemSettings WITH (NOLOCK) WHERE SName = @SName
	
	RETURN @SValue
END
GO