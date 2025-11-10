/*<info serverAlias="DBOH-ONEHub"></info>*/
/*
    Created: 20251110@Sophia
    DB: DBOH-ONEHub
    Task: Insert Log Actions for LinkGenerator stored procedures [RedmineId : #241764]
*/
 
USE ONEHub;
GO

-- Insert Log Action for OH_LinkGenerator_Ins
IF NOT EXISTS (SELECT TOP 1 1 FROM dbo.LogAction WITH (NOLOCK) WHERE SPName = 'OH_LinkGenerator_Ins')
BEGIN
    INSERT INTO dbo.LogAction (
        ActionTypeId,
        SPName,
        Items
    )
    VALUES (
        30,
        'OH_LinkGenerator_Ins',   
        '{
  "Items": [
    {"Alias": "lid", "Item": "Link Id"},
    {"Alias": "ln", "Item": "Link Name"},
    {"Alias": "idc", "Item": "ID Code"},
    {"Alias": "cn", "Item": "Campaign Name"},
    {"Alias": "cty", "Item": "Country"},
    {"Alias": "mkt", "Item": "Market"},
    {"Alias": "eids", "Item": "Event Ids"},
    {"Alias": "gid", "Item": "Group Id"},
    {"Alias": "chid", "Item": "Channel Id"},
    {"Alias": "aid", "Item": "Agency Id"},
    {"Alias": "tid", "Item": "Type Id"},
    {"Alias": "pc", "Item": "Page Code"},
    {"Alias": "pn", "Item": "Page Name"},
    {"Alias": "pt", "Item": "Page Type"},
    {"Alias": "nt", "Item": "Note"},
    {"Alias": "dn", "Item": "Domain Name"},
    {"Alias": "sl", "Item": "Short Link"},
    {"Alias": "sp", "Item": "Short Path"},
    {"Alias": "fl", "Item": "Full Link"},
    {"Alias": "sid", "Item": "Site Id"},
    {"Alias": "st", "Item": "Status"}
  ]
}'
    );
    
    PRINT 'Inserted LogAction for OH_LinkGenerator_Ins';
END
ELSE
BEGIN
    PRINT 'LogAction for OH_LinkGenerator_Ins already exists';
END
GO

-- Insert Log Action for OH_LinkGenerator_Upd
IF NOT EXISTS (SELECT TOP 1 1 FROM dbo.LogAction WITH (NOLOCK) WHERE SPName = 'OH_LinkGenerator_Upd')
BEGIN
    INSERT INTO dbo.LogAction (
        ActionTypeId,
        SPName,
        Items
    )
    VALUES (
        30,
        'OH_LinkGenerator_Upd',
        '{
  "Items": [
    {"Alias": "lid", "Item": "Link Id"},
    {"Alias": "ln", "Item": "Link Name"},
    {"Alias": "idc", "Item": "ID Code"},
    {"Alias": "cn", "Item": "Campaign Name"},
    {"Alias": "cty", "Item": "Country"},
    {"Alias": "mkt", "Item": "Market"},
    {"Alias": "eids", "Item": "Event Ids"},
    {"Alias": "gid", "Item": "Group Id"},
    {"Alias": "chid", "Item": "Channel Id"},
    {"Alias": "aid", "Item": "Agency Id"},
    {"Alias": "tid", "Item": "Type Id"},
    {"Alias": "pc", "Item": "Page Code"},
    {"Alias": "pt", "Item": "Page Type"},
    {"Alias": "nt", "Item": "Note"},
    {"Alias": "dn", "Item": "Domain Name"},
    {"Alias": "sl", "Item": "Short Link"},
    {"Alias": "fl", "Item": "Full Link"},
    {"Alias": "sid", "Item": "Site Id"},
    {"Alias": "st", "Item": "Status"}
  ]
}'
    );
    
    PRINT 'Inserted LogAction for OH_LinkGenerator_Upd';
END
ELSE
BEGIN
    PRINT 'LogAction for OH_LinkGenerator_Upd already exists';
END
GO

-- Verify insertions
SELECT 
    ActionId,
    ActionTypeId,
    SPName,
    Items
FROM dbo.LogAction WITH (NOLOCK)
WHERE SPName IN ('OH_LinkGenerator_Ins', 'OH_LinkGenerator_Upd')
ORDER BY SPName;
GO
