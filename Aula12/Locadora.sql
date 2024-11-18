-- 1) Selecione todos os clientes da locadora.

SELECT * FROM CLIENTES;

-- 2) Selecione todos os filmes da locadora.

SELECT * FROM FILME;

-- 3) Mostre todas as categorias que a locadora possui cadastrada.

SELECT * FROM CATEGORIA;

-- 4) Mostre todos os clientes do sexo masculino que moram na cidade de Sorocaba.

SELECT * FROM CLIENTES WHERE SEXO = 'M' AND CIDADE = 'Sorocaba';

-- 5) Mostre o nome e o telefone de todos os clientes da locadora ordenando a consulta por ordem alfabética.

SELECT NOME, TELEFONE FROM CLIENTES
ORDER BY NOME;

-- 6) Mostre a quantidade de clientes mulheres cadastradas no sistema.

SELECT COUNT(*) FROM CLIENTES WHERE SEXO = 'F';

-- 7) Mostre as categorias de filmes que a locadora possui mostrando o nome da categoria em ordem alfabética.

SELECT NOME_CATEGORIA FROM CATEGORIA
ORDER BY NOME_CATEGORIA;

-- 8) Mostre todos os filmes cadastrados do Diretor “Shawn Levy” que não possuem reserva.

SELECT * FROM FILME WHERE DIRETOR = 'Shawn Levy' AND RESERVADA = 'n';

-- 9) Mostre todos os filmes cujo valor seja superior a 5 reais e que estão reservados.

SELECT * FROM FILME WHERE VALOR_LOCACAO > 5 AND RESERVADA = 's';

-- 10) Mostre todos os diretores cadastrados no sistema sem repetição de nomes.

SELECT DISTINCT DIRETOR FROM FILME;

-- 11) Mostre a quantidade de filmes reservados.

SELECT COUNT(*) AS "QUANTIDADE_FILMES" FROM FILME WHERE RESERVADA = 's';

-- 12) Mostre o maior valor de Locação cadastrado.

SELECT MAX(VALOR_LOCACAO) FROM FILME;

-- 13) Mostre todos os filmes cuja categoria seja Ação (nome).

SELECT * FROM FILME F
JOIN CATEGORIA C ON F.COD_CATEGORIA = C.COD_CATEGORIA
WHERE C.NOME_CATEGORIA = 'Ação';

-- 14) Mostre todos os filmes cuja categoria seja Romance ou Aventura que já estão reservados e seu valor de locação seja menor que 5 reais.

SELECT * FROM FILME F
JOIN CATEGORIA C ON F.COD_CATEGORIA = C.COD_CATEGORIA
WHERE C.NOME_CATEGORIA = 'Romance' OR C.NOME_CATEGORIA = 'Aventura' AND F.RESERVADA = 's' AND F.VALOR_LOCACAO < 5;

-- 15) Mostre todos os filmes alugados pelo cliente Renata Cristina.

SELECT F.FILME FROM FILME F
JOIN LOCACOES L ON F.COD_FILME = L.COD_FILME
JOIN CLIENTES C ON L.COD_CLIENTE = C.COD_CLIENTE
WHERE C.NOME = 'Renata Cristina';

-- 16) Mostre todos os clientes que já alugaram mais do que 3 filmes.

SELECT NOME
FROM (
    SELECT C.NOME, COUNT(L.COD_LOCACAO) AS total_locacoes
    FROM CLIENTES C
    JOIN LOCACOES L ON C.COD_CLIENTE = L.COD_CLIENTE
    GROUP BY C.NOME
) subconsulta
WHERE total_locacoes > 3;

-- OU usando HAVING

SELECT C.NOME FROM CLIENTES C
JOIN LOCACOES L ON C.COD_CLIENTE = L.COD_CLIENTE
GROUP BY C.NOME
HAVING COUNT(L.COD_LOCACAO) > 3;

-- 17) Mostre quanto foi gasto pelo cliente Renata Cristina.

SELECT SUM(F.VALOR_LOCACAO) AS "VALOR_GASTO"
FROM FILME F
JOIN LOCACOES L ON F.COD_FILME = L.COD_FILME
JOIN CLIENTES C ON L.COD_CLIENTE = C.COD_CLIENTE
WHERE C.NOME = 'Renata Cristina';

-- 18) Mostre a média de valor de locação da locadora.

SELECT AVG(VALOR_LOCACAO) FROM FILME;

-- 19) Mostre o menor valor de locação da locadora.

SELECT MIN(VALOR_LOCACAO) FROM FILME;

-- 20) Mostre a quantidade de filme que a locadora possui por categoria.

SELECT C.NOME_CATEGORIA, COUNT(F.COD_FILME) AS "QUANTIDADE_FILMES"
FROM FILME F
JOIN CATEGORIA C ON F.COD_CATEGORIA = C.COD_CATEGORIA
GROUP BY C.NOME_CATEGORIA;
