select * from products;
/*
	Crie um procedimento armazenado que busque pelo Id um produto e retorne sua classificação.
	O valor do produto se encontra no atributo UnitPrice.
	A classificação do produto está nos seguintes intervalos:
		•Se o preço é maior que 47, pertence à classe A
		•Se o preço é menor e igual 47 e maior que 10, pertence à classeB
		•Diferente das informações anteriores, pertence à classe 
*/

DELIMITER $$
CREATE FUNCTION ProductClass (
	price DECIMAL(10,4)
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
	DECLARE tipoClasse VARCHAR(20);
    
    IF price > 47 THEN
		SET tipoClasse = 'CLASSE A';
        
	ELSEIF price > 10 THEN
		SET tipoClasse = 'CLASSE B';
        
	ELSEIF price <= 10 THEN
		SET tipoClasse = 'CLASSE C';
    
    END IF;
    RETURN (tipoClasse);
	
END $$
DELIMITER ;


DELIMITER //
CREATE PROCEDURE getProductClass (
	IN productID INT,
    OUT productClass VARCHAR(20)
)
BEGIN	
	DECLARE precoProduto decimal(10,4);
    
	SELECT UnitPrice FROM products as p
    WHERE p.ProductID = productID
    INTO precoProduto;
    
    set productClass = ProductClass(precoProduto);

END //

DELIMITER ;

select * from products;
CALL getProductClass(4, @productClass);
select @productClass;