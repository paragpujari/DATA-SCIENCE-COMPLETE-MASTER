use happy;
----------------------------Basic Queries----------------------------------------------

----------------------- 1. Fetch all the details from Employeeees table-------------------
SELECT * FROM Employeeeeeees;

------------------------ 2. Fetch all the employeeees whose salary is greater than 40000--------------
SELECT * FROM Employeeeeeees WHERE Emp_Salary > 40000;

------------------------- 3. Fetch all the employeees whose salary is less than 40000---------------
SELECT * FROM Employeeeeeees WHERE Emp_Salary < 40000;

-------------------------- 4. Fetch all the employeees whose salary is not 50000---------------------
SELECT* FROM Employeeeeeees WHERE Emp_Salary <> 50000;

------------------------- 5. Fetch all the employees whose salary is between 80000 and 90000-----------
SELECT * FROM Employeeeeeees WHERE Emp_Salary BETWEEN 80000 AND 90000;

------------------------- 6. Get all the Male Employeeees whose salary is greater than 50000-----------
SELECT * FROM Employeeeeeees WHERE Emp_Gender = 'Male' AND Emp_Salary > 50000;

------------------------ 7. Get all the Female Employeees whose salary is greater than 80000--------------
SELECT * FROM Employeeeeeees WHERE Emp_Gender = 'Female' AND Emp_Salary > 80000;

----------------------- 8. Get the List of female employeeees or must belong to Puri
SELECT * FROM Employeeeeeees WHERE Emp_Gender = 'Female' OR Emp_City = 'Puri';

------------------------ 9. Get the list of Employeees who are above 75 years of age----------------------------
SELECT * FROM Employeeeeeees WHERE Emp_Age >= 75;


----------------------- 10. Get the specific list of genders  from the employeeees table-------------------
SELECT DISTINCT(Emp_Gender) AS Gender FROM Employeeeeeees;

---------------------- 11. Get the specific list of city from the employeeees table-----------------------------
SELECT DISTINCT(Emp_City) AS City FROM Employeeeeeees;


-------------------- 12. Get the list of employeeees in their increasing order of salary---------------
SELECT * FROM Employeeeeeees ORDER BY Emp_Salary ASC;

------------------ 13. Get the sum of salary for the male and female employeeees ----------------
SELECT Emp_Gender, SUM(Emp_Salary) as Total_Salary FROM Employeeeeeees
GROUP BY Emp_Gender;


------------------ 14. Get the sum of salary for the male and female employeeees and their sum of salary should be greater than 1000000 ----------------
SELECT Emp_Gender, SUM(Emp_Salary) as Total FROM Employeeeeeees
GROUP BY Emp_Gender
HAVING SUM(Emp_Salary) > 1000000;

----------------- 15. Get the list of all the Employeeees whose name start with M----------------------------
SELECT * FROM Employeeeeeees WHERE Emp_Name LIKE 'M%';

--------------- 16. Get the list of all the employeees whose name end with i---------------------------------
SELECT * FROM Employeeeeeees WHERE Emp_Name LIKE '%i';

----------------- 17.  Get the list of all the Employeeeees whose name between 'a' and 'a'-------------------
SELECT * FROM Employeeeeeees WHERE Emp_Name LIKE '%a%a';

------------------18. Get the list of all the Employees that start with a---------------
SELECT * FROM Employeeeeeees WHERE Emp_Name LIKE 'A______';

----------------19. Get the list of all the Employeees what have the length of 5 in their name----------------
SELECT * FROM Employeeeeeees WHERE Emp_Name LIKE '_____';

--------------- 20. Get the list of all the employeees whose name start with M,R,P,A-----------------
SELECT  * FROM Employeeeeeees WHERE Emp_Name LIKE '[MRPA]%';

--------------- 21. Get the list of all the employeeees whose name end with A,L,I------------
SELECT * FROM Employeeeeeees WHERE Emp_Name LIKE '%[ALI]';


----------------  22. Get the list of all the employeeees where starting name ranges between  A-M------------
SELECT  * FROM Employeeeeeees WHERE Emp_Name LIKE '[A-M]%' ORDER BY Emp_Name ASC;

