DROP TABLE IF EXISTS Sales; 
 
CREATE TABLE Sales ( 
    id INT AUTO_INCREMENT, 
    product VARCHAR(100) NOT NULL, 
    quantity INT NOT NULL DEFAULT 0, 
    fiscalYear SMALLINT NOT NULL, 
    fiscalMonth TINYINT NOT NULL, 
    CHECK(fiscalMonth >= 1 AND fiscalMonth <= 12), 
    CHECK(fiscalYear BETWEEN 2000 and 2050), 
    CHECK (quantity >=0), 
    UNIQUE(product, fiscalYear, fiscalMonth), 
    PRIMARY KEY(id) 
); 

INSERT INTO Sales(product, quantity, fiscalYear, fiscalMonth) 
VALUES 
    ('2001 Ferrari Enzo',140, 2021,1), 
    ('1998 Chrysler Plymouth Prowler', 110,2021,1), 
    ('1913 Ford Model T Speedster', 120,2021,1); 
    
SELECT * FROM Sales; 

DROP TABLE IF EXISTS SalesChanges; 
 
CREATE TABLE SalesChanges ( 
    id INT AUTO_INCREMENT PRIMARY KEY, 
    salesId INT, 
    beforeQuantity INT, 
    afterQuantity INT, 
    changedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP 
); 

SELECT * FROM SalesChanges;
	
DELIMITER $$
CREATE OR REPLACE TRIGGER after_sales_update
AFTER UPDATE
ON Sales FOR EACH ROW
BEGIN
   INSERT INTO SalesChanges(salesId, beforeQuantity, afterQuantity, changedAt)
   VALUES(new.id, OLD.quantity, NEW.quantity, now());
END$$
DELIMITER ;

UPDATE Sales
SET quantity = 350 
WHERE id = 1; 

SELECT * FROM SalesChanges;

UPDATE Sales  
SET quantity = CAST(quantity * 1.1 AS UNSIGNED); 

## BEFORE UPTADEEEEEEEEEE

DROP TABLE IF EXISTS sales; 
 
CREATE TABLE sales ( 
    id INT AUTO_INCREMENT, 
    product VARCHAR(100) NOT NULL, 
    quantity INT NOT NULL DEFAULT 0, 
    fiscalYear SMALLINT NOT NULL, 
    fiscalMonth TINYINT NOT NULL, 
    CHECK(fiscalMonth >= 1 AND fiscalMonth <= 12), 
    CHECK(fiscalYear BETWEEN 2000 and 2050), 
    CHECK (quantity >=0), 
    UNIQUE(product, fiscalYear, fiscalMonth), 
    PRIMARY KEY(id) 
); 

INSERT INTO sales(product, quantity, fiscalYear, fiscalMonth) 
VALUES 
    ('2003 Harley-Davidson Eagle Drag Bike',120, 2020,1), 
    ('1969 Corvair Monza', 150,2020,1), 
    ('1970 Plymouth Hemi Cuda', 200,2020,1); 
    
SELECT * FROM Sales; 

DELIMITER $$
CREATE OR REPLACE TRIGGER before_sales_update
BEFORE UPDATE
ON Sales FOR EACH ROW
BEGIN
	IF (NEW.quantity >= (OLD.quantity*3))
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = CONCAT("The new quantity ", NEW.quantity, " cannot be 3 times greater than the current quantity ", OLD.quantity);
	END IF;
    show errors;
END$$
DELIMITER ;


