DROP DATABASE IF EXISTS cadastro;

CREATE DATABASE cadastro;

USE cadastro;

CREATE DATABASE meubanco;

DROP DATABASE meubanco;

CREATE DATABASE cadastro
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_unicode_ci;

CREATE TABLE pessoas(
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(30) NOT NULL
,nascimento DATE
,sexo ENUM('M','F')
,peso DECIMAL(5,2)
,altura DECIMAL(3,2)
,nacionalidade VARCHAR(20) DEFAULT 'Brasil'
,PRIMARY KEY (id)
)DEFAULT CHARSET = utf8mb4;

DESCRIBE pessoas;