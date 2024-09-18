use FBD;

-- jeitos de insert

INSERT INTO Cliente (cod_cliente, nome_cliente, endereco, cidade, cep, uf, ie) VALUES (0001,'Marcelo Cruz' ,'Rua Brasil, 35','Jundiaí',13124579,'SP', '53425364');

INSERT INTO cliente VALUES (0001,'Marcelo Cruz' ,'Rua Brasil, 35'
,'Jundiaí',13124579,'SP', '53425364');

-- select com apelido

SELECT 'Código do Cliente', cod_cliente, 'Nome do Cliente',
nome_cliente
FROM cliente;

SELECT cod_cliente as 'Código do Cliente', nome_cliente as 'Nome
do Cliente'
FROM cliente;

SELECT num_pedido, cod_produto, quantidade
FROM item_pedido
WHERE quantidade = 45;

create table funcionario(
nrmatricula int primary key,
primeiro_nome varchar(50),
ultimo_nome varchar(50),
cod_setor int,
salario float
);

insert into funcionario values(1, 'João', 'Silva', 1, 1000);
insert into funcionario values(2, 'Maria', 'Santos', 2, 2000);
insert into funcionario values(3, 'José', 'Oliveira', 1, 3000);
insert into funcionario values(4, 'Ana', 'Pereira', 3, 4000);
insert into funcionario values(5, 'Pedro', 'Cavalcante', 2, 5000);
insert into funcionario values(6, 'Paula', 'Ferreira', 1, 6000);
insert into funcionario values(7, 'Carlos', 'Santana', 3, 1700);
insert into funcionario values(8, 'Marta', 'Silveira', 2, 1200);
insert into funcionario values(9, 'Yasmin', 'Santos', 1, 1500);

Select nrmatricula, primeiro_nome, ultimo_nome, cod_setor
from funcionario
where cod_setor = 2;

Select primeiro_nome, salario
from funcionario
where salario < 1500;

Select primeiro_nome, salario
from funcionario
where salario between 1500 and 2000;

SELECT cod_produto, descricao
FROM produto
WHERE valor_unitario between 0.32 and 2.00;

Select primeiro_nome, salario, cod_setor
from funcionario
where primeiro_nome like '%M%';

Select primeiro_nome, salario, cod_setor
from funcionario
where primeiro_nome like 'M%';

SELECT cod_produto, descricao, unidade
FROM produto
WHERE unidade like 'K%';

SELECT nome_vendedor
FROM vendedor
WHERE faixa_comissao not in ('A', 'B')

Select primeiro_nome, salario, cod_setor
from funcionario
where cod_setor in (1,3);

select * from funcionario f
where cod_setor not in (1,3);

SELECT *
FROM cliente
WHERE ie is null;

Select nrmatricula, ultimo_nome, salario
from funcionario
where salario > 1000 and nrmatricula >= 3;

Select *
from funcionario
where salario > 2500 or cod_setor = 4;

SELECT descricao
FROM produto
WHERE unidade = 'LT' and valor_unitario > 51;

SELECT descricao
FROM produto
WHERE unidade = 'UN' and valor_unitario = 4;

SELECT nome_vendedor, salario_fixo
FROM vendedor
ORDER by nome_vendedor;

Select *
from funcionario f
where cod_setor NOT IN (2,4)
Order by cod_setor DESCSelect *
from funcionario f
where cod_setor NOT IN (2,4)
Order by cod_setor, primeiro_nome

CREATE TABLE PESSOA
(
id_pessoa integer primary key,
nome varchar(20),
cpf varchar(14)
);

CREATE TABLE PESSOA_FISICA
(
id_pessoa integer primary key,
nome varchar(20),
cpf varchar(14)
);INSERT INTO PESSOA VALUES (1, 'PEDRO CABRAL', '12345678991');INSERT INTO PESSOA_FISICA SELECT ID_PESSOA, NOME, CPF FROM
PESSOA;