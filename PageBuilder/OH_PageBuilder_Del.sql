/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE [dbo].[OH_PageBuilder_Status_Del]
	@PageIds VARCHAR(MAX),
	@UserId INT,
	@IP VARCHAR(50) = '',
	@ErrCode INT = 0 OUTPUT,
	@ErrMsg NVARCHAR(MAX) = '' OUTPUT
AS
	/*
	Created: 20251105@Danny
	DB: DBOH-ONEHub
	Task: Delete Landing Page builder (support multiple)
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

	IF EXISTS (
		SELECT TOP 1 1 
		FROM LinkGenerator l WITH(NOLOCK)
		INNER JOIN @PageId_Tab p ON l.PageId = p.PageId
	)
	BEGIN
		SELECT @ErrCode = 1007, @ErrMsg = N'Landing page are used in link generator function!';
		RETURN;
	END

	DECLARE @Duration INT;
	DECLARE @StartTime DATETIME = GETDATE();

	DECLARE @TimeZone TINYINT
	SELECT @TimeZone = CONVERT(TINYINT, SValue)
	FROM dbo.SystemSettings WITH (NOLOCK)
	WHERE SName = 'TimeZone';

	DECLARE @OldData NVARCHAR(MAX), @NewData NVARCHAR(MAX)


	SELECT @OldData = 
	(	
		SELECT 
			b.PageId,
			b.PageName,
			b.PageCode,
			m.MarketName,
			tc.CountryName,
			c.CampaignName,
			s.Status
		FROM dbo.PageBuilder b WITH (NOLOCK)
		LEFT JOIN dbo.Market m WITH (NOLOCK) ON m.MarketId = b.MarketId
		LEFT JOIN dbo.TargetCountry tc WITH (NOLOCK) ON tc.CountryCode = b.TargetCountryCode AND tc.MarketId = b.MarketId
		LEFT JOIN dbo.Campaign c WITH (NOLOCK) ON c.CampaignId = b.CampaignId
		LEFT JOIN dbo.OH_f_LandingPage_Status() s ON s.StatusId = b.StatusId
		WHERE EXISTS (SELECT TOP 1 1 FROM @PageId_Tab pt WHERE pt.PageId = b.PageId)
		FOR JSON PATH
	)

	BEGIN
		DELETE p 
		FROM dbo.PageBuilderDetail_Preview  p WITH (ROWLOCK)
		WHERE EXISTS (SELECT TOP 1 1 FROM @PageId_Tab pt WHERE pt.PageId = p.PageId)

		DELETE p 
		FROM dbo.PageBuilder_Preview  p WITH (ROWLOCK)
		WHERE EXISTS (SELECT TOP 1 1 FROM @PageId_Tab pt WHERE pt.PageId = p.PageId)

		DELETE p 
		FROM dbo.PageBuilderDetail  p WITH (ROWLOCK)
		WHERE EXISTS (SELECT TOP 1 1 FROM @PageId_Tab pt WHERE pt.PageId = p.PageId)
		
		DELETE p 
		FROM dbo.PageBuilder  p WITH (ROWLOCK)
		WHERE EXISTS (SELECT TOP 1 1 FROM @PageId_Tab pt WHERE pt.PageId = p.PageId)
	END

	-- =========================
	-- Write log
	-- =========================
	DECLARE @EndTime DATETIME = GETDATE();
	SELECT @Duration = DATEDIFF(SECOND, @StartTime, @EndTime);

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
