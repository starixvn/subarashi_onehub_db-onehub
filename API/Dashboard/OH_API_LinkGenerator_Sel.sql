/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[OH_API_LinkGenerator_Sel]
    @FromDate   DATE,
	@ToDate     DATE,
	@PageIndex	INT = 1,
	@PageSize	INT = 1000
AS

/*
	Created: 20251202@Sophia
	DB: DBOH-ONEHub
	Task: API Get LinkGenerator Info of ONEHub for AT Dashboard

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

	-- Return paginated results
	SELECT 
		lg.LinkId,
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
		lg.Note,
		lg.DomainName,
		lg.ShortDomain,
		lg.ShortPath,
		lg.FullLink,
		lg.SiteId,
		lg.StatusId,
		lg.Creator,
		lg.CreatedDate,
		lg.[Date],
		lg.UpdatedBy,
		lg.UpdatedDate
	FROM dbo.LinkGenerator lg WITH (NOLOCK)
	WHERE lg.[Date] >= @FromDate
		AND lg.[Date] <= @ToDate
	ORDER BY lg.CreatedDate ASC, lg.LinkId ASC
	OFFSET (@PageIndex - 1) * @PageSize ROWS
	FETCH NEXT @PageSize ROWS ONLY;
END
GO