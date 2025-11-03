/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[OH_Component_del]
	@UserId   	    INT
	,@ComponentIds	VARCHAR(MAX)
	,@IP 			VARCHAR(50) = ''
	,@ErrCode 		INT = 0 OUTPUT
	,@ErrMsg  		NVARCHAR(4000) = '' OUTPUT
AS
/*
	Created: 20251029@Danny
	DB: DBOH-ONEHub
	Task: Admin site - Marketing tools - All Campaign - delete campaign

	Revisions:
		- 20251029@Danny: Initialize SP [RedmineID: #241764]

	Param's Explanation:

*/
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @CurrentDate 	DATETIME
		  , @Status 		NVARCHAR(50)
		  , @Language 	 	NVARCHAR(5) = 'en-US'
		  , @StartTime 	 	DATETIME = GETDATE()
		  , @EndTime 	 	DATETIME
		  , @Duration 		INT
		  , @SPName 	 	VARCHAR(200) = OBJECT_NAME(@@PROCID)
		  , @OldData 	 	NVARCHAR(MAX)
		  , @NewData 	 	NVARCHAR(MAX);

	DROP TABLE IF EXISTS #tmp_ComponentId
	CREATE TABLE #tmp_ComponentId( rn INT Identity(1,1), ComponentId	INT)

	INSERT INTO #tmp_ComponentId(ComponentId)
	SELECT CAST(value AS INT)
	FROM STRING_SPLIT(@ComponentIds,',')
	
	
	-- Old data for writing log
	SELECT @OldData = (
			SELECT c.ComponentId AS 'ci'
				  ,c.ComponentCode AS 'cc'
				  ,c.ComponentName AS 'cn'
				  ,c.ComponentTypeId AS 'ct'
				  ,c.StatusId AS 'st'
			FROM dbo.Component c WITH (NOLOCK)
			INNER JOIN dbo.OH_f_Component_Status() s ON c.StatusId = s.StatusId 
			INNER JOIN #tmp_ComponentId tc ON tc.ComponentId = c.ComponentId
			FOR JSON PATH, INCLUDE_NULL_VALUES
		);

	DECLARE @TimeZone TINYINT
	SELECT @TimeZone = CONVERT(TINYINT, SValue)
	FROM dbo.SystemSettings WITH (NOLOCK)
	WHERE SName = 'TimeZone';

	SELECT @CurrentDate = DATEADD(HOUR, @TimeZone, GETUTCDATE());
	
	BEGIN TRY

		DELETE cp
		FROM dbo.Component cp
		WHERE EXISTS (SELECT TOP 1 1 FROM #tmp_ComponentId tc WHERE tc.ComponentId = cp.ComponentId)

	END TRY
	BEGIN CATCH
		SELECT @ErrCode = 1011
			 , @ErrMsg = N'Error occurs. Update unsuccessfully.';
		RETURN;
	END CATCH

	-- Write log
	SELECT @EndTime = GETDATE();
	SELECT @Duration = DATEDIFF(SECOND, @StartTime, @EndTime);

   
	EXEC dbo.OH_UserLog_RunSP_Detail_WriteLog
		@UserId    = @UserId
		,@SPName   = @SPName
		,@OldData  = @OldData
		,@NewData  = @NewData
		,@IP   	   = @IP
		,@Language = @Language
		,@Duration = @Duration;

END
GO