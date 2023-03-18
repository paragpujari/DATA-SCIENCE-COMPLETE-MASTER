------------------------------SQL  MERGE STATEMENTS---------------------------------------------
USE HAPPY;

DROP TABLE IF EXISTS product_source;
DROP TABLE IF EXISTS product_target;
CREATE TABLE product_source
(
  P_ID INT ,
  P_Name NVARCHAR(40),
  P_Price INT
);

CREATE TABLE product_target
(
 P_ID INT ,
  P_Name NVARCHAR(40),
  P_Price INT
);


INSERT INTO product_source VALUES(101,'Mouse Digital',180);
INSERT INTO product_source VALUES(102,'Pad',110);
INSERT INTO product_source VALUES(103,'CPU',777);
INSERT INTO product_source VALUES(104,'Hard Disk',300);




INSERT INTO product_target VALUES(101,'Mouse-II',180);
INSERT INTO product_target VALUES(102,'Pad',110);
INSERT INTO product_target VALUES(103,'CPU',777);
INSERT INTO product_target VALUES(106,'Keyboard',300);


SELECT * FROM product_source;
SELECT * FROM product_target;

MERGE product_target b 
USING product_source a
ON    a.P_ID = b.P_ID
WHEN MATCHED THEN  
             UPDATE SET b.P_ID = a.P_ID  ,
			            b.P_Name = a.P_Name ,
						b.P_Price = a.P_Price
WHEN NOT MATCHED BY TARGET
             THEN INSERT(P_ID, P_Name, P_Price) VALUES(a.P_ID , a.P_Name, a.P_Price)
WHEN NOT MATCHED BY SOURCE
             THEN DELETE;