----------------------------------------------------------COMMON TABLE EXPRESSION-------------------------------------------------

--------------- 1. NON-RECURSIVE CTE--------------------------------------

use happy;

CREATE TABLE Emp_Details_cte(
id INT IDENTITY(1,1),
Name NVARCHAR(50),
Gender NVARCHAR(50) NOT NULL,
Salary INT NOT NULL);

INSERT INTO Emp_Details_cte VALUES('Mark','Male',1000);
INSERT INTO Emp_Details_cte VALUES('John','Male',2000);
INSERT INTO Emp_Details_cte VALUES('Pam','Female',3000);
INSERT INTO Emp_Details_cte VALUES('Sara','Female',4000);
INSERT INTO Emp_Details_cte VALUES('Todd','Male',5000);
INSERT INTO Emp_Details_cte VALUES('Mary','Female',6000);
INSERT INTO Emp_Details_cte VALUES('Ben','Male',7000);
INSERT INTO Emp_Details_cte VALUES('Jodi','Female',8000);
INSERT INTO Emp_Details_cte VALUES('Tom','Male',9000);
INSERT INTO Emp_Details_cte VALUES('Ron','Male',9500);

SELECT * FROM Emp_Details_cte;

------------------Write a query to calculate the minimum, maximum, total, average of salary for male and female employees------------------------
;with cte1 as(
SELECT id, Name, Gender, Salary,
MIN(Salary) OVER(PARTITION BY Gender ORDER BY id ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as minimum ,
MAX(Salary) OVER(PARTITION BY Gender ORDER BY id ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as maximum ,
SUM(Salary) OVER(PARTITION BY Gender ORDER BY id ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as total   ,
AVG(Salary) OVER(PARTITION BY Gender ORDER BY id ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as average
FROM Emp_Details_cte
)
select * from cte1


;with cte2 as(
SELECT id, Name, Gender, Salary,
MIN(Salary) OVER (PARTITION BY Gender ORDER BY ID ASC ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) as minimum ,
Max(Salary) OVER (PARTITION BY Gender ORDER BY ID ASC ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) as maximum ,
SUM(Salary) OVER (PARTITION BY Gender ORDER BY ID ASC ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) as Total   ,
AVG(Salary) OVER (PARTITION BY Gender ORDER BY ID ASC ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) as average
FROM 
Emp_Details_cte
)
select * from cte2;


----------------------------------------------RECURSIVE CTE---------------------------------------------------------------------------
CREATE TABLE Employeescte(
EmployeeID INT,
FirstName  VARCHAR(30),
ManagerID  INT
);

INSERT INTO Employeescte VALUES(101,'Ken',NULL);
INSERT INTO Employeescte VALUES(102,'Terri',101);
INSERT INTO Employeescte VALUES(103,'Roberto',101);
INSERT INTO Employeescte VALUES(104,'Rob',102);
INSERT INTO Employeescte VALUES(105,'Gail',102);
INSERT INTO Employeescte VALUES(106,'Jossef',103);
INSERT INTO Employeescte VALUES(107,'Dylan',103);
INSERT INTO Employeescte VALUES(108,'Diane',105);
INSERT INTO Employeescte VALUES(109,'Gigi',105);
INSERT INTO Employeescte VALUES(110,'Micheal',106);

SELECT * FROM Employeescte;


-----------------------Get the list of employees and their managers-------------------------------------
;with cteemployees as(
SELECT EmployeeID, FirstName, ManagerID FROM Employeescte WHERE ManagerID IS NULL
UNION ALL
SELECT e.EmployeeID, e.FirstName, e.ManagerID FROM Employeescte e JOIN cteemployees r ON e.ManagerID = r.EmployeeID
)
SELECT EmployeeID, FirstName, ManagerID, (SELECT FirstName FROM Employeescte  WHERE EmployeeID = cteemployees.ManagerID) as ManagerName
FROM cteemployees



