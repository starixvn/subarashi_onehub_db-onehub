/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE [dbo].[OH_Domain_Sel]
    @CountryCode VARCHAR(20),   
    @DomainType TINYINT = 0,
    @SiteId SMALLINT = 101
AS
/*
    Created: 20251103@Sophia
    DB: DBOH-ONEHub
    Task: Select Domain - Link generator (domains with DomainDetail.Score < 30)

    Revisions:
        - 20251103@Sophia: Initialize SP [RedmineID: #236797]

    Note:
    @DomainType:
        0: Domain of Landing Page (when input param @PageType = 3 - from landing page only)
        1: Domain Others (when input param @PageType = 1 or 2 - from Component)
        2: Short Link
          
*/
BEGIN
    SET NOCOUNT ON;

    -- If DomainType = 0, also check if DomainType = 1 exists with same conditions (domain acceptable for both types)
    IF @DomainType = 0
    BEGIN
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
            AND dd.DomainType = d.DomainType
            AND dd.SiteId = d.SiteId
        WHERE d.SiteId = @SiteId 
            AND d.DomainType = @DomainType
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
        ORDER BY d.Id ASC;
    END
    ELSE
    BEGIN
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
            AND dd.DomainType = d.DomainType
            AND dd.SiteId = d.SiteId
        WHERE d.SiteId = @SiteId 
            AND d.DomainType = @DomainType
            AND d.Note = ''
        ORDER BY d.Id ASC;
    END
END;
GO
