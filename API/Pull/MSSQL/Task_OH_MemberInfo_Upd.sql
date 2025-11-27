/*<info serverAlias="DBOH-ONEHub" isFunction="0" isNested="0"></info>*/

CREATE PROCEDURE [dbo].[Task_OH_MemberInfo_Upd]
	@IsReal BIT = 0,
	@SiteId SMALLINT = 101
AS

/*
	Created: 20251118@Sophia
	DB: DBOH-ONEHub
	Task: Job (SQL) - Update member info

	Revisions:
		- 20251118@Sophia: Initialize SP [RedmineID: #244327]

	Param explain:
		@IsReal = 1: Real time Job (every 1 min)
		@IsReal = 0: Normal job (every 30 min)

*/

BEGIN
	SET NOCOUNT ON
 
	DECLARE @LastUpdatedTime DATETIME, @TimeZone INT
	SELECT  @TimeZone = dbo.OH_f_GetSetting('TimeZone'),
			@LastUpdatedTime = dbo.OH_f_GetSetting('MemberInfoLastUpdatedTime')		

	SELECT @LastUpdatedTime =  CONVERT(DATE, DATEADD(DAY, -1, @LastUpdatedTime))  -- Recall data backward a day

	-- Real time: will use the SName = 'RealMemberInfoLastUpdatedTime', re-call data backward 1 hour
	IF @IsReal = 1
	BEGIN 
		SELECT @LastUpdatedTime = dbo.OH_f_GetSetting('RealMemberInfoLastUpdatedTime')
		SELECT @LastUpdatedTime = DATEADD(HOUR, -1, @LastUpdatedTime)
	END

	CREATE TABLE #Customer
	(
		RowNumber			INT IDENTITY(1,1)
		,CustId				INT
		,IBCUsername		VARCHAR(50)
		,ActStatus			TINYINT
		,Status				TINYINT
		,FirstDepositDate	DATETIME
		,FirstDepositAmount	MONEY
		,TagList			NVARCHAR(MAX)
		,UpdatedTime		DATETIME
	)

	INSERT INTO #Customer (CustId, IBCUsername, ActStatus, Status, FirstDepositDate, FirstDepositAmount, UpdatedTime, TagList)
	SELECT CustId, TpSystemUserName, ActStatus, Status, FirstDepositDate, FirstDepositAmount, UpdatedTime, TagList
	FROM bodb_12B.dbo.Customer WITH (NOLOCK)
	WHERE SiteId = @SiteId
		AND UpdatedTime >= @LastUpdatedTime

	IF EXISTS (SELECT 1 FROM #Customer)
	BEGIN
		-- Update in batches of 2000 rows
		DECLARE @StartRow	INT 
			,@StopRow		INT 
			,@MaxRow		INT	= 0
			,@Threshold		INT  -- the number of each batch

		SET @Threshold = 2000
		SELECT @MaxRow = MAX(RowNumber) FROM #Customer

		IF (@Threshold >= @MaxRow)
			SET @Threshold = @MaxRow

		-- SET for first batch
		SELECT @StartRow = 1, @StopRow = @Threshold

		WHILE (@MaxRow IS NOT NULL)
		BEGIN
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
				INNER JOIN #Customer c ON mi.CustId = c.CustId
				LEFT JOIN dbo.TpExchange t WITH (NOLOCK) ON t.TpExchangeId = mi.Currency
				INNER JOIN dbo.Exchange e WITH (NOLOCK) ON ISNULL(t.ExchangeId, mi.Currency) = e.ExchangeId
			WHERE c.RowNumber BETWEEN @StartRow AND @StopRow

			IF @StopRow = @MaxRow BREAK

			-- Set for next batch
			SET @StartRow = @StopRow + 1
			SET @StopRow = @StopRow + @Threshold

			IF @StopRow >= @MaxRow
				SET @StopRow = @MaxRow
		END

		SELECT @LastUpdatedTime = MAX(UpdatedTime) FROM #Customer

		IF @IsReal = 1 
		BEGIN 
			UPDATE dbo.SystemSettings WITH (ROWLOCK, UPDLOCK)
			SET SValue = CONVERT(VARCHAR(20), @LastUpdatedTime, 120)
			WHERE SName = 'RealMemberInfoLastUpdatedTime'		
		END 
		ELSE
		BEGIN 
			UPDATE dbo.SystemSettings WITH (ROWLOCK, UPDLOCK)
			SET SValue = CONVERT(VARCHAR(20), @LastUpdatedTime, 120)
			WHERE SName = 'MemberInfoLastUpdatedTime'
		END 

		DROP TABLE #Customer   
	END
END
GO

    
