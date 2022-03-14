DROP DATABASE IF EXISTS cadastro;

CREATE DATABASE cadastro;

USE cadastro;

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

INSERT INTO pessoas
(nome,nascimento,sexo,peso,altura,nacionalidade)
VALUES
('Godofredo','1984-01-02','M','78.5','1.83','Brasil');

INSERT INTO pessoas
(nome,nascimento,sexo,peso,altura,nacionalidade)
VALUES
('Maria','1999-12-30','F','55.2','1.65','Portugal');

INSERT INTO pessoas
(id,nome,nascimento,sexo,peso,altura,nacionalidade)
VALUES
(DEFAULT,'Creuza','1920-12-30','F','50.2','1.65',DEFAULT);

INSERT INTO pessoas
VALUES
(DEFAULT,'Adalgiza','1930-11-02','F','63.2','1.75',DEFAULT);

INSERT INTO pessoas
VALUES
(DEFAULT,'Cláudio','1975-04-22','M','99','2.15',DEFAULT),
(DEFAULT,'Pedro','1999-12-03','M','87','2',DEFAULT),
(DEFAULT,'Janaína','1987-11-12','F','75.4','1.66','EUA');

SELECT * FROM pessoas;

ALTER TABLE pessoas
ADD COLUMN profissao VARCHAR(10);

DESCRIBE pessoas;

ALTER TABLE pessoas
DROP COLUMN profissao;

ALTER TABLE pessoas
ADD COLUMN profissao VARCHAR(10) AFTER nome;

DESCRIBE pessoas;

ALTER TABLE pessoas
ADD COLUMN codigo INT FIRST;

ALTER TABLE pessoas
MODIFY COLUMN profissao VARCHAR(20) NOT NULL DEFAULT '';

ALTER TABLE pessoas
CHANGE COLUMN profissao prof VARCHAR(20);

ALTER TABLE pessoas
RENAME TO gafanhotos;

DESCRIBE gafanhotos;

CREATE TABLE cursos(
nome VARCHAR(30) NOT NULL
,descricao TEXT
,carga INT UNSIGNED
,totaulas INT UNSIGNED
,ano YEAR DEFAULT '2022'
)DEFAULT CHARSET = utf8mb4;

DESCRIBE cursos;

ALTER TABLE cursos
ADD COLUMN id INT FIRST;

ALTER TABLE cursos
ADD PRIMARY KEY (id);

ALTER TABLE cursos
CHANGE COLUMN id idcurso INT;

CREATE TABLE IF NOT EXISTS teste(
id INT PRIMARY KEY AUTO_INCREMENT
,nome VARCHAR(100)
,idade INT
);

INSERT INTO teste
VALUES (DEFAULT,'Pedro','22');

SELECT * FROM teste;

DROP TABLE IF EXISTS teste;