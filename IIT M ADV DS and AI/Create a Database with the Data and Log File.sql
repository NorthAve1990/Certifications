--Create a SQL Server Database with the data and log files on different drives 
--https://www.mssqltips.com/sqlservertip/7304/create-database-sql-server/

USE master 
GO  
  
-- Create database syntax with more specific options 
CREATE DATABASE [IITMDSAIDB]  
ON   
(NAME = N'IITMDSAIDB',  -- Logical name of the Data file 
    FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\IITMDSAIDB.mdf',  -- The operating system file name 
    SIZE = 10,  -- The size of the file 
    MAXSIZE = 20,  -- The maximum size to which the file can grow, the default is MB 
    FILEGROWTH = 2)  -- The automatic growth increment of the file, the default is MB 
LOG ON  
(NAME = N'IITMDSAIDB_log',  -- Logical name of the Log file 
    FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\IITMDSAIDB_Log.ldf', -- The operating system file name 
    SIZE = 5,  -- The size of the file 
    MAXSIZE = 20,  -- The maximum size to which the file can grow, the default is MB 
    FILEGROWTH = 2);  -- The automatic growth increment of the file, the default is MB 
GO 

/*
--Remove the Database after use 
--Change to the master database 
USE master; 
GO  
  
--Drop a Database and close connections to it 
BEGIN TRY 
   ALTER DATABASE IITMDSAIDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE 
   DROP DATABASE IF EXISTS IITMDSAIDB 
   PRINT 'DATABASE IITMDSAIDB dropped!' 
END TRY 
BEGIN CATCH 
   PRINT 'DATABASE IITMDSAIDB not available to drop' 
END CATCH; 
GO 
*/