--Aggregate Functions (Transact-SQL)
--https://learn.microsoft.com/en-us/sql/t-sql/functions/aggregate-functions-transact-sql?view=sql-server-ver16
USE AdventureWorks2019
GO

--APPROX_COUNT_DISTINCT
SELECT APPROX_COUNT_DISTINCT(O_OrderKey) AS Approx_Distinct_OrderKey
FROM dbo.Orders;

--AVG
SELECT AVG(VacationHours)AS 'Average vacation hours',   
    SUM(SickLeaveHours) AS 'Total sick leave hours'  
FROM HumanResources.Employee  
WHERE JobTitle LIKE 'Vice President%'; 

--CHECKSUM_AGG
SELECT CHECKSUM_AGG(CAST(Quantity AS INT))  
FROM Production.ProductInventory;  
GO  

--COUNT
--COUNT_BIG
--GROUPING
--GROUPING_ID
--MAX
--MIN
--STDEV
--STDEVP
--STRING_AGG
--SUM
--VAR
--VARP
