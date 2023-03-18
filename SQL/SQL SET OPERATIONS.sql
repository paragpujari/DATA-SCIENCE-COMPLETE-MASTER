---------------------------------SQL SET OPERATIONS------------------------------------------------------
USE happy;

CREATE TABLE User_1_Survey(
name  NVARCHAR(40),
MobileNo INT,
City     NVARCHAR(40),
Occupation NVARCHAR(40),
Salary     INT
);

INSERT INTO User_1_Survey VALUES('John',             2929101,   'Noida','Business',2000);
INSERT INTO User_1_Survey VALUES('King-Duplicate',   2728377,   'Delhi','Self Employed',5000);
INSERT INTO User_1_Survey VALUES('Lee-Duplicate',    88888888,  'London','Contractor',6000);
INSERT INTO User_1_Survey VALUES('Suzan',            3944094,   'Braha','Service',5000);
INSERT INTO User_1_Survey VALUES('Mike-Duplicate',   3320329,   'Kurd','Business',4000);

CREATE TABLE User_2_Survey(
Cust_name  NVARCHAR(40),
Cust_MobileNo INT,
City     NVARCHAR(40),
Occupation NVARCHAR(40),
Salary     INT
);


INSERT INTO User_2_Survey VALUES('Mike John',             6666666,   'London','Business',2000);
INSERT INTO User_2_Survey VALUES('King-Duplicate',   2728377,   'Delhi','Self Employed',5000);
INSERT INTO User_2_Survey VALUES('Lee-Duplicate',    88888888,  'London','Contractor',6000);
INSERT INTO User_2_Survey VALUES('Korner',            3944094,   'Braha','Service',5000);
INSERT INTO User_2_Survey VALUES('Mike-Duplicate',   3320329,   'Kurd','Business',4000);


SELECT * FROM User_1_Survey;
SELECT * FROM User_2_Survey;


---------- 1. Perform the combined result set of both the tables of user_1_survey and iser_2_survey--------------------
SELECT name, MobileNo, City, Occupation,Salary FROM User_1_Survey
UNION
SELECT Cust_name, Cust_MobileNo, City, Occupation, Salary FROM User_2_Survey;

---------- 2. Perform the combined result set of user_1_survey and user_2_survey including its duplicates-------------
SELECT name, MobileNo, City, Occupation, Salary FROM User_1_Survey
UNION ALL
SELECT Cust_name, Cust_MobileNo, City, Occupation, Salary FROM User_2_Survey;

---------- 3. Common records from user_1_survey and user_2_survey
SELECT name, MobileNo, City, Occupation, Salary FROM User_1_Survey
INTERSECT
SELECT Cust_name, Cust_MobileNo, City, Occupation, Salary FROM User_2_Survey;


---------- 4. Give the Records present in user_1_survey but not in user_2_survey 
SELECT name, MobileNo, City, Occupation, Salary FROM User_1_Survey
EXCEPT
SELECT Cust_name, Cust_MobileNo, City, Occupation, Salary FROM User_2_Survey;

--------- 5. Give the Records present in user_2_survey but nit in user_1_survey
SELECT Cust_name, Cust_MobileNo, City, Occupation, Salary FROM User_2_Survey
EXCEPT
SELECT name, MobileNo, City, Occupation, Salary FROM User_1_Survey

