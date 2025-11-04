/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE [dbo].[OH_LinkGenerator_Ins]
    @LinkName VARCHAR(200),
    @IDCode VARCHAR(20),
    @CampaignId INT,
    @CountryCode VARCHAR(50),
    @MarketId VARCHAR(50),
    @EventId INT,
    @GroupId INT,
    @ChannelId INT,
    @AgencyId INT,
    @TypeId INT,
    @PageId INT,
    @PageType TINYINT,
    @DomainName VARCHAR(200),
    @Note NVARCHAR(200),
    @ShortLink VARCHAR(500),
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

    -- Handle IDCode generation or validation
    IF @IDCode IS NULL OR @IDCode = ''
    BEGIN
        -- Generate new IDCode by calling OH_IDCode_Ins
        EXEC dbo.OH_IDCode_Ins @SiteId = @SiteId, @IDCode = @IDCode OUTPUT;
    END
    ELSE
    BEGIN
        -- Validate that IDCode exists in IDCode table
        IF NOT EXISTS (SELECT TOP 1 1 FROM dbo.IDCode WITH (NOLOCK) WHERE IDCode = @IDCode)
        BEGIN
            SELECT @ErrCode = 1004, @ErrMsg = N'IDCode does not exist in IDCode table';
            RETURN;
        END
    END

    -- Check for duplicate LinkName
    IF EXISTS (SELECT TOP 1 1 FROM dbo.LinkGenerator WITH (NOLOCK) WHERE LinkName = @LinkName)
    BEGIN
        SELECT @ErrCode = 1005, @ErrMsg = N'LinkName already exists';
        RETURN;
    END

    -- Validate DomainName exists in Domain table with required conditions
    IF @DomainName IS NOT NULL AND @DomainName <> ''
    BEGIN
        -- If PageType = 0 (Landing Page), check if DomainType = 1 also exists with same conditions
        IF @PageType = 0
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
                  AND d.DomainType = @PageType
                  AND d.SiteId = @SiteId
                  AND d.Note = ''
                  -- Check if DomainType = 1 also exists with same conditions
                  AND EXISTS (
                      SELECT 1 
                      FROM dbo.Domain d1 WITH (NOLOCK)
                      INNER JOIN dbo.DomainDetail dd1 WITH (NOLOCK)
                          ON d1.DomainName = dd1.DomainName
                          AND dd1.Score < 30
                          AND dd1.CountryCode = @CountryCode
                          AND dd1.DomainType = 1
                          AND dd1.SiteId = @SiteId
                      WHERE d1.DomainName = d.DomainName
                          AND d1.DomainType = 1
                          AND d1.SiteId = @SiteId
                          AND d1.Note = ''
                  )
            )
            BEGIN
                SELECT @ErrCode = 1006, @ErrMsg = N'DomainName does not exist in Domain table with required conditions (DomainType 0 and 1, Note empty, Score < 30, CountryCode)';
                RETURN;
            END
        END
        ELSE
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
                  AND d.DomainType = @PageType
                  AND d.SiteId = @SiteId
                  AND d.Note = ''
            )
            BEGIN
                SELECT @ErrCode = 1006, @ErrMsg = N'DomainName does not exist in Domain table with required conditions (DomainType, Note empty, Score < 30, CountryCode)';
                RETURN;
            END
        END
    END

    -- Validate ShortLink exists in Domain table with required conditions
    IF @ShortLink IS NOT NULL AND @ShortLink <> ''
    BEGIN
        -- If PageType = 0 (Landing Page), check if DomainType = 1 also exists with same conditions
        IF @PageType = 0
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
                WHERE d.DomainName = @ShortLink
                  AND d.DomainType = @PageType
                  AND d.SiteId = @SiteId
                  AND d.Note = ''
                  -- Check if DomainType = 1 also exists with same conditions
                  AND EXISTS (
                      SELECT 1 
                      FROM dbo.Domain d1 WITH (NOLOCK)
                      INNER JOIN dbo.DomainDetail dd1 WITH (NOLOCK)
                          ON d1.DomainName = dd1.DomainName
                          AND dd1.Score < 30
                          AND dd1.CountryCode = @CountryCode
                          AND dd1.DomainType = 1
                          AND dd1.SiteId = @SiteId
                      WHERE d1.DomainName = d.DomainName
                          AND d1.DomainType = 1
                          AND d1.SiteId = @SiteId
                          AND d1.Note = ''
                  )
            )
            BEGIN
                SELECT @ErrCode = 1007, @ErrMsg = N'ShortLink does not exist in Domain table with required conditions (DomainType 0 and 1, Note empty, Score < 30, CountryCode)';
                RETURN;
            END
        END
        ELSE
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
                WHERE d.DomainName = @ShortLink
                  AND d.DomainType = @PageType
                  AND d.SiteId = @SiteId
                  AND d.Note = ''
            )
            BEGIN
                SELECT @ErrCode = 1007, @ErrMsg = N'ShortLink does not exist in Domain table with required conditions (DomainType, Note empty, Score < 30, CountryCode)';
                RETURN;
            END
        END
    END

    -- Check for duplicate DomainName in LinkGenerator
    IF EXISTS (SELECT TOP 1 1 FROM dbo.LinkGenerator WITH (NOLOCK) WHERE DomainName = @DomainName)
    BEGIN
        SELECT @ErrCode = 1008, @ErrMsg = N'DomainName already exists in LinkGenerator';
        RETURN;
    END

    -- Check for duplicate ShortLink in LinkGenerator
    IF EXISTS (SELECT TOP 1 1 FROM dbo.LinkGenerator WITH (NOLOCK) WHERE ShortLink = @ShortLink)
    BEGIN
        SELECT @ErrCode = 1009, @ErrMsg = N'ShortLink already exists in LinkGenerator';
        RETURN;
    END

    INSERT INTO dbo.LinkGenerator (
        LinkName,
        IDCode,
        CampaignId,
        CountryCode,
        MarketId,
        EventId,
        GroupId,
        ChannelId,
        AgencyId,
        TypeId,
        PageId,
        PageType,
        Note,
        DomainName,
        ShortLink,
        FullLink,
        SiteId,
        StatusId,
        CreatedDate
    )
    VALUES (
        @LinkName,
        @IDCode,
        @CampaignId,
        @CountryCode,
        @MarketId,
        @EventId,
        @GroupId,
        @ChannelId,
        @AgencyId,
        @TypeId,
        @PageId,
        @PageType,
        @Note,
        @DomainName,
        @ShortLink,
        @FullLink,
        @SiteId,
        @StatusId,
        DATEADD(HOUR, @TimeZone, GETUTCDATE())
    );

    SET @LinkId = SCOPE_IDENTITY();

    -- =========================
    -- Update Domain Info to 'Reserved'
    -- =========================
    DECLARE @DomainUpdErrCode INT = 0;
    DECLARE @DomainUpdErrMsg NVARCHAR(MAX) = '';

    EXEC dbo.OH_Domain_Upd
        @DomainName = @DomainName,
        @Note = @Note,
        @DomainType = @TypeId,
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
    WHERE PageId = @PageId;

    -- Determine TypeName based on TypeId
    SELECT @TypeName = CASE @TypeId
        WHEN 0 THEN 'Landing Page'
        WHEN 1 THEN 'Domain Others'
        WHEN 2 THEN 'ShortLink'
        ELSE 'Unknown'
    END;

    -- Compose @NewData JSON
    SELECT @NewData = ISNULL((
        SELECT 
            ISNULL(@LinkId, 0) AS 'linkId',
            ISNULL(@LinkName, '') AS 'linkName',
            ISNULL(@IDCode, '') AS 'idCode',
            ISNULL(@CampaignName, '') AS 'campaign',
            ISNULL(@CountryName, '') AS 'country',
            ISNULL(@MarketName, '') AS 'market',
            ISNULL(@EventId, 0) AS 'eventId',
            ISNULL(@GroupId, 0) AS 'groupId',
            ISNULL(@ChannelId, 0) AS 'channelId',
            ISNULL(@AgencyId, 0) AS 'agencyId',
            ISNULL(@TypeId, 0) AS 'typeId',
            ISNULL(@TypeName, '') AS 'typeName',
            ISNULL(@PageId, 0) AS 'pageId',
            ISNULL(@PageName, '') AS 'pageName',
            ISNULL(@PageType, 0) AS 'pageType',
            ISNULL(@Note, '') AS 'note',
            ISNULL(@DomainName, '') AS 'domainName',
            ISNULL(@ShortLink, '') AS 'shortLink',
            ISNULL(@FullLink, '') AS 'fullLink',
            ISNULL(@SiteId, 0) AS 'siteId',
            ISNULL(@StatusId, 0) AS 'statusId'
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
