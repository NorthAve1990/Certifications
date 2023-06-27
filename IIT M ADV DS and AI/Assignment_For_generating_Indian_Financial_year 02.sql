DECLARE @Current_DateTime DATETIME= SYSDATETIMEOFFSET() AT TIME ZONE 'India Standard Time';
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
