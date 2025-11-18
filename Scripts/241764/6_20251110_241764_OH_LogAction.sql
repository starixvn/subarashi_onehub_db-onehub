/*<info serverAlias="DBOH-ONEHub"></info>*/
/*
    Created: 20251110@Sophia
    DB: DBOH-ONEHub
    Task: Insert Log Actions for stored procedures [RedmineId : #241764]
*/
 
USE [ONEHub]
GO

TRUNCATE TABLE LogType
INSERT INTO LogType (TypeId,	TypeName,	Description) VALUES (1,	'LandingPage','Landing Page Builder Management')


TRUNCATE TABLE LogAction
INSERT [dbo].[LogAction] ([ActionId], [ActionTypeId], [SPName], [Items], [ActionName]) VALUES (1, 1, N'OH_AssetUploader_Del', N'{
    "Items": [
        {"Alias": "ai", "Item": "Asset Information"},
        {"Alias": "fn", "Item": "Form Name"},
        {"Alias": "f", "Item": "File Name"},
        {"Alias": "m", "Item": "Module"},
        {"Alias": "d", "Item": "Dimension"},
        {"Alias": "tc", "Item": "Target Country"},
        {"Alias": "l", "Item": "Language"},
        {"Alias": "st", "Item": "Status"}
    ]
}', N'Delete Asset Uploader')
INSERT [dbo].[LogAction] ([ActionId], [ActionTypeId], [SPName], [Items], [ActionName]) VALUES (2, 1, N'OH_AssetUploader_Ins', N'{
    "Items": [
        {"Alias": "ai", "Item": "Asset Information"},
        {"Alias": "fn", "Item": "Form Name"},
        {"Alias": "f", "Item": "File Name"},
        {"Alias": "m", "Item": "Module"},
        {"Alias": "d", "Item": "Dimension"},
        {"Alias": "tc", "Item": "Target Country"},
        {"Alias": "l", "Item": "Language"},
        {"Alias": "st", "Item": "Active"}
    ]
}', N'Insert Asset Uploader')
INSERT [dbo].[LogAction] ([ActionId], [ActionTypeId], [SPName], [Items], [ActionName]) VALUES (3, 1, N'OH_AssetUploader_Status_Upd', N'{
    "Items": [
        {"Alias": "ai", "Item": "Asset Information"},
        {"Alias": "fn", "Item": "Form Name"},
        {"Alias": "f", "Item": "File Name"},
        {"Alias": "st", "Item": "Status"}
    ]
}', N'Update Asset Uploader Status')
INSERT [dbo].[LogAction] ([ActionId], [ActionTypeId], [SPName], [Items], [ActionName]) VALUES (4, 1, N'OH_AssetUploader_Upd', N'{
    "Items": [
        {"Alias": "ai", "Item": "Asset Information"},
        {"Alias": "fn", "Item": "Form Name"},
        {"Alias": "f", "Item": "File Name"},
        {"Alias": "m", "Item": "Module"},
        {"Alias": "d", "Item": "Dimension"},
        {"Alias": "tc", "Item": "Target Country"},
        {"Alias": "l", "Item": "Language"},
        {"Alias": "st", "Item": "Active"}
    ]
}', N'Update Asset Uploader')
INSERT [dbo].[LogAction] ([ActionId], [ActionTypeId], [SPName], [Items], [ActionName]) VALUES (5, 1, N'OH_PageBuilder_Ins', N'{
  "Items": [
    {
      "Alias": "lp",
      "Item": "Landing Page"
    },
    {
      "Alias": "pid",
      "Item": "PageId"
    },
    {
      "Alias": "pn",
      "Item": "Page Name"
    },
    {
      "Alias": "pc",
      "Item": "Page Code"
    },
    {
      "Alias": "tc",
      "Item": "Target Country"
    },
    {
      "Alias": "l",
      "Item": "Language"
    },
    {
      "Alias": "st",
      "Item": "Status"
    },
    {
      "Alias": "cc",
      "Item": "Campaign Code"
    },
    {
      "Alias": "prv",
      "Item": "IsPreview"
    },
    {
      "Alias": "cs",
      "Item": "ComponentStructure"
    }
  ]
}', N'Insert Page Builder')
INSERT [dbo].[LogAction] ([ActionId], [ActionTypeId], [SPName], [Items], [ActionName]) VALUES (6, 1, N'OH_PageBuilder_RowVersion_Upd', N'{
  "Items": [
    {
      "Alias": "lp",
      "Item": "Landing Page"
    },
    {
      "Alias": "pid",
      "Item": "PageId"
    },
    {
      "Alias": "pn",
      "Item": "Page Name"
    },
    {
      "Alias": "pc",
      "Item": "Page Code"
    },
    {
      "Alias": "tc",
      "Item": "Target Country"
    },
    {
      "Alias": "l",
      "Item": "Language"
    },
    {
      "Alias": "st",
      "Item": "Status"
    },
    {
      "Alias": "cc",
      "Item": "Campaign Code"
    },
    {
      "Alias": "prv",
      "Item": "IsPreview"
    },
    {
      "Alias": "cs",
      "Item": "ComponentStructure"
    }
  ]
}', N'Update Page Builder Row Version')
INSERT [dbo].[LogAction] ([ActionId], [ActionTypeId], [SPName], [Items], [ActionName]) VALUES (7, 1, N'OH_PageBuilder_Upd', N'{
  "Items": [
    {
      "Alias": "lp",
      "Item": "Landing Page"
    },
    {
      "Alias": "pid",
      "Item": "PageId"
    },
    {
      "Alias": "pn",
      "Item": "Page Name"
    },
    {
      "Alias": "pc",
      "Item": "Page Code"
    },
    {
      "Alias": "tc",
      "Item": "Target Country"
    },
    {
      "Alias": "l",
      "Item": "Language"
    },
    {
      "Alias": "st",
      "Item": "Status"
    },
    {
      "Alias": "cc",
      "Item": "Campaign Code"
    },
    {
      "Alias": "prv",
      "Item": "IsPreview"
    },
    {
      "Alias": "cs",
      "Item": "ComponentStructure"
    }
  ]
}', N'Update Page Builder')
INSERT [dbo].[LogAction] ([ActionId], [ActionTypeId], [SPName], [Items], [ActionName]) VALUES (8, 1, N'OH_Campaign_Del', N'{    "Items": [
        {"Alias": "ci", "Item": "Campaign Id"},
        {"Alias": "cc", "Item": "Campaign Code"},
        {"Alias": "cn", "Item": "Campaign Name"},
        {"Alias": "d", "Item": "Description"},
        {"Alias": "st", "Item": "Status"}
    ]
}', N'Delete campaign')
INSERT [dbo].[LogAction] ([ActionId], [ActionTypeId], [SPName], [Items], [ActionName]) VALUES (9, 1, N'OH_Campaign_Ins', N'{
    "Items": [
        {"Alias": "ci", "Item": "Campaign Id"},
        {"Alias": "cc", "Item": "Campaign Code"},
        {"Alias": "cn", "Item": "Campaign Name"},
        {"Alias": "d", "Item": "Description"},
        {"Alias": "st", "Item": "Status"}
    ]
}', N'Insert Campaign')
INSERT [dbo].[LogAction] ([ActionId], [ActionTypeId], [SPName], [Items], [ActionName]) VALUES (10, 1, N'OH_Campaign_Status_Upd', N'{    "Items": [
        {"Alias": "ci", "Item": "Campaign Id"},
        {"Alias": "cc", "Item": "Campaign Code"},
        {"Alias": "cn", "Item": "Campaign Name"},
        {"Alias": "d", "Item": "Description"},
        {"Alias": "st", "Item": "Status"}
    ]
}', N'Update campaign status only')
INSERT [dbo].[LogAction] ([ActionId], [ActionTypeId], [SPName], [Items], [ActionName]) VALUES (11, 1, N'OH_Campaign_Upd', N'{    "Items": [
        {"Alias": "ci", "Item": "Campaign Id"},
        {"Alias": "cc", "Item": "Campaign Code"},
        {"Alias": "cn", "Item": "Campaign Name"},
        {"Alias": "d", "Item": "Description"},
        {"Alias": "st", "Item": "Status"}
    ]
}', N'Update Campaign')
INSERT [dbo].[LogAction] ([ActionId], [ActionTypeId], [SPName], [Items], [ActionName]) VALUES (12, 1, N'OH_Component_Del', N'{
    "Items": [
        {"Alias": "ci", "Item": "Component Id"},
        {"Alias": "cc", "Item": "Component Code"},
        {"Alias": "cn", "Item": "Component Name"},
        {"Alias": "ct", "Item": "Component Type Id"},
        {"Alias": "st", "Item": "Status"}
    ]
}', N'Delete component')
INSERT [dbo].[LogAction] ([ActionId], [ActionTypeId], [SPName], [Items], [ActionName]) VALUES (13, 1, N'OH_Component_Ins', N'{
    "Items": [
        {"Alias": "ci", "Item": "Component Id"},
        {"Alias": "cc", "Item": "Component Code"},
        {"Alias": "cn", "Item": "Component Name"},
        {"Alias": "ct", "Item": "Component Type Id"},
        {"Alias": "st", "Item": "Status"}
    ]
}', N'Insert Component')
INSERT [dbo].[LogAction] ([ActionId], [ActionTypeId], [SPName], [Items], [ActionName]) VALUES (14, 1, N'OH_Component_Status_Upd', N'{
    "Items": [
        {"Alias": "ci", "Item": "Component Id"},
        {"Alias": "cc", "Item": "Component Code"},
        {"Alias": "cn", "Item": "Component Name"},
        {"Alias": "ct", "Item": "Component Type Id"},
        {"Alias": "st", "Item": "Status"}
    ]
}', N'Update component status only')
INSERT [dbo].[LogAction] ([ActionId], [ActionTypeId], [SPName], [Items], [ActionName]) VALUES (15, 1, N'OH_Component_Upd', N'{
    "Items": [
        {"Alias": "ci", "Item": "Component Id"},
        {"Alias": "cc", "Item": "Component Code"},
        {"Alias": "cn", "Item": "Component Name"},
        {"Alias": "ct", "Item": "Component Type Id"},
        {"Alias": "st", "Item": "Status"}
    ]
}', N'Update Component')
INSERT [dbo].[LogAction] ([ActionId], [ActionTypeId], [SPName], [Items], [ActionName]) VALUES (16, 1, N'OH_SignUp', N'{
    "Items": [
        {"Alias": "u", "Item": "User name"},
        {"Alias": "e", "Item": "Email"},
        {"Alias": "ph", "Item": "Phone Number"},
        {"Alias": "cu", "Item": "Currency"},
        {"Alias": "ac", "Item": "Area Code"},
        {"Alias": "ct", "Item": "Captcha Type"},
        {"Alias": "rct", "Item": "ReCaptchaToken"},
        {"Alias": "ru", "Item": "Referral Url"},
        {"Alias": "l", "Item": "User Lang"},
        {"Alias": "st", "Item": "Status"},
        {"Alias": "dur", "Item": "Duration"}
    ]
}', N'API Sign in')
INSERT [dbo].[LogAction] ([ActionId], [ActionTypeId], [SPName], [Items], [ActionName]) VALUES (17, 1, N'OH_LinkGenerator_Ins', N'{
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
}', N'LinkGenerator insert')

