USE SQLREVISION;

CREATE TABLE Customer(
ID     INT PRIMARY KEY              ,
NAME   VARCHAR(50)          NOT NULL,
AGE    INT                  NOT NULL,
CITY   CHAR(50)                     ,
Salary NUMERIC
);

--------------------------To fetch all the data from Customer tables-------------------------------------------
SELECT * FROM Customer;


-----------------------------Insert all the values into the table---------------------------------------------------
INSERT INTO Customer(ID,NAME,AGE,CITY,Salary)VALUES(1,'Sam',26,'Delhi',9000); 
INSERT INTO Customer(ID,NAME,AGE,CITY,Salary)VALUES(2,'Ram',19,'Bangalore',11000);  
INSERT INTO Customer(ID,NAME,AGE,CITY,Salary)VALUES(3,'Pam',31,'Mumbai',6000);  
INSERT INTO Customer(ID,NAME,AGE,CITY,Salary)VALUES(4,'Jam',42,'Pune',10000);  


SELECT * FROM Customer;

--------------------------------Add the column Country----------------------------------------------------------
ALTER TABLE Customer ADD COUNTRY VARCHAR(50);

--------------------------------Delete the column Country----------------------------------------------------------
ALTER TABLE Customer DROP COLUMN COUNTRY;

------------------------------Change the datatype of Salary to decimal------------------------------------------------
ALTER TABLE Customer ALTER COLUMN Salary DECIMAL;
----------------------------Delete all the records of Jam--------------------------------------------------------------
DELETE FROM Customer WHERE NAME = 'Jam';
					    

SELECT * FROM Customer;


------------------------------DOUBLE THE SALARY OF Pam-----------------------------------------------------------------
UPDATE Customer SET Salary = Salary * 2 WHERE NAME = 'Pam';


SELECT * FROM Customer;



---------------------------Fetch the details of Sam------------------------------------
SELECT * FROM Customer WHERE NAME = 'Sam';

---------------------------Fetch all the Customers who live in Bangalore----------------------------
SELECT * FROM Customer WHERE CITY = 'Bangalore';

----------------------------Fetch all the details of the Customers whose age is greater than 30-------------------------------
SELECT * FROM Customer WHERE AGE > 30;


---------------------------Fetch ony names and age from the Customers----------------------------------------------------------------
SELECT NAME , AGE FROM Customer;


------------------------Fetch all the unique id from the cutomers-----------------------------------------------------------------
SELECT DISTINCT(ID) AS ID FROM Customer;

--------------------------Fetch all the Customer details whose name = 'Pam' and age is greater than 30---------------------------------------------			   
SELECT * FROM Customer WHERE NAME = 'Pam' AND AGE > 30;

-------------------------------------Sort all the customer details in increasing order of names------------------------------------------------
SELECT * FROM Customer ORDER BY NAME;

-------------------------------------Sort all the customer details in decreasing order of names------------------------------------------------
SELECT * FROM Customer ORDER BY NAME DESC;

-------------------------------------Get only one  customer details in increasing order of names------------------------------------------------
SELECT TOP 1 * FROM Customer ORDER BY NAME;


------------------------------------After Importing the data into the customers table------------------------------------------------------------------------
SELECT * FROM Customers;

------------------------------------------STRING FUNCTIONS-------------------------------------------
SELECT UPPER(first_name) as names FROM Customers;

SELECT LOWER(first_name) as names FROM Customers;

SELECT LEN(first_name) as names FROM Customers;


SELECT LEN(first_name) as length, UPPER(first_name) as names FROM Customers;


SELECT SUBSTRING(first_name,2,4) AS Sub_part FROM Customers;


SELECT CONCAT(first_name,' ',last_name) as full_names FROM Customers;



SELECT  REPLACE(first_name,'Mary','Tina') as replaced FROM Customers;


SELECT  RTRIM(LTRIM('Tina  ')) as replaced FROM Customers;




-----------------------------------------AGGREGRATE FUNCTIONS---------------------------------------------------
SELECT * FROM payment;

SELECT COUNT(amount) as amount FROM payment;

SELECT SUM(amount) as amount FROM payment;

SELECT MIN(amount) as minimum FROM payment;

SELECT MAX(amount) as maximum FROM payment;

SELECT (CONVERT(NUMERIC(18,5),AVG(amount))) as average  FROM payment;

