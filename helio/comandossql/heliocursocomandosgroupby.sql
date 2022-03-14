DROP DATABASE IF EXISTS aula_banco;
CREATE DATABASE aula_banco;
USE aula_banco;

CREATE TABLE estado(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL UNIQUE
,sigla CHAR(2) NOT NULL UNIQUE
);

INSERT INTO estado (nome,sigla) VALUES ('PARANÁ','PR'), ('SÃO PAULO','SP'), ('MATO GROSSO','MT'), ('BAHIA','BA'), ('RIO GRANDE DO SUL','RS');

CREATE TABLE cidade(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL
,estado_id INT NOT NULL
,CONSTRAINT cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id)
);

INSERT INTO cidade (nome,estado_id) VALUES ('APUCARANA',1), ('BAURU',2), ('ITABUNA',4), ('JUNDIAÍ',2), ('LONDRINA',1), ('SALVADOR',4), ('VERA CRUZ',2), ('VERA CRUZ',5);

SELECT * FROM cidade;

-- SQL89
SELECT estado.nome estado, cidade.nome cidade
FROM estado, cidade
WHERE estado.id = cidade.estado_id;

-- SQL92

SELECT estado.nome estado, cidade.nome cidade
FROM estado
INNER JOIN cidade ON cidade.estado_id = estado.id;

-- SQL92

SELECT estado.nome estado, count(cidade.id) n_cidades, group_concat(cidade.nome) nomecidades
FROM estado
INNER JOIN cidade ON cidade.estado_id = estado.id
GROUP BY estado.nome;

CREATE TABLE fornecedor(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL
,CPF CHAR(14) NOT NULL UNIQUE
,cidade_id INT NOT NULL
,CONSTRAINT forncedor_cidade FOREIGN KEY (cidade_id) REFERENCES cidade(id)
);

INSERT INTO fornecedor (nome,CPF,cidade_id) VALUES ('JOAQUIM','635.118.250-67',2);
INSERT INTO fornecedor (nome,CPF,cidade_id) VALUES ('PAULA','395.849.300-95',6);
INSERT INTO fornecedor (nome,CPF,cidade_id) VALUES ('MARCELO','094.787.500-03',1);
INSERT INTO fornecedor (nome,CPF,cidade_id) VALUES ('MARIANA','898.129.850-50',2);
INSERT INTO fornecedor (nome,CPF,cidade_id) VALUES ('GIULIANO','916.767.550-63',5);
INSERT INTO fornecedor (nome,CPF,cidade_id) VALUES ('EDSON','006.561.040-74',5);
INSERT INTO fornecedor (nome,CPF,cidade_id) VALUES ('TALITA','828.955.030-87',6);
INSERT INTO fornecedor (nome,CPF,cidade_id) VALUES ('HADASSA','616.501.890-44',8);
INSERT INTO fornecedor (nome,CPF,cidade_id) VALUES ('FABRÍCIA','910.782.930-23',7);

-- SQL92

SELECT c.nome cidade, COUNT(f.nome) nfornecedor, GROUP_CONCAT(f.nome) nomefornecedor
FROM cidade c
INNER JOIN fornecedor f ON f.cidade_id = c.id
GROUP BY c.id;