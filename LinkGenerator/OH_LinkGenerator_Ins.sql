/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE [dbo].[OH_LinkGenerator_Ins]
    @LinkName VARCHAR(200),
    @IDCode VARCHAR(20),
    @CampaignId INT,
    @CountryCode VARCHAR(50),
    @MarketId VARCHAR(50),
    @EventIds VARCHAR(1000),
    @GroupId INT,
    @ChannelId INT,
    @AgencyId INT,
    @TypeId INT,
    @PageCode VARCHAR(100),
    @PageType TINYINT,
    @DomainName VARCHAR(200),
    @DomainNote NVARCHAR(200),
    @Note NVARCHAR(500),
    @ShortDomain VARCHAR(500),
    @ShortPath VARCHAR(50),
    @FullLink VARCHAR(1000),
    @SiteId SMALLINT = 101,
    @StatusId TINYINT = 1,
    @UserId INT,
    @IP VARCHAR(50) = '',
    @LinkId INT OUTPUT,
    @ErrCode INT = 0 OUTPUT,
    @ErrMsg NVARCHAR(MAX) = '' OUTPUT
AS
/*
    Created: 20251103@Sophia
    DB: DBOH-ONEHub
    Task: Insert LinkGenerator - Link generator

    Note: 
        @PageType :
            1: Mobile & Desktop from Component
            2: Mobile from Component
            3: Mobile from LandingPage

        (DomainType:
            0: Domain of Landing Page (when input param @PageType = 3 - from landing page only)
            1: Domain of Others (when input param @PageType = 1 or 2 - from Component)
            2: Short Link)

    Sample EXEC:
        DECLARE @LinkId INT, @ErrCode INT, @ErrMsg NVARCHAR(MAX), @IDCode VARCHAR(50) 
		Select @IDCode  = ''

        EXEC dbo.OH_LinkGenerator_Ins
            @LinkName = 'Promo Campaign Link',
            @IDCode =  @IDCode  OUTPUT ,  -- Will auto-generate if empty
            @CampaignId = 100,
            @CountryCode = 'VN',
            @MarketId = 'en-US',
            @EventIds = '5001,5002',
            @GroupId = 200,
            @ChannelId = 10,
            @AgencyId = 50,
            @TypeId = 0,  -- Landing Page
            @PageCode = 'vn-sport-17'  ,
            @PageType = 3,  -- Mobile from LandingPage
            @DomainName = '12gogofun.com',
            @DomainNote = 'Reserved for Q4 Campaign',
            @Note = 'Link Generator Note',
            @ShortDomain = '002AC.nufrel.com',
            @ShortPath = 'ABC',
            @FullLink = 'https://12gogofun.com/campaign?@CampaignId=100',
            @SiteId = 101,
            @StatusId = 1,
            @UserId = 12345,
            @IP = '192.168.1.100',
            @LinkId = @LinkId OUTPUT,
            @ErrCode = @ErrCode OUTPUT,
            @ErrMsg = @ErrMsg OUTPUT
			
        SELECT @LinkId AS LinkId, @ErrCode AS ErrorCode, @ErrMsg AS ErrorMessage, @IDCode as ID

    Revisions:
        - 20251103@Sophia: Initialize SP [RedmineID: #236797] 
*/
BEGIN
    SET NOCOUNT ON;
 
    DECLARE @Duration INT;
    DECLARE @StartTime DATETIME = GETDATE();
    DECLARE @NewData NVARCHAR(MAX);

    DECLARE @TimeZone TINYINT;
    SELECT @TimeZone = CONVERT(TINYINT, SValue)
    FROM dbo.SystemSettings WITH (NOLOCK)
    WHERE SName = 'TimeZone';

    -- Initialize error handling
    SET @ErrCode = 0;
    SET @ErrMsg = '';

    -- Validate required parameters
    IF @LinkName IS NULL OR @LinkName = ''
    BEGIN
        SELECT @ErrCode = 1001, @ErrMsg = N'LinkName is required';
        RETURN;
    END

    IF @CountryCode IS NULL OR @CountryCode = ''
    BEGIN
        SELECT @ErrCode = 1002, @ErrMsg = N'CountryCode is required';
        RETURN;
    END

    IF @DomainName IS NULL OR @DomainName = ''
    BEGIN
        SELECT @ErrCode = 1003, @ErrMsg = N'DomainName is required';
        RETURN;
    END

     -- Validate that IDCode exists in IDCode table
    IF NOT EXISTS (SELECT TOP 1 1 FROM dbo.IDCode WITH (NOLOCK) WHERE IDCode = @IDCode)
    BEGIN
        SELECT @ErrCode = 1004, @ErrMsg = N'The code you entered wasn''t found. Please verify or leave it empty to auto-generate a new one.';
        RETURN;
    END    

    -- Check for duplicate DomainName
    IF EXISTS (SELECT TOP 1 1 FROM dbo.LinkGenerator WITH (NOLOCK) WHERE DomainName = @DomainName AND StatusID = 1)
    BEGIN
        SELECT @ErrCode = 1005, @ErrMsg = N'This Domain Name already has an active link. You can''t generate a new one until the existing link is inactive.';
        RETURN;
    END
    
    -- Check for duplicate ShortPath
    IF EXISTS (SELECT TOP 1 1 FROM dbo.LinkGenerator WITH (NOLOCK) WHERE ShortPath = @ShortPath)
    BEGIN
        SELECT @ErrCode = 1006, @ErrMsg = N'Short path must be unique across all short link domains';
        RETURN;
    END

    -- Check DomainName in Domain table with required conditions
    -- If PageType = 3 (Landing Page), check more DomainType in (0,1) also exists with same conditions
    IF @PageType = 3
    BEGIN
        IF NOT EXISTS (
            SELECT TOP 1 1 
            FROM dbo.Domain d WITH (NOLOCK)
            INNER JOIN dbo.DomainDetail dd WITH (NOLOCK)
                ON d.DomainName = dd.DomainName
                AND dd.Score < 30
                AND dd.CountryCode = @CountryCode
                AND dd.DomainType = d.DomainType
                AND dd.SiteId = d.SiteId
            WHERE d.DomainName = @DomainName
                AND d.DomainType = 0  ---- Domain from Landing Page sheet
                AND d.SiteId = @SiteId
                AND d.Note = ''
                -- Check DomainType = 1 also exists with same conditions
                AND EXISTS (
                    SELECT 1 
                    FROM dbo.Domain d1 WITH (NOLOCK)
                    INNER JOIN dbo.DomainDetail dd1 WITH (NOLOCK)
                        ON d1.DomainName = dd1.DomainName
                        AND dd1.Score < 30
                        AND dd1.CountryCode = @CountryCode
                        AND dd1.DomainType = d1.DomainType ---- Domain from Others sheet
                        AND dd1.SiteId = @SiteId
                    WHERE d1.DomainName = d.DomainName
                        AND d1.DomainType = 1
                        AND d1.SiteId = @SiteId
                        AND d1.Note = ''
                )
        )
        BEGIN
            SELECT @ErrCode = 1007, @ErrMsg = N'Domain Name not available. The domain score has changed or it has been marked as used. Please choose another one.';
            RETURN;
        END
    END
    -- If PageType in (1, 2), check DomainType = 1 (Domain from Others sheet) exists with conditions
    ELSE IF @PageType IN (1, 2)
    BEGIN
        IF NOT EXISTS (
            SELECT TOP 1 1 
            FROM dbo.Domain d WITH (NOLOCK)
            INNER JOIN dbo.DomainDetail dd WITH (NOLOCK)
                ON d.DomainName = dd.DomainName
                AND dd.Score < 30
                AND dd.CountryCode = @CountryCode
                AND dd.DomainType = d.DomainType
                AND dd.SiteId = d.SiteId
            WHERE d.DomainName = @DomainName
                AND d.DomainType = 1 ---- Domain from Others sheet
                AND d.SiteId = @SiteId
                AND d.Note = ''
        )
        BEGIN
            SELECT @ErrCode = 1008, @ErrMsg = N'Domain Name not available. The score of domain has changed or it has been marked as used. Please choose another one.';
            RETURN;
        END
    END
    

    -- Validate ShortDomain exists in Domain table with required conditions
    BEGIN
        IF NOT EXISTS (
            SELECT TOP 1 1 
            FROM dbo.Domain d WITH (NOLOCK)
            INNER JOIN dbo.DomainDetail dd WITH (NOLOCK)
                ON d.DomainName = dd.DomainName
                AND dd.Score < 30
                AND dd.CountryCode = @CountryCode
                AND dd.DomainType = d.DomainType
                AND dd.SiteId = d.SiteId
            WHERE d.DomainName = @ShortDomain
                AND d.DomainType = 2  ---- Domain from ShortLink
                AND d.SiteId = @SiteId
                AND d.Note = ''
        )
        BEGIN
            SELECT @ErrCode = 1009, @ErrMsg = N'Short Domain Name not available. The domain score has changed or it has been marked as used. Please choose another one';
            RETURN;
        END
        
    END 
  
    -- =========================

    INSERT INTO dbo.LinkGenerator (
        LinkName,
        IDCode,
        CampaignId,
        CountryCode,
        MarketId,
        EventIds,
        GroupId,
        ChannelId,
        AgencyId,
        TypeId,
        PageCode,
        PageType,
        Note,
        DomainName,
        ShortDomain,
        ShortPath,
        FullLink,
        SiteId,
        StatusId,
        Creator,
        CreatedDate
    )
    VALUES (
        @LinkName,
        @IDCode,
        @CampaignId,
        @CountryCode,
        @MarketId,
        @EventIds,
        @GroupId,
        @ChannelId,
        @AgencyId,
        @TypeId,
        @PageCode,
        @PageType,
        @Note,
        @DomainName,
        @ShortDomain,
        @ShortPath,
        @FullLink,
        @SiteId,
        @StatusId,
        @UserId,
        DATEADD(HOUR, @TimeZone, GETUTCDATE())
    );

    SET @LinkId = SCOPE_IDENTITY();

    -- =========================
    -- Update Domain Info to 'Reserved'
    -- =========================
    DECLARE @DomainUpdErrCode INT = 0;
    DECLARE @DomainUpdErrMsg NVARCHAR(MAX) = '';
    DECLARE @DomainType TINYINT;

    IF @PageType = 3 
       SET @DomainType = 0
    ELSE 
       SET @DomainType = 1

    EXEC dbo.OH_Domain_Upd
        @DomainName = @DomainName,
        @Note = @DomainNote,
        @DomainType = @DomainType,
        @SiteId = @SiteId,
        @UserId = @UserId,
        @IP = @IP,
        @ErrCode = @DomainUpdErrCode OUTPUT,
        @ErrMsg = @DomainUpdErrMsg OUTPUT;

    -- If OH_Domain_Upd fails, propagate the error
    IF @DomainUpdErrCode <> 0
    BEGIN
        SET @ErrCode = @DomainUpdErrCode;
        SET @ErrMsg = @DomainUpdErrMsg;
        RETURN;
    END

    -- =========================
    -- Write log
    -- =========================
    DECLARE @EndTime DATETIME = GETDATE();
    SELECT @Duration = DATEDIFF(SECOND, @StartTime, @EndTime);

    -- Get all reference names
    DECLARE @CountryName NVARCHAR(100),
            @MarketName NVARCHAR(100),
            @CampaignName NVARCHAR(500),
            @PageName NVARCHAR(200),
            @TypeName NVARCHAR(50);

    -- Get Country name
    SELECT TOP 1 @CountryName = CountryName
    FROM dbo.TargetCountry WITH (NOLOCK)
    WHERE CountryCode = @CountryCode;

    -- Get Market name
    SELECT @MarketName = MarketName
    FROM dbo.Market WITH (NOLOCK)
    WHERE MarketId = @MarketId;

    -- Get Campaign name
    SELECT @CampaignName = CampaignName
    FROM dbo.Campaign WITH (NOLOCK)
    WHERE CampaignId = @CampaignId;

    -- Get Page name
    SELECT @PageName = PageName
    FROM dbo.PageBuilder WITH (NOLOCK)
    WHERE PageCode = @PageCode;


    -- Compose @NewData JSON
    SELECT @NewData = ISNULL((
        SELECT 
            ISNULL(@LinkId, 0) AS 'lid',
            ISNULL(@LinkName, '') AS 'ln',
            ISNULL(@IDCode, '') AS 'idc',
            ISNULL(@CampaignName, '') AS 'cn',
            ISNULL(@CountryName, '') AS 'cty',
            ISNULL(@MarketName, '') AS 'mkt',
            ISNULL(@EventIds, '') AS 'eids',
            ISNULL(@GroupId, 0) AS 'gid',
            ISNULL(@ChannelId, 0) AS 'chid',
            ISNULL(@AgencyId, 0) AS 'aid',
            ISNULL(@TypeId, 0) AS 'tid',
            ISNULL(@PageCode, 0) AS 'pc',
            ISNULL(@PageName, '') AS 'pn',
            ISNULL(@PageType, 0) AS 'pt',
            ISNULL(@Note, '') AS 'nt',
            ISNULL(@DomainName, '') AS 'dn',
            ISNULL(@ShortDomain, '') AS 'sd',
            ISNULL(@ShortPath, '') AS 'sp',
            ISNULL(@FullLink, '') AS 'fl',
            ISNULL(@SiteId, 0) AS 'sid',
            ISNULL(@StatusId, 0) AS 'st'
        FOR JSON PATH, WITHOUT_ARRAY_WRAPPER, INCLUDE_NULL_VALUES
    ), '{}');

    -- Write log
    DECLARE @SPName VARCHAR(200);
    SELECT @SPName = OBJECT_NAME(@@PROCID);
    
    EXEC dbo.OH_UserLog_RunSP_Detail_WriteLog
        @UserId     = @UserId,
        @SPName     = @SPName,
        @NewData    = @NewData,
        @IP         = @IP,
        @Duration   = @Duration;
 
END;
GO