SELECT ROUND((CONVERT(NUMERIC(18,5),AVG(amount))),2) as rounded_average FROM payment;


-----------------------------------------Get the total amount for each mode--------------------------------

SELECT  mode, sum(amount) as total FROM payment
GROUP BY mode
ORDER BY total DESC;

SELECT TOP 1 mode, sum(amount) as total FROM payment
GROUP BY mode
ORDER BY total DESC;


SELECT mode, SUM(amount) as total FROM payment
GROUP BY mode
HAVING SUM(amount) > 100 AND SUM(amount) < 200
ORDER BY total DESC;


---------------------------------TIME DATE FUNCTIONS--------------------------------------------------------------------
SELECT GETDATE();

SELECT DAY(GETDATE()) AS Day;

SELECT MONTH(GETDATE()) as month;

SELECT YEAR(GETDATE()) as year;


SELECT DATEPART(DAY, GETDATE()) AS Day;

SELECT DATEPART(Month, GETDATE()) AS Month;


SELECT DATEPART(Year, GETDATE()) AS Year;


SELECT DATEPART(HOUR, GETDATE()) AS Hour;

SELECT DATEPART(MINUTE, GETDATE()) AS Minute;

SELECT DATEPART(SECOND, GETDATE()) AS Seconds;


SELECT CURRENT_TIMESTAMP;

----------------------------Extract the date, month and year from payment date-----------------------------------------------
SELECT DATEPART(Year, payment_date) as year FROM payment;

SELECT DATEPART(Month, payment_date) as month FROM payment;

SELECT DATEPART(Day, payment_date) as Day FROM payment;


SELECT * FROM Customers;

SELECT * FROM payment;


----------------------------How much amount was paid by the customer 'Madan' and what was the mode and payment date?
SELECT * FROM Customers a
JOIN payment  b
ON a.customer_id = b.customer_id
WHERE a.first_name = 'Madan';

SELECT b.amount as amount, b.mode as mode, b.payment_date as date FROM Customers a
JOIN payment  b
ON a.customer_id = b.customer_id
WHERE a.first_name = 'Madan';

-------------------------------------TYPES OF JOINS---------------------------------------------------------------------------------

SELECT * FROM Customers;

SELECT * FROM payment;


--------------inner join---------------------------------

SELECT * FROM Customers a
JOIN payment b
ON a.customer_id = b.customer_id;


---------------left join--------------------------------
SELECT * FROM Customers a
LEFT JOIN payment b
ON a.customer_id = b.customer_id;


---------------right join---------------------------
SELECT * FROM Customers a
RIGHT JOIN payment b
ON a.customer_id = b.customer_id;

-----------------full outer join------------------------
SELECT * FROM Customers a
FULL OUTER JOIN payment b
ON a.customer_id = b.customer_id;

---------------------self join----------------------------------
CREATE TABLE employee(
empid int primary key,
empname varchar(50),
manager_id bigint
);

INSERT INTO employee VALUES(1, 'Agni', 3);
INSERT INTO employee VALUES(2, 'Akash', 4);
INSERT INTO employee VALUES(3, 'Dharti', 2);
INSERT INTO employee VALUES(4, 'Vayu', 3);

-------------------------------find out the managers of every employee----------------------------------
SELECT a.empname as employee, b.empname as manager
FROM employee a
JOIN employee b ON a.manager_id
= b.empid;


----------------------------------UNION AND UNION ALL-----------------------------------------------------

CREATE TABLE custA(
cust_name character(30),
cust_amount bigint
);

INSERT INTO custA VALUES('Madan Mohan', 2100);
INSERT INTO custA VALUES('Gopi Nath'  , 1200);
INSERT INTO custA VALUES('Govind Dev'  ,5000);




CREATE TABLE custB(
cust_name character(30),
cust_amount bigint
);

INSERT INTO custB VALUES('Gopal Bhat', 1500);
INSERT INTO custB VALUES('Madan Mohan', 2100);



SELECT * FROM custA;

SELECT * FROM custB;


SELECT cust_name, cust_amount FROM custA
UNION
SELECT cust_name, cust_amount  FROM custB;


SELECT cust_name, cust_amount FROM custA
UNION ALL
SELECT cust_name, cust_amount FROM custB;


-----------------------get the list of all the customers whose payment amount is greater than the average of all the amounts of the customers--------------
SELECT * FROM Customers;