INSERT [dbo].[LogAction] ([ActionId], [ActionTypeId], [SPName], [Items], [ActionName]) VALUES (18, 1, N'OH_LinkGenerator_Upd', N'{
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
    {"Alias": "sd", "Item": "Short Domain"},
    {"Alias": "sp", "Item": "Short Path"},
    {"Alias": "fl", "Item": "Full Link"},
    {"Alias": "sid", "Item": "Site Id"},
    {"Alias": "st", "Item": "Status"}
  ]
}', N'LinkGenerator status update')

INSERT [dbo].[LogAction] ([ActionId], [ActionTypeId], [SPName], [Items], [ActionName]) VALUES (19, 1, N'OH_PageBuilder_Status_Upd', N'{
  "Items": [
    {
      "Alias": "pid",
      "Item": "PageId"
    },
    {
      "Alias": "pn",
      "Item": "Page Name"
    },
    {
      "Alias": "pc",
      "Item": "Page Code"
    },
    {
      "Alias": "tc",
      "Item": "Target Country"
    },
    {
      "Alias": "l",
      "Item": "Language"
    },
    {
      "Alias": "st",
      "Item": "Status"
    },
    {
      "Alias": "cn",
      "Item": "Campaign Name"
    }
  ]
}', N'Update Page Builder status only')

INSERT [dbo].[LogAction] ([ActionId], [ActionTypeId], [SPName], [Items], [ActionName]) VALUES (20, 1, N'OH_Domain_Upd', N'{
  "Items": [
    {
      "Alias": "dmn",
      "Item": "Domain Name"
    },
    {
      "Alias": "dt",
      "Item": "Domain Type"
    },
    {
      "Alias": "pc",
      "Item": "Page Code"
    },
    {
      "Alias": "nt",
      "Item": "Note"
    },
    {
      "Alias": "sid",
      "Item": "SiteId"
    },
    {
      "Alias": "cd",
      "Item": "Created Date"
    }
  ]
}', N'Domain update')
GO


