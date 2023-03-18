------------------------------------------------TRIGGERS------------------------------------------------------------
---------1. DML TRIGGERS


---------------1.1 AFTER TRIGGER
CREATE TRIGGER after_employee_insert_details
ON Employeeeeeees
AFTER INSERT
  AS
    PRINT('Trigger gets fired successfully');

INSERT INTO Employeeeeeees VALUES('Kamna',78,'Female','Chennai',76443.89);


----------1.2 AFTER DELETE
ALTER TRIGGER after_employee_delete_details
ON Employeeeeeees
AFTER DELETE
  AS
    PRINT('Trigger gets fired successfully');

	DELETE FROM Employeeeeeees WHERE Emp_Id = 4;
	SELECT * FROM Employeeeeeees

--------- 1.3 AFTER UPDATE
CREATE TRIGGER after_employee_update_details
ON Employeeeeeees
AFTER UPDATE
 AS
   PRINT('Trigger gets fired successfully');

   UPDATE Employeeeeeees SET Emp_Name = 'Maya' WHERE Emp_Id = 12;



-------------2. DDL TRIGGERS

-------------------2.1 INSTEAD OF TRIGGERS

-----------------------2.1.1 INSERT
CREATE TRIGGER instead_triggers_insert_details
ON Employeeeeeees
INSTEAD OF INSERT
  AS
    PRINT('Trigger gets fired successfully');

INSERT INTO Employeeeeeees VALUES('Hena',67,'Female','Mumbai',675477.43);


----------------------2.1.2 DELETE
CREATE TRIGGER instead_triggers_delete_details
ON Employeeeeeees
INSTEAD OF DELETE
 AS
   PRINT('Trigger gets fired successfully');

   DELETE FROM Employeeeeeees WHERE Emp_Id = 4;


-------------------------2.1.3 UPDATE
CREATE TRIGGER instead_triggers_update_details
ON Employeeeeeees
INSTEAD OF UPDATE
 AS
  PRINT('Trigger gets fired successfully');

  UPDATE Employeeeeeees SET Emp_City = 'Puri' WHERE Emp_Id = 5;



