/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" viewers="" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE [dbo].[OH_ClickStatisticsIns]
	@ClickId			BIGINT
	,@UpdatedTime		DATETIME = NULL
	,@IP				VARCHAR(25) = ''
	,@Browser			NVARCHAR(50) = ''
	,@URLReferrer		NVARCHAR(300) = NULL
	,@DomainReferrer	NVARCHAR(300) = NULL
	,@OS				NVARCHAR(50) = ''
	,@Device			NVARCHAR(50) = ''
	,@BrowserVersion	NVARCHAR(16) = ''
	,@BrowserLanguage	NVARCHAR(8) = ''
	,@UserAgent			NVARCHAR(256) = ''
	,@RedirectURL		VARCHAR(4000) = NULL
	,@DeviceType		TINYINT = 0
	,@ClickTypeId		TINYINT = 0
	,@LinkId			INT = 0
	,@ErrCode			INT = 0 OUTPUT
	,@ErrMsg			NVARCHAR(4000) = '' OUTPUT

AS
/*
	Created: 20251107@Danny
	DB: DBOH-ONEHub
	Task: Clicking Short link action

	Revisions:  
		- 20251107@Danny: Initialize SP [RedmineID: #241764]

*/
BEGIN
	SET NOCOUNT ON;


	BEGIN TRY

		INSERT INTO dbo.ClickStatistics
		(
			[ClickId],
			[UpdatedTime],
			[Date],
			[IP],
			[DomainReferrer],
			[URLReferrer],
			[RedirectURL],
			[Browser],
			[BrowserVersion],
			[BrowserLanguage],
			[OS],
			[Device],
			[DeviceType],
			[UserAgent],
			[LinkId],
			[SiteId],
			[ClickTypeId]
		)
		VALUES
		(
			@ClickId, 
			@UpdatedTime, 
			CAST(@UpdatedTime AS DATE), 
			@IP, 
			@DomainReferrer, 
			@URLReferrer, 
			@RedirectURL, 
			@Browser, 
			@BrowserVersion, 
			@BrowserLanguage, 
			@OS, 
			@Device, 
			@DeviceType,
			@UserAgent, 
			@LinkId,
			101, -- 12B
			@ClickTypeId
		);

	END TRY
	BEGIN CATCH
		
		-- Set error information for insert failures
		SET @ErrCode = 303;
		SET @ErrMsg = 'Insert data ClickStatistics Fail!';
		RETURN;
	END CATCH
		
END
GO