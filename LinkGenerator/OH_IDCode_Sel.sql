/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE [dbo].[OH_IDCode_Sel]
	@IDCode			VARCHAR(20) = NULL
	,@FromDate		DATETIME = NULL
	,@ToDate		DATETIME = NULL
	,@PageIndex		INT = 1
	,@PageSize		INT = 100
	,@NRows			INT = 0 OUTPUT
AS
/*
	Created: 20251117@Sophia
	DB: DBOH-ONEHub
	Task: Select IDCode information for API Push data to AT

	Revisions:
		- 20251117@Sophia: Initialize SP [RedmineID: #243773]

	Param's Explanation:
		- @IDCode:
			+ NULL or '' : Retrieve data by date range (@FromDate, @ToDate)
			+ 'ABC123'   : Retrieve direct info for specific IDCode
		
		- @FromDate: Start date for filtering (used when @IDCode is NULL or '')
		- @ToDate: End date for filtering (used when @IDCode is NULL or '')
		- @PageIndex: Page number (1-based), default = 1
		- @PageSize: Number of records per page, default = 100
		- @NRows: Total number of records (OUTPUT)

	Usage Examples:
		-- Get specific IDCode
		EXEC OH_IDCode_Sel @IDCode = 'ABC123'
		
		-- Get IDCodes by date range with paging
		DECLARE @TotalRows INT
		EXEC OH_IDCode_Sel 
			@FromDate = '2025-11-01',
			@ToDate = '2025-11-30',
			@PageIndex = 1,
			@PageSize = 50,
			@NRows = @TotalRows OUTPUT
		SELECT @TotalRows AS TotalRecords
*/

BEGIN
	SET NOCOUNT ON;

	DROP TABLE IF EXISTS #Data;
	CREATE TABLE #Data
	(
		Id				INT
		,IDCode			VARCHAR(20)
		,StatusId		TINYINT
		,CreatedDate	DATETIME
		,SiteId			SMALLINT
		,RowIdx			INT
	);

	-- Insert data based on @IDCode parameter
	IF ISNULL(@IDCode, '') <> ''
	BEGIN
		-- Direct lookup by IDCode
		INSERT INTO #data (
			Id
			,IDCode
			,StatusId
			,CreatedDate
			,SiteId
			,RowIdx
		)
		SELECT 
			i.Id
			,i.IDCode
			,i.StatusId
			,i.CreatedDate
			,i.SiteId
			,ROW_NUMBER() OVER(ORDER BY i.Id DESC) AS RowIdx
		FROM dbo.IDCode i WITH (NOLOCK)
		WHERE i.IDCode = @IDCode;
	END
	ELSE
	BEGIN	
		
		DECLARE @NowGMT8 DATETIME = DATEADD(HOUR, 8, SYSUTCDATETIME())
		-- Default date range if not provided
		IF @FromDate IS NULL
			SET @FromDate = @NowGMT8
		
		IF @ToDate IS NULL	
			SET @ToDate = @NowGMT8

		-- Adjust @FromDate, @ToDate to include the entire day
			SET @FromDate = CAST(@FromDate AS DATE)
			SET @ToDate = DATEADD(DAY, 1, CAST(@ToDate AS DATE))

		-- Retrieve by date range
		INSERT INTO #Data (
			Id
			,IDCode
			,StatusId
			,CreatedDate
			,SiteId
			,RowIdx
		)
		SELECT 
			i.Id
			,i.IDCode
			,i.StatusId
			,i.CreatedDate
			,i.SiteId
			,ROW_NUMBER() OVER(ORDER BY i.Id ASC) AS RowIdx
		FROM dbo.IDCode i WITH (NOLOCK)
		WHERE i.CreatedDate >= @FromDate AND i.CreatedDate < @ToDate;
	END

	-- Get total row count
	SELECT @NRows = COUNT(*) FROM #data;

	-- Paging logic
	DECLARE @RowStart INT, @RowEnd INT;

	SELECT @RowStart = (@PageIndex - 1) * @PageSize + 1,
		   @RowEnd = @RowStart + @PageSize - 1;

	-- Return paged results
	SELECT 
		Id
		,IDCode
		,StatusId 
		,CreatedDate
		,SiteId
		,RowIdx
	FROM #data
	WHERE RowIdx BETWEEN @RowStart AND @RowEnd
	ORDER BY RowIdx ASC;

	DROP TABLE #data;
END
GO
