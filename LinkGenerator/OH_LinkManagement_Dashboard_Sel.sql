/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE [dbo].[OH_LinkManagement_Dashboard_Sel]
	 @Search				VARCHAR(500)  = ''
	,@CountryCodes		VARCHAR(MAX)   = ''
	,@ChannelIds		VARCHAR(MAX)   = ''
	,@StartDate			DATE   
	,@EndDate			DATE   
	,@StatusIds			VARCHAR(50)   = ''
AS
/*
	Created: 20251104@Danny
	DB: DBOH-ONEHub
	Task: Admin site - Marketing tools - LinkManagement - Dashboard
	Revisions:
		- 20251104@Danny: Initial version [RedmineID: #236797]
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
	

	SELECT  COUNT(1) AS TotalLinks ,
			FLOOR(RAND() * 100000) + 1 AS TotalClicks,
			FLOOR(RAND() * 20000) + 1 AS TotalRegistrations,
			FLOOR(RAND() * 25000) + 1 AS TotalFTDs,
			CAST((RAND() * 100000) + RAND() AS MONEY) AS AvgFTDs
	FROM LinkGenerator l WITH(NOLOCK)
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

END
