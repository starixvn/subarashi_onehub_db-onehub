/*<info serverAlias="DBOH-ONEHub" selecters="wsv_oh" isFunction="1" isNested="0"></info>*/
CREATE FUNCTION [dbo].[OH_f_PageBuilder_Status]()
RETURNS TABLE
/*
	Created: 20250826@Sophia
	DB: DBOH-ONEHub
	Task: Table-valued function for Landing Page Status
	Revisions:
		- 20250826@Sophia: Initial version [RedmineID: #236797]
*/

AS
RETURN
(
	SELECT StatusId, Status FROM (
		VALUES
			(0, 'Draft'),
			(1, 'Active'),
			(2, 'Inactive')
	) AS StatusTable(StatusId, Status)
);
GO
