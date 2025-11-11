/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE [dbo].[OH_PageBuilder_Dashboard_Sel]
	@CampaignName VARCHAR(200) = '', -- Search in both CampaignName and CampaignCode
	@PageName VARCHAR(200) = '', -- Search in both PageName and PageCode
	@TargetCountryCodes VARCHAR(500) = '',
	@MarketIds VARCHAR(500) = '',
	@StatusIds VARCHAR(500) = '',
	@FromDate	  DATE = NULL,
	@ToDate		  DATE = NULL
AS
/*
	Created: 20251105@Danny
	DB: DBOH-ONEHub
	Task: Page management dashboard
	Revisions:
		- 20251105@Danny: Initial version [RedmineID: #241764]
*/
BEGIN
	SET NOCOUNT ON;

	SELECT COUNT(*) AS TotalPageBuilders
          ,SUM(CASE WHEN p.StatusId = 0 THEN 1 ELSE 0 END) AS DraftPageBuilders
          ,SUM(CASE WHEN p.StatusId = 1 THEN 1 ELSE 0 END) AS ActivePageBuilders
          ,SUM(CASE WHEN p.StatusId = 2 THEN 1 ELSE 0 END) AS InactivePageBuilders
	FROM dbo.PageBuilder p WITH (NOLOCK)
	LEFT JOIN dbo.Campaign c WITH (NOLOCK) ON p.CampaignId = c.CampaignId
	WHERE	(@CampaignName = '' 
			OR c.CampaignName LIKE '%' + @CampaignName + '%'
			OR c.CampaignCode LIKE '%' + @CampaignName + '%'
		)
		AND (
			@PageName = ''
			OR p.PageName LIKE '%' + @PageName + '%'
			OR p.PageCode LIKE '%' + @PageName + '%'
		)
		AND (
			@TargetCountryCodes = ''
			OR EXISTS (
				SELECT 1 FROM STRING_SPLIT(@TargetCountryCodes, ',') s WHERE p.TargetCountryCode = s.value
			)
		)
		AND (
			@MarketIds = ''
			OR EXISTS (
				SELECT 1 FROM STRING_SPLIT(@MarketIds, ',') s WHERE p.MarketId = s.value
			)
		)
		AND (
			@StatusIds = ''
			OR EXISTS (
				SELECT 1 FROM STRING_SPLIT(@StatusIds, ',') s WHERE CONVERT(VARCHAR(10), p.StatusId) = s.value
			)
		)
		AND p.CreatedDate BETWEEN @FromDate AND DATEADD(DAY,1, @ToDate)

END
GO


