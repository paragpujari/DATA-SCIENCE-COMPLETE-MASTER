-------------------------SQL DATETIME FUNCTIONS---------------------------------------

---------1. CURRENT_TIMESTAMP = Returns the current date and time part without including the time zone part.
SELECT CURRENT_TIMESTAMP;

---------2. ISDATE() = It check if the input is a date or not
SELECT ISDATE(GETDATE());

------3. GETUTCDATE() = It returns the date part of the date as an integer value
SELECT GETUTCDATE();

------4. GETDATE() = It retuns the current date and time on the system on which it i running.
SELECT GETDATE();


---------5. SYSDATETIME() = It returns the current date and time with more precise fractional value than getdate();
SELECT SYSDATETIME();

------------------6. SYSUTCDATETIME = It returns the current date and time in UTC time.
SELECT SYSUTCDATETIME();


-----------------7. SYSDATETIMEOFFSET() = It returns the current date and time including the time part zone.
SELECT SYSDATETIMEOFFSET();


-------------------8. DATENAME() = It returns the part of the date in the form of character string.
SELECT DATENAME(YEAR, GETDATE());

SELECT DATENAME(MONTH, GETDATE());

SELECT DATENAME(DAY, GETDATE());

SELECT DATENAME(HOUR, GETDATE());

SELECT DATENAME(MINUTE, GETDATE());

SELECT DATENAME(SECOND, GETDATE());

-------------------9.DATEPART() = It returns the part of the date in the form of integer.
SELECT DATEPART(YEAR, GETDATE());

SELECT DATEPART(MONTH, GETDATE());

SELECT DATEPART(DAY, GETDATE());

SELECT DATEPART(HOUR, GETDATE());

SELECT DATEPART(MINUTE, GETDATE());

SELECT DATEPART(SECOND, GETDATE());

--------------------10. DAY() = It returns the day from a given date
SELECT DAY(GETDATE());

------------------- 11. MONTH() = It returns the month from a given date.
SELECT MONTH(GETDATE());

------------------ 12. YEAR() = It returns the year from a given date.
SELECT YEAR(GETDATE());


-------------------- 13. DATEDIFF() = It returns the difference between the two given dates in terms of day, month, years
SELECT DATEDIFF(DD,GETDATE(), GETDATE()+1);

DECLARE 
    @start_dt DATETIME2= '2019-12-31 23:59:59.9999999', 
    @end_dt DATETIME2= '2020-01-01 00:00:00.0000000';

	SELECT DATEDIFF(DAY, @start_dt, @end_dt);
	SELECT DATEDIFF(MONTH, @start_dt, @end_dt);
	SELECT DATEDIFF(YEAR, @start_dt, @end_dt);
	SELECT DATEDIFF(HOUR, @start_dt, @end_dt);
	SELECT DATEDIFF(MINUTE, @start_dt, @end_dt);
	SELECT DATEDIFF(SECOND, @start_dt, @end_dt);


----------------------------  14. DATEADD() = It adds a specific number to a given date and returns the resultant date to it.
SELECT DATEADD(DD,1,GETDATE());

SELECT DATEADD(MONTH,1,GETDATE());

SELECT DATEADD(YEAR,1,GETDATE());

SELECT DATEADD(HOUR,1,GETDATE());

SELECT DATEADD(MINUTE,1,GETDATE());

SELECT DATEADD(SECOND,1,GETDATE());


----------------------- 15. EOMONTH() = It returns the last day of the month of the specified date.

SELECT EOMONTH(GETDATE());


---------------------------- 16. DATEFROMPARTS() = It returns the date from year, month and date
SELECT DATEFROMPARTS(2022,03,13);

----------------------------17. DATETIME2FROMPARTS() = It returns the date and time from the parts
SELECT DATETIME2FROMPARTS(2023,03,13,11,59,59,0,0);


---------------------------------18. TIMEFROMPARTS() = It returns the time from parts.
SELECT TIMEFROMPARTS(18,59,59,0,0);


