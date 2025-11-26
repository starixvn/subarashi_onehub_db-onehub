/*<info serverAlias="B2C-Siebog"></info>*/
Use Siebog;
DELIMITER //
CREATE DEFINER=`nova88`@`%` PROCEDURE `OH_Link_IDCode_Set`(
    IN _IDCode VARCHAR(20),
    IN _SiteId SMALLINT,
    IN _StatusId TINYINT
)
BEGIN
    /* 20251120 @Ian: Create stored procedure to insert/update OH_Link_IDCode data*/

    INSERT INTO `Siebog`.`OH_Link_IDCode`
    (`IDCode`, `SiteId`, `StatusId`)
    VALUES
    (_IDCode, _SiteId, _StatusId)
    ON DUPLICATE KEY UPDATE
        `StatusId` = _StatusId;

END//
DELIMITER ;

GRANT EXECUTE ON PROCEDURE Siebog.OH_Link_IDCode_Set TO 'OneHub_Api'@'%'; 
