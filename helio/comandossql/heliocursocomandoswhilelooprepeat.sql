DROP DATABASE IF EXISTS aula_banco;

CREATE DATABASE aula_banco;

USE aula_banco;

/**   
>>>>>>>>>>>>>>>>>>> SINTAXE WHILE <<<<<<<<<<<<<<<<<<<<<<<  
criando função com a estrutura de repetição WHILE

WHILE condição_lógica DO
	nosso código...
END WHILE;
*/
DELIMITER //
CREATE FUNCTION contar_ate(limite INT)
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE contador INT;
    SET contador = 0;
    WHILE contador < limite DO
		SET contador = contador+1;
    END WHILE;
	RETURN contador;
END;
// DELIMITER ;

SELECT contar_ate(30);

/**   
>>>>>>>>>>>>>>>>>>> SINTAXE LOOP <<<<<<<<<<<<<<<<<<<<<<<  
nome_loop : LOOP
	nosso código...
	IF condição_lógica THEN
		LEAVE nome_loop;
	END IF;
END LOOP nome_loop;
*/
DROP FUNCTION somar_ate; /**elimiando função*/
 /** criando a função com LOOP */
 
DELIMITER //
 CREATE FUNCTION somar_ate(limite INT)
 RETURNS INT DETERMINISTIC
 BEGIN
	DECLARE contador INT;
    SET contador = 0;
    meu_loop : LOOP
		SET contador = contador + 1;
        IF contador >= limite THEN
			LEAVE meu_loop;
        END IF;
    END LOOP meu_loop;
    RETURN contador;
 END;
 // DELIMITER ;
 
 SELECT contar_ate(30);
 
 /**   
>>>>>>>>>>>>>>>>>>> SINTAXE REPEAT <<<<<<<<<<<<<<<<<<<<<<<  
REPEAT
	nosso código...
	UNTIL condição_lógica
END REPEAT;
*/
DROP FUNCTION contar_ate; /**elimiando função*/

 /** criando a função com REPEAT */
 DELIMITER //
 CREATE FUNCTION contar_ate(limite INT)
 RETURNS INT DETERMINISTIC
 BEGIN
	DECLARE contador INT;
    SET contador = 0;
    REPEAT
		SET contador = contador + 1;
		UNTIL contador >= limite
    END REPEAT;
    RETURN contador;
 END;
 // DELIMITER ;
 
 SELECT contar_ate(40);
 
  /** FATORIAL 
Operação comum na análise combinatória, facilitando o cálculo envolvendo contagem. 
Representado pelo símbolo "!" ( n! ) → multiplicação de n por todos os seus antecessores até chegar em 1. 
3! = 3 x 2 x 1.
obs: fatorial de 0 é 1
 */
 
/** versão 1 **/

DELIMITER //
CREATE FUNCTION fatorial(n INT)
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE fat INT DEFAULT n;
    WHILE n > 1 DO
		SET n = n -1;
        SET fat = fat * n;
    END WHILE;
    RETURN fat;
END;
// DELIMITER ;

SELECT fatorial(3); /** testando com 3 - deu certo!! */
SELECT fatorial(0); /** testando com 3 - deu errado!! */

/** versão 2 - corrigindo o bug do 0 **/
DROP FUNCTION fatorial;

DELIMITER //
CREATE FUNCTION fatorial(n INT)
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE fat INT;
    SET fat = n;
	IF n = 0 THEN
		RETURN 1;
    END IF;
    WHILE n > 1 DO
		SET n = n - 1;
        SET fat = fat * n;
    END WHILE;
    RETURN fat;
END;
// DELIMITER ;

SELECT fatorial(5);

DROP FUNCTION fatorial;

DELIMITER //
CREATE FUNCTION fatorial(num INT)
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE fat INT;
    SET fat = num;
    IF num = 1 THEN
		RETURN 1;
	END IF;
    meu_loop : LOOP
		SET num = num -1;
		SET fat = fat * num;
        IF num <= 1 THEN
			LEAVE meu_loop;
		END IF;
    END LOOP meu_loop;
    RETURN fat;
END;
// DELIMITER ;

SELECT fatorial(5);

DROP FUNCTION fatorial;

DELIMITER //
CREATE FUNCTION fatorial(num INT)
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE fat INT;
	SET fat = num;
	IF num = 1 THEN
		RETURN 1;
	END IF;
    REPEAT
		SET num = num - 1;
        SET fat = fat * num;
		UNTIL num <= 1
    END REPEAT;
    RETURN fat;
END;
// DELIMITER ;

SELECT fatorial(5);