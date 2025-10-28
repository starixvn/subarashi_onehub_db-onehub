/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[OH_Component_Device_Sel]
AS
/*
    Created: 20251031@Danny
    DB: DBOH-ONEHub
    Task: List of Component device
    Revisions:
        - 20251031@Danny: Initial version [RedmineID: #241764]
*/
BEGIN
    SET NOCOUNT ON;

    SELECT 1 AS DeviceId, 'Mobile Only' AS DeviceName
    UNION ALL
	SELECT 2 AS DeviceId, 'Mobile & Desktop' AS DeviceName
END
GO
