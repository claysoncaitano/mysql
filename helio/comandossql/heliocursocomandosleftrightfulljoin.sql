DROP DATABASE IF EXISTS aula_banco; -- se existir elimine aula_banco
CREATE DATABASE aula_banco; 		-- criar aula_banco
USE aula_banco;						-- selecionar aula_banco

CREATE TABLE pessoa(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL
,CPF CHAR(14) NOT NULL UNIQUE
);

INSERT INTO pessoa (nome,CPF) VALUES ('JOAQUIM','111.111.111-11'), ('MARIA','222.222.222-22'), ('ROBERTO','333.333.333-33'), ('KELLY','444.444.444-44');

SELECT * FROM pessoa;

CREATE TABLE estado(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL
,sigla CHAR(2) NOT NULL UNIQUE
);

INSERT INTO estado (nome,sigla) VALUES ('PARANÁ','PR'), ('SANTA CATARINA','SC'), ('MATO GROSSO','MT'), ('SÃO PAULO','SP');

SELECT * FROM estado;

CREATE TABLE pessoa_estado(
pessoa_id INT NOT NULL
,estado_id INT NOT NULL
,CONSTRAINT pessoa_pe FOREIGN KEY (pessoa_id) REFERENCES pessoa(id)
,CONSTRAINT estado_pe FOREIGN KEY (estado_id) REFERENCES estado(id)
);

INSERT INTO pessoa_estado (pessoa_id,estado_id) VALUES (1,1), (2,3), (3,3), (1,4), (2,4), (3,4);

SELECT * FROM pessoa_estado;

SELECT pessoa.nome, estado.nome
FROM pessoa
INNER JOIN pessoa_estado ON pessoa_estado.pessoa_id = pessoa.id
INNER JOIN estado ON estado.id = pessoa_estado.estado_id;

SELECT pessoa.nome, estado.nome
FROM pessoa
LEFT JOIN pessoa_estado ON pessoa_estado.pessoa_id = pessoa.id
LEFT JOIN estado ON estado.id = pessoa_estado.estado_id;

SELECT pessoa.nome, estado.nome
FROM pessoa
RIGHT JOIN pessoa_estado ON pessoa_estado.pessoa_id = pessoa.id
RIGHT JOIN estado ON estado.id = pessoa_estado.estado_id;

SELECT pessoa.nome, estado.nome
FROM pessoa
LEFT JOIN pessoa_estado ON pessoa_estado.pessoa_id = pessoa.id
LEFT JOIN estado ON estado.id = pessoa_estado.estado_id
UNION
SELECT pessoa.nome, estado.nome
FROM pessoa
RIGHT JOIN pessoa_estado ON pessoa_estado.pessoa_id = pessoa.id
RIGHT JOIN estado ON estado.id = pessoa_estado.estado_id;