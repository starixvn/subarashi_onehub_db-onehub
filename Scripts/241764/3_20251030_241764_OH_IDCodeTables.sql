/*<info serverAlias="DBOH-ONEHub"></info>*/
/*
    Created: 20251030
    DB: DBOH-ONEHub
    Task: Create Domain Management Tables [RedmineId : #241764]
         
*/
 
-- 5. Drop & Create IDCode Table
IF EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IDCode]') AND type IN (N'U'))
BEGIN
    DROP TABLE [dbo].[IDCode];
END
GO

CREATE TABLE IDCode (
    Id INT IDENTITY(100,1) NOT NULL,
    IDCode VARCHAR(20) NOT NULL,
    StatusId TINYINT NULL,
    CreatedDate DATETIME NOT NULL CONSTRAINT DF_IDCode_CreatedDate DEFAULT GETDATE(),
    SiteId SMALLINT NULL,
    CONSTRAINT PK_IDCode PRIMARY KEY NONCLUSTERED (Id)
) 
ON [SETTING_DATA];

CREATE UNIQUE CLUSTERED INDEX IX_IDCode_Code
ON IDCode (IDCode);

GO
