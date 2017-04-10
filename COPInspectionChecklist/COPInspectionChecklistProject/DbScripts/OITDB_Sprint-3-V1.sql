USE [OITDB]
GO

/****** Drop ALL FKs ******/
ALTER TABLE [dbo].[CASE_INFO] DROP CONSTRAINT [FK_CASE_INFO_PROPERTY_INFO]
GO

ALTER TABLE [dbo].[CASE_INFO] DROP CONSTRAINT [FK_CASE_INFO_INSPECTOR_INFO]
GO

ALTER TABLE [CL_SectionDetail] DROP CONSTRAINT [FK_CL_SectionDetail_CL_Section]
GO

ALTER TABLE [dbo].[VIOLATIONS] DROP CONSTRAINT [FK_VIOLATIONS_CL_SectionDetail]
GO

ALTER TABLE [dbo].[VIOLATIONS] DROP CONSTRAINT [FK_VIOLATIONS_CASE_INFO]
GO

/****** Drop Entity VIOLATIONS******/
DROP TABLE [dbo].[VIOLATIONS]
GO

/****** Drop Entity CASE_INFO ******/
DROP TABLE [dbo].[CASE_INFO]
GO
/****** Drop Entity INSPECTOR_INFO ******/
DROP TABLE [dbo].[INSPECTOR_INFO]
GO
/****** Drop Entity PROPERTY_INFO ******/
DROP TABLE [dbo].[PROPERTY_INFO]

/****** Drop Entity CL_Section ******/
DROP TABLE [dbo].[CL_Section]
GO

/****** Drop Entity CL_SectionDetail ******/
DROP TABLE [dbo].[CL_SectionDetail]
GO

/****** Create Entity CASE_INFO ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CASE_INFO](
	[Case_Num] [varchar](13) NOT NULL,
	[Case_Date] [date] NULL,
	[Inspector_ID] [varchar](5) NULL,
	[Property_ID] [varchar](10) NULL,
	[Inspection_Date] [date] NULL,
	[ReInspection_Date] [date] NULL,
	[Inspection_Type] [varchar](30) NULL,
	[Inspection_Status] [varchar](15) NULL,
	[Citation_Charges] [varchar](5) NULL,
	[Inspector_Notes] [varchar](250) NULL,
	[Inspector_Signature] [varchar](50) NULL,
	[Cert_IssueDate] [date] NULL,
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
	[Sidewalk_Fee] [bit] NULL,
 CONSTRAINT [PK_PROPERTY_INFO] PRIMARY KEY CLUSTERED 
(
	[Property_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

/****** Create Entity CL_Section ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CL_Section](
	[SectionSeq_ID] [int] NOT NULL,
	[Section_ID] [varchar](4) NOT NULL,
	[Section_Name] [varchar](80) NULL,
 CONSTRAINT [PK_CL_Section] PRIMARY KEY CLUSTERED 
(
	[Section_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

/****** Create Entity CL_SectionDetail ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CL_SectionDetail](
	[Section_ID] [varchar](4) NULL,
	[SubSectionSeq_ID] [int] NOT NULL,
	[SubSection_ID] [varchar](30) NOT NULL,
	[SubSection_Desc] [varchar](250) NULL,
	[SubSection_Notes] [varchar](250) NULL,
	[SubSection_Code] [varchar](25) NULL,
	[SubSection_Major] [bit] NULL,
	[SubSection_Minor] [bit] NULL
CONSTRAINT [PK_SubSection_ID] PRIMARY KEY CLUSTERED 
(
	[SubSection_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

/****** Create Entity VIOLATIONS ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[VIOLATIONS](
	[Case_Num] [varchar](13) NULL,
	[SubSection_ID] [varchar](30) NULL,
	[SubSection_Notes] [varchar](250) NULL,
	[SubSection_Major] [bit] NULL,
	[SubSection_Minor] [bit] NULL
) ON [PRIMARY]

GO

/****** ADD  CONSTRAINT [FK_CASE_INFO_INSPECTOR_INFO] IN CASE_INFO******/
ALTER TABLE [dbo].[CASE_INFO]  WITH CHECK ADD  CONSTRAINT [FK_CASE_INFO_INSPECTOR_INFO] FOREIGN KEY([Inspector_ID])
REFERENCES [dbo].[INSPECTOR_INFO] ([Inspector_ID])
GO

