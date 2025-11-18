/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE [dbo].[OH_Component_ManageSel]
    @ComponentTypeId INT,
    @ComponentName	VARCHAR(200) = '',
	@DeviceIds		VARCHAR(200) = '',
    @StatusIds		VARCHAR(50) = '',
	@IsExportExcel BIT = 0,
	@PageIndex 		INT = 1,
    @PageSize 		INT = 20,
    @NRows 			INT = 0 OUTPUT
AS
/*
    Created: 20250929@Sophia
    DB: DBAFF12B-Affiliate_12B
    Task: Select Landing Page Components for management grid with filtering
    Revisions:
        - 20250929@Sophia: Initial version [RedmineID: #239988]
*/
BEGIN
    SET NOCOUNT ON;

	 DROP TABLE IF EXISTS #data;
    CREATE TABLE #data
    (
        ComponentId			INT
        ,ComponentCode		VARCHAR(200)
        ,ComponentName 		VARCHAR(200)
        ,ComponentTypeId   INT
        ,CreatedDate		DATE
        ,CreatedBy			VARCHAR(60)
        ,LastModifiedDate	DATE
		,LastModifiedBy	    VARCHAR(60)
        ,StatusId			TINYINT
        ,Status				VARCHAR(50)
		,Device				VARCHAR(100)
		,DeviceId			INT
		,RowIdx				INT
    );

	INSERT INTO #data (
		 ComponentId			
        ,ComponentCode		
        ,ComponentName 		
        ,ComponentTypeId   
        ,CreatedDate	
        ,CreatedBy		
        ,LastModifiedDate	
		,LastModifiedBy
        ,StatusId		
        ,Status			
		,Device	
		,DeviceId
		,RowIdx			

	)
    SELECT 
        c.ComponentId,
        c.ComponentCode,
        c.ComponentName,
        c.ComponentTypeId,
        c.CreatedDate,
        u.UserName AS CreatedBy,
        c.UpdatedDate AS LastModifiedDate,
        au.UserName AS LastModifiedBy,
        c.StatusId,
        s.Status,
		CASE WHEN c.CategoryType = 1 THEN 'Mobile' WHEN c.CategoryType =2 THEN 'Mobile & Desktop' ELSE NULL END Device,
		c.CategoryType DeviceId,
		 ROW_NUMBER() OVER(ORDER BY c.ComponentId DESC) AS RowIdx
    FROM dbo.Component c WITH (NOLOCK)
    LEFT JOIN dbo.OH_User u WITH (NOLOCK) ON u.UserId = c.Creator
    LEFT JOIN dbo.OH_User au WITH (NOLOCK) ON au.UserId = c.UpdatedBy
    LEFT JOIN dbo.OH_f_Component_Status() s ON s.StatusId = c.StatusId
    WHERE (c.ComponentTypeId = @ComponentTypeId)
        AND (@ComponentName = '' 
            OR c.ComponentName LIKE '%' + @ComponentName + '%'
            OR c.ComponentCode LIKE '%' + @ComponentName + '%')
        AND (@StatusIds = '' OR ',' + @StatusIds + ',' LIKE '%,' + CONVERT(VARCHAR(10), c.StatusId) + ',%')
		 AND  ( 
			c.ComponentTypeId = 6 AND (@DeviceIds = '' OR ',' + @DeviceIds + ',' LIKE '%,' + CONVERT(VARCHAR(10), c.CategoryType) + ',%')
			OR c.ComponentTypeId <> 6 AND @DeviceIds = ''
		 )
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

	SELECT  ComponentId			
        ,ComponentCode		
        ,ComponentName 		
        ,ComponentTypeId   
        ,CreatedDate	
        ,CreatedBy		
        ,LastModifiedDate	
		,LastModifiedBy
        ,StatusId		
        ,Status			
		,Device
		,DeviceId	
		,RowIdx			
	FROM #data
    WHERE RowIdx BETWEEN @RowStart AND @RowEnd
    ORDER BY RowIdx ASC;

END;