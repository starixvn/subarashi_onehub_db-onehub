/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE [dbo].[OH_UserInfo_Sel]
	@UserName VARCHAR(30) = NULL,
	@UserID  INT = NULL
AS

/*
	Created: 20251118@Danny
	DB: DBOH-ONEHub
	Task: Get user info 

	Revisions:
		- 20251118@Danny: Initialize SP [RedmineID: #241764]

	Parameter's Explanation:
		- @UserName: username

*/

BEGIN
	SET NOCOUNT ON

	SELECT UserID, 
		    UserName, 
			PasswordHash, 
			IsAdmin

	FROM OH_user WITH(NOLOCK)
	WHERE (UserName = @UserName AND @UserName IS NOT NULL)
	OR (UserID = @UserID AND @UserID IS NOT NULL)
END