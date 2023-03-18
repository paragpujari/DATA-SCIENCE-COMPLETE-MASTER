-------------------------TEMPORARY TABLES--------------------------------------------
SELECT * FROM Employeeeeeees;

-------------1. LOCAL TEMPORARY TABLES---------------
DROP TABLE  if exists #temp;

SELECT * INTO #temp FROM Employeeeeeees;

SELECT * FROM #temp;


--------- 2. GLOBAL TEMPORARY TABLES-------------------
DROP TABLE IF EXISTS ##global_temp;

SELECT * INTO ##global_temp FROM Employeeeeeees;

SELECT * FROM ##global_temp;