/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
USE [master]
GO

/****** Object:  Database [ONEHub]    Script Date: 10/23/2025 10:35:54 AM ******/
CREATE DATABASE [ONEHub]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ONEHub_Data', FILENAME = N'H:\USER_DB\ONEHub\ONEHub_Data.mdf' , SIZE = 128MB , MAXSIZE = UNLIMITED, FILEGROWTH = 64MB ), 
 FILEGROUP [LogData] 
( NAME = N'LogData', FILENAME = N'H:\USER_DB\ONEHub\LogData.mdf' , SIZE = 128MB , MAXSIZE = UNLIMITED, FILEGROWTH = 64MB ), 
 FILEGROUP [Setting_Data] 
( NAME = N'Setting_Data_01', FILENAME = N'H:\USER_DB\ONEHub\Setting_Data_01.mdf' , SIZE = 128MB , MAXSIZE = UNLIMITED, FILEGROWTH = 64MB ),
( NAME = N'Setting_Data_02', FILENAME = N'H:\USER_DB\ONEHub\Setting_Data_02.mdf' , SIZE = 128MB , MAXSIZE = UNLIMITED, FILEGROWTH = 64MB ),
 FILEGROUP [Report_Data] 
( NAME = N'Report_Data_01', FILENAME = N'H:\USER_DB\ONEHub\Report_Data_01.mdf' , SIZE = 128MB , MAXSIZE = UNLIMITED, FILEGROWTH = 64MB ),
( NAME = N'Report_Data_02', FILENAME = N'H:\USER_DB\ONEHub\Report_Data_02.mdf' , SIZE = 128MB , MAXSIZE = UNLIMITED, FILEGROWTH = 64MB )
 LOG ON 
( NAME = N'ONEHub_Log', FILENAME = N'H:\USER_DB\ONEHub\ONEHub_Log.ldf' , SIZE = 51200KB , MAXSIZE = 2048GB , FILEGROWTH = 25600KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO



USE [master]
GO
/* For security reasons the login is created disabled and with a random password.*/
/****** Object:  Login [wsv_oh]    Script Date: 10/27/2025 10:42:44 AM ******/
CREATE LOGIN [wsv_oh] WITH PASSWORD=N'Hicw2/c6/uZpMQ/zPgWh74Fr8MJe01avxTYUL9AiGvo=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
USE ONEHub
GO
/****** Object:  User [wsv_oh]    Script Date: 10/27/2025 9:55:02 AM ******/
CREATE USER [wsv_oh] FOR LOGIN [wsv_oh] WITH DEFAULT_SCHEMA=[dbo]
GO


