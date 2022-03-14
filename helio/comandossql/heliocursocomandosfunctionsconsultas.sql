DROP DATABASE IF EXISTS aula_banco;
CREATE DATABASE aula_banco;
USE aula_banco;

CREATE TABLE funcionario(
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL
,CPF CHAR(14) NOT NULL UNIQUE
,salario DECIMAL(9,2) NOT NULL
,nascimento DATE NOT NULL
,ativo CHAR(1) NOT NULL DEFAULT 'A'
,CONSTRAINT pk_funcionario PRIMARY KEY (id)
);

INSERT INTO funcionario (nome,CPF,salario,nascimento,ativo) VALUES ('ROBERTO','789.456.135-87',2500,'2000-10-22','A');
INSERT INTO funcionario (nome,CPF,salario,nascimento,ativo) VALUES ('RÚBIA','951.357.987-88',4261.70,'1998-07-18','I');
INSERT INTO funcionario (nome,CPF,salario,nascimento,ativo) VALUES ('MARCO','753.951.744-56',1000,'2002-5-01','A');
INSERT INTO funcionario (nome,CPF,salario,nascimento,ativo) VALUES ('ELIANE','251.654.889-74',15000,'2001-4-20','A');
INSERT INTO funcionario (nome,CPF,salario,nascimento,ativo) VALUES ('HORTÊNCIA','369.258.741-56',25700,'1980-7-30','T');

SELECT * FROM funcionario;

SELECT 3*5;

SELECT
	nome
    ,salario
    ,salario*0.1 AS aumento
    ,salario*0.05 AS desconto
    ,(salario*1.1)-(salario*0.05) AS total
FROM funcionario;

SELECT CASE 1000 WHEN 1 THEN 'one' WHEN 2 THEN 'two' ELSE 'more' END;

SELECT
	nome
    ,salario
    ,salario*0.1 AS aumento
    ,salario*0.05 AS desconto
    ,(salario*1.1)-(salario*0.05) AS total
    ,CASE ativo WHEN 'A' THEN 'Ativo' WHEN 'I' THEN 'Inativo' WHEN 'T' THEN 'Treinamento' ELSE '' END status
    ,IF (salario>20000,'Patrão', IF (salario>10000,'Boy','Zé'))
    ,salario/3 'parcelado 3x'
    ,round(salario/3,2) 'parcelado 3x arredondado'
    ,truncate(salario/3,2) 'parcelado 3x truncate'
    ,DATE_FORMAT(nascimento,'%d/%m/%Y')
    ,TIMESTAMPDIFF(YEAR,nascimento,NOW())
FROM funcionario;

SELECT MAX(salario) FROM funcionario;

SELECT MIN(salario) FROM funcionario;

SELECT AVG(salario) FROM funcionario;