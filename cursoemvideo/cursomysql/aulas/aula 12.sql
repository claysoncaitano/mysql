USE cadastro;

SELECT * FROM cursos
WHERE nome = 'P%';

SELECT * FROM cursos
WHERE nome LIKE 'A%';

SELECT * FROM cursos
WHERE nome LIKE '%a';

SELECT * FROM cursos
WHERE nome LIKE '%A%';

SELECT * FROM cursos
WHERE nome NOT LIKE '%a%';

UPDATE cursos
SET nome='PáOO'
WHERE idcurso = 7;

SELECT * FROM cursos;

UPDATE cursos
SET nome = 'Word'
WHERE idcurso = 7;

UPDATE cursos
SET nome='PáOO'
WHERE idcurso = 9;

SELECT * FROM cursos
WHERE nome LIKE 'PH%P%';

SELECT * FROM cursos
WHERE nome LIKE 'PH%P_';

SELECT * FROM cursos
WHERE nome LIKE 'P_______P_';

SELECT * FROM gafanhotos;

SELECT * FROM gafanhotos
WHERE nome LIKE '%SILVA%';

SELECT * FROM gafanhotos
WHERE nome LIKE '%_SILVA%';

SELECT DISTINCT nacionalidade
FROM gafanhotos
ORDER BY nacionalidade;

SELECT count(*)
FROM cursos
WHERE carga > 30;

SELECT count(nome)
FROM cursos
WHERE carga > 30;

SELECT *
FROM cursos
ORDER BY carga;

SELECT nome,max(carga)
FROM CURSOS;

SELECT nome,max(totaulas)
FROM cursos
WHERE ano = 2016;

SELECT nome,min(totaulas)
FROM cursos
WHERE ano = 2016;

SELECT sum(totaulas)
FROM cursos
WHERE ano = 2016;

SELECT avg(totaulas)
FROM cursos
WHERE ano = 2016;