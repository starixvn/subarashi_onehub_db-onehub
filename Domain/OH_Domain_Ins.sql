/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[OH_Domain_Ins]
    @Data VARCHAR(MAX),
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

    Example XML Input:
    <Dms>
        <Dm>
            <DmName>example.com</DmName>
            <Note>Test domain</Note>
            <Dts>
                <Dt>
                    <Country>VN</Country>
                    <Score>25</Score>
                </Dt>
                <Dt>
                    <Country>TH</Country>
                    <Score>28</Score>
                </Dt>
            </Dts>
        </Dm>
        <Dm>
            <DmName>example2.com</DmName>
            <Note></Note>
            <Dts>
                <Dt>
                    <Country>VN</Country>
                    <Score>20</Score>
                </Dt>
            </Dts>
        </Dm>
    </Dms>

    Note: @DomainType and @SiteId parameters are applied to all domains in the batch
*/
BEGIN
    SET NOCOUNT ON;

    DECLARE @XmlData XML;
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

    -- Parse XML
    BEGIN TRY
        SET @XmlData = CAST(@Data AS XML);
    END TRY
    BEGIN CATCH
        SELECT @ErrCode = 1002, @ErrMsg = N'Invalid XML format: ' + ERROR_MESSAGE();
        RETURN;
    END CATCH

    -- Create temp tables for processing
    CREATE TABLE #TempDomain (
        DomainName VARCHAR(200),
        Note NVARCHAR(200)
    );

    CREATE TABLE #TempDomainDetail (
        DomainName VARCHAR(200),
        CountryCode VARCHAR(20),
        Score SMALLINT
    );

    -- Parse XML into temp tables
    BEGIN TRY
        -- Parse Domain data
        INSERT INTO #TempDomain (DomainName, Note)
        SELECT 
            T.c.value('(DmName)[1]', 'VARCHAR(200)') AS DomainName,
            T.c.value('(Note)[1]', 'NVARCHAR(200)') AS Note
        FROM @XmlData.nodes('/Dms/Dm') AS T(c);

        -- Parse DomainDetail data
        INSERT INTO #TempDomainDetail (DomainName, CountryCode, Score)
        SELECT 
            T.c.value('(../../DmName)[1]', 'VARCHAR(200)') AS DomainName,
            D.d.value('(Country)[1]', 'VARCHAR(20)') AS CountryCode,
            D.d.value('(Score)[1]', 'SMALLINT') AS Score
        FROM @XmlData.nodes('/Dms/Dm') AS T(c)
        CROSS APPLY T.c.nodes('Dts/Dt') AS D(d);
    END TRY
    BEGIN CATCH
        SELECT @ErrCode = 1003, @ErrMsg = N'Error parsing XML data: ' + ERROR_MESSAGE();
        DROP TABLE #TempDomain;
        DROP TABLE #TempDomainDetail;
        RETURN;
    END CATCH

    -- Validate data
    IF NOT EXISTS (SELECT TOP 1 1 FROM #TempDomain)
    BEGIN
        SELECT @ErrCode = 1004, @ErrMsg = N'No domain data found in XML';
        DROP TABLE #TempDomain;
        DROP TABLE #TempDomainDetail;
        RETURN;
    END

    -- UPSERT into DomainDetail table (do DomainDetail first to avoid FK issues)
    MERGE INTO dbo.DomainDetail AS target
    USING #TempDomainDetail AS source
    ON target.DomainName = source.DomainName 
       AND target.CountryCode = source.CountryCode
       AND target.DomainType = @DomainType
       AND target.SiteId = @SiteId
    WHEN MATCHED THEN
        UPDATE SET 
            Score = source.Score
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (DomainName, CountryCode, Score, DomainType, SiteId)
        VALUES (source.DomainName, source.CountryCode, source.Score, @DomainType, @SiteId)
    WHEN NOT MATCHED BY SOURCE AND target.DomainName IN (SELECT DomainName FROM #TempDomain) 
       AND target.DomainType = @DomainType
       AND target.SiteId = @SiteId THEN
        DELETE;

    -- UPSERT into Domain table
    MERGE INTO dbo.Domain AS target
    USING #TempDomain AS source
    ON target.DomainName = source.DomainName 
       AND target.DomainType = @DomainType 
       AND target.SiteId = @SiteId
    WHEN MATCHED THEN
        UPDATE SET 
            Note = source.Note
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (DomainName, DomainType, Note, SiteId, CreatedDate)
        VALUES (source.DomainName, @DomainType, source.Note, @SiteId, DATEADD(HOUR, @TimeZone, GETUTCDATE()))
    WHEN NOT MATCHED BY SOURCE AND target.DomainName IN (SELECT DomainName FROM #TempDomain) 
       AND target.DomainType = @DomainType 
       AND target.SiteId = @SiteId THEN
        DELETE;

    -- Clean up
    DROP TABLE #TempDomain;
    DROP TABLE #TempDomainDetail;

END;
GO
