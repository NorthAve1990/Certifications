--1. Find out the selling cost AVG for packages developed in Pascal.
SELECT [TITLE]
     , AVG([SCOST]) [Average Selling Cost]
  FROM [IITMDSAIDB].[dbo].[SOFTWARE]
 WHERE [DEVELOPIN] = 'PASCAL'
 GROUP BY [TITLE]

--2. Display Names, Ages of all Programmers.
SELECT [PNAME]
     , DATEDIFF(YEAR, [DOB], GETDATE()) AS [AGE]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]

--3. Display the Names of those who have done the DAP Course.
SELECT [PNAME]
     , [COURSE]
  FROM [IITMDSAIDB].[dbo].[STUDIES]
 WHERE [COURSE] = 'DAP'

--4. Display the Names and Date of Births of all Programmers Born in January.
SELECT [PNAME]
     , [DOB] 
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]
 WHERE MONTH([DOB]) = '01'

--5. Display the Details of the Software Developed by Ramesh.
SELECT [PNAME]
     , [TITLE]
     , [DEVELOPIN]
     , [SCOST]
     , [DCOST]
     , [SOLD]
  FROM [IITMDSAIDB].[dbo].[SOFTWARE]
 WHERE [PNAME] = 'RAMESH'

--6. Display the Details of Packages for which Development Cost have been recovered.
SELECT [PNAME]
     , [TITLE]
     , [DEVELOPIN]
     , [SCOST]
	 , ([SCOST] * [SOLD]) AS [COST SOLD] 
     , [DCOST]
     , [SOLD]
  FROM [IITMDSAIDB].[dbo].[SOFTWARE]
 WHERE ([SCOST] * [SOLD]) >= [DCOST]

--7. Display the details of the Programmers Knowing C.
SELECT [PNAME]
     , [DOB]
     , [DOJ]
     , [GENDER]
     , [PROF1]
     , [PROF2]
     , [SALARY]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]
 WHERE [PROF1] = 'C'
    OR [PROF2] = 'C'

--8. What are the Languages studied by Male Programmers?
SELECT [PNAME]
     , [DOB]
     , [DOJ]
     , [GENDER]
     , [PROF1]
     , [PROF2]
     , [SALARY]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]
 WHERE [GENDER] = 'M'

--9. Display the details of the Programmers who joined before 1990.
SELECT [PNAME]
     , [DOB]
     , [DOJ]
     , [GENDER]
     , [PROF1]
     , [PROF2]
     , [SALARY]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]
 WHERE YEAR([DOJ]) = '1990'

--10. Who are the authors of the Packages, which have recovered more than double the Development cost?
SELECT [PNAME]
     , [TITLE]
     , [SCOST]
	 , ([SCOST] * [SOLD]) AS [COST SOLD] 
     , [DCOST]
     , ([DCOST] * 2) AS [DOUBLE DCOST]
     , [SOLD]
  FROM [IITMDSAIDB].[dbo].[SOFTWARE]
 WHERE ([SCOST] * [SOLD]) >= ([DCOST] * 2)
   AND [TITLE] LIKE 'PKG%'
 ORDER BY [DOUBLE DCOST] DESC

