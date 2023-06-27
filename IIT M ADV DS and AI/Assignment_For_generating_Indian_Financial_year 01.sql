DECLARE @Current_DateTime DATETIME = SYSDATETIMEOFFSET() AT TIME ZONE 'India Standard Time'; -- GETDATE()
DECLARE @Today DATETIME, @nMonths TINYINT

-- SET @Current_DateTime='20200312'; -- uncomment this line to test with your desired date.
-- SET @Today = SYSDATETIMEOFFSET() AT TIME ZONE 'India Standard Time' --GETDATE()
SET @Today = (SELECT DATEFROMPARTS(Yr, 4, 1) 
                FROM (SELECT CASE WHEN DATEPART(MONTH, @Current_DateTime ) < 4 
                                  THEN DATEPART(YEAR, @Current_DateTime ) - 1 
                                  ELSE DATEPART(YEAR, @Current_DateTime ) END Yr) a ) 
SET @nMonths = 12

SELECT MonthEndDate = DATEADD(MONTH, n.n + DATEDIFF(MONTH, 0, @Today)-1, 0)
  FROM (SELECT TOP(@nMonths) n = ROW_NUMBER() OVER (ORDER BY NAME) FROM master.dbo.syscolumns) n

--SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0) AS [1st day of current month]

--SELECT MonthEndDate = DATEADD(MONTH, n.n + DATEDIFF(MONTH, 0, @Today),0)
--  FROM (SELECT TOP(@nMonths) n = ROW_NUMBER() OVER (ORDER BY NAME) FROM master.dbo.syscolumns) n

SELECT DATEFROMPARTS(Yr, 4, 1) AS FinancialYear_StartDate
     , DATEFROMPARTS(Yr + 1, 3, 31) AS FinancialYear_EndDate
     , CONCAT(Yr,'-',Yr+1) AS FinancialYear
  FROM (SELECT CASE WHEN DATEPART(MONTH, @Current_DateTime ) < 4 
               THEN DATEPART(YEAR, @Current_DateTime ) - 1 
               ELSE DATEPART(YEAR, @Current_DateTime ) END Yr) a;

--SELECT TOP 12 n = ROW_NUMBER() OVER (ORDER BY NAME) FROM master.dbo.syscolumns

--SELECT DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0) --First day of previous month
--SELECT DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-1, -1) --Last Day of previous month

DECLARE @Current_DateTime DATETIME= SYSDATETIMEOFFSET() AT TIME ZONE 'India Standard Time'; -- GETDATE()
--	SET @Current_DateTime='20200312'; -- uncomment this line to test with your desired date.

SELECT DATEFROMPARTS(Yr, 4, 1) AS FinancialYear_StartDate,
DATEFROMPARTS(Yr + 1, 3, 31) AS FinancialYear_EndDate,
CONCAT(Yr,'-',Yr+1) AS FinancialYear
FROM 
(SELECT CASE WHEN DATEPART(MONTH, @Current_DateTime ) < 4 
THEN DATEPART(YEAR, @Current_DateTime ) - 1 ELSE DATEPART(YEAR, @Current_DateTime ) END Yr) a;


DECLARE @start DATE, @end DATE, @fyear VARCHAR(10)
SET @start =  (SELECT DATEFROMPARTS(Yr, 4, 1) 
                 FROM (SELECT CASE WHEN DATEPART(MONTH, @Current_DateTime ) < 4 
                              THEN DATEPART(YEAR, @Current_DateTime ) - 1 ELSE 
							  DATEPART(YEAR, @Current_DateTime ) END Yr) a)
SET @end = (SELECT DATEFROMPARTS(Yr + 1, 3, 31) 
                 FROM (SELECT CASE WHEN DATEPART(MONTH, @Current_DateTime ) < 4 
                              THEN DATEPART(YEAR, @Current_DateTime ) - 1 ELSE 
							  DATEPART(YEAR, @Current_DateTime ) END Yr) a)

SET @fyear = (SELECT CONCAT(Yr,'-',Yr+1) 
                 FROM (SELECT CASE WHEN DATEPART(MONTH, @Current_DateTime ) < 4 
                              THEN DATEPART(YEAR, @Current_DateTime ) - 1 ELSE 
							  DATEPART(YEAR, @Current_DateTime ) END Yr) a)

;WITH months (date1, date2)
AS
(
    SELECT @start, EOMONTH(@start)
    UNION ALL
    SELECT DATEADD(MONTH, 1, date1),EOMONTH(DATEADD(MONTH, 1, date1))
     FROM months
    WHERE DATEADD(MONTH, 1, date1) <= EOMONTH(@end)
)
SELECT IIF(date1 = @start, @start, DATEADD(DAY, 1, EOMONTH(date1, -1))) StartDate,
       IIF(date2 > @end, @end, date2) EndDate, 
	   @fyear AS FinancialYear
  FROM months
