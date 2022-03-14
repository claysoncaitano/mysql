
/** script do curso de banco de dados MySQL utilizando workbench**/


DROP DATABASE IF EXISTS AULA_BANCO;	/** caso exista, eliminando a base de dados AULA_BANCO **/
CREATE DATABASE AULA_BANCO; 		/** criando a base de dados **/
USE AULA_BANCO;				/** selecionando a base de dados **/

/** criando a tabela pessoa **/
CREATE TABLE PESSOA(
ID INT NOT NULL AUTO_INCREMENT
,NOME VARCHAR(100) NOT NULL 
,ATIVO CHAR(1) NOT NULL DEFAULT 'S'
,CONSTRAINT PK_PESSOA PRIMARY KEY (ID)
);

DELETE FROM pessoa WHERE id = 5;

SELECT * FROM pessoa;

/** inserindo pessoas **/
INSERT INTO PESSOA (NOME) VALUES ('PAULA');
INSERT INTO PESSOA (NOME) VALUES ('RAUL');
INSERT INTO PESSOA (NOME,ATIVO) VALUES ('REGIANE','N');

/**
***** sintaxe de uma função MySQL  ****
DELIMITER //                            → troca do símbolo do delimitador que por padrão é ; - para diferenciar com o final do comando
CREATE FUNCTION nome( [parâmetros] )    → cria função, os parâmetros são opcionais
RETURNS {TIPO DE DADO}                  → definir o tipo de dados que a função irá retornar
[NOT] DETERMINISTC                      → se a função será ou não DETERMINISTC
BEGIN                                   → início do bloco de comando
   DECLARE [variáveis];                 → declaração da variável
   código...                            → nossa programação
   RETURN ....;                         → o retorno do resultado
END;                                    → fim do bloco de comando
//                                      → fim da função                          
DELIMITER ;                             → retornando o símbolo padrão do delimitador
**/


/** 
exemplo de função deterministc 
conforme parâmetro, o resultado sempre é o mesmo
**/

SELECT concat(nome,' - ',ativo) FROM pessoa;

/** 
exemplo de função não deterministc 
funão de caucular idade, conforme o dia, mesmo que tenha o mesmo parâmetro gera resultado diferente
**/

SELECT now();


/** sintaxe para eliminar, caso exista, uma função **/
DROP FUNCTION IF EXISTS OLA;

/** exemplo da 1º função - sem parâmetro, sem variáveis, somente para entender a sintaxe **/
DELIMITER //
CREATE FUNCTION ola()
RETURNS VARCHAR(150) DETERMINISTIC
BEGIN
	RETURN 'olá pessoal';
END;
//
DELIMITER ;

SELECT ola();/** TESTANDO A FUNÇÃO **/

/** eliminando a função para fazer o 2º exemplo **/
DROP FUNCTION IF EXISTS OLA;

/** exemplo da 2º função - definindo parâmetro **/
DELIMITER //
CREATE FUNCTION ola(nome VARCHAR(100))
RETURNS VARCHAR(150) DETERMINISTIC
BEGIN
	RETURN concat('olá ',nome);
END;
// DELIMITER ;


SELECT ola('Clayson'); /** TESTANDO A FUNÇÃO**/
SELECT ola(nome) FROM pessoa; /** TESTE FUNÇÃO NA CONSULTA**/
SELECT ola(nome) FROM pessoa WHERE id = 3; /** TESTE FUNÇÃO NA CONSUTLA COM FILTRO**/
SELECT ola(nome) FROM pessoa WHERE ativo = 'N';


/** eliminando a função para fazer o 3º exemplo **/
DROP FUNCTION IF EXISTS OLA;

/** exemplo da 3º função - definindo VARIÁVEL **/
DELIMITER //
CREATE FUNCTION ola(nome VARCHAR(100))
RETURNS VARCHAR(150) DETERMINISTIC
BEGIN
	DECLARE frase VARCHAR(150);
    SET frase = concat('olá ',nome);
    RETURN frase;
END;
// DELIMITER ;

SELECT ola(nome) FROM pessoa WHERE ativo = 'S'; /** TESTE FUNÇÃO NA CONSULTA**/

/** eliminando a função para fazer o 4º exemplo **/
DROP FUNCTION IF EXISTS OLA;

/** exemplo da 4º função - ESTRUTURA DE DECISÃO **/
DELIMITER //
CREATE FUNCTION ola(nome VARCHAR(100),ativo CHAR(1) ) 
RETURNS VARCHAR(150) DETERMINISTIC
BEGIN
	DECLARE FRASE VARCHAR(150);
	IF ativo = 'S' THEN
		BEGIN
			SET frase = CONCAT('Olá ', nome);
		END;
	END IF;
	RETURN frase;
END;
//
DELIMITER ;

SELECT ola(nome,ativo) FROM pessoa; /** TESTE FUNÇÃO NA CONSULTA**/

/** eliminando a função para fazer o 5º exemplo **/
DROP FUNCTION IF EXISTS OLA;

/** exemplo da 5º função - ELSE **/
DELIMITER //
CREATE FUNCTION ola(nome VARCHAR(100), ativo CHAR(1))
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
	DECLARE frase VARCHAR(150);
    
    IF ativo = 'S' THEN
		BEGIN
			SET frase = concat('olá ',nome);
        END;
	ELSE
		BEGIN
			SET frase = concat(nome,' está inativo');
        END;
	END IF;
    RETURN frase;
END;
// DELIMITER ;

SELECT ola(nome,ativo) FROM pessoa; /** TESTE FUNÇÃO NA CONSULTA**/

/** eliminando a função para fazer o 6º exemplo **/
DROP FUNCTION IF EXISTS OLA;

/** exemplo da 6º função - IF ANINHADO - ELSEIF **/
DELIMITER //
CREATE FUNCTION ola(nome VARCHAR(100), ativo CHAR(1), opcao INT)
RETURNS VARCHAR(150) DETERMINISTIC
BEGIN
	DECLARE frase VARCHAR(150);
    
    IF ativo = 'S' THEN
		BEGIN
			IF opcao = 1 THEN
				BEGIN
					SET frase = concat('bom dia ',nome);
				END;
			ELSEIF opcao = 2 THEN
				BEGIN
					SET frase = concat('boa tarde ',nome);
				END;
			ELSEIF opcao = 3 THEN
				BEGIN
					SET frase = concat('boa noite ',nome);
				END;
			ELSE
				BEGIN
					SET frase = 'opcão errado';
				END;
			END IF;
		END;
	ELSE
		BEGIN
			SET frase = concat(nome,' está inativo');
		END;
	END IF;
    
    RETURN frase;
END;
            
// DELIMITER ;

SELECT ola(nome,ativo,58) FROM pessoa; /** TESTE FUNÇÃO NA CONSULTA**/