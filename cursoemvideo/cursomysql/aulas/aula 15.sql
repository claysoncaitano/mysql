USE cadastro;

DESCRIBE gafanhotos;

ALTER TABLE gafanhotos
ADD COLUMN curso_preferido INT;

ALTER TABLE gafanhotos
ADD FOREIGN KEY (curso_preferido)
REFERENCES cursos(idcurso);

SELECT * FROM gafanhotos;

UPDATE gafanhotos
SET curso_preferido = 6
WHERE id = 1;

DELETE FROM cursos
WHERE idcurso = 6;

DELETE FROM cursos
WHERE idcurso = 28;

SELECT nome,curso_preferido FROM gafanhotos;

SELECT gafanhotos.nome 'Nome aluno',cursos.nome 'Curso preferido',cursos.ano 'Ano'
FROM gafanhotos INNER JOIN cursos
ON gafanhotos.curso_preferido=cursos.idcurso
ORDER BY gafanhotos.id;

SELECT gafanhotos.nome 'Nome aluno',cursos.nome 'Curso preferido',cursos.ano 'Ano'
FROM gafanhotos LEFT OUTER JOIN cursos
ON gafanhotos.curso_preferido=cursos.idcurso
ORDER BY gafanhotos.id;

SELECT gafanhotos.nome 'Nome aluno',cursos.nome 'Curso preferido',cursos.ano 'Ano'
FROM gafanhotos RIGHT OUTER JOIN cursos
ON gafanhotos.curso_preferido=cursos.idcurso
ORDER BY gafanhotos.id;