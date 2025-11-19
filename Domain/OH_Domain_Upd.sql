/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[OH_Domain_Upd]
    @DomainName VARCHAR(200),
    @Note NVARCHAR(200),
    @DomainType TINYINT,
    @SiteId SMALLINT = 101,
    @UserId INT,
    @IP VARCHAR(50) = '',
    @ErrCode INT = 0 OUTPUT,
    @ErrMsg NVARCHAR(MAX) = '' OUTPUT
AS
/*
    Created: 20251104@Sophia
    DB: DBOH-ONEHub
    Task: Update Domain Info - Mark domain as reserved

    Revisions:
        - 20251104@Sophia: Initialize SP [RedmineID: #236797]
        - 20251104@Sophia: Add @DomainType parameter to indicate source [RedmineID: #236797]

    DomainType mapping:
        0: Domain Landing Page (IsComponent = 0)
        1: Domain Others (from Component, IsComponent = 1)
        2: Short Link

    Sample EXEC:
        -- Example 1: Update Domain Landing Page (DomainType = 0)
        DECLARE @ErrCode INT, @ErrMsg NVARCHAR(MAX)
        EXEC dbo.OH_Domain_Upd
            @DomainName = 'example.com',
            @Note = 'Reserved for Campaign ABC',
            @DomainType = 0,
            @SiteId = 101,
            @UserId = 12345,
            @IP = '192.168.1.100',
            @ErrCode = @ErrCode OUTPUT,
            @ErrMsg = @ErrMsg OUTPUT
        SELECT @ErrCode AS ErrorCode, @ErrMsg AS ErrorMessage

        -- Example 2: Update Domain Others from Component (DomainType = 1)
        DECLARE @ErrCode INT, @ErrMsg NVARCHAR(MAX)
        EXEC dbo.OH_Domain_Upd
            @DomainName = 'component-domain.com',
            @Note = 'Reserved for Mobile Component',
            @DomainType = 1,
            @SiteId = 101,
            @UserId = 12345,
            @IP = '192.168.1.100',
            @ErrCode = @ErrCode OUTPUT,
            @ErrMsg = @ErrMsg OUTPUT
        SELECT @ErrCode AS ErrorCode, @ErrMsg AS ErrorMessage

       
*/
BEGIN
    SET NOCOUNT ON;

    DECLARE @Duration INT;
    DECLARE @StartTime DATETIME = GETDATE();
    DECLARE @OldData NVARCHAR(MAX);
    DECLARE @NewData NVARCHAR(MAX);

    -- Initialize error handling
    SELECT @ErrCode = 0, @ErrMsg = '';

    -- Validate required parameters
    IF @DomainName IS NULL OR @DomainName = ''
    BEGIN
        SELECT @ErrCode = 1001, @ErrMsg = N'DomainName is required';
        RETURN;
    END

    IF @Note IS NULL
    BEGIN
        SELECT @ErrCode = 1002, @ErrMsg = N'Note is required';
        RETURN;
    END

    -- Check if Domain exists
    IF NOT EXISTS (SELECT TOP 1 1 FROM dbo.Domain WITH (NOLOCK) WHERE DomainName = @DomainName)
    BEGIN
        SELECT @ErrCode = 1003, @ErrMsg = N'DomainName does not exist';
        RETURN;
    END

    -- Capture old data before update
    SELECT @OldData = ISNULL((
        SELECT 
            ISNULL(d.DomainName, '') AS 'dmn',
            ISNULL(d.Note, '') AS 'nt',
            ISNULL(d.SiteId, 0) AS 'sid',
            CONVERT(VARCHAR(23), d.CreatedDate, 121) AS 'cd'
        FROM dbo.Domain d WITH (NOLOCK)
        WHERE d.DomainName = @DomainName
        FOR JSON PATH, WITHOUT_ARRAY_WRAPPER, INCLUDE_NULL_VALUES
    ), '{}');

    -- Update Domain Note
    UPDATE dbo.Domain WITH (ROWLOCK)
    SET Note = @Note
    WHERE DomainName = @DomainName
      AND SiteId = @SiteId;

    -- Capture new data after update
    SELECT @NewData = ISNULL((
        SELECT 
            ISNULL(d.DomainName, '') AS 'dmn',
            ISNULL(d.Note, '') AS 'nt',
            ISNULL(d.SiteId, 0) AS 'sid',
            CONVERT(VARCHAR(23), d.CreatedDate, 121) AS 'cd'
        FROM dbo.Domain d WITH (NOLOCK)
        WHERE d.DomainName = @DomainName
        FOR JSON PATH, WITHOUT_ARRAY_WRAPPER, INCLUDE_NULL_VALUES
    ), '{}');

    -- =========================
    -- Write log
    -- =========================
    DECLARE @EndTime DATETIME = GETDATE();
    SELECT @Duration = DATEDIFF(SECOND, @StartTime, @EndTime);

    -- Write log
    DECLARE @SPName VARCHAR(200);
    SELECT @SPName = OBJECT_NAME(@@PROCID);
    
    EXEC dbo.OH_UserLog_RunSP_Detail_WriteLog
        @UserId     = @UserId,
        @SPName     = @SPName,
        @OldData    = @OldData,
        @NewData    = @NewData,
        @IP         = @IP,
        @Duration   = @Duration;

END;
GO
