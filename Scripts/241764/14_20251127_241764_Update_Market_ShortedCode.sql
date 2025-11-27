/*<info serverAlias="DBOH-ONEHub"></info>*/
/*
    Created: 20251127@Sophia
    DB: DBOH-ONEHub
    Task: Update Market table shortedcode values [RedmineID: #241764]
         
*/

USE [ONEHub];
GO

UPDATE Market WITH (ROWLOCK, UPDLOCK)
SET shortedcode = 'bd'
WHERE shortedcode = 'bn';
GO

UPDATE Market WITH (ROWLOCK, UPDLOCK)
SET shortedcode = 'te'
WHERE shortedcode = 'hitg';
GO