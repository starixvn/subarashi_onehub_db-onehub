ALTER  PROCEDURE [dbo].[OH_Domain_Ins]
    @Data NVARCHAR(MAX),
    @DomainType TINYINT,
    @SiteId SMALLINT = 101,
    @ErrCode INT = 0 OUTPUT,
    @ErrMsg NVARCHAR(MAX) = '' OUTPUT
AS
/*
    Created: 20251104@Sophia
    DB: DBOH-ONEHub
    Task: Insert Domain and DomainDetail records

    Revisions:
        - 20251104@Sophia: Initialize SP [RedmineID: #236797]
        - 20251110@Sophia: Changed from XML to JSON format [RedmineID: #241764]

    Example JSON Input (using short codes):
    [
        {
            "DmN": "example.com",
            "Nt": "Test domain",
            "Dts": [
                {
                    "CC": "VN",
                    "Sc": 25
                },
                {
                    "CC": "TH",
                    "Sc": 28
                }
            ]
        },
        {
            "DmN": "example2.com",
            "Nt": "",
            "Dts": [
                {
                    "CC": "VN",
                    "Sc": 20
                }
            ]
        }
    ]

    Short codes mapping:
        DmN = DomainName
        Nt = Note
        Dts = Details
        CC = CountryCode
        Sc = Score

    Sample EXEC:
        DECLARE @ErrCode INT, @ErrMsg NVARCHAR(MAX)
        DECLARE @JsonData NVARCHAR(MAX) = N'[
            {
                "DmN": "testdomain.com",
                "Nt": "Test domain for campaign",
                "Dts": [
                    {"CC": "VN", "Sc": 15},
                    {"CC": "TH", "Sc": 20}
                ]
            }
        ]'
        
        EXEC dbo.OH_Domain_Ins
            @Data = @JsonData,
            @DomainType = 0,
            @SiteId = 101,
            @ErrCode = @ErrCode OUTPUT,
            @ErrMsg = @ErrMsg OUTPUT
        
        SELECT @ErrCode AS ErrorCode, @ErrMsg AS ErrorMessage

    Note: @DomainType and @SiteId parameters are applied to all domains in the batch
*/
BEGIN
    SET NOCOUNT ON;

    DECLARE @TimeZone TINYINT;

    -- Initialize error handling
    SELECT @ErrCode = 0, @ErrMsg = '';

    -- Get timezone setting
    SELECT @TimeZone = CONVERT(TINYINT, SValue)
    FROM dbo.SystemSettings WITH (NOLOCK)
    WHERE SName = 'TimeZone';

    -- Validate required parameters
    IF @Data IS NULL OR @Data = ''
    BEGIN
        SELECT @ErrCode = 1001, @ErrMsg = N'Data is required';
        RETURN;
    END

    -- Validate JSON format
    IF ISJSON(@Data) = 0
    BEGIN
        SELECT @ErrCode = 1002, @ErrMsg = N'Invalid JSON format';
        RETURN;
    END

    -- Create temp tables for processing
    CREATE TABLE #TempDomain (
        DomainName VARCHAR(200),
        DomainType TINYINT,
        Note NVARCHAR(200)
    );

    CREATE TABLE #TempDomainDetail (
        DomainName VARCHAR(200),
        DomainType TINYINT,
        CountryCode VARCHAR(20),
        Score SMALLINT
    );

    -- Parse JSON into temp tables (using short codes)
    BEGIN TRY
        -- Parse Domain data
        INSERT INTO #TempDomain (DomainName, DomainType, Note)
        SELECT 
            JSON_VALUE(value, '$.DmN') AS DomainName,
            @DomainType AS DomainType,
            JSON_VALUE(value, '$.Nt') AS Note
        FROM OPENJSON(@Data);

        -- Parse DomainDetail data
        INSERT INTO #TempDomainDetail (DomainName, DomainType, CountryCode, Score)
        SELECT 
            JSON_VALUE(domain.value, '$.DmN') AS DomainName,
            @DomainType AS DomainType,
            JSON_VALUE(detail.value, '$.CC') AS CountryCode,
            JSON_VALUE(detail.value, '$.Sc') AS Score
        FROM OPENJSON(@Data) AS domain
        CROSS APPLY OPENJSON(domain.value, '$.Dts') AS detail;
    END TRY
    BEGIN CATCH
        SELECT @ErrCode = 1003, @ErrMsg = N'Error parsing JSON data: ' + ERROR_MESSAGE();
        DROP TABLE #TempDomain;
        DROP TABLE #TempDomainDetail;
        RETURN;
    END CATCH

    -- Validate data
    IF NOT EXISTS (SELECT TOP 1 1 FROM #TempDomain)
    BEGIN
        SELECT @ErrCode = 1004, @ErrMsg = N'No domain data found in JSON';
        DROP TABLE #TempDomain;
        DROP TABLE #TempDomainDetail;
        RETURN;
    END

    -- UPSERT into DomainDetail table (do DomainDetail first to avoid FK issues)
    MERGE INTO dbo.DomainDetail AS target
    USING #TempDomainDetail AS source
    ON target.DomainName = source.DomainName 
       AND target.CountryCode = source.CountryCode
       AND target.DomainType = source.DomainType
       AND target.SiteId = @SiteId
    WHEN MATCHED THEN
        UPDATE SET 
            Score = source.Score
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (DomainName, CountryCode, Score, DomainType, SiteId)
        VALUES (source.DomainName, source.CountryCode, source.Score, source.DomainType, @SiteId)
    WHEN NOT MATCHED BY SOURCE 
       AND target.DomainType = @DomainType
       AND target.SiteId = @SiteId THEN
        DELETE;

    -- UPSERT into Domain table
    MERGE INTO dbo.Domain AS target
    USING #TempDomain AS source
    ON target.DomainName = source.DomainName 
       AND target.DomainType = source.DomainType 
       AND target.SiteId = @SiteId
    WHEN MATCHED THEN
        UPDATE SET 
            Note = source.Note
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (DomainName, DomainType, Note, SiteId, CreatedDate)
        VALUES (source.DomainName, source.DomainType, source.Note, @SiteId, DATEADD(HOUR, @TimeZone, GETUTCDATE()))
    WHEN NOT MATCHED BY SOURCE 
       AND target.DomainType = @DomainType
       AND target.SiteId = @SiteId THEN
        DELETE;

    -- Clean up
    DROP TABLE #TempDomain;
    DROP TABLE #TempDomainDetail;

END;