USE cadastro;

SELECT totaulas,count(nome)
FROM cursos
GROUP BY totaulas
ORDER BY totaulas;

SELECT carga,count(nome)
FROM cursos
WHERE totaulas = 30
GROUP BY carga;

SELECT *
FROM cursos
WHERE totaulas = 30;

SELECT ano,count(*)
FROM cursos
GROUP BY ano
HAVING count(ano) >= 5
ORDER BY count(*) DESC;

SELECT ano,count(*)
FROM cursos
WHERE totaulas > 30
GROUP BY ano
HAVING ano > 2013
ORDER BY count(*) DESC;

SELECT avg(carga)
FROM cursos;

SELECT carga, count(*)
FROM cursos
WHERE ano > 2015
GROUP BY carga;

SELECT carga, count(*)
FROM cursos
WHERE ano > 2015
GROUP BY carga
HAVING carga > (SELECT avg(carga)
FROM cursos);