ALTER TABLE [dbo].[CASE_INFO] CHECK CONSTRAINT [FK_CASE_INFO_INSPECTOR_INFO]
GO

/****** ADD  CONSTRAINT [FK_CASE_INFO_PROPERTY_INFO] IN CASE_INFO******/
ALTER TABLE [dbo].[CASE_INFO]  WITH CHECK ADD  CONSTRAINT [FK_CASE_INFO_PROPERTY_INFO] FOREIGN KEY([Property_ID])
REFERENCES [dbo].[PROPERTY_INFO] ([Property_ID])
GO

ALTER TABLE [dbo].[CASE_INFO] CHECK CONSTRAINT [FK_CASE_INFO_PROPERTY_INFO]
GO

/****** ADD  CONSTRAINT [FK_CL_SectionDetail_CL_Section] IN CL_SectionDetail******/
ALTER TABLE [dbo].[CL_SectionDetail]  WITH CHECK ADD  CONSTRAINT [FK_CL_SectionDetail_CL_Section] FOREIGN KEY([Section_ID])
REFERENCES [dbo].[CL_Section] ([Section_ID])
GO

ALTER TABLE [dbo].[CL_SectionDetail] CHECK CONSTRAINT [FK_CL_SectionDetail_CL_Section]
GO

/****** ADD  CONSTRAINT [FK_VIOLATIONS_CASE_INFO] and [FK_VIOLATIONS_CL_SectionDetail] IN VIOLATIONS******/
ALTER TABLE [dbo].[VIOLATIONS]  WITH CHECK ADD  CONSTRAINT [FK_VIOLATIONS_CASE_INFO] FOREIGN KEY([Case_Num])
REFERENCES [dbo].[CASE_INFO] ([Case_Num])
GO

ALTER TABLE [dbo].[VIOLATIONS] CHECK CONSTRAINT [FK_VIOLATIONS_CASE_INFO]
GO

ALTER TABLE [dbo].[VIOLATIONS]  WITH CHECK ADD  CONSTRAINT [FK_VIOLATIONS_CL_SectionDetail] FOREIGN KEY([SubSection_ID])
REFERENCES [dbo].[CL_SectionDetail] ([SubSection_ID])
GO

ALTER TABLE [dbo].[VIOLATIONS] CHECK CONSTRAINT [FK_VIOLATIONS_CL_SectionDetail]
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
           ,[NumberOfUnits]
           ,[Sidewalk_Fee])
     VALUES
           ('PROPERTY01','454','ROSEMONT AVE','69058','WENDY J RINNER','6263550958','ANNETTE MARCHAIN','6263550957','wendy.j.rinner@gmail.com','540','S LAKE ST','69059','SINGLE FAMILY','1',1),
           ('PROPERTY02','941','MONT AVE','69059','MICHAEL A SMITH','6263550859','ANOOJ K SMITH','6263550754','michael.a.smith@gmail.com','120','EAST WEST HWY','69052','SINGLE FAMILY','1',0)

GO
/****** Populate CASE_INFO ******/
INSERT INTO [dbo].[CASE_INFO]
           ([Case_Num]
		   ,[Case_Date]
           ,[Inspector_ID]
           ,[Property_ID]
           ,[Inspection_Date]
           ,[ReInspection_Date]
           ,[Inspection_Type]
           ,[Inspection_Status]
           ,[Citation_Charges]
           ,[Inspector_Notes]
           ,[Inspector_Signature]
           ,[Cert_IssueDate])
     VALUES
           ('CC12017-00375','10-05-2016','INS05','PROPERTY01','11-05-2016','11-25-2016','Occupancy Inspection','Scheduled','552','Inspection Notes','Inspector Signature','11-27-2016'),
           ('CC12017-00389','11-15-2016','INS08','PROPERTY02','12-15-2016','01-05-2017','Occupancy Inspection','Scheduled','552','Inspection Notes','Inspector Signature','01-09-2017')

