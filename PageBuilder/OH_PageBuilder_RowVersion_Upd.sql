/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="1"></info>*/
CREATE PROCEDURE [dbo].[OH_PageBuilder_RowVersion_Upd]
    @PageIds VARCHAR(MAX),
    @ErrCode INT = 0 OUTPUT,
    @ErrMsg NVARCHAR(MAX) = '' OUTPUT
AS
/*
    Created: 20250915@Sophia
    DB: DBOH-ONEHub
    Task: Update RowVersion by updating Creator with its own value
    Revisions:
        - 20250915@Sophia: Initial version [RedmineID: #236797]

    Purpose: Update RowVersion column by performing a self-update.
             This allows detection of changes through the RowVersion timestamp.
*/
BEGIN
    SET NOCOUNT ON;

    -- =========================
    -- Validate required parameters
    -- =========================
    IF ISNULL(@PageIds, '') = ''
    BEGIN
        SELECT @ErrCode = 100, @ErrMsg = N'PageIds is required!';
        RETURN;
    END

    -- =========================
    -- Update to trigger RowVersion change
    -- =========================
    BEGIN TRY
        UPDATE b WITH (ROWLOCK)
        SET b.Creator = b.Creator -- Self-update to trigger RowVersion
        FROM dbo.PageBuilder b
        WHERE b.PageId IN (SELECT value FROM STRING_SPLIT(@PageIds, ','));

    END TRY
    BEGIN CATCH
        SELECT 
            @ErrCode = 101,
            @ErrMsg = 'There was an error while updating RowVersion: ' + ERROR_MESSAGE();
        RETURN;
    END CATCH
END;
GO
