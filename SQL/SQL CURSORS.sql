------------------------------------------------------CURSORS-------------------------------------------------------
CREATE TABLE Student_Details(
  RollNO               INT NOT NULL,
  Student_Name         VARCHAR(100) NOT NULL,
  Class                VARCHAR(10)  NULL,
  Marks_Science        INT  NOT NULL,
  Marks_Math           INT  NOT NULL,
  Marks_Eng            INT  NOT NULL
);

INSERT INTO Student_Details VALUES(1, 'Anil','5th',34,78,54);
INSERT INTO Student_Details VALUES(2, 'Sunl','7th',78,43,87);
INSERT INTO Student_Details VALUES(3, 'Ajay','5th',45,32,78);
INSERT INTO Student_Details VALUES(4, 'Vijay','4th',36,78,32);
INSERT INTO Student_Details VALUES(5, 'Manoj','5th',12,22,67);
INSERT INTO Student_Details VALUES(6, 'Geeta','8th',21,65,43);
INSERT INTO Student_Details VALUES(7, 'Sita','4th',34,78,54);
INSERT INTO Student_Details VALUES(8, 'Reeta','9th',89,78,54);
INSERT INTO Student_Details VALUES(9, 'Arvind','12th',76,78,54);
INSERT INTO Student_Details VALUES(10,'Kumar','11th',22,56,54);

SELECT * FROM Student_Details;


--------------------DECLARE THE VARIABLES FOR THE STUDENTS-----------------------------------
DECLARE @RollNo             INT;
DECLARE @Student_Name       NVARCHAR(30);
DECLARE @Marks_Science      INT;
DECLARE @Marks_Math         INT;
DECLARE @Marks_Eng          INT;
DECLARE @Marks_Total        INT;
DECLARE @Percentage         FLOAT;

----------------------DECLARE THE CURSOR-------------------------------------------------------------
DECLARE Student_Cursor CURSOR FOR SELECT RollNO, Student_Name, Marks_Science, Marks_Math, Marks_Eng FROM Student_Details;

-------------------OPEN THE CURSOR---------------------------------------------------------------------
OPEN Student_Cursor;


-----------------------FETCH THE DATA ROW BY ROW FROM TABLE UING THE CURSOR-----------------------------
FETCH NEXT FROM Student_Cursor INTO @RollNo, @Student_Name, @Marks_Science, @Marks_Math, @Marks_Eng
 WHILE(@@FETCH_STATUS = 0)
   BEGIN
     PRINT CONCAT('Roll Number is:', @RollNo)
	 PRINT CONCAT('Student Name is:', @Student_Name)
	 PRINT CONCAT('Math Marks is:', @Marks_Math)
	 PRINT CONCAT('Science Marks is:', @Marks_Science)
	 PRINT CONCAT('English Marks is:', @Marks_Eng)
	 SET   @Marks_Total = @Marks_Eng + @Marks_Math + @Marks_Science;
	 SET   @Percentage  = @Marks_Total/3;

	 IF(@Percentage >= 80)
	   BEGIN
	      PRINT('Grade A:');
	   END
	 ELSE IF((@Percentage >= 60) AND (@Percentage < 80))
	   BEGIN
	      PRINT('Grade B:');
	   END
	 ELSE
	   BEGIN
	     PRINT('Grade C:');
	   END
	  FETCH NEXT FROM Student_Cursor INTO @RollNo, @Student_Name, @Marks_Science, @Marks_Math, @Marks_Eng
   END
 CLOSE Student_Cursor;
 DEALLOCATE Student_Cursor;

