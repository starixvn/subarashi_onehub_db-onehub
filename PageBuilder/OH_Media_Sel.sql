/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[OH_Media_Sel]
	@ModuleId INT = 0,
	@TargetCountryCode VARCHAR(50) = '',
	@MarketId VARCHAR(50) = ''
AS
/*
	Created: 20250911@Sophia
	DB: DBOH-ONEHub
	Task: Select Media for Landing Page Builder- dropdown list in Media component
	Revisions:
		- 20250911@Sophia: Initial version [RedmineID: #236797]
*/
BEGIN
	SET NOCOUNT ON;

	SELECT 
		mg.MediaId,
        mg.MediaName,
		mg.FileName,
        mg.Dimension,
        mg.ModuleId
	FROM dbo.MediaGallery mg WITH (NOLOCK)
	WHERE (@ModuleId = 0 OR mg.ModuleId = @ModuleId)
		AND (@TargetCountryCode = '' OR mg.TargetCountryCode = @TargetCountryCode)
		AND (@MarketId = '' OR mg.MarketId = @MarketId)
		AND mg.StatusId = 1 -- Active only
	ORDER BY mg.MediaId DESC;
END;
GO
