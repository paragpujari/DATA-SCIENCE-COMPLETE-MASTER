--------------------IDENTITY COLUMNS-----------------------------------------
USE happy

SELECT * FROM Employeeeeeees

---------------------------------To add the identity column explicitly by the user-------------
SET IDENTITY_INSERT Employeeeeeees on;

INSERT INTO Employeeeeeees(Emp_Id, Emp_Name, Emp_Age,Emp_Gender,Emp_City,Emp_Salary) VALUES(11, 'Manushi', 49,'Female','Sundergarh',89765);

INSERT INTO Employeeeeeees(Emp_Id, Emp_Name, Emp_Age,Emp_Gender,Emp_City,Emp_Salary) VALUES(12, 'Tanisha', 65,'Female','Bagarh',87689);

INSERT INTO Employeeeeeees(Emp_Id, Emp_Name, Emp_Age,Emp_Gender,Emp_City,Emp_Salary) VALUES(13, 'Anamika', 45,'Female','Sonapali',875578);

---------------------------------To add the identity column by the system------------------------
SET IDENTITY_INSERT Employeeeeeees OFF;

INSERT INTO Employeeeeeees(Emp_Name, Emp_Age,Emp_Gender,Emp_City,Emp_Salary) VALUES('Kanya', 76,'Female','Junagarh',657865);