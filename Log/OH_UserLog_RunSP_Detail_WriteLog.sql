/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="1"></info>*/
ALTER PROCEDURE [dbo].[OH_UserLog_RunSP_Detail_WriteLog]
	@SPName		VARCHAR(200),
	@UserId		INT,
	@OldData	NVARCHAR(MAX) = NULL,
	@NewData	NVARCHAR(MAX) = NULL,
	@IP			VARCHAR(50) = '',
	@Language	VARCHAR(20) = '',
	@Duration SMALLINT = 0
AS

/*
	Created: 20251021@Danny
	DB: DBOH-ONEHub
	Task: UserLog - Log data
	
	Revisions:
		- 20251021@Danny: Initialize SP [RedmineID: #241764]

*/

BEGIN
	SET NOCOUNT ON

	IF @SPName LIKE '%_xtest'
		SELECT @SPName = LEFT(@SPName, LEN(@SPName) - 6)
	ELSE IF @SPName LIKE '%_xpre'
			OR @SPName LIKE '%_UAT1'
			OR @SPName LIKE '%_UAT2'
			OR @SPName LIKE '%_UAT3'
			OR @SPName LIKE '%_UAT4'
		SELECT @SPName = LEFT(@SPName, LEN(@SPName) - 5)

	DECLARE @LogTypeId INT, @LogActionId INT

	SELECT @LogTypeId = lt.TypeID, @LogActionId = la.ActionId
	FROM dbo.LogAction la WITH (NOLOCK)
		LEFT JOIN dbo.LogType lt WITH (NOLOCK) ON lt.TypeID = la.ActionTypeId
	WHERE la.SPName = @SPName

	SELECT @LogTypeId = ISNULL(@LogTypeId, 0), @LogActionId = ISNULL(@LogActionId, 0)

	INSERT INTO dbo.UserLog_RunSP_Detail
	(
		LogTypeId,
		LogActionId,
		SPName,
		UserId,
		LogDate,
		OldData,
		NewData,
		IP,
		Language,
		Duration
	)
	VALUES
	(
		@LogTypeId,
		@LogActionId,
		@SPName,
		@UserId,
		GETDATE(),
		@OldData,
		@NewData,
		@IP,
		@Language,
		@Duration
	)
END
GO