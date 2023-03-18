----------------------1. CAST() = It casts a value of one type into another type.
SELECT CAST(10.98 AS INT);

SELECT CAST('10' AS INT);

SELECT CAST('Parag' AS VARCHAR(10));

SELECT (1 + CAST('1' AS INT));

SELECT ('1' + CAST(1 AS VARCHAR(10)));

SELECT CAST(5.95 AS DEC(10,3));

SELECT CAST('2022-09-12' AS DATETIME);

SELECT CAST('10.98' AS INT);



-------------- 2. CONVERT() = It converts the value of one type to another type.
SELECT CONVERT(INT, 10.98);

SELECT CONVERT(INT, '10');

SELECT CONVERT(VARCHAR(10) , 'Parag');

SELECT (1 + CONVERT(INT, '1'));

SELECT ('1' + CONVERT(VARCHAR(10), 1));

SELECT (CONVERT(DEC(10,3), 5.95));

SELECT CONVERT(DATETIME, '2022-09-12');

SELECT CONVERT(INT, '10.98');


------------------ 3. CHOOSE() = It is used to return an item from the list of items at a specified index--------------

SELECT CHOOSE(2,'First', 'Second', 'Third');

SELECT CHOOSE(3, 'Monday', 'Tuesday','Wednesday', 'Thuirsday','Friday','Saturday','Sunday');

SELECT CHOOSE(6, 'January','February','March','April','May','June','July','August','September','October','November','December');

SELECT CHOOSE(4, 'Outstanding','Excellent','Very Good', 'Good','Average','Poor', 'Very Poor', 'Bad');



---------------- 4. ISNULL() = It returns NULL if the input value is NULL
SELECT ISNULL('Hello','Hi');

SELECT ISNULL(NULL, 'Hi');

SELECT ISNULL(20,80);

SELECT ISNULL(NULL, 'Exp');


---------------- 5. ISNUMERIC() = It checks if the input is numeric or not
SELECT ISNUMERIC(10);

SELECT ISNUMERIC('$10');

SELECT ISNUMERIC('-2.2E-308');

SELECT ISNUMERIC('90');


--------------- 6. IIF() = It evaluates a boolean expression and returns true arguement for a true condition and returns false arguement for a false condition.
SELECT IIF(10 < 20, 'True', 'False');

SELECT IIF(20 < 50, 'True', 'False');


SELECT IIF(80 < 100, 'True', 'False');


SELECT IIF(100 < 20, 'True', 'False');


--------------- 7. TRY_CAST() = It casts the value of one type into another type and returns NULL if the conversion fails.
SELECT TRY_CAST(10.98 AS INT);

SELECT TRY_CAST('10' AS INT);

SELECT TRY_CAST('Parag' AS VARCHAR(10));

SELECT (1 + TRY_CAST('1' AS INT));

SELECT ('1' + TRY_CAST(1 AS VARCHAR(10)));

SELECT TRY_CAST(5.95 AS DEC(10,3));

SELECT TRY_CAST('2022-09-12' AS DATETIME);

SELECT  TRY_CAST('10.98' AS INT);



-------------- 8. TRY_CONVERT() = It converts the value of one type into another type and returns NULL if the conversion fails.
SELECT TRY_CONVERT(INT, 10.98);

SELECT TRY_CONVERT(INT, '10');

SELECT TRY_CONVERT(VARCHAR(10) , 'Parag');

SELECT (1 + TRY_CONVERT(INT, '1'));

SELECT ('1' + TRY_CONVERT(VARCHAR(10), 1));

SELECT (TRY_CONVERT(DEC(10,3), 5.95));

SELECT TRY_CONVERT(DATETIME, '2022-09-12');

SELECT TRY_CONVERT(INT, '10.98');


------------ 9. TRY_PARSE() = It is used to convert the result of the expression of the data type to the requested data type.
SELECT TRY_PARSE('20 April 2022' AS DATE);

SELECT TRY_PARSE('-1250' AS INT);

SELECT TRY_PARSE('89.08' AS DEC(10,2));

SELECT
   CASE
     WHEN TRY_PARSE('Last Year' AS DATE) IS NULL THEN 'Case Failed'
	                                             ELSE  'Case Succeded'
												 END AS Result;


SELECT TRY_PARSE('ABC' AS VARCHAR(10));


-------------------10. convert datetime to string
SELECT CONVERT(VARCHAR(10), GETDATE(), 112);

-----------------11. convert string to datetime
SELECT CONVERT(DATETIME, '2022-03-12');

-----------------12. CONVERT DATETIME TO DATE----------
SELECT CONVERT(DATE, GETDATE());




