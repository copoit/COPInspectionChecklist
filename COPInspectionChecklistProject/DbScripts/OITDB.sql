USE [OITDB]
GO

/****** Drop PK and FK ******/
ALTER TABLE [dbo].[CASE_INFO] DROP CONSTRAINT [FK_CASE_INFO_PROPERTY_INFO]
GO

ALTER TABLE [dbo].[CASE_INFO] DROP CONSTRAINT [FK_CASE_INFO_INSPECTOR_INFO]
GO

/****** Drop Entity CASE_INFO ******/
DROP TABLE [dbo].[CASE_INFO]
GO
/****** Drop Entity INSPECTOR_INFO ******/
DROP TABLE [dbo].[INSPECTOR_INFO]
GO
/****** Drop Entity PROPERTY_INFO ******/
DROP TABLE [dbo].[PROPERTY_INFO]

/****** Create Entity CASE_INFO ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CASE_INFO](
	[Case_Num] [varchar](13) NOT NULL,
	[Inspection_Date] [date] NULL,
	[ReInspection_Date] [date] NULL,
	[Inspector_ID] [varchar](5) NULL,
	[Property_ID] [varchar](10) NULL,
 CONSTRAINT [PK_CASE_INFO] PRIMARY KEY CLUSTERED 
(
	[Case_Num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

/****** Create Entity INSPECTOR_INFO ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[INSPECTOR_INFO](
	[Inspector_ID] [varchar](5) NOT NULL,
	[Inspector_FName] [varchar](50) NULL,
	[Inspector_LName] [varchar](50) NULL,
	[Inspector_Phone] [varchar](50) NULL,
	[Inspector_Email] [varchar](50) NULL,
 CONSTRAINT [PK_INSPECTOR_INFO] PRIMARY KEY CLUSTERED 
(
	[Inspector_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO


/****** Create Entity PROPERTY_INFO ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PROPERTY_INFO](
	[Property_ID] [varchar](10) NOT NULL,
	[Property_StreetNumber] [varchar](6) NULL,
	[Property_StreetName] [varchar](50) NULL,
	[Property_Zip] [varchar](5) NULL,
	[Property_Owner_Name] [varchar](50) NULL,
	[Property_Owner_Phone] [varchar](10) NULL,
	[Applicant_Name] [varchar](50) NULL,
	[Applicant_Phone] [varchar](10) NULL,
	[Applicant_Email] [varchar](50) NULL,
	[Mailing_StreetNumber] [varchar](6) NULL,
	[Mailing_StreetName] [varchar](50) NULL,
	[Mailing_Zip] [varchar](5) NULL,
	[Dwelling_Info] [varchar](25) NULL,
	[NumberOfUnits] [smallint] NULL,
 CONSTRAINT [PK_PROPERTY_INFO] PRIMARY KEY CLUSTERED 
(
	[Property_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO

ALTER TABLE [dbo].[CASE_INFO]  WITH CHECK ADD  CONSTRAINT [FK_CASE_INFO_INSPECTOR_INFO] FOREIGN KEY([Inspector_ID])
REFERENCES [dbo].[INSPECTOR_INFO] ([Inspector_ID])
GO

ALTER TABLE [dbo].[CASE_INFO] CHECK CONSTRAINT [FK_CASE_INFO_INSPECTOR_INFO]
GO

ALTER TABLE [dbo].[CASE_INFO]  WITH CHECK ADD  CONSTRAINT [FK_CASE_INFO_PROPERTY_INFO] FOREIGN KEY([Property_ID])
REFERENCES [dbo].[PROPERTY_INFO] ([Property_ID])
GO

ALTER TABLE [dbo].[CASE_INFO] CHECK CONSTRAINT [FK_CASE_INFO_PROPERTY_INFO]
GO

/****** Populate INSPECTOR_INFO ******/
INSERT INTO [dbo].[INSPECTOR_INFO]
           ([Inspector_ID]
           ,[Inspector_FName]
           ,[Inspector_LName]
           ,[Inspector_Phone]
           ,[Inspector_Email])
     VALUES
           ('INS05','Bethany','Moss','6263550958','Bmoss@cityofpasadena.net'),
		   ('INS06','Mike','Hughes','6263550969','MHughes@cityofpasadena.net'),
		   ('INS07','Li','Hong','6263550970','LHong@cityofpasadena.net'),
		   ('INS08','Martha','Engel','6263550981','MEngel@cityofpasadena.net'),
		   ('INS09','Angel','Smith','6263550992','ASmith@cityofpasadena.net'),
		   ('INS10','Roger','Ambross','6263550903','RAmbross@cityofpasadena.net'),
		   ('INS11','Simson','Tan','6263550914','STan@cityofpasadena.net'),
		   ('INS12','Gloria','Smith','6263550925','GSmith@cityofpasadena.net'),
		   ('INS13','Robert','Schram','6263550936','RSchram@cityofpasadena.net'),
		   ('INS14','Hoang','Li','6263550947','HLi@cityofpasadena.net')
