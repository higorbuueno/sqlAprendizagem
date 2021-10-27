-- STORE APENAS COM IN

DELIMITER //
CREATE or REPLACE PROCEDURE getAllEmployees()
BEGIN
	DECLARE total int;
    
	select COUNT(*) into total from employees;
    
    select total as TotalColaboradores;
END//
DELIMITER ;

call getAllEmployees();


DELIMITER //
CREATE or REPLACE PROCEDURE SP_SOMAOUT
(
	IN num1 INT,
    IN num2 INT,
    out resultado INT
)

BEGIN
	set resultado = num1 + num2;
END//
DELIMITER ;

call SP_SOMA(1,9, @resultado);
select @resultado;

-- ------------------------
DELIMITER //
CREATE OR REPLACE PROCEDURE SP_DUPLICADOR_INOUT
(
	INOUT duplicado INT
)
BEGIN
	set duplicado = duplicado * 2;
END//
DELIMITER ;

set @duplicado = 5;
call SP_DUPLICADOR_INOUT(@duplicado);
select @duplicado;