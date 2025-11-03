/*<info serverAlias="DBOH-ONEHub"></info>*/
/*
    Created: 20251030
    DB: DBOH-ONEHub
    Task: Create Domain Management Tables [RedmineId : #241764]
        - Create Domain table with identity primary key
        - Create DomainDetail table with country scoring
        - Create DomainLog table for domain booking tracking
*/



USE ONEHub;
GO

-- 1. Drop & Create Domain Table
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Domain]') AND type IN (N'U'))
BEGIN
    DROP TABLE [dbo].[Domain];
END
GO

CREATE TABLE Domain (
    Id INT IDENTITY(1,1) NOT NULL,
    DomainName VARCHAR(200) NOT NULL,
    Info NVARCHAR(200) NULL,
    CreatedDate DATETIME NOT NULL CONSTRAINT DF_Domain_CreatedDate DEFAULT GETDATE(),
    SiteId SMALLINT NULL,
    CONSTRAINT PK_Domain PRIMARY KEY NONCLUSTERED (Id)
) 
ON [SETTING_DATA]
WITH (DATA_COMPRESSION = PAGE);

-- Create clustered index on DomainName for performance
CREATE CLUSTERED INDEX IX_Domain_DomainName 
ON Domain (DomainName);

-- 2. Drop & Create DomainDetail Table  
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DomainDetail]') AND type IN (N'U'))
BEGIN
    DROP TABLE [dbo].[DomainDetail];
END
GO

CREATE TABLE DomainDetail (
    Id INT IDENTITY(1,1) NOT NULL,
    DomainName VARCHAR(200) NOT NULL,
    Country VARCHAR(20) NOT NULL,
    SiteId SMALLINT NULL,
    Score SMALLINT NULL,
    CONSTRAINT PK_DomainDetail PRIMARY KEY NONCLUSTERED (Id)
) 
ON [SETTING_DATA]
WITH (DATA_COMPRESSION = PAGE);

-- Create indexes for performance
CREATE CLUSTERED INDEX IX_DomainDetail_DomainName 
ON DomainDetail (DomainName);

CREATE NONCLUSTERED INDEX IX_DomainDetail_Country 
ON DomainDetail (Country);

-- 3. Drop & Create DomainLog Table
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DomainLog]') AND type IN (N'U'))
BEGIN
    DROP TABLE [dbo].[DomainLog];
END
GO

CREATE TABLE DomainLog (
    Id INT IDENTITY(1,1) NOT NULL,
    DomainName VARCHAR(200) NOT NULL,
    Info NVARCHAR(200) NULL,
    CreatedDate DATETIME NOT NULL CONSTRAINT DF_DomainLog_CreatedDate DEFAULT GETDATE(),
    SiteId SMALLINT NULL,
    CONSTRAINT PK_DomainLog PRIMARY KEY CLUSTERED (Id)
) 
ON [SETTING_DATA]
WITH (DATA_COMPRESSION = PAGE);

-- Create index on DomainName for performance
CREATE NONCLUSTERED INDEX IX_DomainLog_DomainName 
ON DomainLog (DomainName);

-- Create index on CreatedDate for log queries
CREATE NONCLUSTERED INDEX IX_DomainLog_CreatedDate 
ON DomainLog (CreatedDate);

GO
 