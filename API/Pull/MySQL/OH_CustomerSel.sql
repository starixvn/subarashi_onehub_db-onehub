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
    DB:  Siebog
    Task: Get player information for ONEHub system [RedmineId: #244327]
    
	Revisions:
		- 20251119@Sophia: Initialize SP based on Aff_CustomerSel_V4 logic
        
	Param's Explanation
		fromDate, toDate: an hour
		pageSize: max is 2000
	Example CALL:
		CALL Siebog.OH_CustomerSel('2025-08-01 00:00:00', '2025-08-31 23:59:59', 0, 100);
		-- Get the first 100 records from 2025-08-01 to 2025-08-31
		-- PageIndex starts from 0		
 */
)
BEGIN
	DECLARE _offSet INT;
	SET _pageSize = IF(_pageSize > 2000, 2000, _pageSize); -- maximum is 2000
	SET _offSet = _pageIndex * _pageSize;
    
	WITH CTE_CustomerInfo AS(
		SELECT c.CustId, c.SiteId, s.SiteName, a.IDCode, c.UserName, c.Userpwd, c.CurrencyId, c.UserLang, c.ActStatus, c.UserLevel, c.LastLoginTime, c.RegTime, cw.TaskTime AS FirstDepositTime, c.IsTest, c.IsKyc, c.IsRisk, c.`Status`,a.ClickId
		FROM `Customer` c
			INNER JOIN `OH_Link_ClickLog` a ON a.CustId = c.CustId
			INNER JOIN `CustTaskTime` cw ON cw.CustId = c.CustId AND cw.TaskId = 6
			INNER JOIN `ServerInfo` s ON c.SiteId = s.SiteId
		WHERE cw.TaskTime between _fromDate and _ToDate
		UNION
		SELECT c.CustId, c.SiteId, s.SiteName, a.IDCode, c.UserName, c.Userpwd, c.CurrencyId, c.UserLang, c.ActStatus, c.UserLevel, c.LastLoginTime, c.RegTime, cw.TaskTime AS FirstDepositTime, c.IsTest, c.IsKyc, c.IsRisk, c.`Status`,  a.ClickId
		FROM `Customer` c
			INNER JOIN `OH_Link_ClickLog` a ON a.CustId = c.CustId
			LEFT JOIN `CustTaskTime` cw ON cw.CustId = c.CustId AND cw.TaskId = 6
			INNER JOIN `ServerInfo` s ON c.SiteId = s.SiteId
		WHERE c.RegTime  between _fromDate and _ToDate
		
	)
		SELECT c.CustId, c.SiteId, c.SiteName, c.IDCode, c.UserName, c.Userpwd, c.CurrencyId, c.UserLang, c.ActStatus, c.UserLevel, c.LastLoginTime, c.RegTime, c.FirstDepositTime, c.IsTest, c.IsKyc, c.IsRisk, c.`Status`, c.ClickId
		FROM CTE_CustomerInfo c
		ORDER BY c.RegTime ASC, c.CustId ASC
		LIMIT _offSet, _pageSize;

END 
//
DELIMITER ; 

GRANT EXECUTE ON PROCEDURE `OH_CustomerSel` TO `OneHub_Api`@`%`;