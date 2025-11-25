/*<info serverAlias="DBOH-ONEHub"></info>*/
/*
    Created: 20251125@Sophia
    DB: DBOH-ONEHub
    Task: Create ExchangeOanda table [RedmineID: #244327]
         
*/

DROP TABLE IF EXISTS [dbo].[ExchangeOanda];
GO

CREATE TABLE [dbo].[ExchangeOanda](
	[ExchangeDate] [smalldatetime] NOT NULL,
	[ExchangeId] [int] NOT NULL,
	[Code] [varchar](5) NULL,
	[ActualRate] [float] NULL,
	[VND] [float] NULL,
	[EUR] [float] NULL,
	[USD] [float] NULL,
	[CNY] [float] NULL,
	[MYR] [float] NULL,
	[THB] [float] NULL,
	[IDR] [float] NULL,
	[BDT] [float] NULL,
	[INR] [float] NULL,
 CONSTRAINT [PK_ExchangeOanda] PRIMARY KEY CLUSTERED 
(
	[ExchangeDate] ASC,
	[ExchangeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [SETTING_DATA]
) ON [SETTING_DATA]
GO