/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE [dbo].[OH_IDCode_Ins]
    @SiteId SMALLINT = 101,
    @IDCode VARCHAR(20) OUTPUT
AS
/*
    Created: 20251103@Sophia
    DB: DBOH-ONEHub
    Task: Insert IDCode - Link generator
    Note: IDCode is auto-generated as 'OH' + Id

    Revisions:
        - 20251103@Sophia: Initialize SP [RedmineID: #236797]
*/
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewId INT;
    DECLARE @TimeZone TINYINT;

    -- Get timezone setting
    SELECT @TimeZone = CONVERT(TINYINT, SValue)
    FROM dbo.SystemSettings WITH (NOLOCK)
    WHERE SName = 'TimeZone';

    -- Insert with placeholder IDCode
    INSERT INTO dbo.IDCode (IDCode, StatusId, CreatedDate, SiteId)
    VALUES ('', 1, DATEADD(HOUR, @TimeZone, GETUTCDATE()), @SiteId);

    -- Get the new identity
    SELECT @NewId = SCOPE_IDENTITY();

    -- Update IDCode to 'OH' + Id and set output parameter
    SELECT @IDCode = 'OH' + CAST(@NewId AS VARCHAR(20));
    
    UPDATE dbo.IDCode WITH (ROWLOCK)
    SET IDCode = @IDCode
    WHERE Id = @NewId

    SELECT @IDCode AS IDCode;
END;
GO
