-------------------------------------SUBQUERY--------------------------------------------
USE happy;

CREATE TABLE staudent
(
  RollNO INT IDENTITY(1,1) PRIMARY KEY,
  student_Name NVARCHAR(50),
  city         NVARCHAR(50)
);

INSERT INTO staudent VALUES('Anil','Delhi');
INSERT INTO staudent VALUES('Sunl','Delhi');
INSERT INTO staudent VALUES('Ajay','NCR');
INSERT INTO staudent VALUES('Vijay','Pune');
INSERT INTO staudent VALUES('Manoj','Faridabad');
INSERT INTO staudent VALUES('Geeta','Noida');
INSERT INTO staudent VALUES('Sita','Noida');
INSERT INTO staudent VALUES('Reeta','New Delhi');
INSERT INTO staudent VALUES('Arvind','Faridabad');
INSERT INTO staudent VALUES('Kumar','Delhi');

SELECT * FROM staudent;

CREATE TABLE staudent_marks
(
  RollNO INT IDENTITY(1,1) PRIMARY KEY,
  Science INT,
  Math    INT,
  Eng     INT
);

INSERT INTO staudent_marks VALUES(34,78,54);
INSERT INTO staudent_marks VALUES(78,43,87);
INSERT INTO staudent_marks VALUES(45,32,78);
INSERT INTO staudent_marks VALUES(36,78,32);
INSERT INTO staudent_marks VALUES(12,22,67);
INSERT INTO staudent_marks VALUES(21,65,43);
INSERT INTO staudent_marks VALUES(34,78,54);
INSERT INTO staudent_marks VALUES(89,78,54);
INSERT INTO staudent_marks VALUES(76,78,54);
INSERT INTO staudent_marks VALUES(22,56,54);


SELECT * FROM staudent;

SELECT * FROM staudent_marks;


----------------Marks of student whose name is Anil and who lives in Delhi---------------------

SELECT Science, Math, Eng FROM staudent_marks WHERE RollNO
IN (SELECT RollNO FROM staudent WHERE student_Name = 'Anil' AND city = 'Delhi');


------------------Marks of the student who lives in Noida----------------------------------------------------------------
SELECT Science, Math, Eng FROM staudent_marks WHERE RollNO
IN (SELECT RollNO FROM staudent WHERE City = 'Noida');


CREATE TABLE Empl_Salary(empid INT IDENTITY(1,1) PRIMARY KEY,
salary INT);

INSERT INTO Empl_Salary VALUES(3000);

INSERT INTO Empl_Salary VALUES(2345);

INSERT INTO Empl_Salary VALUES(7666);

INSERT INTO Empl_Salary VALUES(3000);

INSERT INTO Empl_Salary VALUES(7666);

INSERT INTO Empl_Salary VALUES(5000);

INSERT INTO Empl_Salary VALUES(6000);


SELECT * FROM Empl_Salary order by salary desc;

----------------------------Highest Salary--------------------------------------------
SELECT DISTINCT(salary) AS Highest_Salary FROM Empl_Salary WHERE Salary IN (SELECT MAX(Salary) FROM Empl_Salary);

--------------------------Second Highest Salary-----------------------------------------------
SELECT TOP 1 MAX(DISTINCT(salary)) as Second_Highest_Salary FROM Empl_Salary WHERE salary < (select MAX(Salary) from Empl_Salary);


----------------------------Third Highest Salary----------------------------------------------------------------------------
SELECT  DISTINCT(salary) as salary INTO #TEMP  FROM Empl_Salary WHERE salary < (SELECT MAX(Salary) FROM Empl_Salary) ORDER BY salary DESC;

SELECT  TOP 1 salary  AS Third_Highest_Salary FROM #TEMP where salary < (SELECT MAX(Salary) FROM #TEMP) ORDER BY salary desc;