----------------- 23.  Get the list of all the employeeees whose starting name should not begin with L AND A----------
SELECT * FROM Employeeeeeees WHERE Emp_Name LIKE '[^LA]%';

-----------------24. Get the Employeeee with the minimum salary-------------------------------------------------
SELECT TOP 1 * FROM Employeeeeeees ORDER BY Emp_Salary ASC;


---------------- 25.  Get the Employeeee with the maximum salary---------------------------------------------
SELECT TOP 1 * FROM Employeeeeeees ORDER BY Emp_Salary DESC;


---------------- 26. Get the list of employeees name whose salary > 70000----------------------------------------
SELECT a.Emp_Name, a.Emp_Salary FROM Employeeeeeees a
WHERE EXISTS(
SELECT a.Emp_Salary FROM Employeeeeeees b WHERE a.Emp_Id = b.Emp_Id AND a.Emp_Salary > 70000
);


---------------27. Get the list of all employee name of  the female employeeeees--------------------------------------------------
SELECT a.Emp_Name FROM Employeeeeeees a
WHERE NOT EXISTS(
select b.Emp_Gender from Employeeeeeees b WHERE  a.Emp_Id = b.Emp_Id AND b.Emp_Gender = 'male'
);

--------------- 28. ADD THE EMPLOYEES for the Moksha

INSERT INTO Employeeees VALUES(5,'Moksha','Awasti',6789,'Female', 'Delhi');

SELECT * FROM Employeeees;

-------------- 29. DELETE THE RECORD FOR Mike  Menco  from the employees table----------
DELETE FROM EMPLOYEEEES WHERE FIRSTNAME = 'Mike'  AND LASTNAME = 'Menco';


--------------30. Double the Salary for Moksha Awasti------------------------------------
UPDATE EMPLOYEEEES SET SALARY = SALARY * 2 WHERE  FIRSTNAME = 'Moksha' AND LASTNAME = 'Awasti';


------------- 31. ADD A COLUMN Date of Birth IN Employeeees Table--------------
ALTER TABLE Employeeees ADD DOB VARCHAR(10);

------------ 32. DROP THE Date of Birth Column from the Employeeees Table-------------
ALTER TABLE Employeeees DROP COLUMN DOB;

------------- 33. ALTER THE DATATYPE OF GENDER TO NVARCHAR(500)------------------------
ALTER TABLE EMPLOYEEEES ALTER COLUMN GENDER NVARCHAR(500);


-------------- 34. IMPORT THE Dataset Persons Excel file into SQL Server-----------
select * from Coursese;


------------ 35.  Constraints in the Table------------------------------------------------
----- PRIMARY KEY----------------
DROP TABLE IF EXISTS Employeees;
CREATE TABLE Employeees(
     Emp_ID           INT IDENTITY(1,1)  ,
     Emp_Name         NVARCHAR(50)      ,
     Emp_Age          INT              ,
     Emp_Gender       NVARCHAR(50) ,
     Emp_City         NVARCHAR(50) ,
     Emp_Salary       DECIMAL(10,2)
)

INSERT INTO Employeees VALUES('Oap',21,'Male','Sundargarh',23456);
INSERT INTO Employeees VALUES('Pap',23,'Male','Sundargarh',23456);
INSERT INTO Employeees VALUES('Jap',25,'Male','Sundargarh',23456);

SELECT * FROM Employeees;


---------UNIQUE KEY------------------
DROP TABLE IF EXISTS Employeeees;

CREATE TABLE Employeeees(
       Emp_ID           INT  IDENTITY(1,1)   ,
	   Emp_Name         NVARCHAR(50) UNIQUE  ,
	   Emp_Age          INT                  ,
	   Emp_Gender       NVARCHAR(50)         ,
	   Emp_City         NVARCHAR(50)         ,
       Emp_Salary       DECIMAL(10,2)
);

INSERT INTO Employeeees VALUES('Anisha',21,'Female','Sambalpur',87644);
INSERT INTO Employeeees VALUES('Sushree',23,'Female','Sundargarh',23456);
INSERT INTO Employeeees VALUES('Armaan',25,'Male','Sundargarh',23456);

SELECT * FROM Employeeees;



