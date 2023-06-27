USE IITMDSAIDB
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE NAME = 'PROGRAMMER' AND xtype = 'U')
CREATE TABLE [dbo].[PROGRAMMER] (
   [PNAME] VARCHAR(30) NULL,
   [DOB] DATE NULL,
   [DOJ] DATE NULL,
 --[GENDER]  VARCHAR(30) NULL,
   [GENDER]  VARCHAR(1) NULL,
   [PROF1]  VARCHAR(30) NULL,
   [PROF2] VARCHAR(30) NULL,
   [SALARY] INT NULL
)
GO

--ALTER TABLE [dbo].[PROGRAMMER]
--ALTER COLUMN [GENDER] VARCHAR(1)

INSERT INTO [dbo].[PROGRAMMER] ([PNAME], [DOB], [DOJ], [GENDER], [PROF1], [PROF2], [SALARY]) VALUES ('ANAND', '12-Apr-66', '21-Apr-92', 'M', 'PASCAL', 'BASIC', 3200);
INSERT INTO [dbo].[PROGRAMMER] ([PNAME], [DOB], [DOJ], [GENDER], [PROF1], [PROF2], [SALARY]) VALUES ('ALTAF', '02-Jul-64', '13-Nov-90', 'M', 'CLIPPER', 'COBOL', 2800);
INSERT INTO [dbo].[PROGRAMMER] ([PNAME], [DOB], [DOJ], [GENDER], [PROF1], [PROF2], [SALARY]) VALUES ('JULIANA', '31-Jan-60', '21-Apr-90', 'F', 'COBOL', 'DBASE', 3000);
INSERT INTO [dbo].[PROGRAMMER] ([PNAME], [DOB], [DOJ], [GENDER], [PROF1], [PROF2], [SALARY]) VALUES ('KAMALA', '30-Oct-68', '02-Jan-92', 'F', 'C', 'DBASE', 2900);
INSERT INTO [dbo].[PROGRAMMER] ([PNAME], [DOB], [DOJ], [GENDER], [PROF1], [PROF2], [SALARY]) VALUES ('MARY', '24-Jun-70', '01-Feb-91', 'F', 'CPP', 'ORACLE', 4500);
INSERT INTO [dbo].[PROGRAMMER] ([PNAME], [DOB], [DOJ], [GENDER], [PROF1], [PROF2], [SALARY]) VALUES ('NELSON', '11-Sep-85', '11-Oct-89', 'M', 'COBOL', 'DBASE', 2500);
INSERT INTO [dbo].[PROGRAMMER] ([PNAME], [DOB], [DOJ], [GENDER], [PROF1], [PROF2], [SALARY]) VALUES ('PATTRICK', '10-Nov-65', '21-Apr-90', 'M', 'PASCAL', 'CLIPPER', 2800);
INSERT INTO [dbo].[PROGRAMMER] ([PNAME], [DOB], [DOJ], [GENDER], [PROF1], [PROF2], [SALARY]) VALUES ('QADIR', '31-Aug-65', '21-Apr-91', 'M', 'ASSEMBLY', 'C', 3000);
INSERT INTO [dbo].[PROGRAMMER] ([PNAME], [DOB], [DOJ], [GENDER], [PROF1], [PROF2], [SALARY]) VALUES ('RAMESH', '03-May-67', '28-Feb-91', 'M', 'PASCAL', 'DBASE', 3200);
INSERT INTO [dbo].[PROGRAMMER] ([PNAME], [DOB], [DOJ], [GENDER], [PROF1], [PROF2], [SALARY]) VALUES ('REBECCA', '01-Jan-67', '01-Dec-90', 'F', 'BASIC', 'COBOL', 2500);
INSERT INTO [dbo].[PROGRAMMER] ([PNAME], [DOB], [DOJ], [GENDER], [PROF1], [PROF2], [SALARY]) VALUES ('REMITHA', '19-Apr-70', '20-Apr-93', 'F', 'C', 'ASSEMBLY', 3600);
INSERT INTO [dbo].[PROGRAMMER] ([PNAME], [DOB], [DOJ], [GENDER], [PROF1], [PROF2], [SALARY]) VALUES ('REVATHI', '02-Dec-69', '02-Jan-92', 'F', 'PASCAL', 'BASIC', 3700);
INSERT INTO [dbo].[PROGRAMMER] ([PNAME], [DOB], [DOJ], [GENDER], [PROF1], [PROF2], [SALARY]) VALUES ('VIJAYA', '14-Dec-65', '02-May-92', 'F', 'FOXPRO', 'C', 3500);