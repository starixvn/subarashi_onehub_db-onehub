/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[Task_OH_MemberInfo_ImportedTime]
	@LastImportedTime 	DATETIME
	,@SName 			VARCHAR(50) = 'MemberInfoLastImportedTime'
	,@ErrCode			INT = 0 OUTPUT
	,@ErrMsg			VARCHAR(2000) = '' OUTPUT
AS

/*
	Created: 20251118@Sophia
	DB: DBOH-ONEHub
	Task: Job (web call) - After import member info

	Revisions:
		- 20251118@Sophia: Initialize SP [RedmineID: #244327]
	Note:
		@SName = 'MemberInfoLastImportedTime'
		@SName = 'RealMemberInfoLastImportedTime'
		@SName = 'ManualMemberInfoLastImportedTime'
*/

BEGIN

	IF @LastImportedTime IS NOT NULL
	BEGIN
		UPDATE dbo.SystemSettings WITH (ROWLOCK)
		SET SValue = CONVERT(VARCHAR(20), @LastImportedTime, 120)
		WHERE SName = @SName
	END
	ELSE
	BEGIN
		SELECT @ErrCode = 100, @ErrMsg = 'Invalid update!!!'
	END
END
GO