GO
/****** Populate CL_Section ******/
INSERT INTO [dbo].[CL_Section]
           ([SectionSeq_ID]
		   ,[Section_ID]
           ,[Section_Name])
     VALUES
           (1,'1.0','BUILDING AND STRUCTURAL'),
		   (2,'1.1','Floorings, foundations, or floor supports:'),
		   (3,'1.2','Condition of vertical supports:'),
		   (4,'1.3','Condition of ceiling joists:'),
		   (5,'1.4','Condition of fireplaces or chimneys:'),
		   (6,'1.5','Inadequate room dimension'),
		   (7,'1.6','Illegal addition, construction, alteration, repair, conversion or demolition:'),
		   (8,'1.7','Owner responsible for inspection'),
		   (9,'2.0','WEATHER PROTECTION'),
		   (10,'2.1','Building must provide protection from elements and dampness:'),
		   (11,'2.2','Condition of exterior and/or interior walls or roof coverings:'),
		   (12,'2.3','Condition of weather protection:'),
		   (13,'3.0','FIRE DETECTION, PROTECTION, EXITS AND SAFETY'),
		   (14,'3.1','Self-closing door between garage and dwelling:'),
		   (15,'3.2','Quick release mechanism on windows and doors:'),
		   (16,'3.3','Fire detection'),
		   (17,'3.4','Interior and exterior stairway'),
		   (18,'3.5','Combustible Material'),
		   (19,'3.6','Exit Doors'),
		   (20,'4.0','NATURAL LIGHT AND VENTILATION'),
		   (21,'4.1','Natural light and ventilation'),
		   (22,'4.2','Mechanical Ventilation'),
		   (23,'5.0','ELECTRICAL'),
		   (24,'5.1','Unsafe electrical/over fusing'),
		   (25,'5.2','Hazardous wiring'),
		   (26,'5.3','Ground fault circuit interrupter required after 1975'),
		   (27,'5.4','Missing electrical and outlet switch coverplates'),
		   (28,'6.0','HEATING AND MECHANICAL'),
		   (29,'6.1','Heating facility in dwelling'),
		   (30,'6.2','Venting system required'),
		   (31,'6.3','Combustion air supply'),
		   (32,'6.4','Gas shut off valve'),
		   (33,'7.0','PLUMBING'),
		   (34,'7.1','Condition of sewer drain, water pipes or faucets'),
		   (35,'7.2','Water supply'),
		   (36,'7.3','Dwelling unit must have lavatory, water closet, bathtub or shower; kitchen sink'),
		   (37,'7.4','Cross connection and siphonage'),
		   (38,'7.5','Water heater'),
		   (39,'8.0','ENVIRONMENTAL, HEALTH AND SANITATION'),
		   (40,'8.1','Condition of flooring'),
		   (41,'8.2','Evidence of infestation'),
		   (42,'8.3','Unsanitary premises'),
		   (43,'8.4','Accumulation of junk, trash and debris'),
		   (44,'8.5','Foundation/Attic vent screens'),
		   (45,'9.0','POOL'),
		   (46,'9.1','Pool gate not proper'),
		   (47,'9.2','Green pool'),
		   (48,'10.0','IMPROPER OCCUPANCY'),
		   (49,'10.1','Garage conversion'),
		   (50,'10.2','SFR illegally divided'),
		   (51,'11.0','INADEQUATE OR NO COVERED PARKING'),
		   (52,'11.1','No covered parking'),
		   (53,'12.0','OUTDOOR STORAGE OF INOPERABLE AND/OR UNREGISTERED VEHICLES'),
		   (54,'12.1','Inoperable vehicle(s) stored on the property')
GO

