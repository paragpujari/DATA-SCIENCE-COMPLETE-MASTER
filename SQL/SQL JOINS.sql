-------------------------------------JOINS AND ITS TYPES-------------------------------------------------------------------
 USE happy;
DROP TABLE Employee
DROP TABLE Employee_Details

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



----------------------INNER JOIN = It returns common records from both the tables------------------------------------
SELECT a.emp_ID, a.emp_Name, b.emp_Age, b.emp_Address, b.emp_Salary FROM Employee a
INNER JOIN Employee_Details b
ON a.emp_ID = b.emp_ID

---------------------LEFT JOIN = It returns all the records from the left table and the matching records from the right table.-----------------------------------------
SELECT a.emp_ID, a.emp_Name, b.emp_Age, b.emp_Address, b.emp_Salary FROM Employee a
LEFT JOIN Employee_Details b
ON a.emp_ID = b.emp_ID;


----------------------RIGHT JOIN = It returns then matching records from the left table and all the records from the right table.----------------------------------------
SELECT a.emp_ID, a.emp_Name, b.emp_Age, b.emp_Address, b.emp_Salary FROM Employee a
RIGHT JOIN Employee_Details b
ON a.emp_ID = b.emp_ID;


---------------------FULL OUTER JOIN = It returns all the records from both the tables as well as non matching records from both the table------------------------------------------
SELECT a.emp_ID, a.emp_Name, b.emp_Age, b.emp_Address, b.emp_Salary FROM Employee a
FULL OUTER JOIN Employee_Details b
ON a.emp_ID = b.emp_ID;

-------------------CROSS JOIN = It combines each row of one table with every row of another table and returns all the rows from the tables.-------------------------------------------
SELECT * FROM Employee a CROSS JOIN Employee_Details b;