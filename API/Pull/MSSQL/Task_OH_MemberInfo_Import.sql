/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE [dbo].[Task_OH_MemberInfo_Import]
	@XmlData	XML
	,@ErrCode	INT = 0 OUTPUT
	,@ErrMsg	VARCHAR(2000) = '' OUTPUT
AS

/*
	Created: 20251118@Sophia
	DB: DBOH-ONEHub
	Task: Job (web call) - Import member info

	Revisions:
		- 20251118@Sophia: Initialize SP [RedmineID: #244327]
		- 20251119@Sophia: Updated to match new MemberInfo table structure with additional columns [RedmineID: #244327]

*/

BEGIN
	SET NOCOUNT ON

	SELECT @ErrCode = 0, @ErrMsg = ''

	DECLARE @TimeZone INT
	SELECT @TimeZone = CONVERT(TINYINT, SValue)
	FROM dbo.SystemSettings WITH (NOLOCK)
	WHERE SName = 'TimeZone'

	CREATE TABLE #MemberInfo
	(
		CustId				INT NOT NULL
		,UserName			VARCHAR(30) NULL
		,FirstName			NVARCHAR(100) NULL
		,LastName			NVARCHAR(100) NULL
		,Email				NVARCHAR(100) NULL
		,Currency			INT NULL
		,ActStatus			TINYINT NULL
		,Status				TINYINT NULL
		,IsRemoved			BIT NULL
		,RegisteredDate		DATETIME NULL
		,RegDate			DATE NULL
		,IDCode				VARCHAR(20) NULL
		,CreatedDate		DATETIME NULL
		,ClickId			BIGINT NULL
		,FirstDepositDate	DATETIME NULL
		,FTDDate			DATE NULL
		,FirstDepositAmount	MONEY NULL
		,SiteId				SMALLINT NOT NULL
	)

	BEGIN TRY
		INSERT INTO #MemberInfo
		(
			CustId
			,UserName
			,FirstName
			,LastName
			,Email
			,Currency
			,ActStatus
			,Status
			,IsRemoved
			,RegisteredDate
			,RegDate
			,IDCode
			,CreatedDate
			,ClickId
			,FirstDepositDate
			,FTDDate
			,FirstDepositAmount
			,SiteId
		)
		SELECT
			CustId				= t.c.value('@custid', 'INT')
			,UserName			= t.c.value('@username', 'VARCHAR(30)')
			,FirstName			= t.c.value('@firstname', 'NVARCHAR(100)')
			,LastName			= t.c.value('@lastname', 'NVARCHAR(100)')
			,Email				= t.c.value('@email', 'NVARCHAR(100)')
			,Currency			= t.c.value('@currencyid', 'INT')
			,ActStatus			= t.c.value('@actstatus', 'TINYINT')
			,Status				= t.c.value('@status', 'TINYINT')
			,IsRemoved			= t.c.value('@IsRemoved', 'BIT')
			,RegisteredDate		= DATEADD(HOUR, @TimeZone, NULLIF(t.c.value('@regtime', 'DATETIME'), ''))
			,RegDate			= CAST(DATEADD(HOUR, @TimeZone, NULLIF(t.c.value('@regtime', 'DATETIME'), '')) AS DATE)
			,IDCode				= t.c.value('@idcode', 'VARCHAR(20)')
			,CreatedDate		= GETDATE()
			,ClickId			= CASE WHEN t.c.value('@clickid', 'BIGINT') = 0 THEN NULL ELSE t.c.value('@clickid', 'BIGINT') END
			,FirstDepositDate	= DATEADD(HOUR, @TimeZone, NULLIF(t.c.value('@firstdepositdate', 'DATETIME'), ''))
			,FTDDate			= CAST(DATEADD(HOUR, @TimeZone, NULLIF(t.c.value('@firstdepositdate', 'DATETIME'), '')) AS DATE)
			,FirstDepositAmount	= t.c.value('@firstdepositamount', 'MONEY')
			,SiteId				= t.c.value('@siteid', 'SMALLINT')
		FROM @XmlData.nodes('root/row') AS t(c)
		OPTION (OPTIMIZE FOR (@XmlData = NULL))
	END TRY
	BEGIN CATCH
		SELECT @ErrCode = 100, @ErrMsg = 'Failed Parse XML data: ' + ERROR_MESSAGE()
		RETURN
	END CATCH

	CREATE CLUSTERED INDEX CIX_CustId ON #MemberInfo (CustId)

	-- Insert/update data
	BEGIN
		IF EXISTS (
			SELECT 1
			FROM dbo.MemberInfo mi WITH (NOLOCK)
			WHERE EXISTS (SELECT 1 FROM #MemberInfo m WHERE mi.CustId = m.CustId)
		)
		BEGIN
			UPDATE mi WITH (ROWLOCK)
			SET mi.UserName				= m.UserName
				,mi.FirstName			= m.FirstName
				,mi.LastName			= m.LastName
				,mi.Email				= m.Email
				,mi.Currency			= m.Currency
				,mi.ActStatus			= m.ActStatus
				,mi.Status				= m.Status
				,mi.RegisteredDate		= m.RegisteredDate
				,mi.RegDate				= m.RegDate
				,mi.IDCode				= m.IDCode
				,mi.CreatedDate			= m.CreatedDate
				,mi.ClickId				= m.ClickId
				,mi.FirstDepositDate	= m.FirstDepositDate
				,mi.FTDDate				= m.FTDDate
				,mi.FirstDepositAmount	= m.FirstDepositAmount
			FROM dbo.MemberInfo mi
				INNER JOIN #MemberInfo m ON mi.CustId = m.CustId AND mi.SiteId = m.SiteId
		END

		INSERT INTO dbo.MemberInfo
		(
			CustId
			,UserName
			,FirstName
			,LastName
			,Email
			,Currency
			,ActStatus
			,Status
			,IsRemoved
			,RegisteredDate
			,RegDate
			,IDCode
			,CreatedDate
			,ClickId
			,FirstDepositDate
			,FTDDate
			,FirstDepositAmount
			,SiteId
		)
		SELECT
			CustId
			,UserName
			,FirstName
			,LastName
			,Email
			,Currency
			,ActStatus
			,Status
			,IsRemoved
			,RegisteredDate
			,RegDate
			,IDCode
			,CreatedDate
			,ClickId
			,FirstDepositDate
			,FTDDate
			,FirstDepositAmount
			,SiteId
		FROM #MemberInfo m
		WHERE NOT EXISTS (SELECT 1 FROM dbo.MemberInfo mi WITH (NOLOCK) WHERE m.CustId = mi.CustId AND m.SiteId = mi.SiteId)
	END

	DROP TABLE #MemberInfo
END
GO
