/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE [dbo].[OH_PageBuilder_ManageSel]
	@CampaignName VARCHAR(200) = '', -- Search in both CampaignName and CampaignCode
	@PageName VARCHAR(200) = '', -- Search in both PageName and PageCode
	@TargetCountryCodes VARCHAR(500) = '',
	@MarketIds VARCHAR(500) = '',
	@StatusIds VARCHAR(500) = '',
	@CampaignIds VARCHAR(500) = '',
	@IsExportExcel BIT = 0,
	@PageIndex INT = 1,
    @PageSize INT = 20,
    @NRows INT = 0 OUTPUT,
	@FromDate	  DATE = NULL,
	@ToDate		  DATE = NULL
AS
/*
	Created: 20250826@Sophia
	DB: DBOH-ONEHub
	Task: Manage Landing Page builder
	Revisions:
		- 20250826@Sophia: Initial version [RedmineID: #236797]
		- 20250917@Sophia: Combine PageName and PageCode search into single @PageName parameter [RedmineID: #TBD]
*/
BEGIN
	SET NOCOUNT ON;

    DROP TABLE IF EXISTS #Data;
    
    CREATE TABLE #Data
    (
        CampaignCode VARCHAR(100),
        CampaignName VARCHAR(500),
        PageName VARCHAR(200),
        PageCode VARCHAR(100),
        TargetCountryCode VARCHAR(50),
        TargetCountryName VARCHAR(100),
        MarketId VARCHAR(50),
        Language VARCHAR(100),
        TargetLanguageCode VARCHAR(10),
        CreatedDate DATETIME,
        CreatedBy VARCHAR(100),
        LastModifiedBy VARCHAR(100),
        LastModifiedDate DATETIME,
        StatusId TINYINT,
        Status VARCHAR(50),
        PageId INT,
        RowIdx INT
    );

    INSERT INTO #Data (
        CampaignCode, CampaignName, PageName, PageCode, 
        TargetCountryCode, TargetCountryName, MarketId, Language, TargetLanguageCode,
        CreatedDate, CreatedBy, 
        LastModifiedBy, LastModifiedDate, StatusId, Status, PageId, RowIdx
    )
	SELECT
		c.CampaignCode,
		c.CampaignName,
		b.PageName,
		b.PageCode,
		b.TargetCountryCode,
		tc.CountryName AS TargetCountryName,
		b.MarketId,
		m.MarketName AS Language,
		ISNULL(lcm.TargetLanguageCode, m.ShortedCode) AS TargetLanguageCode,
		b.CreatedDate,
		u1.UserName AS CreatedBy,
		u2.UserName AS LastModifiedBy,
		b.UpdatedDate AS LastModifiedDate,
		b.StatusId,
		s.Status,
		b.PageId,
        ROW_NUMBER() OVER (ORDER BY b.PageId DESC) AS RowIdx
	FROM dbo.PageBuilder b WITH (NOLOCK)
	LEFT JOIN dbo.TargetCountry tc WITH (NOLOCK) ON tc.CountryCode = b.TargetCountryCode AND b.MarketId = tc.MarketId
	LEFT JOIN dbo.Market m WITH (NOLOCK) ON m.MarketId = b.MarketId
	LEFT JOIN dbo.OH_f_GetTargetLanguageCode() lcm ON m.ShortedCode = lcm.ShortedCode
	LEFT JOIN dbo.OH_f_LandingPage_Status() s ON b.StatusId = s.StatusId
	LEFT JOIN dbo.Campaign c WITH (NOLOCK) ON b.CampaignId = c.CampaignId
	LEFT JOIN dbo."User" u1 WITH (NOLOCK) ON u1.CustId = b.Creator
	LEFT JOIN dbo."User" u2 WITH (NOLOCK) ON u2.CustId = b.UpdatedBy
	WHERE
		(@CampaignName = '' 
			OR c.CampaignName LIKE '%' + @CampaignName + '%'
			OR c.CampaignCode LIKE '%' + @CampaignName + '%'
		)
		AND (
			@PageName = ''
			OR b.PageName LIKE '%' + @PageName + '%'
			OR b.PageCode LIKE '%' + @PageName + '%'
		)
		AND (
			@TargetCountryCodes = ''
			OR EXISTS (
				SELECT 1 FROM STRING_SPLIT(@TargetCountryCodes, ',') s WHERE b.TargetCountryCode = s.value
			)
		)
		AND (
			@MarketIds = ''
			OR EXISTS (
				SELECT 1 FROM STRING_SPLIT(@MarketIds, ',') s WHERE b.MarketId = s.value
			)
		)
		AND (
			@StatusIds = ''
			OR EXISTS (
				SELECT 1 FROM STRING_SPLIT(@StatusIds, ',') s WHERE CONVERT(VARCHAR(10), b.StatusId) = s.value
			)
		)
		AND (
			@CampaignIds = ''
			OR EXISTS (
				SELECT 1 FROM STRING_SPLIT(@CampaignIds, ',') s WHERE CONVERT(VARCHAR(10), b.CampaignId) = s.value
			)
		)
		AND b.CreatedDate BETWEEN @FromDate AND DATEADD(DAY,1, @ToDate);

    -- Get total row count
    SELECT @NRows = COUNT(*) FROM #Data;
    
    -- Paging logic
    DECLARE @RowStart INT, @RowEnd INT;
    
    IF @IsExportExcel = 0
    BEGIN
        SELECT @RowStart = (@PageIndex - 1) * @PageSize + 1,
               @RowEnd = @RowStart + @PageSize - 1;
    END
    ELSE
    BEGIN
        SELECT @RowStart = 1,
               @RowEnd = @NRows;
    END
    
    -- Return paged results
    SELECT 
        CampaignCode,
        CampaignName,
        PageName,
        PageCode,
        TargetCountryCode,
        TargetCountryName,
        MarketId,
        Language,
        TargetLanguageCode,
        CreatedDate,
        CreatedBy,
        LastModifiedBy,
        LastModifiedDate,
        StatusId,
        Status,
        PageId,
        RowIdx,
		0 AS Click,
		0 AS Registration,
		0 AS FTD,
		0 AS Revenue
    FROM #Data
    WHERE RowIdx BETWEEN @RowStart AND @RowEnd
    ORDER BY PageId DESC;
    
    DROP TABLE #Data;
END;
GO
