/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE [dbo].[OH_UserInfo_Ins]
	@UserID			INT,
	@UserName		VARCHAR(30) ,
	@PasswordHash	VARCHAR(60),
	@IsAdmin		TINYINT
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

	IF EXISTS (SELECT TOP 1 1 FROM OH_User WITH(NOLOCK) WHERE UserID = @UserID)
	BEGIN

		UPDATE  OH_User WITH(ROWLOCK, UPDLOCK)
		SET UserName = @UserName,
			PasswordHash = @PasswordHash,
			IsAdmin		= @IsAdmin
		WHERE UserID = @UserID
	END
	ELSE 
	BEGIN
		INSERT INTO OH_User (UserID, UserName, PasswordHash, IsAdmin)
		VALUES ( @UserID, @UserName, @PasswordHash, @IsAdmin)
	END
END