/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" viewers="" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[OH_ClickStatisticsPatterns_Upd]
	@ClickIDs		VARCHAR(MAX)
	,@ClickTypeId	TINYINT
	,@ErrCode		INT = 0 OUTPUT
	,@ErrMsg		NVARCHAR(4000) = '' OUTPUT

AS
/*
	Created: 20251110@Danny
	DB: DBOH-ONEHub
	Task: Update ClickStatistics IsExcluded column 

	Revisions:  
		- 20251110@Danny: Initialize SP to update IsExcluded column [RedmineID: #241764]

*/
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY

		IF @ClickTypeid IS NULL
		BEGIN
			SET @ErrCode = 302;
			SET @ErrMsg = 'ClickTypeid parameter is required!';
			RETURN;
		END

		-- Create temp table to store ClickIDs
		CREATE TABLE #TempClickIDs (
			ClickId BIGINT
		);

		-- Insert ClickIDs into temp table (split comma-separated values)
		INSERT INTO #TempClickIDs (ClickId)
		SELECT CAST(value AS BIGINT)
		FROM STRING_SPLIT(@ClickIDs, ',')
		WHERE TRIM(value) != '';

		-- Check if any ClickIDs were provided
		IF NOT EXISTS (SELECT 1 FROM #TempClickIDs)
		BEGIN
			SET @ErrCode = 303;
			SET @ErrMsg = 'No valid ClickIDs provided!';
			DROP TABLE #TempClickIDs;
			RETURN;
		END

		-- Update ClickStatistics table
		UPDATE cs
		SET ClickTypeid = @ClickTypeid
		FROM dbo.ClickStatistics cs
		INNER JOIN #TempClickIDs t ON cs.ClickId = t.ClickId;

		-- Get the number of rows affected
		DECLARE @RowsAffected INT = @@ROWCOUNT;

		-- Clean up temp table
		DROP TABLE #TempClickIDs;

		-- Return success message with affected rows count
		SET @ErrCode = 0;
		SET @ErrMsg = CAST(@RowsAffected AS NVARCHAR(10)) + ' record(s) updated successfully.';

	END TRY
	BEGIN CATCH
		
		-- Clean up temp table if it exists
		IF OBJECT_ID('tempdb..#TempClickIDs') IS NOT NULL
			DROP TABLE #TempClickIDs;

		-- Set error information for update failures
		SET @ErrCode = 304;
		SET @ErrMsg = 'Update ClickStatistics failed: ' + ERROR_MESSAGE();
		RETURN;
	END CATCH
		
END
GO