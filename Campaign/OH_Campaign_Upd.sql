/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE [dbo].[OH_Campaign_Upd]
	@UserId   	    INT
	,@CampaignId	INT
	,@CampaignName	VARCHAR(500) = NULL
	,@Description	VARCHAR(500) = NULL
	,@StatusId		TINYINT = NULL
	,@IP 			VARCHAR(50) = ''
	,@ErrCode 		INT = 0 OUTPUT
	,@ErrMsg  		NVARCHAR(4000) = '' OUTPUT
AS
/*
	Created: 20250904@Eddie
	DB: DBOH-ONEHub
	Task: Admin site - Marketing tools - All Campaign - Edit campaign

	Revisions:
		- 20250904@Eddie: Initialize SP [RedmineID: #236797]

	Param's Explanation:
		- @CampaignName, @Description:
			+ NULL	: no change will be made to the existing value
			+ ''	: sets the value to an empty string
			+ 'abc' : updates the field with the provided input
		- @StatusId:
			+ NULL 	  : no change will be made to the existing value
			+ 0/1/2/3 : updates the field with the provided input
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
	
	-- Validate input
	BEGIN
		SELECT @CampaignName = LTRIM(RTRIM(@CampaignName));

		SELECT @Description = LTRIM(RTRIM(@Description));
		
		IF @CampaignName = ''
		BEGIN
			SELECT @ErrCode = 1001
			     , @ErrMsg = N'Campaign Name is required.';
			RETURN;
		END
		
		IF EXISTS ( SELECT 1 FROM dbo.Campaign WITH (NOLOCK) WHERE CampaignName = @CampaignName AND CampaignId <> @CampaignId )
		BEGIN
			SELECT @ErrCode = 1002
			     , @ErrMsg = N'This campaign name already exists. Please enter a different name.';
			RETURN;
		END
	END
	
	-- Get status name
	SELECT @Status = Status
	FROM dbo.OH_f_Campaign_Status()
	WHERE StatusId = @StatusId

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

	DECLARE @TimeZone TINYINT
	SELECT @TimeZone = CONVERT(TINYINT, SValue)
	FROM dbo.SystemSettings WITH (NOLOCK)
	WHERE SName = 'TimeZone';

	SELECT @CurrentDate = DATEADD(HOUR, @TimeZone, GETUTCDATE());
	
	BEGIN TRY

		UPDATE cp WITH (ROWLOCK, UPDLOCK)
		SET cp.CampaignName = @CampaignName 
		   ,cp.Description  = @Description
		   ,cp.UpdatedBy  	= @UserId
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
		,@AffId    = 0
		,@SPName   = @SPName
		,@OldData  = @OldData
		,@NewData  = @NewData
		,@IP   	   = @IP
		,@Language = @Language
		,@Duration = @Duration;

END
GO