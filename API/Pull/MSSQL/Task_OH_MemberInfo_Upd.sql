/*<info serverAlias="DBOH-ONEHub" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[Task_OH_MemberInfo_Upd]
	@IsReal BIT = 0 
AS

/*
	Created: 20251118@Sophia
	DB: DBOH-ONEHub
	Task: Job - Update member info

	Revisions:
		- 20251118@Sophia: Initialize SP [RedmineID: #244327]

	Param explain:
		@IsReal = 1: Real time Job (every 1 min)
		@IsReal = 0: Normal job (every 30 min)

*/

BEGIN
	SET NOCOUNT ON

	DECLARE @LastUpdatedTime DATETIME, @TimeZone INT
	
	SELECT @TimeZone = CONVERT(TINYINT, SValue)
	FROM dbo.SystemSettings WITH (NOLOCK)
	WHERE SName = 'TimeZone'

	SELECT @LastUpdatedTime = CONVERT(DATETIME, SValue)
	FROM dbo.SystemSettings WITH (NOLOCK)
	WHERE SName = 'MemberInfoLastImportedTime'

	SELECT @LastUpdatedTime = ISNULL(CONVERT(DATE, DATEADD(DAY, -1, @LastUpdatedTime)), '2021-01-01') -- Recall data backward a day

	-- Real time: will use the SName = 'RealMemberInfoLastImportedTime', re-call data backward 1 hour
	IF @IsReal = 1
	BEGIN 
		SELECT @LastUpdatedTime = CONVERT(DATETIME, SValue)
		FROM dbo.SystemSettings WITH (NOLOCK)
		WHERE SName = 'RealMemberInfoLastImportedTime'
		
		SELECT @LastUpdatedTime = DATEADD(HOUR, -1, @LastUpdatedTime)
	END

	CREATE TABLE #MemberInfo
	(
		RowNumber			INT IDENTITY(1,1)
		,CustId				INT
		,UserName			VARCHAR(30)
		,Currency			INT
		,ActStatus			TINYINT
		,Status				TINYINT
		,RegisteredDate		DATETIME
		,FirstDepositDate	DATETIME
		,FirstDepositAmount	MONEY
		,ClickId			BIGINT
		,TagList			NVARCHAR(MAX)
		,UpdatedTime		DATETIME
	)

	INSERT INTO #MemberInfo (CustId, UserName, Currency, ActStatus, Status, RegisteredDate, FirstDepositDate, FirstDepositAmount, ClickId, TagList, UpdatedTime)
	SELECT CustId, UserName, Currency, ActStatus, Status, RegisteredDate, FirstDepositDate, FirstDepositAmount, ClickId, TagList, UpdatedTime
	FROM dbo.MemberInfo WITH (NOLOCK)
	WHERE UpdatedTime >= @LastUpdatedTime

	IF EXISTS (SELECT 1 FROM #MemberInfo)
	BEGIN
		-- Update in batches of 2000 rows
		DECLARE @StartRow	INT 
			,@StopRow		INT 
			,@MaxRow		INT	= 0
			,@Threshold		INT  -- the number of each batch

		SET @Threshold = 2000
		SELECT @MaxRow = MAX(RowNumber) FROM #MemberInfo

		IF (@Threshold >= @MaxRow)
			SET @Threshold = @MaxRow

		-- SET for first batch
		SELECT @StartRow = 1, @StopRow = @Threshold

		WHILE (@MaxRow IS NOT NULL)
		BEGIN
			-- Update logic for MemberInfo synchronization
			-- Process records in batches for performance
			UPDATE mi WITH (ROWLOCK, UPDLOCK)
			SET mi.UserName = m.UserName
				,mi.Currency = m.Currency
				,mi.ActStatus = m.ActStatus
				,mi.Status = m.Status
				,mi.RegisteredDate = m.RegisteredDate
				,mi.FirstDepositDate = m.FirstDepositDate
				,mi.FirstDepositAmount = m.FirstDepositAmount
				,mi.ClickId = m.ClickId
				,mi.TagList = m.TagList
			FROM dbo.MemberInfo mi
				INNER JOIN #MemberInfo m ON mi.CustId = m.CustId
			WHERE m.RowNumber BETWEEN @StartRow AND @StopRow

			IF @StopRow = @MaxRow BREAK

			-- Set for next batch
			SET @StartRow = @StopRow + 1
			SET @StopRow = @StopRow + @Threshold

			IF @StopRow >= @MaxRow
				SET @StopRow = @MaxRow

		END

		SELECT @LastUpdatedTime = MAX(UpdatedTime) FROM #MemberInfo

		IF @IsReal = 1 
		BEGIN 
			UPDATE dbo.SystemSettings WITH (ROWLOCK, UPDLOCK)
			SET SValue = CONVERT(VARCHAR(20), @LastUpdatedTime, 120)
			WHERE SName = 'RealMemberInfoLastImportedTime'		
		END 
		ELSE
		BEGIN 
			UPDATE dbo.SystemSettings WITH (ROWLOCK, UPDLOCK)
			SET SValue = CONVERT(VARCHAR(20), @LastUpdatedTime, 120)
			WHERE SName = 'MemberInfoLastImportedTime'
		END 
		
	END

	DROP TABLE #MemberInfo
END
GO
