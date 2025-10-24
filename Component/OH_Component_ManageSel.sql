/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[OH_Component_ManageSel]
    @ComponentTypeId INT,
    @ComponentName VARCHAR(200) = '',
    @StatusIds VARCHAR(50) = ''
AS
/*
    Created: 20250929@Sophia
    DB: DBAFF12B-Affiliate_12B
    Task: Select Landing Page Components for management grid with filtering
    Revisions:
        - 20250929@Sophia: Initial version [RedmineID: #239988]
*/
BEGIN
    SET NOCOUNT ON;

    SELECT 
        c.ComponentId,
        c.ComponentCode,
        c.ComponentName,
        c.ComponentTypeId,
        c.CreatedDate,
        u.UserName AS CreatedBy,
        c.UpdatedDate AS LastModifiedDate,
        au.UserName AS LastModifiedBy,
        c.StatusId,
        s.Status
    FROM dbo.Component c WITH (NOLOCK)
    LEFT JOIN dbo."User" u WITH (NOLOCK) ON u.CustId = c.Creator
    LEFT JOIN dbo."User" au WITH (NOLOCK) ON au.CustId = c.UpdatedBy
    LEFT JOIN dbo.OH_f_Component_Status() s ON s.StatusId = c.StatusId
    WHERE (c.ComponentTypeId = @ComponentTypeId)
        AND (@ComponentName = '' 
            OR c.ComponentName LIKE '%' + @ComponentName + '%'
            OR c.ComponentCode LIKE '%' + @ComponentName + '%')
        AND (@StatusIds = '' OR ',' + @StatusIds + ',' LIKE '%,' + CONVERT(VARCHAR(10), c.StatusId) + ',%')
    ORDER BY c.ComponentId DESC;
END;