/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE [dbo].[OH_PageBuilder_Status_Upd]
	@PageIds VARCHAR(MAX),
	@StatusId TINYINT = NULL,
	@UserId INT,
	@IP VARCHAR(50) = '',
	@ErrCode INT = 0 OUTPUT,
	@ErrMsg NVARCHAR(MAX) = '' OUTPUT
AS
	/*
	Created: 20251105@Danny
	DB: DBOH-ONEHub
	Task: Update Landing Page builder status only (support multiple)
	Revisions:
		- 20251105@Danny: Initial version [RedmineID: #241764]

		
	Explain:	

*/
BEGIN
	SET NOCOUNT ON;

	-- =========================
	-- Validate required parameters
	-- =========================
	DECLARE @PageId_Tab TABLE (PageId INT)
	INSERT INTO @PageId_Tab(PageId)
	SELECT CAST(value AS INT) FROM STRING_SPLIT(@PageIds,',')

	IF @UserId IS NULL
	BEGIN
		SELECT @ErrCode = 1006, @ErrMsg = N'UserId is required!';
		RETURN;
	END

	DECLARE @Language NVARCHAR(5) = 'en-US';
	DECLARE @Duration INT;
	DECLARE @StartTime DATETIME = GETDATE();
	DECLARE @OldData NVARCHAR(MAX), @NewData NVARCHAR(MAX)

	DECLARE @TimeZone TINYINT
	SELECT @TimeZone = CONVERT(TINYINT, SValue)
	FROM dbo.SystemSettings WITH (NOLOCK)
	WHERE SName = 'TimeZone';

	SELECT @OldData = 
	(	
		SELECT 
			b.PageId AS 'pid',
			b.PageName AS 'pn',
			b.PageCode AS 'pc',
			m.MarketName AS 'l',
			tc.CountryName AS 'tc',
			c.CampaignName AS 'cn',
			s.Status AS 'st'
		FROM dbo.PageBuilder b WITH (NOLOCK)
		LEFT JOIN dbo.Market m WITH (NOLOCK) ON m.MarketId = b.MarketId
		LEFT JOIN dbo.TargetCountry tc WITH (NOLOCK) ON tc.CountryCode = b.TargetCountryCode AND tc.MarketId = b.MarketId
		LEFT JOIN dbo.Campaign c WITH (NOLOCK) ON c.CampaignId = b.CampaignId
		LEFT JOIN dbo.OH_f_LandingPage_Status() s ON s.StatusId = b.StatusId
		WHERE EXISTS (SELECT TOP 1 1 FROM @PageId_Tab pt WHERE pt.PageId = b.PageId)
		FOR JSON PATH
	)

	BEGIN
		
		UPDATE b
			SET b.StatusId = ISNULL(@StatusId, StatusId),
			b.UpdatedBy = @UserId,
			b.UpdatedDate = DATEADD(HOUR, @TimeZone, GETUTCDATE()) 
		FROM dbo.PageBuilder  b WITH (ROWLOCK)
		WHERE EXISTS (SELECT TOP 1 1 FROM @PageId_Tab pt WHERE pt.PageId = b.PageId)
	END

	-- =========================
	-- Write log
	-- =========================
	DECLARE @EndTime DATETIME = GETDATE();
	SELECT @Duration = DATEDIFF(SECOND, @StartTime, @EndTime);

	SELECT @NewData = 
	(	
		SELECT
			b.PageId AS 'pid',
			b.PageName AS 'pn',
			b.PageCode AS 'pc',
			m.MarketName AS 'l',
			tc.CountryName AS 'tc',
			c.CampaignName AS 'cn',
			s.Status AS 'st'
		FROM dbo.PageBuilder b WITH (NOLOCK)
		LEFT JOIN dbo.Market m WITH (NOLOCK) ON m.MarketId = b.MarketId
		LEFT JOIN dbo.TargetCountry tc WITH (NOLOCK) ON tc.CountryCode = b.TargetCountryCode AND tc.MarketId = b.MarketId
		LEFT JOIN dbo.Campaign c WITH (NOLOCK) ON c.CampaignId = b.CampaignId
		LEFT JOIN dbo.OH_f_LandingPage_Status() s ON s.StatusId = b.StatusId
		WHERE EXISTS (SELECT TOP 1 1 FROM @PageId_Tab pt WHERE pt.PageId = b.PageId)
		FOR JSON PATH
	)
	
	-- Write log
	DECLARE @SPName VARCHAR(200);
	SELECT @SPName = OBJECT_NAME(@@PROCID);
	
	EXEC dbo.OH_UserLog_RunSP_Detail_WriteLog
		@UserId		= @UserId,
		@SPName		= @SPName,
		@OldData	= @OldData,
		@NewData	= @NewData,
		@IP			= @IP,
		@Duration	= @Duration;
END;
GO
