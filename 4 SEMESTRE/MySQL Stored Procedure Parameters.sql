DELIMITER //
CREATE OR REPLACE PROCEDURE GetSuppliersByCountry
(
	IN CountryName VARCHAR(20)
)

BEGIN
	SELECT * FROM suppliers WHERE Country = CountryName;
END //

DELIMITER ;

SELECT * FROM suppliers;
CALL GetSuppliersByCountry('SINGAPORE');