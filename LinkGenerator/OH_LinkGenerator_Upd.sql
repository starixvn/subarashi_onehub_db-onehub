/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE [dbo].[OH_LinkGenerator_Upd]
    @LinkId INT,
    @StatusId TINYINT,
    @UserId INT,
    @IP VARCHAR(50) = '',
    @ErrCode INT = 0 OUTPUT,
    @ErrMsg NVARCHAR(MAX) = '' OUTPUT
AS
/*
    Created: 20251107@Sophia
    DB: DBOH-ONEHub
    Task: Update LinkGenerator Status - Link generator status update

    Sample EXEC:
        -- Example 1: Update Status to Active (1)
        DECLARE @ErrCode INT, @ErrMsg NVARCHAR(MAX)
        EXEC dbo.OH_LinkGenerator_Upd
            @LinkId = 1,
            @StatusId = 0,  -- 1: Active, 0: Inactive
            @UserId = 12345,
            @IP = '192.168.1.100',
            @ErrCode = @ErrCode OUTPUT,
            @ErrMsg = @ErrMsg OUTPUT
        SELECT @ErrCode AS ErrorCode, @ErrMsg AS ErrorMessage
 
    Revisions:
        - 20251107@Sophia: Initialize SP [RedmineID: #241764] 
*/
BEGIN
    SET NOCOUNT ON;
 
    DECLARE @Duration INT;
    DECLARE @StartTime DATETIME = GETDATE();
    DECLARE @OldData NVARCHAR(MAX);
    DECLARE @NewData NVARCHAR(MAX);

    DECLARE @TimeZone TINYINT;
    SELECT @TimeZone = CONVERT(TINYINT, SValue)
    FROM dbo.SystemSettings WITH (NOLOCK)
    WHERE SName = 'TimeZone';

    -- Initialize error handling
    SET @ErrCode = 0;
    SET @ErrMsg = '';

    -- Validate required parameters
    IF @LinkId IS NULL OR @LinkId = 0
    BEGIN
        SELECT @ErrCode = 2001, @ErrMsg = N'LinkId is required';
        RETURN;
    END

    IF @StatusId IS NULL
    BEGIN
        SELECT @ErrCode = 2002, @ErrMsg = N'StatusId is required';
        RETURN;
    END

    -- Check if LinkGenerator exists
    IF NOT EXISTS (SELECT TOP 1 1 FROM dbo.LinkGenerator WITH (NOLOCK) WHERE LinkId = @LinkId)
    BEGIN
        SELECT @ErrCode = 2003, @ErrMsg = N'LinkGenerator not found';
        RETURN;
    END

    -- Capture old data before update
    SELECT @OldData = ISNULL((
        SELECT 
            lg.LinkId AS 'lid',
            lg.LinkName AS 'ln',
            lg.IDCode AS 'idc',
            c.CampaignName AS 'cn',
            tc.CountryName AS 'cty',
            m.MarketName AS 'mkt',
            lg.EventIds AS 'eids',
            lg.GroupId AS 'gid',
            lg.ChannelId AS 'chid',
            lg.AgencyId AS 'aid',
            lg.TypeId AS 'tid',
            lg.PageCode AS 'pc',
            lg.PageType AS 'pt',
            ISNULL(lg.Note, '') AS 'nt',
            lg.DomainName AS 'dn',
            ISNULL(lg.ShortDomain, '') AS 'sd',
            ISNULL(lg.FullLink, '') AS 'fl',
            lg.SiteId AS 'sid',
            lg.StatusId AS 'st'
        FROM dbo.LinkGenerator lg WITH (NOLOCK)
        LEFT JOIN dbo.TargetCountry tc WITH (NOLOCK) ON lg.CountryCode = tc.CountryCode
        LEFT JOIN dbo.Market m WITH (NOLOCK) ON lg.MarketId = m.MarketId
        LEFT JOIN dbo.Campaign c WITH (NOLOCK) ON lg.CampaignId = c.CampaignId
        WHERE lg.LinkId = @LinkId
        FOR JSON PATH, WITHOUT_ARRAY_WRAPPER, INCLUDE_NULL_VALUES
    ), '{}');

    -- Update LinkGenerator
    UPDATE dbo.LinkGenerator WITH (ROWLOCK)
    SET 
        StatusId = @StatusId,
        UpdatedDate = DATEADD(HOUR, @TimeZone, GETUTCDATE()),
        UpdatedBy = @UserId
    WHERE LinkId = @LinkId;

    -- Check if update was successful
    IF @@ROWCOUNT = 0
    BEGIN
        SELECT @ErrCode = 2004, @ErrMsg = N'Failed to update LinkGenerator';
        RETURN;
    END

    -- Capture new data after update
    SELECT @NewData = ISNULL((
        SELECT 
            lg.LinkId AS 'lid',
            lg.LinkName AS 'ln',
            lg.IDCode AS 'idc',
            c.CampaignName AS 'cn',
            tc.CountryName AS 'cty',
            m.MarketName AS 'mkt',
            lg.EventIds AS 'eids',
            lg.GroupId AS 'gid',
            lg.ChannelId AS 'chid',
            lg.AgencyId AS 'aid',
            lg.TypeId AS 'tid',
            lg.PageCode AS 'pc',
            lg.PageType AS 'pt',
            ISNULL(lg.Note, '') AS 'nt',
            lg.DomainName AS 'dn',
            ISNULL(lg.ShortDomain, '') AS 'sd',
            ISNULL(lg.FullLink, '') AS 'fl',
            lg.SiteId AS 'sid',
            lg.StatusId AS 'st'
        FROM dbo.LinkGenerator lg WITH (NOLOCK)
        LEFT JOIN dbo.TargetCountry tc WITH (NOLOCK) ON lg.CountryCode = tc.CountryCode
        LEFT JOIN dbo.Market m WITH (NOLOCK) ON lg.MarketId = m.MarketId
        LEFT JOIN dbo.Campaign c WITH (NOLOCK) ON lg.CampaignId = c.CampaignId
        WHERE lg.LinkId = @LinkId
        FOR JSON PATH, WITHOUT_ARRAY_WRAPPER, INCLUDE_NULL_VALUES
    ), '{}');

    -- =========================
    -- Write log
    -- =========================
    DECLARE @EndTime DATETIME = GETDATE();
    SELECT @Duration = DATEDIFF(SECOND, @StartTime, @EndTime);

    DECLARE @SPName VARCHAR(200);
    SELECT @SPName = OBJECT_NAME(@@PROCID);
    
    EXEC dbo.OH_UserLog_RunSP_Detail_WriteLog
        @UserId     = @UserId,
        @SPName     = @SPName,
        @OldData    = @OldData,
        @NewData    = @NewData,
        @IP         = @IP,
        @Duration   = @Duration;

    -- Return success
    SET @ErrCode = 0;
    SET @ErrMsg = N'Updated Status successfully';
 
END;
GO
