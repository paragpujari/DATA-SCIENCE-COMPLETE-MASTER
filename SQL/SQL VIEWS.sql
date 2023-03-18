-------------------------------------------VIEWS---------------------------------------------------------------
USE happy;

CREATE TABLE Employeeeeeees(
Emp_Id INT IDENTITY(1,1) PRIMARY KEY,
Emp_Name NVARCHAR(50) UNIQUE,
Emp_Age  INT CHECK (Emp_Age >= 40),
Emp_Gender NVARCHAR(50) DEFAULT 'Male',
Emp_City   NVARCHAR(50),
Emp_Salary DECIMAL(16,2)
);
INSERT INTO Employeeeeeees(Emp_Name,Emp_Age,Emp_Gender,Emp_City, Emp_Salary)VALUES('Mayur',45,'Male','Sundargarh',23456);
INSERT INTO Employeeeeeees(Emp_Name,Emp_Age,Emp_Gender,Emp_City, Emp_Salary)VALUES('Sayur',46,'Male','Bargarh',33456);
INSERT INTO Employeeeeeees(Emp_Name,Emp_Age,Emp_Gender,Emp_City, Emp_Salary)VALUES('Rahul',42,'Male','Sambalpur',50000);
INSERT INTO Employeeeeeees(Emp_Name,Emp_Age,Emp_Gender,Emp_City, Emp_Salary)VALUES('Soham',41,'Male','Baleswar',21098);
INSERT INTO Employeeeeeees(Emp_Name,Emp_Age,Emp_Gender,Emp_City, Emp_Salary)VALUES('Keyul',44,'Male','Puri',45678);
INSERT INTO Employeeeeeees(Emp_Name,Emp_Age,Emp_Gender,Emp_City, Emp_Salary)VALUES('Sona',47,'Female','Bhubneswar',76854);
INSERT INTO Employeeeeeees(Emp_Name,Emp_Age,Emp_Gender,Emp_City, Emp_Salary)VALUES('Parul',51,'Female','Brajrajnagar',76543);
INSERT INTO Employeeeeeees(Emp_Name,Emp_Age,Emp_Gender,Emp_City, Emp_Salary)VALUES('Priya',49,'Female','Baripada',67543);
INSERT INTO Employeeeeeees(Emp_Name,Emp_Age,Emp_Gender,Emp_City, Emp_Salary)VALUES('Mona',50,'Female','Jharsuguda',61098);
INSERT INTO Employeeeeeees(Emp_Name,Emp_Age,Emp_Gender,Emp_City, Emp_Salary)VALUES('Lalita',56,'Female','Rourkela',76543);

SELECT * FROM Employeeeeeees;


CREATE TABLE Employee
(
   emp_ID INT PRIMARY KEY,
   emp_Name NVARCHAR(50) 
);

CREATE TABLE Employee_Details
(
    emp_ID INT PRIMARY KEY,
	emp_Age INT,
	emp_Address NVARCHAR(40),
	emp_Salary DECIMAL(10,2)
);

INSERT INTO Employee VALUES(1,'Anil');
INSERT INTO Employee VALUES(2,'Suresh');
INSERT INTO Employee VALUES(3,'Mahesh');
INSERT INTO Employee VALUES(4,'Mohan');
INSERT INTO Employee VALUES(5,'Sohan');



INSERT INTO Employee_Details VALUES(1,33,'Delhi',2923.90);
INSERT INTO Employee_Details VALUES(2,43,'NCR',3344.90);
INSERT INTO Employee_Details VALUES(3,22,'Haryana',3456.90);
INSERT INTO Employee_Details VALUES(4,65,'UP',5433.90);
INSERT INTO Employee_Details VALUES(8,34,'Delhi',4222.90);
INSERT INTO Employee_Details VALUES(10,32,'Delhi',4554.90);

SELECT * FROM Employee;

SELECT * FROM Employee_Details;

----1.CREATE A VIEW TO DISPLAY THE Employees Details------------------
CREATE VIEW view_employee_details AS
   SELECT Emp_Id, Emp_Name, Emp_Age, Emp_Gender, Emp_City, Emp_Salary FROM Employeeeeeees;

-----2. DISPLAY THE VIEW----
SELECT * FROM view_employee_details;

----3. DROP THE VIEW-----
DROP VIEW view_employee_details;


-----4. CREATE A VIEW SO AS TO JOIN EMPLOYEE AND EMPLOYEE_DETAILS----

CREATE VIEW view_emp_join_emp_details AS
    SELECT a.emp_ID, a.emp_Name, b.emp_Age, b.emp_Address, b.emp_Salary  FROM EMPLOYEE a
	JOIN     Employee_Details b
	ON  a.emp_ID = b.emp_ID;

------ 5. Display the view------------------------------
SELECT * FROM view_emp_join_emp_details;


-----6. DROP THE VIEW----------
DROP VIEW view_emp_join_emp_details;

 ------7. UPDATE THE VIEW IN SUCH A WAY THAT THE SALARY MUST BE TWICE OF ORIGINAL----
 UPDATE view_emp_join_emp_details  SET emp_Salary = emp_Salary * 2;


 -----8. UPDATE THE SALARY OF MAHESH TO 100000----------------------
 UPDATE view_emp_join_emp_details SET emp_Salary = 100000 WHERE emp_Name = 'Mahesh';

-----9. CHANGE THE VIEW DISPLAY THE EMPLOYEE DETAILS WHOSE AGE >= 40-----------------------
ALTER VIEW view_employee_details as
            select * from Employeeeeeees WHERE Emp_Age >= 40;

---- 10. Display the view------------------------------------------------------------------
SELECT * FROM view_employee_details;