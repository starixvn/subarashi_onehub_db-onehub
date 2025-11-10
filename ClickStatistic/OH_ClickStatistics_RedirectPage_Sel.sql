/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" viewers="" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE dbo.OH_ClickStatistics_RedirectPage_Sel
	@ShortLink	VARCHAR(500)

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

	DECLARE @LinkId			INT, @FullLink VARCHAR(1000)

	SELECT  @FullLink = FullLink, @LinkId = LinkId
	FROM	LinkGenerator WITH(NOLOCK)
	WHERE   ShortLink = @ShortLink AND StatusId = 1

	SELECT @FullLink AS FullLink, @LinkId AS LinkId

END;
GO