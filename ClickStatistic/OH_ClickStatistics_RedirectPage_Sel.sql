/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" viewers="" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE dbo.OH_ClickStatistics_RedirectPage_Sel
	@ShortPath	VARCHAR(50)

AS
/*
    Created: 20251107@Danny
    Task: Generate redirect page URL without click tracking
    DB: DBOH-ONEHub

    Revisions:
        - 20251107@Danny: Generate redirect page URL without click tracking [RedmineID: #241764]
		
*/
BEGIN
	SET NOCOUNT ON;


	SELECT  ShortDomain,
			ShortPath
			FullLink,
			LinkId
	FROM	LinkGenerator WITH(NOLOCK)
	WHERE   ShortPath = @ShortPath


END;
GO