GO

/****** Populate PROPERTY_INFO ******/
INSERT INTO [dbo].[PROPERTY_INFO]
           ([Property_ID]
           ,[Property_StreetNumber]
           ,[Property_StreetName]
           ,[Property_Zip]
           ,[Property_Owner_Name]
           ,[Property_Owner_Phone]
           ,[Applicant_Name]
           ,[Applicant_Phone]
           ,[Applicant_Email]
           ,[Mailing_StreetNumber]
           ,[Mailing_StreetName]
           ,[Mailing_Zip]
           ,[Dwelling_Info]
           ,[NumberOfUnits])
     VALUES
           ('PROPERTY01','454','ROSEMONT AVE','69058','WENDY J RINNER','6263550958','ANNETTE MARCHAIN','6263550957','wendy.j.rinner@gmail.com','540','S LAKE ST','69059','SINGLE FAMILY','1'),
		   ('PROPERTY02','941','MONT AVE','69059','MICHAEL A SMITH','6263550859','ANOOJ K SMITH','6263550754','michael.a.smith@gmail.com','120','EAST WEST HWY','69052','SINGLE FAMILY','1')

GO
/****** Populate CASE_INFO ******/
INSERT INTO [dbo].[CASE_INFO]
           ([Case_Num]
           ,[Inspection_Date]
           ,[ReInspection_Date]
           ,[Inspector_ID]
           ,[Property_ID])
     VALUES
           ('CC12017-00375','11-05-2016','11-25-2016','INS05','PROPERTY01'),
		   ('CC12017-00389','12-05-2016','12-25-2016','INS08','PROPERTY02')
GO

/****** VIEW CASE_INFO ******/
SELECT [Case_Num]
      ,[Inspection_Date]
      ,[ReInspection_Date]
      ,[Inspector_ID]
      ,[Property_ID]
  FROM [dbo].[CASE_INFO]
GO

/****** VIEW INSPECTOR_INFO ******/
SELECT [Inspector_ID]
      ,[Inspector_FName]
      ,[Inspector_LName]
      ,[Inspector_Phone]
      ,[Inspector_Email]
  FROM [dbo].[INSPECTOR_INFO]
GO

USE [OITDB]
GO

/****** VIEW PROPERTY_INFO ******/
SELECT [Property_ID]
      ,[Property_StreetNumber]
      ,[Property_StreetName]
      ,[Property_Zip]
      ,[Property_Owner_Name]
      ,[Property_Owner_Phone]
      ,[Applicant_Name]
      ,[Applicant_Phone]
      ,[Applicant_Email]
      ,[Mailing_StreetNumber]
      ,[Mailing_StreetName]
      ,[Mailing_Zip]
      ,[Dwelling_Info]
      ,[NumberOfUnits]
  FROM [dbo].[PROPERTY_INFO]
GO


