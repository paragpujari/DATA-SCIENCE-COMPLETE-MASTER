use happy;

---------------Indexes--------------------------------

SELECT * FROM EMPLOYS

-----------1. CREATION OF CLUESTERED INDEX ON emp_id-------------------------------

CREATE  CLUSTERED INDEX idx_EMPLOYS_emp_id ON EMPLOYS(emp_id);

----------- 2. CREATION OF NON CLUSTERDD INDEX-------------------------------------
CREATE NONCLUSTERED  INDEX idx_EMPLOYS_emp_name ON EMPLOYS(emp_name);

----------  3. To diasble index in the table----------------------------------------
ALTER INDEX idx_EMPLOYS_emp_id ON EMPLOYS DISABLE;

-----------  4. To enable index in the table---------------------------------------
ALTER INDEX idx_EMPLOYS_emp_id ON EMPLOYS REBUILD;

----------- 5. DROP THE INDEX--------------------------------------------------------
DROP INDEX idx_EMPLOYS_emp_id ON EMPLOYS;

---------- 6. CREATION OF UNIQUE CLUSTERED INDEX ON THE TABLE---------------------
CREATE UNIQUE CLUSTERED INDEX uix_EMPLOYS_emp_id ON EMPLOYS(emp_id);

----------- 7. CREATION OF UNIQUE NON CLUSTERED INDEX-------------------------------
CREATE UNIQUE NONCLUSTERED INDEX uix_EMPLOYS_emp_dob ON EMPLOYS(emp_dob);

SELECT * FROM EMPLOYS;

----------- 8. INDEXES WITH INCLUDE COLUMNS-----------------------------------------
CREATE NONCLUSTERED INDEX idx_EMPLOYS_emp_name ON EMPLOYS(emp_name)
INCLUDE (emp_dob, emp_salary, emp_gender);

------------9. INDEX WITH FILTERED COLUMNS--------------------------------------------
CREATE NONCLUSTERED INDEX idx_EMPLOYS_emp_age ON EMPLOYS(emp_age) WHERE emp_age IS NOT NULL;

------------ 10. INDEXES ON COMPUTED COLUMNS-----------------------------------------
CREATE INDEX idx_EMPLOYS_emp_salary ON EMPLOYS(emp_salary);

CREATE INDEX idx_EMPLOYS_emp_dob ON EMPLOYS(emp_dob);

