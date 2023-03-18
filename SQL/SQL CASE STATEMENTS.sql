------------------------------------------SQL  CASE STATEMENTS-------------------------------------------------------
use happy;
DROP TABLE IF EXISTS staudent_marks;

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


SELECT * FROM staudent_marks;

---------------Print The Grade of the Students based on the percentage obtained by the students------------

SELECT RollNO, Science, Math, Eng,
CASE WHEN (Science + Math + Eng)/3 >= 90                                          THEN 'S'
     WHEN (Science + Math + Eng)/3 >= 80 AND (Science + Math + Eng)/3 < 90        THEN 'A'
	 WHEN (Science + Math + Eng)/3 >= 70 AND (Science + Math + Eng)/3 < 80        THEN 'B'
	 WHEN (Science + Math + Eng)/3 >= 60 AND (Science + Math + Eng)/3 < 70        THEN 'C'
	 WHEN (Science + Math + Eng)/3 >= 50 AND (Science + Math + Eng)/3 < 60        THEN 'D'
	 WHEN (Science + Math + Eng)/3 >= 40 AND (Science + Math + Eng)/3 < 50        THEN 'E'
	 ELSE                                                                              'F'
	 END  AS Grade
	 FROM staudent_marks;

------------------------Print the Remark of the Employeeees based on their salaries------------------------
SELECT *,
CASE WHEN Emp_Salary >= 70000                               THEN  'Outstanding'
     WHEN Emp_Salary >= 60000    AND  Emp_Salary < 70000    THEN  'Good'      
	 WHEN Emp_Salary >= 50000    AND  Emp_Salary < 60000    THEN  'Average'
	 WHEN Emp_Salary >= 40000    AND  Emp_Salary < 50000    THEN  'OK'
	 ELSE                                                         'Poor'
	 END AS Remark
	 FROM Employeeeeeees;

-----------------------Print the Quality of the Product based on the Sales--------------------------------------
SELECT ID, YEAR, PRODUCT,SALES,
CASE WHEN SALES >= 80                  THEN   'A' 
     WHEN SALES >= 70  AND SALES < 80  THEN   'B'
	 WHEN SALES >= 60  AND SALES < 70  THEN   'C'
	 WHEN SALES >= 50  AND SALES < 60  THEN   'D'
	 WHEN SALES >= 40  AND SALES < 50  THEN   'E'
	 ELSE                                     'F'
	 END AS Quality
	 FROM PRODUCTS;





