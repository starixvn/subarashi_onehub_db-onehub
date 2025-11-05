/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE [dbo].[OH_Campaign_ManageSel]
	@Search			VARCHAR(500)  = ''
	,@StatusIds		VARCHAR(50)   = ''
	,@IsExportExcel BIT = 0
	,@PageIndex 	INT = 1
    ,@PageSize 		INT = 20
    ,@NRows 		INT = 0 OUTPUT
	,@FromDate		DATE = '1900-01-01'
	,@Todate		DATE = '2050-01-01'
AS

/*
	Created: 20250903@Eddie
	DB: DBOH-ONEHub
	Task: Admin site - Marketing tools - Campaign Management

	Revisions:
		- 20250903@Eddie: Initialize SP [RedmineID: #236797]

	Param's Explanation:
		- @CampaignSearch:
			+ '' 	: all campaign codes AND Name
			+ 'ABC' : campaign codes include the text 'ABC' OR campaign names include the text 'ABC'
	
		- @StatusIds:
			+ '0,1,2,3' : all statuses
			+ '0,2'     : multiple statuses
			+ '1'       : single status
		- @Description:
			+ '' 	: all descriptions
			+ 'abc' : descriptions include the text 'abc'
		- @PageIndex: page number (1-based)
        - @PageSize: number of records per page
        - @NRows: total number of records (OUTPUT)
        - @IsExportExcel: 
			+ 1 : return all data for Excel export
			+ 0 : return paged data
		
*/

BEGIN
	SET NOCOUNT ON;
	
	DECLARE @Status TABLE (StatusId TINYINT);
	DECLARE @FDate DATETIME = @FromDate
	DECLARE @TDate DATETIME = DATEADD(MILLISECOND, -3, DATEADD(DAY, 1, CAST(@Todate AS DATETIME)))
	IF @StatusIds <> '' AND @StatusIds IS NOT NULL
	BEGIN
		INSERT INTO @Status(StatusId)
		SELECT CAST(f2.value AS TINYINT)
		FROM STRING_SPLIT(@StatusIds, ',') f2;
	END
	
    DROP TABLE IF EXISTS #data;
    CREATE TABLE #data
    (
        CampaignId      INT
        ,CampaignName	VARCHAR(500)
        ,CampaignCode   VARCHAR(100)
        ,Description 	VARCHAR(500)
        ,Creator    	VARCHAR(30)
        ,CreatorId     	INT
        ,CreatedDate	DATE
        ,UpdatedBy		VARCHAR(30)
        ,UpdatedById	INT
        ,UpdatedDate	DATE
        ,StatusId		TINYINT
        ,Status			VARCHAR(50)
		,RowIdx			INT
		,IsAllowDelete  BIT
    );
	
	INSERT INTO #data(
		CampaignId
		,CampaignName
		,CampaignCode
		,Description
		,Creator
		,CreatorId
		,CreatedDate
		,UpdatedBy
		,UpdatedById
		,UpdatedDate
		,StatusId
		,Status
		,RowIdx
		,IsAllowDelete
	)
	SELECT cp.CampaignId
		  ,cp.CampaignName
		  ,cp.CampaignCode
		  ,cp.Description
		  ,u.UserName AS Creator
		  ,cp.Creator AS CreatorId
		  ,CONVERT(DATE, cp.CreatedDate) AS CreatedDate
		  ,au.UserName AS UpdatedBy
		  ,cp.UpdatedBy AS UpdatedById
		  ,CONVERT(DATE, cp.UpdatedDate) AS UpdatedDate
		  ,cp.StatusId
		  ,f.Status
		  ,ROW_NUMBER() OVER(ORDER BY cp.CampaignId DESC) AS RowIdx
		  ,CASE WHEN x.PageID IS NULL THEN 1 ELSE 0 END AS IsAllowDelete
	FROM dbo.Campaign cp WITH (NOLOCK)
		LEFT JOIN dbo."User" u WITH (NOLOCK) ON u.CustId = cp.Creator
		LEFT JOIN dbo."User" au WITH (NOLOCK) ON au.CustId = cp.UpdatedBy
		INNER JOIN dbo.OH_f_Campaign_Status() f ON f.StatusId = cp.StatusId
		OUTER APPLY(
			SELECT TOP 1 PageID FROM PageBuilder pb WITH(NOLOCK)
			WHERE pb.CampaignId = cp.CampaignId
		) x
	WHERE EXISTS(SELECT 1 FROM @Status s WHERE s.StatusId = cp.StatusId)
	AND (
			(cp.CampaignCode LIKE '%' + @Search + '%') 
		OR (cp.CampaignName LIKE '%' + @Search + '%')
		OR  ISNULL(@Search, '') = ''
		OR cp.Description LIKE '%' + @Search + '%'
	) 
	AND cp.CreatedDate BETWEEN @Fdate AND @Tdate;


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
	
	SELECT CampaignId
	       ,CampaignName
	       ,CampaignCode
	       ,Description
	       ,Creator
	       ,CreatorId
	       ,CreatedDate
		   ,UpdatedBy
		   ,UpdatedById
		   ,UpdatedDate
	       ,StatusId
	       ,Status
	       ,RowIdx
		   ,IsAllowDelete
	FROM #data
    WHERE RowIdx BETWEEN @RowStart AND @RowEnd
    ORDER BY RowIdx ASC;

	DROP TABLE #data;
END
