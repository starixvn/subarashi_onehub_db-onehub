/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[OH_Campaign_Status_Upd]
	@UserId   	    INT
	,@CampaignIds	VARCHAR(MAX)
	,@StatusId		TINYINT = NULL
	,@IP 			VARCHAR(50) = ''
	,@ErrCode 		INT = 0				OUTPUT
	,@ErrMsg  		NVARCHAR(4000) = '' OUTPUT
AS
/*
	Created: 20251029@Danny
	DB: DBOH-ONEHub
	Task: Admin site - Marketing tools - All Campaign - Edit campaign

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
		  , @NewData 	 	NVARCHAR(MAX)
		  , @CampaignId		INT
			
	-- Get status name
	SELECT @Status = Status
	FROM dbo.OH_f_Campaign_Status()
	WHERE StatusId = @StatusId
	
	DECLARE @TimeZone TINYINT
	SELECT @TimeZone = CONVERT(TINYINT, SValue)
	FROM dbo.SystemSettings WITH (NOLOCK)
	WHERE SName = 'TimeZone';


	DROP TABLE IF EXISTS #tmp_CampaignId
	CREATE TABLE #tmp_CampaignId( rn INT Identity(1,1), CampaignId	INT)

	INSERT INTO #tmp_CampaignId(CampaignId)
	SELECT CAST(value AS INT)
	FROM STRING_SPLIT(@CampaignIds,',')

	WHILE EXISTS (SELECT TOP 1 1 FROM #tmp_CampaignId)
	BEGIN
		SELECT TOP 1 @CampaignId = CampaignId FROM #tmp_CampaignId

		-- Old data for writing log
		SELECT @OldData = (
			SELECT c.CampaignId    AS 'ci'
				   ,c.CampaignName AS 'cn'
				   ,c.Description  AS 'ds'
				   ,s.Status       AS 's'
			FROM dbo.Campaign c WITH (NOLOCK)
				INNER JOIN dbo.OH_f_Campaign_Status() s ON c.StatusId = s.StatusId 
			WHERE c.CampaignId = @CampaignId
			FOR JSON PATH, WITHOUT_ARRAY_WRAPPER, INCLUDE_NULL_VALUES
		);


		SELECT @CurrentDate = DATEADD(HOUR, @TimeZone, GETUTCDATE());
	
		BEGIN TRY

			UPDATE cp WITH (ROWLOCK, UPDLOCK)
			SET cp.UpdatedBy  	= @UserId
			   ,cp.UpdatedDate  = @CurrentDate
			   ,cp.StatusId     = @StatusId
			FROM dbo.Campaign cp
			WHERE cp.CampaignId = @CampaignId;

		END TRY
		BEGIN CATCH
			SELECT @ErrCode = 1011
				 , @ErrMsg = N'Error occurs. Update unsuccessfully.';
			RETURN;
		END CATCH

		-- Write log
		SELECT @EndTime = GETDATE();
		SELECT @Duration = DATEDIFF(SECOND, @StartTime, @EndTime);

		SELECT @NewData = (
			SELECT c.CampaignId    AS 'ci'
				   ,c.CampaignName AS 'cn'
				   ,c.Description  AS 'ds'
				   ,s.Status       AS 's'
			FROM dbo.Campaign c WITH (NOLOCK)
				INNER JOIN dbo.OH_f_Campaign_Status() s ON c.StatusId = s.StatusId 
			WHERE c.CampaignId = @CampaignId
			FOR JSON PATH, WITHOUT_ARRAY_WRAPPER, INCLUDE_NULL_VALUES
		);
   
		EXEC dbo.OH_UserLog_RunSP_Detail_WriteLog
			@UserId    = @UserId
			,@SPName   = @SPName
			,@OldData  = @OldData
			,@NewData  = @NewData
			,@IP   	   = @IP
			,@Language = @Language
			,@Duration = @Duration;

		DELETE FROM #tmp_CampaignId WHERE CampaignId = @CampaignId
	END
END
GO