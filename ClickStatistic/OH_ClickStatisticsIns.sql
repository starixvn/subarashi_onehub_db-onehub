/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" viewers="" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[OH_ClickStatisticsIns]
	@ClickId			BIGINT
	,@IDCode			VARCHAR(20)
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
	,@RedirectURL		NVARCHAR(256) = NULL
	,@DeviceType		TINYINT = 0
	,@ClickTypeId		TINYINT = 0
	,@LinkId			INT = 0
	,@Fulllink			VARCHAR(1000) = NULL
	,@ShortLink			VARCHAR(500) = NULL
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
			[IdCode],
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
			[FullLink],
			[ShortLink],
			[SiteId],
			[ClickTypeId]
		)
		VALUES
		(
			@ClickId, 
			@IDCode, 
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
			@Fulllink, 
			@ShortLink, 
			9999, --hardcode
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