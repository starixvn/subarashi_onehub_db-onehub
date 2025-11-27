/*<info serverAlias="DBOH-ONEHub"></info>*/
/*
    Created: 20251127@Sophia
    DB: DBOH-ONEHub
    Task: Insert initial LastImportedTime_ExchangeOanda setting [RedmineID: #244327]
         
*/

USE [ONEHub];
GO

INSERT INTO [dbo].[SystemSettings] (SName, SValue)
VALUES ('LastImportedTime_ExchangeOanda', '2025-11-27 04:00:00');
GO