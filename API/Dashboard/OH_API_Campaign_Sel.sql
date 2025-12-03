/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[OH_API_Campaign_Sel]
    @FromDate   DATE,
	@ToDate     DATE,
	@PageIndex	INT = 1,
	@PageSize	INT = 1000
AS

/*
	Created: 20251202@Sophia
	DB: DBOH-ONEHub
	Task: API Get Campaign Info of ONEHub for AT Dashboard

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
		c.CampaignId,
		c.CampaignName,
		c.CampaignCode,
		c.Description,
		c.Creator,
		c.CreatedDate,
		c.UpdatedBy,
		c.UpdatedDate,
		c.StatusId
	FROM dbo.Campaign c WITH (NOLOCK)
	WHERE CONVERT(DATE, c.CreatedDate) >= @FromDate
		AND CONVERT(DATE, c.CreatedDate) < DATEADD(DAY, 1, @ToDate)
	ORDER BY c.CreatedDate ASC, c.CampaignId ASC
	OFFSET (@PageIndex - 1) * @PageSize ROWS
	FETCH NEXT @PageSize ROWS ONLY;
END
GO