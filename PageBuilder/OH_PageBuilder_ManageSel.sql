/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE [dbo].[OH_PageBuilder_ManageSel]
	@Search			VARCHAR(500)  = '',
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

	DROP TABLE IF EXISTS #data_Statistics
	CREATE TABLE #data_Statistics
	(
		[UniqueClick]   [int] NULL,
		[PageCode]		VARCHAR(100) NULL,
		[FTD]			[int] NULL,
		[AvgFTD]		[MONEY] NULL,
		[Bonus]			[int] NULL,
		[Registration]  [int] NULL
	)

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
	LEFT JOIN dbo.OH_f_PageBuilder_Status() s ON b.StatusId = s.StatusId
	LEFT JOIN dbo.Campaign c WITH (NOLOCK) ON b.CampaignId = c.CampaignId
	LEFT JOIN dbo.OH_User u1 WITH (NOLOCK) ON u1.UserId = b.Creator
	LEFT JOIN dbo.OH_User u2 WITH (NOLOCK) ON u2.UserId = b.UpdatedBy
	WHERE
		(@Search = '' 
			OR c.CampaignName LIKE '%' + @Search + '%'
			OR c.CampaignCode LIKE '%' + @Search + '%'
			OR b.PageName LIKE '%' + @Search + '%'
			OR b.PageCode LIKE '%' + @Search + '%'
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


	INSERT INTO #data_Statistics (PageCode, UniqueClick, FTD, AvgFTD, Bonus, Registration)
	SELECT d.PageCode, x.UniqueClick, x.FTD, x.AvgFTD, x.Bonus, x.Registration
	FROM #data d
	CROSS APPLY (
		SELECT COUNT(DISTINCT c.IP) AS UniqueClick,
		       SUM(CASE WHEN m.ClickId IS NOT NULL  AND m.FTDDate IS NOT NULL THEN 1 ELSE 0 END) AS FTD,
			   CASE WHEN  SUM(CASE WHEN m.ClickId IS NOT NULL AND m.FTDDate IS NOT NULL  THEN 1 ELSE 0 END) = 0 THEN 0 ELSE
			   SUM(CASE WHEN m.ClickId IS NOT NULL THEN ISNULL(FirstDepositAmount,0) * ISNULL(ex.Rate, 0) ELSE 0 END)
			   / SUM(CASE WHEN m.ClickId IS NOT NULL AND m.FTDDate IS NOT NULL  THEN 1 ELSE 0 END) END AS AvgFTD,
			   SUM(CASE WHEN b.CustID IS NOT NULL THEN 1 ELSE 0 END) Bonus,
			  SUM(CASE WHEN m.ClickId IS NOT NULL THEN 1 ELSE 0 END) Registration
		FROM LinkGenerator l WITH(NOLOCK)
		INNER JOIN ClickStatistics c WITH(NOLOCK) ON l.LinkId = c.LinkId
		LEFT JOIN  MemberInfo m WITH(NOLOCK) ON c.ClickId = m.ClickId AND m.IsRemoved = 0
		LEFT JOIN dbo.TpExchange te WITH (NOLOCK) ON m.Currency = te.TpExchangeId
		OUTER APPLY 
		(
			SELECT    TOP 1 b.CustID  CustID
			FROM	bodb_12B.dbo.BonusInfo b WITH(NOLOCK) 
			WHERE   m.CustId = b.CustId AND b.PromotionType = 1 AND b.SiteId = 101
		) b
		
		OUTER APPLY dbo.OH_f_ExchangeRate_Sel(m.FTDDate,ISNULL(te.ExchangeId, m.Currency), 0) ex
		WHERE l.PageCode = d.PageCode AND c.Date >= l.Date  AND c.ClickTypeId = 0
	) x

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
        d.PageCode,
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
		ISNULL(df.UniqueClick,0) AS Click,
		ISNULL(df.Registration,0) AS Registration,
		ISNULL(df.FTD,0) AS FTD,
		ISNULL(df.AvgFTD,0) AS AvgFTD,
		ISNULL(df.Bonus,0) AS Bonus

    FROM #Data d
	LEFT JOIN #data_Statistics df ON d.PageCode = df.PageCode
    WHERE RowIdx BETWEEN @RowStart AND @RowEnd
    ORDER BY PageId DESC;

	SELECT COUNT(*) AS TotalPageBuilders
          ,SUM(CASE WHEN p.StatusId = 0 THEN 1 ELSE 0 END) AS DraftPageBuilders
          ,SUM(CASE WHEN p.StatusId = 1 THEN 1 ELSE 0 END) AS ActivePageBuilders
          ,SUM(CASE WHEN p.StatusId = 2 THEN 1 ELSE 0 END) AS InactivePageBuilders
	FROM #Data p
    
    DROP TABLE #Data;
END;
GO
