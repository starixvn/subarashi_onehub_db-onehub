/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" viewers="" isFunction="0" isNested="0"></info>*/
ALTER PROCEDURE dbo.OH_ClickStatistics_RedirectPage_Sel
	@LinkCode	VARCHAR(20)

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


	SELECT  ShortLink,
			FullLink,
			LinkId,
            IDCode AS LinkCode
	FROM	LinkGenerator WITH(NOLOCK)
	WHERE   IDCode = @LinkCode AND StatusId = 1


END;
GO