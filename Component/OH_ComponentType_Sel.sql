/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[OH_ComponentType_Sel]
AS
/*
	Created: 20250929@Sophia
	DB: DBAFF12B-Affiliate_12B
	Task: Select Landing Page Component Types
	Revisions:
		- 20250929@Sophia: Initial version [RedmineID: #239988]
*/
BEGIN
	SET NOCOUNT ON;

	SELECT 
		ct.ComponentTypeId,
		ct.ComponentTypeName
	FROM dbo.ComponentType ct WITH (NOLOCK)
	ORDER BY ct.ComponentTypeId ASC;
END;