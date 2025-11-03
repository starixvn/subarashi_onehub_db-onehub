/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[OH_Component_Status_Upd]
    @UserId          INT,
    @ComponentIds    VARCHAR(MAX),
    @StatusId        TINYINT = NULL,
    @IP             VARCHAR(50) = '',
    @ErrCode        INT = 0 OUTPUT,
    @ErrMsg         NVARCHAR(4000) = '' OUTPUT
AS
/*
    Created: 20251031@Danny
    DB: DBOH-ONEHub
    Task: Update Landing Page Component status
    
    Revisions:
        - 20250929@Sophia: Initial version [RedmineID: #239988]

    Param's Explanation:
        - @ComponentName:
            + NULL   : no change will be made to the existing value
            + ''     : sets the value to an empty string
            + 'abc'  : updates the field with the provided input
        - @StatusId:
            + NULL   : no change will be made to the existing value
            + 0      : Inactive
            + 1      : Active
*/
BEGIN
    SET NOCOUNT ON;

    DECLARE @CurrentDate  DATETIME
          , @Language     NVARCHAR(5) = 'en-US'
          , @StartTime    DATETIME = GETDATE()
          , @EndTime      DATETIME
          , @Duration     INT
          , @SPName       VARCHAR(200) = OBJECT_NAME(@@PROCID)
          , @OldData      NVARCHAR(MAX)
          , @NewData      NVARCHAR(MAX)
		  , @ComponentId   INT

	DROP TABLE IF EXISTS #tmp_ComponentId
	CREATE TABLE #tmp_ComponentId( rn INT Identity(1,1), ComponentId	INT)

	INSERT INTO #tmp_ComponentId(ComponentId)
	SELECT CAST(value AS INT)
	FROM STRING_SPLIT(@ComponentIds,',')

	WHILE EXISTS (SELECT TOP 1 1 FROM #tmp_ComponentId)
	BEGIN
		SELECT TOP 1 @ComponentId = ComponentId FROM #tmp_ComponentId
		-- Old data for writing log
		SELECT @OldData = (
			SELECT c.ComponentId AS 'ci'
				  ,c.ComponentCode AS 'cc'
				  ,c.ComponentName AS 'cn'
				  ,c.ComponentTypeId AS 'ct'
				  ,c.StatusId AS 'st'
			FROM dbo.Component c WITH (NOLOCK)
			WHERE c.ComponentId = @ComponentId
			FOR JSON PATH, WITHOUT_ARRAY_WRAPPER, INCLUDE_NULL_VALUES
		);

		DECLARE @TimeZone TINYINT
		SELECT @TimeZone = CONVERT(TINYINT, SValue)
		FROM dbo.SystemSettings WITH (NOLOCK)
		WHERE SName = 'TimeZone';
		SELECT @CurrentDate = DATEADD(HOUR, @TimeZone, GETUTCDATE());

		BEGIN TRY
			UPDATE c WITH (ROWLOCK, UPDLOCK)
			SET  c.StatusId       = ISNULL(@StatusId, c.StatusId)
			   ,c.UpdatedBy      = @UserId
			   ,c.UpdatedDate    = @CurrentDate
			FROM dbo.Component c
			WHERE c.ComponentId = @ComponentId;

		END TRY
		BEGIN CATCH
			SELECT @ErrCode = 1011
				 , @ErrMsg = N'Error occurs. Update unsuccessfully.';
			RETURN;
		END CATCH

		-- Write log
		SELECT @EndTime = GETDATE();
		SELECT @Duration = DATEDIFF(SECOND, @StartTime, @EndTime);

		SELECT @NewData = (
			SELECT c.ComponentId AS 'ci'
				  ,c.ComponentCode AS 'cc'
				  ,c.ComponentName AS 'cn'
				  ,c.ComponentTypeId AS 'ct'
				  ,c.StatusId AS 'st'
			FROM dbo.Component c WITH (NOLOCK)
			WHERE c.ComponentId = @ComponentId
			FOR JSON PATH, WITHOUT_ARRAY_WRAPPER, INCLUDE_NULL_VALUES
		);

		EXEC dbo.OH_UserLog_RunSP_Detail_WriteLog
			@UserId    = @UserId
			,@SPName   = @SPName
			,@OldData  = @OldData
			,@NewData  = @NewData
			,@IP       = @IP
			,@Language = @Language
			,@Duration = @Duration;

		DELETE FROM #tmp_ComponentId WHERE ComponentId = @ComponentId
	END
END