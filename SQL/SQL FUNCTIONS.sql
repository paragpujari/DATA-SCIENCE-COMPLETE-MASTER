------------------------------------ 1.  USER DEFINED FUNCTIONS------------------------------------------------------------------
ALTER FUNCTION SQUARES(@num int)
 RETURNS INT
   AS
     BEGIN
	  RETURN(@num * @num);
	 END
SELECT dbo.SQUARES(5);


CREATE FUNCTION SUM(@a int, @b int)
 RETURNS INT
   AS
    BEGIN
	  RETURN(@a + @b);
	END
SELECT dbo.SUM(8,9);

CREATE FUNCTION EXP(@a1 int, @b1 int, @c1 int)
 RETURNS INT
   AS
    BEGIN
	  RETURN(@a1 - (@b1 + @c1));
	END

SELECT dbo.EXP(10,2,1);
----------------------- 2. TABLE VALUED FUNCTIONS--------------------------------------------------------------------------------------

SELECT * FROM tblperson

CREATE FUNCTION gender_data(@gender varchar(30))
 RETURNS TABLE
   AS
     RETURN
	   SELECT * FROM tblperson WHERE GENDERID = @gender;
	 
SELECT * FROM dbo.gender_data('Male');


CREATE FUNCTION female_data(@gend VARCHAR(30))
 RETURNS TABLE
  AS
   RETURN(SELECT * FROM tblperson WHERE GENDERID = @gend);

SELECT * FROM dbo.female_data('FEMALE');