/****** Populate CL_SectionDetail ******/
INSERT INTO [dbo].[CL_SectionDetail]
           ([Section_ID]
		   ,[SubSectionSeq_ID]
           ,[SubSection_ID]
           ,[SubSection_Desc]
           ,[SubSection_Notes]
           ,[SubSection_Code]
           ,[SubSection_Major]
           ,[SubSection_Minor])
     VALUES
           ('1.1',1,'1.1A','Inadequate flooring. Flooring must be free of large cracks, holes, or missing/damaged parts. Members may not be split, lean, list or buckle due to defective material or deterioration.','','PMC 14.12.610 A - C',0,0),
		   ('1.2',2,'1.2A','Inadequate vertical supports. Structural members are insufficient to carry imposed loads','','PMC 14.12.610 D - E',0,0),
		   ('1.3',3,'1.3A','Inadequate/sagging joists','','PMC 14.12.610 F - G',0,0),
		   ('1.4',4,'1.4A','Loose bricks / missing mortar observed at firebox','','PMC 14.12.610 H - I',0,0),
		   ('1.4',5,'1.4B','Loose bricks / missing mortar observed at exterior chimney','','PMC 14.12.610 H - I',0,0),
		   ('1.5',6,'1.5A','Habitable room does not meet minimum size requirements - 7ft','','PMC 14.12.380',0,0),
		   ('1.5',7,'1.5B','Habitable room does not meet minimum height requirement of 7''6"' ,'','PMC 14.12.360',0,0),
		   ('1.6',8,'1.6Attic','ATTIC: The attic has been converted into livable space without obtaining necessary approvals and permits','','PMC 14.12.320',0,0),
		   ('1.6',9,'1.6Bathroom','BATHROOM: One or more bathrooms have been added to the structure without obtaining the necessary permits','','PMC 14.12.320',0,0),
		   ('1.6',10,'1.6Copper repipe','COPPER REPIPE: Plumbing water lines have been replaced with copper piping throughout without obtaining the necessary permits','','PMC 14.12.320',0,0),
		   ('1.6',11,'1.6Deck','DECK: A deck has been constructed without obtaining the necessary permits','','PMC 14.12.320',0,0),
		   ('1.6',12,'1.6Driveway','DRIVEWAY: The driveway has been replaced without zoning approval and a required permit','','PMC 14.12.320',0,0),
		   ('1.6',13,'1.6Electric','ELECTRICAL: Electrical wiring has been upgraded without obtaining the necessary permit','','PMC 14.12.320',0,0),
		   ('1.6',14,'1.6Fencing','FENCING: A fence has been constructed without obtaining a zoning approval and required permit','','PMC 14.12.320',0,0),
		   ('1.6',15,'1.6Garage','GARAGE: Garage has been converted into livable space without obtaining the necessary permits. Including: Flamming flooring, Unpermitted electric, Unpermitted plumbing, Inoperable garage door/garage door dry walled over','','PMC 14.12.320',0,0),
		   ('1.6',16,'1.6Heater','HEATER: Heater has been replaced without obtaining the necessary permit','','PMC 14.12.320',0,0),
		   ('1.6',17,'1.6HVAC','HVAC: A heating and or air conditioning system has been added to the house without obtaining the necessary permits','','PMC 14.12.320',0,0),
		   ('1.6',18,'1.6Illegal Unit','ILLEGAL UNIT: One or more units have been added to this property without City approvals or permits.','','PMC 14.12.320',0,0),
		   ('1.6',19,'1.6Laundry','LAUNDRY: Laundry plumbing connections (water, sewer, gas) installed without obtaining the necessary permit','','PMC 14.12.320',0,0),
		   ('1.6',20,'1.6Porch Enclosure','PORCH ENCLOSURE: Porch has been enclosed and made into livable space without obtaining the necessary permits','','PMC 14.12.320',0,0),
		   ('1.6',21,'1.6Patio Enclosure','PATIO ENCLOSURE: Patio structure has been enclosed and made into livable space without obtaining the necessary permits','','PMC 14.12.320',0,0),
		   ('1.6',22,'1.6Patio','PATIO: A patio structure has been constructed without obtaining the necessary permits','','PMC 14.12.320',0,0),
		   ('1.6',23,'1.6Recessed Lighting','RECESSED LIGHTING: Recessed lighting fixtures have been installed without obtaining the necessary permit','','PMC 14.12.320',0,0),
		   ('1.6',24,'1.6Re-roof','RE-ROOF: Structure has been re-roofed without obtaining the necessary permits','','PMC 14.12.320',0,0),
		   ('1.6',25,'1.6Plumbing','PLUMBING: Sewer lines have been replaced without obtaining the necessary permit','','PMC 14.12.320',0,0),
		   ('1.6',26,'1.6Walls','WALLS: Interior wall modifications (addition and removal of walls) without obtaining the necessary permit','','PMC 14.12.320',0,0),
		   ('1.6',27,'1.6Water Heater','WATER HEATER: Water heater has been replaced without obtaining the necessary permit','','PMC 14.12.320',0,0),
		   ('1.6',28,'1.6Windows','WINDOWS: Windows have been replaced without obtaining the necessary permit.','','PMC 14.12.320',0,0),
		   ('1.6',29,'1.6Building-BLD:','EXPIRED: Building permit: BLD','','PMC 14.12.320',0,0),
		   ('1.6',30,'1.6Building-BMN','EXPIRED: Building permit: BMN','','PMC 14.12.320',0,0),
		   ('1.6',31,'1.6Electrical-ELE','EXPIRED: Electrical permit: ELE','','PMC 14.12.320',0,0),
		   ('1.6',32,'1.6Fence-ZON','EXPIRED: Fence permit: ZON','','PMC 14.12.320',0,0),
		   ('1.6',33,'1.6Roofing-BMN','EXPIRED: Roofing permit: BMN','','PMC 14.12.320',0,0),
		   ('1.6',34,'1.6Mechanical-MEC','EXPIRED: Mechanical permit: MEC','','PMC 14.12.320',0,0),
		   ('1.6',35,'1.6Plumbing-PLM','EXPIRED: Plumbing permit: PLM','','PMC 14.12.320',0,0),
		   ('1.7',36,'1.7','No access into: Garage, Shed, Bedroom(s), Other room:','','PMC 14.16.100',0,0),
		   
		   ('2.1',37,'2.1A','Damaged siding','','PMC 14.12.660',0,0),
		   ('2.1',38,'2.1B','Broken/cracked plaster','','PMC 14.12.660',0,0),
		   ('2.2',39,'2.2A','Broken windows','','PMC 14.12.660',0,0),
		   ('2.2',40,'2.2B','Paint finish is chipped/peeling at: Walls','','PMC 14.12.660',0,0),
		   ('2.2',41,'2.2C','Paint finish is chipped/peeling at: Eaves','','PMC 14.12.660',0,0),
		   ('2.2',42,'2.2D','Paint finish is chipped/peeling at: Window frames','','PMC 14.12.660',0,0),
		   ('2.3',43,'2.3A','Faulty weather protection','','PMC 14.12.660',0,0),
		   ('2.3',44,'2.3B','Inadequate roof covering','','PMC 14.12.660 B',0,0),
		   ('2.3',45,'2.3C','Missing exterior outlet cover plates','','PMC 14.12.630',0,0),

		   ('3.1',46,'3.1A','Not fire rated','','PMC 14.12.720',0,0),
		   ('3.1',47,'3.1B','Not self-closing','','PMC 14.12.720',0,0),
		   ('3.1',48,'3.1C','Holes in fire wall','','PMC 14.12.720',0,0),
		   ('3.1',49,'3.1D','Door into bedroom','','PMC 14.12.720',0,0),
		   ('3.2',50,'3.2A','Windows do not open','','PMC 14.12.710 B',0,0),
		   ('3.2',51,'3.2B','Double keyed deadbolt','','PMC 14.12.710 B',0,0),		   
		   ('3.2',52,'3.2C','No quick release mechanism on window bars','','PMC 14.12.710 B',0,0),
		   ('3.2',53,'3.2D','Inadequate egress','','PMC 14.12.710 B',0,0),	
		   ('3.3',54,'3.3A','No carbon monoxide detectors: Basement, Main Floor, Upper Floor','','PMC 14.12.580',0,0),
		   ('3.3',55,'3.3B','No smoke detectors: Bedroom(s), Hallway, Upper Floor, Basement','','PMC 14.12.580',0,0),
		   ('3.3',56,'3.3C','Smoke detector battery missing','','PMC 14.12.580',0,0),
		   ('3.4',57,'3.4A','No hand railing - exterior staircase','','PMC 14.12.530',0,0),
		   ('3.4',58,'3.4B','Loose hand railing','','PMC 14.12.530',0,0),
		   ('3.4',59,'3.4C','Steps loose or damaged','','PMC 14.12.530',0,0),
		   ('3.4',60,'3.4D','Rise/run improper','','PMC 14.12.530',0,0),
		   ('3.5',61,'3.5A','Excessive accumulation of combustible material','','PMC 14.12.670',0,0),
		   ('3.6',62,'3.6A','Double keyed deadbolt','','PMC 14.12.710 B',0,0),
		   ('3.6',63,'3.6B','Inadequate egress','','PMC 14.12.710 B',0,0),
		   
		   ('4.1',64,'4.1A','Natural light and ventilation','','PMC 14.12.390',0,0),
		   ('4.2',65,'4.2A','Inoperable bathroom vent fan','','PMC 14.12.450',0,0),
		   ('4.2',66,'4.2B','No bath vent','','PMC 14.12.450',0,0),
		   ('4.2',67,'4.2C','Inoperable kitchen vent fan/hood','','PMC 14.12.450',0,0),
		   
		   ('5.1',68,'5.1A','Exposed wires: Missing light fixture, Garbage disposal, Other: ','','PMC 14.12.630',0,0),
		   ('5.1',69,'5.1B','Missing knock out cover plates at electrical panel','','PMC 14.12.630',0,0),
		   ('5.2',70,'5.2A','Hazardous wiring','','PMC 14.12.630',0,0),
		   ('5.2',71,'5.2B','Electrical equipment','','PMC 14.12.550',0,0),
		   ('5.2',72,'5.2C','Exposed electrical','','PMC 14.12.630',0,0),
		   ('5.3',73,'5.3A','Bad GFCI','','PMC 14.12.630',0,0),
		   ('5.3',74,'5.3B','No GFCI','','PMC 14.12.631',0,0),
		   ('5.4',75,'5.4A','Location(s): hall closet','','PMC 14.12.630',0,0),
		   
		   ('6.1',76,'6.1A','No heating','','PMC 14.12.540',0,0),
		   ('6.1',77,'6.1B','Hazardous mechanical equipment','','PMC 14.12.650',0,0),
		   ('6.2',78,'6.2A','Improper venting','','PMC 14.12.560',0,0),
		   ('6.2',79,'6.2B','Inadequate clearance','','PMC 14.12.560',0,0),
		   ('6.2',80,'6.2C','Vent disconnected','','PMC 14.12.560',0,0),
		   ('6.2',81,'6.2D','Furnace','','PMC 14.12.560',0,0),
		   ('6.2',82,'6.2E','Water heater','','PMC 14.12.560',0,0),
		   ('6.3',83,'6.3A','Inadequate at furnace','','PMC 14.12.650',0,0),
		   ('6.3',84,'6.3B','Inadequate at water heater','','PMC 14.12.650',0,0),
		   ('6.4',85,'6.4A','No shut off','','PMC 14.12.650',0,0),

		   ('7.1',86,'7.1A','Corrosion, leaks','','PMC 14.12.640',0,0),
		   ('7.1',87,'7.1B','Bad disposal','','PMC 14.12.640',0,0),
		   ('7.1',88,'7.1C','Loose toilet','','PMC 14.12.640',0,0),
		   ('7.1',89,'7.1D','No P-trap and laundry drain pipe','','PMC 14.12.640',0,0),
		   ('7.2',90,'7.2A','No hot water','','PMC 14.12.600 E',0,0),
		   ('7.2',91,'7.2B','No cold water','','PMC 14.12.600 E',0,0),
		   ('7.3',92,'7.3A','Loose faucet : bathroom, kitchen, laundry','','PMC 14.12.600 B',0,0),
		   ('7.3',93,'7.3B','Inoperable or missing plumbing fixtures','','PMC 14.12.600 B',0,0),
		   ('7.3',94,'7.3C','Unsanitary drain board','','PMC 14.12.600 M',0,0),
		   ('7.4',95,'7.4A','No air gap','','PMC 14.12.640',0,0),
		   ('7.4',96,'7.4B','No anti-siphon','','PMC 14.12.640',0,0),
		   ('7.5',97,'7.5A','No discharge line','','PMC 14.12.640',0,0),
		   ('7.5',98,'7.5B','No strapping','','PMC 14.12.640',0,0),
		   ('7.5',99,'7.5C','Inadequate strapping','','PMC 14.12.640',0,0),
		   ('7.5',100,'7.5D','No TPRV','','PMC 14.12.640',0,0),
		   ('7.5',101,'7.5E','Bad venting','','PMC 14.12.640',0,0),
		   ('7.5',102,'7.5F','Not 18" above garage floor','','PMC 14.12.640',0,0),
		   ('7.5',103,'7.5G','Flex line protruding','','PMC 14.12.640',0,0),
		   ('7.5',104,'7.5H','Leaks','','PMC 14.12.640',0,0),
		   ('7.5',105,'7.5I','No combustion','','PMC 14.12.640',0,0),
		   
		   ('8.1',106,'8.1A','Condition of flooring','','PMC 14.12.690',0,0),
		   ('8.1',107,'8.1B','Flooring unsanitary','','PMC 14.12.690',0,0),
		   ('8.1',108,'8.1C','Flooring damaged','','PMC 14.12.690',0,0),
		   ('8.2',109,'8.2A','Roach activity','','PMC 14.12.600 L',0,0),
		   ('8.2',110,'8.2B','Rodent activity','','PMC 14.12.600 L',0,0),
		   ('8.3',111,'8.3A','Overgrown vegetation: Front yard, Back yard, Side yard','','PMC 14.12.690',0,0),
		   ('8.3',112,'8.3B','Stagnant water','','PMC 14.12.690',0,0),
		   ('8.4',113,'8.4A','Excessive junk, trash and debris present: Front yard, Back yard, Side yard','','PMC 14.12.690',0,0),
		   ('8.4',114,'8.4B','Trash cans visible from the right of way','','PMC 14.50.040 - 3',0,0),
		   ('8.5',115,'8.5A','Vents damaged/missing','','PMC 8.28.060',0,0),
		   
		   ('9.1',116,'9.1A','Pool gate not proper','','PMC 14.50.040 - 6',0,0),
		   ('9.1',117,'9.1B','No fencing','','PMC 14.50.040 - 6',0,0),
		   ('9.1',118,'9.1C','Gate does not open outward','','PMC 14.50.040 - 6',0,0),
		   ('9.1',119,'9.1D','Gate does not self-close and self-latch','','PMC 14.50.040 - 6',0,0),
		   ('9.2',120,'9.2A','Green pool','','PMC 14.12.690',0,0),

		   ('10.1',121,'10.1A','Garage conversion','','PMC 14.12.730',0,0),
		   ('10.1',122,'10.1B','Inoperable garage door','','PMC 14.12.730',0,0),
		   ('10.1',123,'10.1C','Kitchen added to garage without permit','','PMC 14.12.730',0,0),
		   ('10.1',124,'10.1D','Bathroom added to the garage without permit','','PMC 14.12.730',0,0),
		   ('10.1',125,'10.1E','Flammable flooring','','PMC 14.12.730',0,0),
		   ('10.2',126,'10.2A','SFR illegally divided','','PMC 14.12.730',0,0),

		   ('11.1',127,'11.1A','No covered parking','','PMC 17.46.040 A',0,0),

		   ('12.1',128,'12.1A','Inoperable vehicle(s) stored on the property: Make: Model:','','PMC 14.50.040 - 23',0,0)
