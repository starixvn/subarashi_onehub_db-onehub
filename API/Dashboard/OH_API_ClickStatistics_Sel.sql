/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[OH_API_ClickStatistics_Sel]
    @FromDate   DATE,
	@ToDate     DATE,
	@PageIndex	INT = 1,
	@PageSize	INT = 1000
AS

/*
	Created: 20251202@Sophia
	DB: DBOH-ONEHub
	Task: API Get ClickStatistic Info of ONEHub for AT Dashboard

	Revisions:
		- 20251202@Sophia: Initialize SP [RedmineID: #244327]
    
	Param's Explanation:
		- @FromDate, @ToDate: GMT+8
		- @PageIndex: The page index for pagination, starting from 1
		- @PageSize: The number of records to return per page, limit 1k rows

*/
BEGIN
	SET NOCOUNT ON;

	-- Limit Pagesize to 1000 rows
	SELECT @Pagesize = CASE 
		WHEN @PageSize <= 0 OR @PageSize > 1000 THEN 1000 
		ELSE @PageSize 
	END;

	-- Return paginated results with LinkGenerator data
	SELECT 
		c.ClickId,
		c.UpdatedTime,
		c.[Date],
		c.IP,
		c.DomainReferrer,
		c.URLReferrer,
		c.RedirectURL,
		c.Browser,
		c.BrowserVersion,
		c.BrowserLanguage,
		c.OS,
		c.Device,
		c.DeviceType,
		c.UserAgent,
		c.LinkId,
		c.SiteId,
		c.ClickTypeId,
		-- LinkGenerator columns
		lg.LinkName,
		lg.IDCode,
		lg.CampaignId,
		lg.CountryCode,
		lg.MarketId,
		lg.EventIds,
		lg.GroupId,
		lg.ChannelId,
		lg.AgencyId,
		lg.TypeId,
		lg.PageCode,
		lg.PageType,
		lg.Note AS LinkNote,
		lg.DomainName AS LinkDomainName,
		lg.ShortDomain,
		lg.ShortPath,
		lg.FullLink,
		lg.StatusId AS LinkStatusId,
		lg.Creator AS LinkCreator,
		lg.CreatedDate AS LinkCreatedDate,
		lg.UpdatedBy AS LinkUpdatedBy,
		lg.UpdatedDate AS LinkUpdatedDate
	FROM dbo.ClickStatistics c WITH (NOLOCK)
	INNER JOIN dbo.LinkGenerator lg WITH (NOLOCK) ON c.LinkId = lg.LinkId
	WHERE c.[Date] >= @FromDate
		AND c.[Date] <= @ToDate
	ORDER BY c.UpdatedTime ASC, c.ClickId ASC
	OFFSET (@PageIndex - 1) * @PageSize ROWS
	FETCH NEXT @PageSize ROWS ONLY;
END
GO