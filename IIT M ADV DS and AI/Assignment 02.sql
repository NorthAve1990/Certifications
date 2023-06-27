--1) What is the Highest Number of copies sold by a Package?
SELECT TOP 1 [TITLE]
     , SUM([SOLD]) AS [Highest Number of copies sold by a Package]
  FROM [IITMDSAIDB].[dbo].[SOFTWARE]
 GROUP BY [TITLE]
 ORDER BY [Highest Number of copies sold by a Package] DESC

--2) Display lowest course Fee.
SELECT TOP 1 [COURSE]
     , MIN([COURSE FEE]) AS [Lowest Course Fee]
  FROM [IITMDSAIDB].[dbo].[STUDIES]
 GROUP BY [COURSE]
 ORDER BY [Lowest Course Fee]

--3) How old is the Oldest Male Programmer.
SELECT TOP 1 [PNAME]
     , [DOB]
     , [DOJ]
     , [GENDER]
     , [PROF1]
     , [PROF2]
     , [SALARY]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]
 WHERE [GENDER]  = 'M'
 ORDER BY [DOB]

--4) What is the AVG age of Female Programmers?
SELECT AVG(DATEDIFF(YEAR, [DOB], GETDATE())) AS [Aerage age of Female Programmers]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]
 WHERE [GENDER]  = 'F'

--5) Calculate the Experience in Years for each Programmer and Display with their names in Descending order.
SELECT [PNAME]
	 , [DOJ]
     , DATEDIFF(YEAR, [DOJ], GETDATE()) AS [Experience in Years]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]
 ORDER BY [Experience in Years] DESC

--6) How many programmers have done the PGDCA Course?
SELECT COUNT(1) AS [Programmers have done the PGDCA]
  FROM [IITMDSAIDB].[dbo].[STUDIES]
 WHERE [COURSE] = 'PGDCA'

--7) How much revenue has been earned thru sales of Packages Developed in C.
SELECT [DEVELOPIN] AS [Packages Developed]
     , SUM(([SCOST] * [SOLD])) AS [Revenue has been earned thru Sales of Packages Developed in C]
  FROM [IITMDSAIDB].[dbo].[SOFTWARE]
 WHERE [DEVELOPIN] = 'C'
 GROUP BY [DEVELOPIN]

--8) How many Programmers Studied at Sabhari?
SELECT [INSTITUTE]
     , COUNT(1) AS [Programmers Studied]
  FROM [IITMDSAIDB].[dbo].[STUDIES]
 WHERE [INSTITUTE] = 'Sabhari'
 GROUP BY [INSTITUTE]

--9) How many Packages Developed in DBASE?
SELECT [DEVELOPIN]
     , COUNT(1) AS [Packages Developed]
  FROM [IITMDSAIDB].[dbo].[SOFTWARE]
 WHERE [DEVELOPIN] = 'DBASE'
 GROUP BY [DEVELOPIN]

--10) How many programmers studied in Pragathi?
SELECT [INSTITUTE]
     , COUNT(1) AS [Programmers Studied]
  FROM [IITMDSAIDB].[dbo].[STUDIES]
 WHERE [INSTITUTE] = 'Pragathi'
 GROUP BY [INSTITUTE]

--11) How many Programmers Paid 5000 to 10000 for their course?
SELECT COUNT(1) AS [Programmers Paid 5000 to 10000 for their course]
  FROM [IITMDSAIDB].[dbo].[STUDIES]
 WHERE [COURSE FEE] BETWEEN 5000 AND 10000

--12) How many Programmers know either COBOL or PASCAL?
SELECT COUNT(1) AS [Programmers know either COBOL or PASCAL]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]
 WHERE ([PROF1] IN ('COBOL', 'PASCAL')
    OR  [PROF2] IN ('COBOL', 'PASCAL'))

--13) How many Female Programmers are there?
SELECT COUNT(1) AS [Female Programmers]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]
 WHERE [GENDER] = 'F'

--14) What is the AVG Salary?
SELECT AVG([SALARY]) AS [Average Salary]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]

--15) How many people draw salary 2000 to 4000?
SELECT COUNT(1) AS [People Draw Salary 2000 to 4000]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]
 WHERE [SALARY] BETWEEN 2000 AND 5000 

--16) Display the sales cost of the packages Developed by each Programmer Language wise
SELECT [TITLE]
     , [PNAME]
     , [SCOST]
  FROM [IITMDSAIDB].[dbo].[SOFTWARE]
 ORDER BY [PNAME], [TITLE]

--17) Display the details of the software developed by the male students of Sabhari.
SELECT [TITLE]
     , [DEVELOPIN]
     , PR.[PNAME]
	 , [GENDER]
	 , [INSTITUTE]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER] PR
  JOIN [IITMDSAIDB].[dbo].[SOFTWARE] SW ON PR.[PNAME] = SW.[PNAME]
  JOIN [IITMDSAIDB].[dbo].[STUDIES] ST ON PR.[PNAME] = ST.[PNAME]
 WHERE [GENDER] = 'M'
   AND [INSTITUTE] = 'SABHARI'

