/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE [dbo].[OH_LinkManagement_ManageSel]
	@Search				VARCHAR(500)  = ''
	,@CountryCodes		VARCHAR(MAX)   = ''
	,@ChannelIds		VARCHAR(MAX)   = ''
	,@StartDate			DATE   
	,@EndDate			DATE   
	,@StatusIds			VARCHAR(50)   = ''
	,@PageIndex 	INT = 1
    ,@PageSize 		INT = 20
    ,@NRows 		INT = 0 OUTPUT
	,@IsExportExcel BIT =  0
AS

/*
	Created: 20251104@Danny
	DB: DBOH-ONEHub
	Task: Admin site - Marketing tools -  LinkManagement - Dashboard

	Revisions:
		- 20251104@Danny: Initialize SP [RedmineID: #241764]

	Param's Explanation:
		
*/

BEGIN
	SET NOCOUNT ON;

	DECLARE @Status TABLE (StatusId TINYINT);

	IF @StatusIds <> '' AND @StatusIds IS NOT NULL
	BEGIN
		INSERT INTO @Status(StatusId)
		SELECT CAST(f2.value AS TINYINT)
		FROM STRING_SPLIT(@StatusIds, ',') f2;
	END
	
	DECLARE @CountryCode_Tab TABLE (CountryCode VARCHAR(50));
	
	IF @CountryCodes <> '' AND @CountryCodes IS NOT NULL
	BEGIN
		INSERT INTO @CountryCode_Tab(CountryCode)
		SELECT  value
		FROM STRING_SPLIT(@CountryCodes, ',');
	END

	DECLARE @ChannelId_Tab TABLE (ChannelId INT);
	
	IF @ChannelIds <> '' AND @ChannelIds IS NOT NULL
	BEGIN
		INSERT INTO @ChannelId_Tab(ChannelId)
		SELECT  CAST(value AS INT)
		FROM STRING_SPLIT(@ChannelIds, ',');
	END
	
	
    DROP TABLE IF EXISTS #data;
    CREATE TABLE #data
    (
		[LinkId]		[int] NULL,
        [LinkName]		[varchar](200) NULL,
		[IDCode]		[varchar](20) NULL,
		[CampaignId]	[int] NULL,
		[CampaignName]	[varchar](500) NULL,
		[CountryCode]	[varchar](50) NULL,
		[CountryName]	[varchar](200) NULL,
		[MarketId]		[varchar](50) NULL,
		[EventIds]		[varchar](1000) NULL,
		[GroupId]		[int] NULL,
		[ChannelId]		[int] NULL,
		[ChannelName]	[varchar](200) NULL,
		[AgencyId]		[int] NULL,
		[TypeId]		[int] NULL,
		[PageCode]		[varchar](100) NULL,
		[PageType]		[tinyint] NULL,
		[Note]			[nvarchar](500) NULL,
		[DomainName]	[varchar](200) NULL,
		[ShortDomain]	[varchar](500) NULL,
		[ShortPath]		[varchar](50) NULL,
		[FullLink]		[varchar](1000) NULL,
		[SiteId]		[smallint] NULL,
		[StatusId]		[tinyint] NULL,
		[CreatedDate]	[datetime] NOT NULL,
		[RowIdx]		[INT]
    );
	
	INSERT INTO #data(
		[LinkId]		,
		[LinkName]		,
		[IDCode]		,
		[CampaignId]	,
		[CampaignName]  ,
		[CountryCode]	,
		[CountryName]	,
		[MarketId]		,
		[EventIds]		,
		[GroupId]		,
		[ChannelId]		,
		[ChannelName]	,
		[AgencyId]		,
		[TypeId]		,
		[PageCode]		,
		[PageType]		,
		[Note]			,
		[DomainName]	,
		[ShortDomain]	,
		[ShortPath]		,
		[FullLink]		,
		[SiteId]		,
		[StatusId]		,
		[CreatedDate]	,
		[RowIdx]
	)
	SELECT  [LinkId]		,
			[LinkName]		,
			[IDCode]		,
			l.[CampaignId]	,
			[CampaignName]  ,
			l.[CountryCode]	,
			[CountryName]   ,
			[MarketId]		,
			l.[EventIds]		,
			[GroupId]		,
			[ChannelId]		,
			co.ComponentName AS  [ChannelName],
			[AgencyId]		,
			[TypeId]		,
			l.[PageCode]		,
			[PageType]		,
			[Note]			,
			[DomainName]	,
			[ShortDomain]	,
			[ShortPath]		,
			[FullLink]		,
			[SiteId]		,
			l.[StatusId]	,
			l.[CreatedDate]	,
			ROW_NUMBER() OVER(ORDER BY l.CreatedDate DESC) AS RowIdx
	FROM dbo.LinkGenerator l WITH (NOLOCK)
	LEFT JOIN Campaign cp  WITH (NOLOCK) ON l.CampaignId = cp.CampaignId
	LEFT JOIN Country c   WITH (NOLOCK) ON l.CountryCode = c.CountryCode
	LEFT JOIN Component co  WITH (NOLOCK) ON l.ChannelId = co.ComponentId AND co.ComponentTypeId = 3
	WHERE ( EXISTS(SELECT 1 FROM @ChannelId_Tab ch WHERE ch.ChannelId = l.ChannelId) OR ISNULL(@ChannelIds,'') = '')
	AND ( EXISTS(SELECT 1 FROM @CountryCode_Tab cc WHERE cc.CountryCode = l.CountryCode) OR ISNULL(@CountryCodes,'') = '')
	AND (
			(cp.CampaignCode LIKE '%' + @Search + '%') 
		OR (cp.CampaignName LIKE '%' + @Search + '%')
		OR  ISNULL(@Search, '') = ''
	)
	AND l.CreatedDate BETWEEN @StartDate AND DATEADD(DAY,1,@EndDate)
	AND EXISTS(SELECT 1 FROM @Status s WHERE s.StatusId = l.StatusId);

	

	-- Get total row count
    SELECT @NRows = COUNT(*) FROM #data;
	
	
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
	
	SELECT RowIdx
		    ,LinkId
		   ,LinkName
	       ,DomainName
	       ,ShortDomain + '/' +  ShortPath AS ShortLink
	       ,CampaignName
	       ,CountryName
	       ,ChannelName
	       ,IDCode
		   ,d.CreatedDate
		   ,0 AS Click
		   ,0 AS Registration
	       ,0 AS FTD
	       ,0 AS Avg_FTD
		   ,d.StatusId
		   ,CASE WHEN d.StatusId = 1 THEN 'Active' ELSE 'Inactive' END StatusName
		   ,FullLink
		   , 0 AS Bonus
		   , x.Event 
		   ,CASE WHEN d.PageType IN (1,2) THEN l.LandingPage ELSE p.LandingPage END LandingPage
		   ,g.ComponentName [Group]
		   ,a.ComponentName  Agency
		   ,m.MarketName Language
		   ,md.ComponentName Type
		   ,d.Note
	FROM #data d
	LEFT JOIN Market m WITH(NOLOCK) ON d.MarketId = m.MarketId
	LEFT JOIN Component g WITH(NOLOCK) ON g.ComponentId = d.GroupId
	LEFT JOIN Component a WITH(NOLOCK) ON a.ComponentId = d.AgencyId
	LEFT JOIN Component md WITH(NOLOCK) ON md.ComponentId = d.TypeId
	OUTER APPLY (
		SELECT STRING_AGG(e.ComponentName,', ') Event
		FROM Component e WITH(NOLOCK)
		WHERE EXISTS ( SELECT TOP 1 1 FROM STRING_SPLIT(d.EventIds,',') z WHERE  CAST(z.value AS INT) =  e.ComponentId)
	) x
	OUTER APPLY (
		SELECT l.ComponentName AS LandingPage
		FROM Component l WITH(NOLOCK)
		WHERE l.ComponentTypeId = 6 AND l.ComponentCode = d.PageCode AND d.PageType IN (1,2)
	) l
	OUTER APPLY (
		SELECT p.PageName AS LandingPage
		FROM PageBuilder p WITH(NOLOCK)
		WHERE p.PageCode = d.PageCode AND d.PageType = 3
	) p
    WHERE RowIdx BETWEEN @RowStart AND @RowEnd
    ORDER BY RowIdx ASC;

	DROP TABLE #data;
END

