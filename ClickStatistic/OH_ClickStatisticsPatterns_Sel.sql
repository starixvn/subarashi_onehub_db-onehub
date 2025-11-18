/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" viewers="" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[OH_ClickStatisticsPatterns_Sel]
	@FromDate		DATE
	,@ToDate		DATE
	,@ErrCode		INT = 0 OUTPUT
	,@ErrMsg		NVARCHAR(4000) = '' OUTPUT

AS
/*
	Created: 20251110@Danny
	DB: DBOH-ONEHub
	Task: Select ClickStatistics data by date range [RedmineId: #241768]

	Revisions:  
		- 20251110@Danny: Initialize SP to select ClickStatistics data [RedmineID: #241764]

*/
BEGIN
	SET NOCOUNT ON;

		-- Select ClickStatistics data
		SELECT 
			ClickId,
			UserAgent,
			IP,
			ClickTypeid,
			Date
		FROM dbo.ClickStatistics WITH (NOLOCK)
		WHERE Date >= @FromDate AND Date < @ToDate
		ORDER BY ClickId ASC;		
END
GO