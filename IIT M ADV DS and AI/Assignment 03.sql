--1. How many Programmers Don’t know PASCAL and C
SELECT COUNT([PNAME]) AS [Programmers Count]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]
 WHERE ([PROF1] != 'PASCAL' OR [PROF1] != 'C')
   AND ([PROF2] != 'PASCAL' OR [PROF2] != 'C')

--2. Display the details of those who don’t know Clipper, COBOL or PASCAL.
SELECT [PNAME]
     , [DOB]
     , [DOJ]
     , [GENDER]
     , [PROF1]
     , [PROF2]
     , [SALARY]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]
 WHERE ([PROF1] NOT IN ('CLIPPER', 'COBOL', 'PASCAL')
   AND  [PROF2] NOT IN ('CLIPPER', 'COBOL', 'PASCAL'))
 ORDER BY [PNAME]

--3. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.
SELECT [PNAME]
     , [TITLE]
     , [DEVELOPIN]
     , AVG([SCOST]) AS [Average Selling Coast]
     , AVG([DCOST]) AS [Average Development Coast]
     , AVG([SOLD]) AS [Average Price Per Copy]
  FROM [IITMDSAIDB].[dbo].[SOFTWARE]
 GROUP BY [PNAME], [TITLE], [DEVELOPIN]

--4. List the programmer names (from the programmer table) and No. Of Packages each has developed.
SELECT PR.[PNAME] AS [Programmer Name]
     , COUNT(SW.[TITLE]) AS [Number Of Packages]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER] PR
  JOIN [IITMDSAIDB].[dbo].[SOFTWARE] SW ON PR.[PNAME] = SW.[PNAME]
 GROUP BY PR.[PNAME]
 ORDER BY [Number Of Packages] DESC

--5. List each PROFIT with the number of Programmers having that PROF and the number of the packages in that PROF.
;WITH PROFIT AS (
SELECT [PNAME]
     , [TITLE]
     , [DEVELOPIN]
     , [SCOST]
     , [DCOST]
     , [SOLD]
	 , ([SCOST] * [SOLD]) AS [Sellecting Cost]
	 , (([SCOST] * [SOLD]) - [DCOST]) AS [Total Profit]
	 , ROUND((([SCOST] * [SOLD]) - [DCOST]) / NULLIF([SOLD], 0), -1) AS [Profit Per Copy]
  FROM [IITMDSAIDB].[dbo].[SOFTWARE]
)
SELECT PR.[PNAME] AS [Programmer Name]
	 , SW.[Profit Per Copy]
	 , COUNT(SW.[SCOST]) AS [Number of Programmers having that PROF]
     , COUNT(SW.[TITLE]) AS [Number Of Packages in that PROF]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER] PR
  JOIN [PROFIT] SW ON PR.[PNAME] = SW.[PNAME]
 GROUP BY PR.[PNAME], SW.[Profit Per Copy]
 ORDER BY [Number Of Packages in that PROF] DESC

--6. How many packages are developed by the most experienced programmer form BDPS.
SELECT [PNAME]
     , [TITLE]
     , [DEVELOPIN]
     , [SCOST]
     , [DCOST]
     , [SOLD]
  FROM [IITMDSAIDB].[dbo].[SOFTWARE]
 WHERE [PNAME] = (
SELECT [PNAME] 
  FROM (
SELECT PR.[PNAME]
     , [DOB]
     , [DOJ]
     , [GENDER]
     , [PROF1]
     , [PROF2]
     , [SALARY]
	 , ST.[INSTITUTE]
     , DATEDIFF(YEAR, [DOJ], GETDATE()) AS [Experience in Years]
	 , RANK() OVER( ORDER BY DATEDIFF(YEAR, [DOJ], GETDATE()) DESC) AS [Ranks]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER] PR
  JOIN [IITMDSAIDB].[dbo].[STUDIES] ST ON PR.[PNAME] = ST.[PNAME]
 WHERE ST.[INSTITUTE] = 'BDPS'
) EX
 WHERE [Ranks] = 1 
--ORDER BY [Experience in Years] DESC
 )

--7. How many packages were developed by the female programmers earning more than the highest paid male programmer?
SELECT [TITLE]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER] PR
  JOIN [IITMDSAIDB].[dbo].[SOFTWARE] SW ON PR.[PNAME] = SW.[PNAME]
 WHERE [GENDER] = 'F'
   AND [SALARY] > (
SELECT DISTINCT [Highest Paid Male Programmer]
  FROM (
SELECT [PNAME]
     , MAX([SALARY]) AS [Highest Paid Male Programmer]
	 , RANK() OVER(ORDER BY MAX([SALARY]) DESC) AS [Ranks]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]
 WHERE [GENDER] = 'M'
 GROUP BY [PNAME]
--ORDER BY [Highest Paid Male Programmer] DESC
) HPMP
 WHERE [Ranks] = 1
)

--8. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo.
--9. In which institute did the person who developed the costliest package study?
--10. Display the names of the programmers who have not developed any packages.
--11. Display the details of the software that has developed in the language which is neither the first nor the second proficiency
--12. Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975
--13. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise.
--14. Display the details of the Software Developed by the Male Programmers Earning More than 3000.
--15. Who are the Female Programmers earning more than the Highest Paid male?
--16. Who are the male programmers earning below the AVG salary of Female Programmers?
--17. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package.
--18. Display the names of the packages, which have sold less than the AVG number of copies.
--19. Which is the costliest package developed in PASCAL.
--20. How many copies of the package that has the least difference between development and selling cost were sold.
--21. Which language has been used to develop the package, which has the highest sales amount?
--22. Who Developed the Package that has sold the least number of copies?
--23. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee
--24. Display the name of the Institute and Course, which has below AVG course fee.
--25. Which Institute conducts costliest course.
--26. What is the Costliest course?



SELECT [PNAME]
     , [INSTITUTE]
     , [COURSE]
     , [COURSE FEE]
  FROM [IITMDSAIDB].[dbo].[STUDIES]

SELECT [PNAME]
     , [TITLE]
     , [DEVELOPIN]
     , [SCOST]
     , [DCOST]
     , [SOLD]
  FROM [IITMDSAIDB].[dbo].[SOFTWARE]

SELECT [PNAME]
     , [DOB]
     , [DOJ]
     , [GENDER]
     , [PROF1]
     , [PROF2]
     , [SALARY]
  FROM [IITMDSAIDB].[dbo].[PROGRAMMER]