--18) Who is the oldest Female Programmer who joined in 1992?
SELECT TOP 1 [PNAME]
     , [DOB]
     , [DOJ]
     , [GENDER]
     , MAX(DATEDIFF(YEAR, [DOB], GETDATE())) AS [AGE]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]
 WHERE YEAR([DOJ]) = '1992'
   AND [GENDER] = 'F'
 GROUP BY [PNAME], [DOB], [DOJ], [GENDER]
 ORDER BY [AGE] DESC

--19) Who is the youngest male Programmer born in 1965?
SELECT TOP 1 [PNAME]
     , [DOB]
     , [DOJ]
     , [GENDER]
     , MIN(DATEDIFF(YEAR, [DOB], GETDATE())) AS [AGE]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]
 WHERE YEAR([DOB]) = '1965'
   AND [GENDER] = 'M'
 GROUP BY [PNAME], [DOB], [DOJ], [GENDER]
 ORDER BY [DOB] DESC

--20) Which Package has the lowest selling cost?
SELECT TOP 1 [TITLE]
     , MIN([SCOST]) AS [Lowest Selling Cost]
  FROM [IITMDSAIDB].[dbo].[SOFTWARE]
 GROUP BY [TITLE]
 ORDER BY [Lowest Selling Cost]

--21) Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE?
SELECT [PNAME]
     , [DOB]
     , [DOJ]
     , [GENDER]
     , [PROF1]
     , [PROF2]
     , [SALARY]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]
 WHERE ([PROF1] NOT IN ('C', 'C++', 'ORACLE', 'DBASE')
    OR [PROF2] NOT IN ('C', 'C++', 'ORACLE', 'DBASE'))
   AND [GENDER] = 'F'
   AND [SALARY] > 3000
 ORDER BY [SALARY] DESC

--22) Who is the Youngest Programmer knowing DBASE?
SELECT TOP 1 [PNAME]
     , [DOB]
     , [PROF1]
     , [PROF2]
     , MIN(DATEDIFF(YEAR, [DOB], GETDATE())) AS [AGE]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]
 WHERE ([PROF1] = 'DBASE' OR [PROF2] = 'DBASE')
 GROUP BY [PNAME], [DOB], [PROF1], [PROF2]
 ORDER BY [AGE]

--23) Which Language is known by only one Programmer?
;WITH LK AS
(
SELECT [PNAME] AS [Programmer]
     , [PROF1] AS [Language Known]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]
UNION ALL
SELECT [PNAME] AS [Programmer]
     , [PROF2] AS [Language Known]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]
),
PC AS
(
SELECT [Language Known]
	 , COUNT([Language Known]) AS [Language Known Count]
  FROM LK
 GROUP BY [Language Known]
),
LKC AS
(
SELECT [Language Known]
     , [Language Known Count]
  FROM PC
 WHERE [Language Known Count] = 1
)
SELECT [Programmer]
     , LKC.[Language Known]
     , [Language Known Count]
  FROM LKC
  JOIN LK ON LKC.[Language Known] = LK.[Language Known]
 GROUP BY [Programmer], LKC.[Language Known], [Language Known Count]
HAVING COUNT([Programmer]) = 1 

--24) Who is the most experienced male programmer knowing PASCAL?
SELECT TOP 1 [PNAME]
     , [DOJ]
     , [GENDER]
     , [PROF1]
     , [PROF2]
     , MAX(DATEDIFF(YEAR, [DOJ], GETDATE())) AS [Experience]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]
 WHERE ([PROF1] = 'PASCAL' OR [PROF2] = 'PASCAL')
   AND [GENDER] = 'M'
 GROUP BY [PNAME], [DOJ], [GENDER], [PROF1], [PROF2]
 ORDER BY [Experience] DESC
  
--25) Who is the least experienced Programmer?
SELECT TOP 1 [PNAME]
     , [DOJ]
     , MIN(DATEDIFF(YEAR, [DOJ], GETDATE())) AS [Experience]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]
 GROUP BY [PNAME], [DOJ], [GENDER], [PROF1], [PROF2]
 ORDER BY [Experience]

--26) Display the Number of Packages in Each Language for which Development Cost is less than 1000.
SELECT [TITLE]
     , [DEVELOPIN]
     , [DCOST]
  FROM [IITMDSAIDB].[dbo].[SOFTWARE]
 WHERE [DCOST] < 1000
 GROUP BY [DEVELOPIN], [TITLE], [DCOST]

--27) Display Highest, Lowest and Average Salaries for those earning more than 2000.
SELECT [PNAME]
     , MAX([SALARY]) AS [Highest Salaries]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]
 GROUP BY [PNAME], [SALARY]
 HAVING [SALARY] > 2000

SELECT [PNAME]
     , MIN([SALARY]) AS [Lowest Salaries]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]
 GROUP BY [PNAME], [SALARY]
 HAVING [SALARY] > 2000

SELECT [PNAME]
     , AVG([SALARY]) AS [Average Salaries]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]
 GROUP BY [PNAME], [SALARY]
 HAVING [SALARY] > 2000
