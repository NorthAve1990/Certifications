BEGIN TRY
   IF NOT EXISTS (SELECT * FROM sysobjects WHERE NAME = '#rand_digits' AND xtype = 'U')
   DROP TABLE #rand_digits
END TRY

BEGIN CATCH
   PRINT '#rand_digits not available to drop'
END CATCH

CREATE TABLE #rand_digits
(
  id_num INT IDENTITY(1, 1),
  prefix VARCHAR(2),
  suffix INT
)

INSERT INTO #rand_digits (prefix, suffix) VALUES ('US', 9572);
INSERT INTO #rand_digits (prefix, suffix) VALUES ('IN', 518);
INSERT INTO #rand_digits (prefix, suffix) VALUES ('UK', 5593144);
INSERT INTO #rand_digits (prefix, suffix) VALUES ('ML', 48640);
INSERT INTO #rand_digits (prefix, suffix) VALUES ('SG', 54);
INSERT INTO #rand_digits (prefix, suffix) VALUES ('ID', 6558);
INSERT INTO #rand_digits (prefix, suffix) VALUES ('RS', 2932064);
INSERT INTO #rand_digits (prefix, suffix) VALUES ('UR', 1027910);

--DECLARE @min_integer INT = 100000
--      , @max_integer INT = 10000000
--      , @loop_ctr INT = 0
--      , @max_loop_ctr INT = 9
 
--WHILE @loop_ctr < @max_loop_ctr
--BEGIN

--   UPDATE #rand_digits
--   SET suffix = (SELECT FLOOR(RAND()*(@max_integer - @min_integer + 1) + @min_integer))
--   WHERE id_num = @loop_ctr

--   SET @loop_ctr = @loop_ctr + 1 

--END

SELECT CONCAT(prefix, REPLACE(STR(suffix, 10),' ','0')) AS [ID]
     , LEN(CONCAT(prefix, REPLACE(STR(suffix, 10),' ','0'))) AS [Length]
  FROM #rand_digits