GO

/****** Populate VIOLATIONS ******/
INSERT INTO [dbo].[VIOLATIONS]
           ([Case_Num]
           ,[SubSection_ID]
           ,[SubSection_Notes]
           ,[SubSection_Major]
           ,[SubSection_Minor])
     VALUES
           ('CC12017-00375','1.6Recessed Lighting','Recessed lighting fixtures installed without obtaining the necessary permit', 0,1),
		   ('CC12017-00375','1.6HVAC','air conditioning system installed without obtaining the necessary permits', 1,0),
		   ('CC12017-00375','1.6Deck','A deck constructed without obtaining the necessary permits', 0,1),
		   ('CC12017-00389','2.2C','Paint finish is chipped/peeling at: Eaves', 0,1),
		   ('CC12017-00389','2.3B','Inadequate roof covering', 1,0),
		   ('CC12017-00389','7.5E','Bad venting', 1,0),
		   ('CC12017-00389','10.1B','Inoperable garage door', 0,1)
GO

/****** VIEW CASE_INFO ******/
SELECT [Case_Num]
      ,[Case_Date]
      ,[Inspector_ID]
      ,[Property_ID]
      ,[Inspection_Date]
      ,[ReInspection_Date]
      ,[Inspection_Type]
      ,[Inspection_Status]
      ,[Citation_Charges]
      ,[Inspector_Notes]
      ,[Inspector_Signature]
      ,[Cert_IssueDate]
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
      ,[Sidewalk_Fee]
  FROM [dbo].[PROPERTY_INFO]
GO

/****** VIEW CL_Section ******/
SELECT [SectionSeq_ID]
	   ,[Section_ID]
       ,[Section_Name]
  FROM [dbo].[CL_Section]
GO

/****** VIEW CL_SectionDetail ******/
SELECT [Section_ID]
	  ,[SubSectionSeq_ID]
      ,[SubSection_ID]
      ,[SubSection_Desc]
      ,[SubSection_Notes]
      ,[SubSection_Code]
      ,[SubSection_Major]
      ,[SubSection_Minor]
  FROM [dbo].[CL_SectionDetail]
GO

/****** VIEW VIOLATIONS ******/
SELECT [Case_Num]
      ,[SubSection_ID]
      ,[SubSection_Notes]
      ,[SubSection_Major]
      ,[SubSection_Minor]
  FROM [dbo].[VIOLATIONS]
GO