USE cadastro;

SELECT * FROM gafanhotos;

SELECT * FROM cursos;

SELECT * FROM cursos
ORDER BY nome;

SELECT * FROM cursos
ORDER BY nome DESC;

SELECT * FROM cursos
ORDER BY NOME ASC;

DESCRIBE cursos;

SELECT nome,carga,ano FROM cursos;

SELECT ano,nome,carga FROM cursos;

SELECT ano,nome,carga FROM cursos
ORDER BY ano;

SELECT ano,nome,carga FROM cursos
ORDER BY ano,nome;

SELECT * FROM cursos
WHERE ano = 2016
ORDER BY ano;

SELECT nome,carga FROM cursos
WHERE ano = 2016
ORDER BY ano;

SELECT nome,descricao FROM cursos
WHERE ano <= 2015
ORDER BY ano, nome;

SELECT nome,descricao FROM cursos
WHERE ano < 2015
ORDER BY ano, nome;

SELECT nome,descricao FROM cursos
WHERE ano > 2016
ORDER BY ano, nome;

SELECT nome,descricao FROM cursos
WHERE ano >= 2015
ORDER BY ano, nome;

SELECT nome,descricao FROM cursos
WHERE ano != 2015
ORDER BY ano, nome;

SELECT nome,descricao FROM cursos
WHERE ano <> 2015
ORDER BY ano, nome;

SELECT * FROM cursos
WHERE totaulas BETWEEN 20 and 30
ORDER BY ano;

SELECT * FROM cursos
WHERE ano BETWEEN 2014 and 2016
ORDER BY ano DESC, nome;

SELECT * FROM cursos
WHERE ano IN('2010','2015','2020')
ORDER BY ano;

SELECT nome,carga,totaulas FROM cursos
WHERE carga > 35 AND totaulas < 30
ORDER BY carga;

SELECT nome,carga,totaulas FROM cursos
WHERE carga > 35 OR totaulas < 30
ORDER BY carga;