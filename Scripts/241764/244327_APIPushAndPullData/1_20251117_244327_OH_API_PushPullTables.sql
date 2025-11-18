/*<info serverAlias="DBOH-ONEHub"></info>*/
/*
    Created: 20251117@Sophia
    DB: DBOH-ONEHub
    Task: Create API Push Data Tracker tables for Push/Pull API functionality [RedmineId: #244327]
        - Create SystemSettings table for configuration (For Pull API)
        - Create API_PushDataTracker table for tracking push operations (For Push API)
*/
 
USE ONEHub;
GO
 
-- ========================================
-- 2. Drop & Create API_PushDataTracker Table
-- ========================================
IF EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[API_PushDataTracker]') AND type IN (N'U'))
BEGIN
    DROP TABLE [dbo].[API_PushDataTracker];
END
GO

CREATE TABLE [dbo].[API_PushDataTracker] (
    PushTrackerId BIGINT IDENTITY(1,1) NOT NULL,
    CheckInTime DATETIME NULL,
    FinishedTime DATETIME NULL,
    StatusId TINYINT NULL,
    PushDataType SMALLINT NULL,
    PushDataInfo NVARCHAR(MAX) NULL,
    CONSTRAINT [PK_API_PushDataTracker] PRIMARY KEY NONCLUSTERED (PushTrackerId ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
    ON [SETTING_DATA]
) ON [SETTING_DATA] TEXTIMAGE_ON [SETTING_DATA];
GO

-- Create clustered index for efficient range queries
CREATE CLUSTERED INDEX [CIX_API_PushDataTracker_PushDataType_StatusId] 
ON [dbo].[API_PushDataTracker] (PushDataType ASC, StatusId ASC)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
ON [SETTING_DATA];
GO

-- Add default constraints
ALTER TABLE [dbo].[API_PushDataTracker] 
ADD CONSTRAINT [DF_API_PushDataTracker_CheckInTime] DEFAULT (GETDATE()) FOR [CheckInTime];
GO

ALTER TABLE [dbo].[API_PushDataTracker] 
ADD CONSTRAINT [DF_API_PushDataTracker_StatusId] DEFAULT ((0)) FOR [StatusId];
GO


-- ========================================
-- 3. Insert Initial Data into SystemSettings
-- ========================================
-- Insert configuration values for Pull API
INSERT INTO [dbo].[SystemSettings] (SName, SValue)
VALUES 
    ('MemberInfoLastImportedTime', ''),
    ('RealMemberInfoLastImportedTime', ''),
    ('ManualMemberInfoLastImportedTime', '');
GO

 