/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[OH_Module_Sel]
(
	@ModuleTypes VARCHAR(100) = 'All'
)
AS
/*
	Created: 20250825@Sophia
	DB: DBOH-ONEHub
	Task: Select Landing Page Modules by Type

	Revisions:  
		- 20250825@Sophia: Initialize SP [RedmineID: #236797]
*/
BEGIN
	SET NOCOUNT ON;
	
	-- If @ModuleTypes is 'All', return all modules
	IF @ModuleTypes = 'All'
	BEGIN
		SELECT 
			ModuleId,
			ModuleName,
			ModuleType,
			NavigateTo,
			IsMultipleUpload,
			IsRequired,
			IsUnique
		FROM Module WITH (NOLOCK)
		WHERE StatusId = 1
		ORDER BY ModuleId ASC;
	END
	ELSE
	BEGIN
		-- Split comma-separated ModuleTypes and filter
		SELECT 
			ModuleId,
			ModuleName,
			ModuleType,
			NavigateTo,
			IsMultipleUpload,
			IsRequired,
			IsUnique
		FROM Module WITH (NOLOCK)
		WHERE  StatusId = 1
			AND ModuleType IN (
				SELECT CAST(value AS SMALLINT)
				FROM STRING_SPLIT(@ModuleTypes, ',')
				WHERE TRIM(value) <> ''
			)
		ORDER BY ModuleId ASC;
	END
END
GO