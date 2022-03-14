-- EXERCÍCIOS SELECET PARTE 2

USE cadastro;

SELECT *
FROM gafanhotos;

-- EXERCÍCIO 01

-- UMA LISTA COM AS PROFISSÕES E QUANTIDADE DE PROFISSIONAIS

SELECT profissao,count(profissao)
FROM gafanhotos
GROUP BY profissao;

-- EXERCÍCIO 02

-- QUANTOS HOMENS E MULHERES NASCERAM APÓS 01-01-2005

SELECT sexo,count(sexo)
FROM gafanhotos
WHERE nascimento > '2005-01-01'
GROUP BY sexo;

-- EXERCÍCIO 03

-- UMA LISTA COM A QUANTIDADE DE PESSOAS QUE NASCERAM EM CADA PAÍS COM EXCESSÃO DO BRASIL E QUE TENHAM MAIS DE TRÊS PESSOAS

SELECT count(nacionalidade)
FROM gafanhotos
GROUP BY nacionalidade;

SELECT nacionalidade,count(nacionalidade)
FROM gafanhotos
WHERE nacionalidade != 'Brasil'
GROUP BY nacionalidade
HAVING count(nacionalidade) > 3;

-- EXERCÍCIO 04

-- UMA LISTA AGRUPADA PELA ALTURA MOSTRANDO QUANTOS ESTÃO ACIMA DE 100 KG E ACIMA DA MÉDIA DE ALTURA

SELECT avg(altura)
FROM gafanhotos;

SELECT count(altura),altura
FROM gafanhotos
WHERE altura > (SELECT avg(altura) FROM gafanhotos) AND peso > 100
GROUP BY altura;