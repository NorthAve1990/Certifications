USE [IITMDSAIDB]
GO

/****** Object:  Table [dbo].[adult]    Script Date: 6/4/2023 9:39:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[adult](
	[age] [money] NULL,
	[workclass] [varchar](20) NULL,
	[fnlwgt] [int] NULL,
	[education] [varchar](20) NULL,
	[educational-num] [int] NULL,
	[marital-status] [varchar](25) NULL,
	[occupation] [varchar](20) NULL,
	[relationship] [varchar](20) NULL,
	[race] [varchar](20) NULL,
	[gender] [varchar](10) NULL,
	[capital-gain] [int] NULL,
	[capital-loss] [int] NULL,
	[hours-per-week] [int] NULL,
	[native-country] [varchar](30) NULL,
	[income] [varchar](10) NULL
) ON [PRIMARY]
GO


