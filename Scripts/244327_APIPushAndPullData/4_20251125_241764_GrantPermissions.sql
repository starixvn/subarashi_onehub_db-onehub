/*<info serverAlias="DBOH-ONEHub"></info>*/
/*
    Created: 20251125@Sophia
    DB: ONEHub
    Task: Grant permissions for wsv_oh user [RedmineID: #241764]
         
*/

USE [bodb_12b];
GO
CREATE USER [wsv_oh] FOR LOGIN [wsv_oh];
GO

GRANT SELECT ON BonusInfo TO [wsv_oh];
GO