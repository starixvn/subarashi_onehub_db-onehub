/*<info serverAlias="DBOH-ONEHub"></info>*/
/*
    Created: 20251107
    DB: DBOH-ONEHub
    Task: Create ClickStatistic Tables [RedmineId : #241764]
       
*/

USE ONEHub;
GO

IF OBJECT_ID('dbo.ClickStatistics','U') IS NOT NULL
    DROP TABLE dbo.ClickStatistics;
GO

DROP PARTITION SCHEME PS_ClickStatistic_RL
DROP PARTITION FUNCTION PF_ClickStatistic_RL


CREATE PARTITION FUNCTION PF_ClickStatistic_RL (DATE)
AS RANGE LEFT FOR VALUES (
    ('2025-11-30'),
    ('2025-12-31'), ('2026-01-31'), ('2026-02-28'), ('2026-03-31'),
    ('2026-04-30'), ('2026-05-31'), ('2026-06-30'), ('2026-07-31'),
    ('2026-08-31'), ('2026-09-30'), ('2026-10-31'), ('2026-11-30'),
    ('2026-12-31'), ('2027-01-31'), ('2027-02-28'), ('2027-03-31'),
    ('2027-04-30'), ('2027-05-31'), ('2027-06-30'), ('2027-07-31'),
    ('2027-08-31'), ('2027-09-30'), ('2027-10-31'), ('2027-11-30'),
    ('2027-12-31'), ('2028-01-31'), ('2028-02-29'), ('2028-03-31'),
    ('2028-04-30'), ('2028-05-31'), ('2028-06-30'), ('2028-07-31'),
    ('2028-08-31'), ('2028-09-30'), ('2028-10-31'), ('2028-11-30'),
    ('2028-12-31')
);



CREATE PARTITION SCHEME PS_ClickStatistic_RL
AS PARTITION PF_ClickStatistic_RL
TO (
    [FG_ClickStatistic_2025_11],
    [FG_ClickStatistic_2025_12],

    [FG_ClickStatistic_2026_01],
    [FG_ClickStatistic_2026_02],
    [FG_ClickStatistic_2026_03],
    [FG_ClickStatistic_2026_04],
    [FG_ClickStatistic_2026_05],
    [FG_ClickStatistic_2026_06],
    [FG_ClickStatistic_2026_07],
    [FG_ClickStatistic_2026_08],
    [FG_ClickStatistic_2026_09],
    [FG_ClickStatistic_2026_10],
    [FG_ClickStatistic_2026_11],
    [FG_ClickStatistic_2026_12],

    [FG_ClickStatistic_2027_01],
    [FG_ClickStatistic_2027_02],
    [FG_ClickStatistic_2027_03],
    [FG_ClickStatistic_2027_04],
    [FG_ClickStatistic_2027_05],
    [FG_ClickStatistic_2027_06],
    [FG_ClickStatistic_2027_07],
    [FG_ClickStatistic_2027_08],
    [FG_ClickStatistic_2027_09],
    [FG_ClickStatistic_2027_10],
    [FG_ClickStatistic_2027_11],
    [FG_ClickStatistic_2027_12],

    [FG_ClickStatistic_2028_01],
    [FG_ClickStatistic_2028_02],
    [FG_ClickStatistic_2028_03],
    [FG_ClickStatistic_2028_04],
    [FG_ClickStatistic_2028_05],
    [FG_ClickStatistic_2028_06],
    [FG_ClickStatistic_2028_07],
    [FG_ClickStatistic_2028_08],
    [FG_ClickStatistic_2028_09],
    [FG_ClickStatistic_2028_10],
    [FG_ClickStatistic_2028_11],
    [FG_ClickStatistic_2028_12],

    [FG_ClickStatistic_Right]
);

CREATE TABLE [dbo].[ClickStatistics](
    [ClickId]  [bigint] NOT NULL,
	[UpdatedTime] [datetime] NOT NULL,
	[Date] [DATE] NOT NULL,
	[IP] [varchar](25) NOT NULL,
	[DomainReferrer] [nvarchar](300) NOT NULL,
	[URLReferrer] [nvarchar](300) NOT NULL,
	[RedirectURL] [varchar](4000) NULL,
	[Browser] [nvarchar](50) NOT NULL,
	[BrowserVersion] [nvarchar](16) NULL,
	[BrowserLanguage] [nvarchar](8) NULL,
	[OS] [nvarchar](50) NULL,
	[Device] [nvarchar](50) NULL,
	[DeviceType] [tinyint] NULL,
	[UserAgent] [nvarchar](256) NULL,
	[LinkId] [varchar](500) NULL,
	[SiteId]	[smallint] NULL,
	[ClickTypeId] [tinyint] NOT NULL
)
ON PS_ClickStatistic_RL(Date);
GO

CREATE CLUSTERED INDEX IX_ClickStatistic_ClickId ON ClickStatistics(Date, ClickId);

CREATE NONCLUSTERED INDEX IX_ClickStatistic_LinkId
ON ClickStatistics(Date, LinkId)
ON PS_ClickStatistic_RL(Date);   