SELECT * FROM payment;

SELECT * FROM Customers WHERE customer_id IN(
SELECT customer_id from payment WHERE amount > 
(SELECT AVG(amount) FROM payment)
);

SELECT customer_id, first_name, last_name FROM Customers c
WHERE EXISTS(
SELECT customer_id, amount FROM payment p WHERE c.customer_id = p.customer_id
AND amount >
(SELECT AVG(amount) FROM payment)
);


------------------------------------WINDOW FUNCTIONS----------------------------------------------------------------------
CREATE TABLE test_data(
new_id   INT PRIMARY KEY,
new_cat  VARCHAR(50)
);

INSERT INTO test_data VALUES(100, 'Agni');
INSERT INTO test_data VALUES(200, 'Agni');
INSERT INTO test_data VALUES(300, 'Vayu');
INSERT INTO test_data VALUES(400, 'Vayu');
INSERT INTO test_data VALUES(500, 'Vayu');
INSERT INTO test_data VALUES(600, 'Dharti');
INSERT INTO test_data VALUES(700, 'Dharti');


SELECT * FROM test_data;

SELECT *,SUM(new_id) OVER(PARTITION BY new_cat ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as sum FROM test_data;

SELECT *,AVG(new_id) OVER(PARTITION BY new_cat ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as average FROM test_data;

SELECT *,COUNT(new_id) OVER(PARTITION BY new_cat ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as average FROM test_data;

SELECT *,MIN(new_id) OVER(PARTITION BY new_cat ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as min FROM test_data;

SELECT *,MAX(new_id) OVER(PARTITION BY new_cat ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as min FROM test_data;


SELECT * FROM test_data;

SELECT ROW_NUMBER() OVER(PARTITION BY new_cat  ORDER BY new_id ) as rwn,* FROM test_data;

SELECT RANK() OVER(PARTITION BY new_cat ORDER BY new_id) as rank,* FROM test_data;

SELECT DENSE_RANK() OVER(PARTITION BY new_cat ORDER BY new_id) as dense_rank,* FROM test_data;


SELECT FIRST_VALUE(new_id) OVER(PARTITION BY new_cat ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as first,* FROM test_data;

SELECT LAST_VALUE(new_id)  OVER(PARTITION BY new_cat ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as last,* FROM test_data;

SELECT LEAD(new_id) OVER(PARTITION BY new_cat ORDER BY new_id ) as lead,* FROM test_data;

SELECT LAG(new_id) OVER(PARTITION BY new_cat ORDER BY new_id) as lag,* FROM test_data;


SELECT LEAD(new_id,2) OVER(ORDER BY new_id ) as lead,* FROM test_data;

SELECT LAG(new_id,2) OVER(ORDER BY new_id ) as lead,* FROM test_data;






-----------------------------------CASE STATEMENTS---------------------------------------------------------------------------
SELECT customer_id, amount,
CASE 
   WHEN amount > 100 THEN 'Expensive ProductFROM payment'
   WHEN amount = 100 THEN 'Moderate Product'
   ELSE                   'Inexpensive Product'
   END AS ProductStatus
FROM payment;



SELECT customer_id, amount,
       CASE amount 
	     WHEN 90 THEN 'Prime Customer'
		 WHEN 80 THEN 'Plus Customer'
		 ELSE         'Regular Customer'
		 END  AS  CustomerType
		 FROM payment;

------------------------------Common Table Expression---------------------------------------------------------------------------------

SELECT * FROM payment;

;with cte as(
SELECT  a.*,AVG(b.amount) OVER(ORDER BY a.customer_id) as average,
COUNT(a.address_id) OVER(ORDER BY a.customer_id) as count FROM Customers a
JOIN payment b ON a.customer_id = b.customer_id
)
select * from cte;


;with mycte as(
SELECT a.customer_id , AVG(b.amount) as amount_average  FROM Customers a
JOIN payment b ON a.customer_id = b.customer_id
WHERE mode = 'Cash'
GROUP BY a.customer_id
)
select mycte.customer_id, mycte.amount_average from mycte;



;with ctea as(
SELECT b.mode, AVG(b.amount) as average FROM Customers a
JOIN payment b
ON a.customer_id = b.customer_id
GROUP BY b.mode
)
select ctea.mode, ctea.average from ctea;


