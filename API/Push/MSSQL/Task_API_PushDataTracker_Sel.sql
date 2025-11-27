/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/

CREATE PROCEDURE [dbo].[Task_API_PushDataTracker_Sel]
	@PushDataType SMALLINT
	,@StatusId	TINYINT = 2
AS

/*
	Created: 20251118@Sophia
	DB: DBOH-ONEHub
	Task: Get info from API_PushDataTracker

	Revisions:
		- 20251118@Sophia: Initialize SP [RedmineID: #244327]

	Param's Explanation:
		- @StatusId
			. 0: InProcess
			. 1: Success
			. 2: Fail
		- @PushDataType
			. 1: For IDCode
*/

BEGIN

	SET NOCOUNT ON

	SELECT PushTrackerId
		,CheckInTime
		,FinishedTime
		,StatusId
		,PushDataType
		,PushDataInfo
	FROM dbo.API_PushDataTracker WITH (NOLOCK)
	WHERE PushDataType = @PushDataType
		AND StatusId = @StatusId
	ORDER BY PushTrackerId DESC

END
GO
