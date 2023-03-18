use happy;

---------------------------------------STRING AGGREGRAION---------------------------------------------------------
SELECT * FROM Employeeeeeees

SELECT STRING_AGG(Emp_Name, '-') as name , STRING_AGG(Emp_City, '_') as city FROM Employeeeeeees;

