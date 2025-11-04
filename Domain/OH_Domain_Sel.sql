/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE [dbo].[OH_Domain_Sel]
    @CountryCode VARCHAR(20),
    @SiteId SMALLINT = 101,
    @DomainType TINYINT = 0
AS
/*
    Created: 20251103@Sophia
    DB: DBOH-ONEHub
    Task: Select Domain - Link generator (domains with DomainDetail.Score < 30)

    Revisions:
        - 20251103@Sophia: Initialize SP [RedmineID: #236797]

    DomainType mapping:
        0: Domain Landing Page (IsComponent = 0)
        1: Domain Others (from Component, IsComponent = 1)
        2: Short Link
*/
BEGIN
    SET NOCOUNT ON;

        SELECT 
                d.DomainName,
                d.DomainType,
                d.CreatedDate,
                d.SiteId,
                dd.Score
        FROM dbo.Domain AS d WITH (NOLOCK)
        INNER JOIN dbo.DomainDetail dd WITH (NOLOCK)
            ON d.DomainName = dd.DomainName
            AND dd.Score < 30
            AND dd.CountryCode = @CountryCode
        WHERE  d.SiteId = @SiteId 
            AND d.DomainType = @DomainType
            AND d.Note = ''
        ORDER BY d.Id ASC;
END;
GO
