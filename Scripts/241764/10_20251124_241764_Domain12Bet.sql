/*<info serverAlias="DBOH-ONEHub"></info>*/
/*
    Created: 20252419@Sophia
    DB: DBOH-ONEHub
    Task: Add domain 12bet sheet - UAT [RedmineId : #236797]
         
*/

declare @p1 int
set @p1=0 
declare @p2 nvarchar(max)
set @p2=N''
exec OH_Domain_Ins @ErrCode=@p1 output,@ErrMsg=@p2 output,@Data=N'[
  {
    "DmN": "12bfacai.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12blueball.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 100
      },
      {
        "CC": "MY",
        "Sc": 100
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 100
      },
      {
        "CC": "BD",
        "Sc": 100
      },
      {
        "CC": "TH",
        "Sc": 100
      },
      {
        "CC": "KR",
        "Sc": 100
      },
      {
        "CC": "IN",
        "Sc": 100
      }
    ]
  },
  {
    "DmN": "12bo8888.com",
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
        "Sc": 1
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
    "DmN": "12bvn.vip",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 1
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
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
    "DmN": "12bvn2.vip",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 1
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12bwinb.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12caiyuan.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 1
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12chances.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 3
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
        "Sc": 26
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "12cntiyu.com",
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
        "Sc": 1
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
    "DmN": "12crystal.com",
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
        "Sc": 1
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
    "DmN": "12crystalclub.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 1
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12enig4567.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 43
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
        "Sc": 1
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
    "DmN": "12fada88.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 1
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
        "Sc": 2
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
    "DmN": "12fifa2018.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 44
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12haoqiu.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 1
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
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
    "DmN": "12haoyun88.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
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
        "Sc": 19
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "12kanqiu.com",
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
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12worldcups.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 58
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
        "Sc": 1
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
        "Sc": 4
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "java16.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 36
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
        "Sc": 1
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
    "DmN": "12bsprt2.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12bsprt3.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12bsprt4.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12bsprt5.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
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
        "Sc": 1
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
        "Sc": 2
      },
      {
        "CC": "IN",
        "Sc": 1
      }
    ]
  },
  {
    "DmN": "12bsaff1.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 59
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12bsaff2.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 57
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
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
    "DmN": "12bsaff3.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 59
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
        "Sc": 1
      },
      {
        "CC": "BD",
        "Sc": 5
      },
      {
        "CC": "TH",
        "Sc": 1
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 1
      }
    ]
  },
  {
    "DmN": "12bsaff4.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 56
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12binrlink1.com",
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
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12binrlink2.com",
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
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 2
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 1
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
    "DmN": "12binr3.com",
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
        "Sc": 1
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
    "DmN": "12binr4.com",
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
        "Sc": 1
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
    "DmN": "12kolink01.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 3
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
      },
      {
        "CC": "BD",
        "Sc": 7
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
    "DmN": "12kolink02.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 2
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
        "Sc": 3
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "12kolink03.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 1
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
    "DmN": "12koreg01.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 3
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
        "Sc": 1
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
        "Sc": 1
      }
    ]
  },
  {
    "DmN": "12koreg02.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 1
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
        "Sc": 1
      }
    ]
  },
  {
    "DmN": "12koreg03.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
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
        "Sc": 1
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
        "Sc": 1
      }
    ]
  },
  {
    "DmN": "12bvnlink1.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
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
        "Sc": 1
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
    "DmN": "12bvnlink2.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
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
        "Sc": 1
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
    "DmN": "12bvnlink3.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 3
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12bvnlink4.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 3
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
    "DmN": "12bvnlink5.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 4
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
        "Sc": 1
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
    "DmN": "12bthlink1.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
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
        "Sc": 1
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 1
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
    "DmN": "12bthlink2.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
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
        "Sc": 1
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
        "Sc": 14
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "12bthlink4.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 0
      },
      {
        "CC": "BD",
        "Sc": 9
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 2
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "12bthlink5.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12bmylink1.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 3
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
        "Sc": 1
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
    "DmN": "12bmylink2.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
        "Sc": 2
      },
      {
        "CC": "IN",
        "Sc": 1
      }
    ]
  },
  {
    "DmN": "12bmylink5.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 3
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12binlink1.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
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
        "Sc": 1
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
        "Sc": 2
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "12binlink2.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
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
    "DmN": "12binlink3.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 1
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 1
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
    "DmN": "12binlink4.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12binlink5.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 3
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
        "Sc": 1
      },
      {
        "CC": "BD",
        "Sc": 5
      },
      {
        "CC": "TH",
        "Sc": 0
      },
      {
        "CC": "KR",
        "Sc": 2
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "12belucky.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 3
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
        "Sc": 1
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
    "DmN": "12bigwin.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 3
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12fun12.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 3
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 2
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
    "DmN": "12befun2.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 3
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 2
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
    "DmN": "12besuper.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 3
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
        "Sc": 1
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
    "DmN": "12belegend.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12beking.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
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
        "Sc": 1
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
    "DmN": "12befair.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12betheone.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
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
        "Sc": 1
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
    "DmN": "12bejackpot.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
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
        "Sc": 1
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
    "DmN": "12peiyu.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 1
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
        "Sc": 3
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 1
      },
      {
        "CC": "KR",
        "Sc": 0
      },
      {
        "CC": "IN",
        "Sc": 1
      }
    ]
  },
  {
    "DmN": "12gogofun.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12game11.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 3
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
        "Sc": 1
      },
      {
        "CC": "BD",
        "Sc": 4
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
    "DmN": "12fun888.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
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
        "Sc": 2
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
        "Sc": 2
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "12game10.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
        "Sc": 2
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "12fun8888.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 3
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 2
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
    "DmN": "12gain.com",
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
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12happen.com",
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
        "Sc": 999
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
    "DmN": "12mega.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12major.com",
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
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 2
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
    "DmN": "12realjackpot.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
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
    "DmN": "onetwo888.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 3
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
        "Sc": 1
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
    "DmN": "1212fun.com",
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
    "DmN": "1212wow.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 2
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
    "DmN": "1212info.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "1212gogo.com",
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
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "1212sky.com",
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
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
        "Sc": 1
      }
    ]
  },
  {
    "DmN": "1212hi.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
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
    "DmN": "1212taste.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 1
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "1212come.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 1
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
        "Sc": 1
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
    "DmN": "1212daddy.com",
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
        "Sc": 999
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
        "Sc": 3
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "1212onetwo.com",
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
        "Sc": 999
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
    "DmN": "1212news.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "1212remix.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 1
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "1212true.com",
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
        "Sc": 1
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
    "DmN": "1212thunder.com",
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
    "DmN": "1212coco.com",
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
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "1212sou.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 1
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
        "Sc": 1
      },
      {
        "CC": "BD",
        "Sc": 9
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
    "DmN": "1212yes.com",
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
        "Sc": 1
      },
      {
        "CC": "BD",
        "Sc": 0
      },
      {
        "CC": "TH",
        "Sc": 1
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
    "DmN": "1212you.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 12
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
        "Sc": 2
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "1212hey.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 3
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
        "Sc": 1
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
    "DmN": "12bvnlink6.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 1
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12bvnlink7.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 999
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
    "DmN": "12bvnlink8.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 1
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
        "Sc": 1
      },
      {
        "CC": "BD",
        "Sc": 7
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
    "DmN": "12bvnlink9.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
        "Sc": 1
      }
    ]
  },
  {
    "DmN": "12bvnlink10.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 1
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12bthlink6.com",
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
        "Sc": 1
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
    "DmN": "12bthlink7.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 3
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
      },
      {
        "CC": "BD",
        "Sc": 5
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
    "DmN": "12bthlink8.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 1
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
        "Sc": 6
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
    "DmN": "12bthlink9.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 3
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12bthlink10.com",
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
        "Sc": 1
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
        "Sc": 2
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "12bmylink6.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 0
      },
      {
        "CC": "CN",
        "Sc": 1
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
        "Sc": 1
      }
    ]
  },
  {
    "DmN": "12bmylink7.com",
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
        "Sc": 1
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
    "DmN": "12bmylink8.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 1
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
        "Sc": 2
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
    "DmN": "12bmylink9.com",
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
        "Sc": 2
      },
      {
        "CC": "BD",
        "Sc": 7
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
    "DmN": "12bmylink10.com",
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
        "Sc": 1
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
        "Sc": 1
      }
    ]
  },
  {
    "DmN": "12binlink6.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "12binlink7.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
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
        "Sc": 1
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
    "DmN": "12binlink8.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
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
        "Sc": 2
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "12binlink9.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 1
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
    "DmN": "12binlink10.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 1
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "trimox39.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 1
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "nexilo07.com",
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
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "lorvia29.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
        "Sc": 2
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "yoprex31.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 3
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 2
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
    "DmN": "xantor55.com",
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
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "vibroa99.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
      },
      {
        "CC": "BD",
        "Sc": 4
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
    "DmN": "poltra40.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "qiravo63.com",
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
        "Sc": 999
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
    "DmN": "ramvoa18.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 1
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "surixa72.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
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
        "Sc": 3
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "jibrox92.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
      },
      {
        "CC": "BD",
        "Sc": 7
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
    "DmN": "zovix12.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "lexiro44.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 3
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
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
    "DmN": "ravixu17.com",
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
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
        "Sc": 3
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "xovira35.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 2
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
        "Sc": 2
      },
      {
        "CC": "IN",
        "Sc": 0
      }
    ]
  },
  {
    "DmN": "luntra09.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 0
      },
      {
        "CC": "MY",
        "Sc": 1
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
    "DmN": "moprix91.com",
    "Nt": "",
    "Dts": [
      {
        "CC": "VN",
        "Sc": 3
      },
      {
        "CC": "MY",
        "Sc": 0
      },
      {
        "CC": "ID",
        "Sc": 999
      },
      {
        "CC": "CN",
        "Sc": 1
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
]',@DomainType=1,@SiteId=101
select @p1, @p2