---------CHECK CONSTRAINT KEY---------------
DROP TABLE IF EXISTS EMPLOYEEEEES;

CREATE TABLE Employeeeees(
       Emp_ID           INT  IDENTITY(1,1)   ,
	   Emp_Name         NVARCHAR(50) UNIQUE  ,
	   Emp_Age          INT    CHECK(Emp_Age >= 30) ,
	   Emp_Gender       NVARCHAR(50)         ,
	   Emp_City         NVARCHAR(50)         ,
       Emp_Salary       DECIMAL(10,2)
);

INSERT INTO Employeeeees VALUES('Parag',31,'Male','Sambalpur',87644);
INSERT INTO Employeeeees VALUES('Nishant',31,'Male','Noida',23456);
INSERT INTO Employeeeees VALUES('Subham',31,'Male','Kolkata',687654);

SELECT * FROM Employeeeees;


----------DEFAULT KEY CONSTRAINT-------------------------
DROP TABLE IF EXISTS EMPLOYEEEEEES;

CREATE TABLE Employeeeeees(
       Emp_ID           INT  IDENTITY(1,1)   ,
	   Emp_Name         NVARCHAR(50) UNIQUE  ,
	   Emp_Age          INT    CHECK(Emp_Age >= 30) ,
	   Emp_Gender       NVARCHAR(50)   DEFAULT 'Male'      ,
	   Emp_City         NVARCHAR(50)         ,
       Emp_Salary       DECIMAL(10,2)
);

INSERT INTO Employeeeeees VALUES('Parag',31,'Male','Sambalpur',87644);
INSERT INTO Employeeeeees VALUES('Nishant',31,'Male','Noida',23456);
INSERT INTO Employeeeeees VALUES('Subham',31,'Male','Kolkata',687654);
INSERT INTO Employeeeeees(Emp_Name, Emp_Age,Emp_City,Emp_Salary) VALUES('Anubhav',30,'Azamgarh',76547);
INSERT INTO Employeeeeees(Emp_Name,Emp_Age,Emp_City,Emp_Salary)  VALUES('Karan',40,'Lucknow',76448);
SELECT * FROM Employeeeeees;


---------------FOREIGN KEY CONSTRAINT-------------------------
DROP TABLE IF EXISTS Demo_Primary

CREATE TABLE Demo_Primary(
 Emp_ID  INT PRIMARY KEY
);


DROP TABLE IF EXISTS Demo_Secondary


CREATE TABLE Demo_Secondary(
Roll_No      INT    ,
Emp_Gender   NVARCHAR(30),
Emp_Name     NVARCHAR(50),
Emp_City     NVARCHAR(50),
FOREIGN KEY(Roll_No) REFERENCES Demo_Primary(Emp_ID)
);

INSERT INTO Demo_Primary(Emp_ID) VALUES(1);
INSERT INTO Demo_Primary(Emp_ID) VALUES(2);
INSERT INTO Demo_Primary(Emp_ID) VALUES(3);
INSERT INTO Demo_Primary(Emp_ID) VALUES(4);
INSERT INTO Demo_Primary(Emp_ID) VALUES(5);

SELECT * FROM Demo_Primary;

DELETE FROM Demo_Primary WHERE Emp_ID = 1;


INSERT INTO Demo_Secondary(Roll_No, Emp_Gender, Emp_Name, Emp_City) VALUES(2,'Male','Sambalpur','parag');
INSERT INTO Demo_Secondary(Roll_No, Emp_Gender, Emp_Name, Emp_City) VALUES(1,'Male','Bargadh','poonik');
INSERT INTO Demo_Secondary(Roll_No, Emp_Gender, Emp_Name, Emp_City) VALUES(4,'Male','Puri','rohit');
INSERT INTO Demo_Secondary(Roll_No, Emp_Gender, Emp_Name, Emp_City) VALUES(5,'Male','Bhubneswar','leon');


SELECT * FROM happy.dbo.Demo_Primary;


SELECT * FROM happy.dbo.Demo_Secondary;

DELETE FROM Demo_Primary WHERE Emp_ID = 1;

DELETE FROM Demo_Secondary WHERE Roll_No = 1;