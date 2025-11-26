/*<info serverAlias="B2C-Siebog"></info>*/
USE Siebog;
DROP PROCEDURE IF EXISTS OH_CustomerSel;
DELIMITER //
CREATE DEFINER=`OneHub_Api`@`%` PROCEDURE `OH_CustomerSel`(
  IN _fromDate DATETIME,
  IN _toDate DATETIME,
  IN _pageIndex INT,
  IN _pageSize INT
    /*
    Created: 20251119@Sophia
    DB: ONEHub
    Task: Get player information for ONEHub system [RedmineId: #244327]
    
	Revisions:
		- 20251119@Sophia: Initialize SP based on Aff_CustomerSel_V4 logic
        
	Param's Explanation
		fromDate, toDate: an hour
		pageSize: max is 2000
	Example CALL:
		CALL ONEHub.OH_CustomerSel('2025-08-01 00:00:00', '2025-08-31 23:59:59', 0, 100);
		-- Get the first 100 records from 2025-08-01 to 2025-08-31
		-- PageIndex starts from 0		
 */
)
BEGIN
	DECLARE _offSet INT;
	SET _pageSize = IF(_pageSize > 2000, 2000, _pageSize); -- maximum is 2000
	SET _offSet = _pageIndex * _pageSize;
    
	WITH CTE_MemberInfo AS(
		SELECT m.CustId, m.SiteId, m.UserName, m.FirstName, m.LastName, m.Email, m.Currency, m.ActStatus, m.Status, m.IsRemoved, m.RegisteredDate, m.RegDate, m.IDCode, m.CreatedDate, m.ClickId, m.FirstDepositDate, m.FTDDate, m.FirstDepositAmount
		FROM `Siebog`.`MemberInfo` m
		WHERE m.FirstDepositDate BETWEEN _fromDate AND _toDate
		UNION
		SELECT m.CustId, m.SiteId, m.UserName, m.FirstName, m.LastName, m.Email, m.Currency, m.ActStatus, m.Status, m.IsRemoved, m.RegisteredDate, m.RegDate, m.IDCode, m.CreatedDate, m.ClickId, m.FirstDepositDate, m.FTDDate, m.FirstDepositAmount
		FROM `Siebog`.`MemberInfo` m
		WHERE m.RegisteredDate BETWEEN _fromDate AND _toDate
	)
		SELECT m.CustId, m.SiteId, m.UserName, m.FirstName, m.LastName, m.Email, m.Currency, m.ActStatus, m.Status, m.IsRemoved, m.RegisteredDate, m.RegDate, m.IDCode, m.CreatedDate, m.ClickId, m.FirstDepositDate, m.FTDDate, m.FirstDepositAmount
		FROM CTE_MemberInfo m
		ORDER BY m.RegisteredDate ASC, m.CustId ASC
		LIMIT _offSet, _pageSize;

END 
//
DELIMITER ; 

GRANT EXECUTE ON PROCEDURE `OH_CustomerSel` TO `OneHub_Api`@`%`;