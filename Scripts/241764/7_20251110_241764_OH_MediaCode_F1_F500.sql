/*<info serverAlias="DBOH-ONEHub"></info>*/
/*
    Created: 20250919@Sophia
    DB: DBAFF12B-Affiliate_12B
    Task: Add more media codes from F101 to F500 [RedmineId : #236797]
        - Insert additional media codes (F101 to F500) into LandingPage_MediaCode table
        - Keep existing codes (F1 to F100) untouched
*/

 
USE ONEHub;
GO

;WITH Numbers AS (
    SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL) ASC) AS N
    FROM master.dbo.spt_values 
    WHERE type = 'P' AND number <= 500
)
INSERT INTO dbo.MediaCode (MediaCode, MediaId)
SELECT 
    'F' + CAST(N AS VARCHAR(3)) AS MediaCode,
    NULL AS MediaId  -- MediaId will need to be updated when media is assigned
FROM Numbers
WHERE N <= 500;
GO
