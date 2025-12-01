/*<info serverAlias="DBOH-ONEHub"></info>*/
/*
    Created: 20252419@Sophia
    DB: DBOH-ONEHub
    Task: Add domain ShortLink  sheet - UAT [RedmineId : #236797]
         
*/
declare @p1 int
set @p1=0
declare @p2 nvarchar(max)
set @p2=N''
exec OH_Domain_Ins @ErrCode=@p1 output,@ErrMsg=@p2 output,@Data=N'[
  {
    "DmN": "482go.nufrel.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "037go.nufrel.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "219go.nufrel.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "684go.nufrel.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "553go.nufrel.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "701go.nufrel.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "896go.nufrel.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "122go.nufrel.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "948go.nufrel.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "375go.nufrel.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "482go.zekvio.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "037go.zekvio.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "219go.zekvio.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "684go.zekvio.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "553go.zekvio.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "701go.zekvio.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "896go.zekvio.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "122go.zekvio.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "948go.zekvio.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "375go.zekvio.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "482go.korvim.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "037go.korvim.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "219go.korvim.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "684go.korvim.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "553go.korvim.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "701go.korvim.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "896go.korvim.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "122go.korvim.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "948go.korvim.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "375go.korvim.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "482go.lomget.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "037go.lomget.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "219go.lomget.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "684go.lomget.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "553go.lomget.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "701go.lomget.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "896go.lomget.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "122go.lomget.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "948go.lomget.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "375go.lomget.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "482go.puldra.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "037go.puldra.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "219go.puldra.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "684go.puldra.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "553go.puldra.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "701go.puldra.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "896go.puldra.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "122go.puldra.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "948go.puldra.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "375go.puldra.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "482go.rixmon.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "037go.rixmon.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "219go.rixmon.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "684go.rixmon.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "553go.rixmon.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "701go.rixmon.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "896go.rixmon.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "122go.rixmon.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "948go.rixmon.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "375go.rixmon.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "482go.zimdor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "037go.zimdor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "219go.zimdor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "684go.zimdor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "553go.zimdor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "701go.zimdor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "896go.zimdor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "122go.zimdor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "948go.zimdor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "375go.zimdor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "482go.keltru.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "037go.keltru.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "219go.keltru.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "684go.keltru.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "553go.keltru.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "701go.keltru.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "896go.keltru.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "122go.keltru.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "948go.keltru.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "375go.keltru.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "482go.tezmin.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "037go.tezmin.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "219go.tezmin.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "684go.tezmin.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "553go.tezmin.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "701go.tezmin.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "896go.tezmin.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "122go.tezmin.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "948go.tezmin.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "375go.tezmin.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "482go.feqnor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "037go.feqnor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "219go.feqnor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "684go.feqnor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "553go.feqnor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "701go.feqnor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "896go.feqnor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "122go.feqnor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "948go.feqnor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "375go.feqnor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "482go.tlndor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "037go.tlndor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "219go.tlndor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "684go.tlndor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "553go.tlndor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "701go.tlndor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "896go.tlndor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "122go.tlndor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "948go.tlndor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "375go.tlndor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "482go.iupdor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "037go.iupdor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "219go.iupdor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "684go.iupdor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "553go.iupdor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "701go.iupdor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "896go.iupdor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "122go.iupdor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "948go.iupdor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "375go.iupdor.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  }
]',@DomainType=2,@SiteId=101
select @p1, @p2 