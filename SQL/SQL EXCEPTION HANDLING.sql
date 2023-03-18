----------------------------------------EXCEPTION HANDLING---------------------------------

---------------------- 1. SYSTEM DEFINED EXCEPTION----------------------
DECLARE @VAR1 INT;
DECLARE @VAR2 INT;

SELECT @VAR1 = 10;
SELECT @VAR2 = 0;

DECLARE @VAR3 INT;

BEGIN TRY
  SELECT @VAR3 = @VAR1 / @VAR2;
END TRY

BEGIN CATCH
  PRINT CONCAT('Error_Message()=',ERROR_MESSAGE());
  PRINT CONCAT('Error_Line()=',ERROR_LINE());
  PRINT CONCAT('Error_Number()=',ERROR_NUMBER());
  PRINT CONCAT('Error_State()=',ERROR_STATE());
  PRINT CONCAT('Error_Severity()=',ERROR_SEVERITY());
  PRINT CONCAT('Error_Procedure()=',ERROR_PROCEDURE());
END CATCH


----------------------- 2. USER DEFINED EXCEPTION--------------------------------
DECLARE @AGE INT;
SELECT  @AGE = 10;

BEGIN TRY
IF(@AGE < 18)
 BEGIN
    THROW 70000, 'You are not eligible to vote',123
 END
END TRY

BEGIN CATCH
  PRINT CONCAT('Error_Message() = ', ERROR_MESSAGE());
  PRINT CONCAT('Error_Line() = ', ERROR_LINE());
  PRINT CONCAT('Error_Number() = ', ERROR_NUMBER());
  PRINT CONCAT('Error_State() = ', ERROR_STATE());
  PRINT CONCAT('Error_Severity() = ', ERROR_SEVERITY());
  PRINT CONCAT('Error_Procedure() = ', ERROR_PROCEDURE());
END CATCH