create database exercicio3;
use exercicio3;

-- item 1

create table Setor(
	COD_SETOR int unique not null,
	NOME_SETOR varchar(30) not null,
);

-- item 2

create table Funcionario(
	NRMATRICULA int unique not null,
	PRIMEIRO_NOME varchar(20) not null,
	ULTIMO_NOME varchar(50) not null,
	EMAIL varchar(20) not null,
	TELEFONE varchar(20) not null,
	DATA_ADMISSAO datetime not null,
	SALARIO float not null,
	COD_SETOR int not null
);

-- item 3

alter table Setor add 
	constraint pk_setor primary key(COD_SETOR);

alter table Funcionario add 
	constraint pk_funcionario primary key(NRMATRICULA);

alter table Funcionario add
	constraint fk_funcionario_setor foreign key(COD_SETOR) 
	references Setor(COD_SETOR);

-- item 4

insert into Setor values
	(1, 'Juridico'),
	(2, 'Tecnologia da Informação'),
	(3, 'Recursos Humanos'),
	(4, 'Diretoria'),
	(5, 'Vendas');

-- item 5

insert into Funcionario values
	(1, 'Jo�o', 'dos Santos', 'joaods@email.com', '(11) 91512-2765', '2023-09-09', 3267.45, 3),
	(2, 'Maria', 'Pinheiros', 'mpinheiros@email.com', '(11) 98151-1251', '2024-04-10', 24350.00, 1),
	(3, 'Felipe', 'Cervos', 'felpcervos@email.com', '(11) 91511-2416', '2003-06-05', 55000.00, 4),
	(4, 'Miriam', 'Braga', 'bragagem@email.com', '(11) 98101-2924', '2019-03-12', 4332.55, 2),
	(5, 'Roberto', 'da Silva', 'bobsilva@email.com', '(11) 97123-0124','2003-10-12', 1823.02, 5);

-- item 6a

select COD_SETOR from Funcionario group by COD_SETOR;

-- item 6b

select 
	concat(ULTIMO_NOME, ', ', COD_SETOR) as 'Empregado e Setor' 
	from Funcionario;

-- item 7

select PRIMEIRO_NOME, ULTIMO_NOME, SALARIO from Funcionario
	where SALARIO > 2500;

-- item 8

select PRIMEIRO_NOME, ULTIMO_NOME, COD_SETOR from Funcionario
	where NRMATRICULA = 5;

-- item 9

select PRIMEIRO_NOME, ULTIMO_NOME, SALARIO from Funcionario
	where SALARIO < 1500 or SALARIO > 3000;

-- item 10

select PRIMEIRO_NOME, ULTIMO_NOME, COD_SETOR, DATA_ADMISSAO from Funcionario
	where DATA_ADMISSAO >= '2009-01-01'
	order by DATA_ADMISSAO;

-- item 11 

select f.PRIMEIRO_NOME, f.ULTIMO_NOME, f.COD_SETOR from Funcionario as f
	join Setor as s on f.COD_SETOR = s.COD_SETOR
	where s.NOME_SETOR = 'Tecnologia da Informação' or s.NOME_SETOR = 'Recursos Humanos';

-- item 12 

select PRIMEIRO_NOME, ULTIMO_NOME from Funcionario
	where PRIMEIRO_NOME like '_a%';

-- item 13 

select PRIMEIRO_NOME, ULTIMO_NOME from Funcionario
	where PRIMEIRO_NOME like '%a%' and PRIMEIRO_NOME like '%e%';

-- item 14 

select PRIMEIRO_NOME, ULTIMO_NOME, COD_SETOR from Funcionario
	where COD_SETOR = 2
	order by PRIMEIRO_NOME;

-- item 15 

select PRIMEIRO_NOME, ULTIMO_NOME, COD_SETOR from Funcionario
	where COD_SETOR = 2 or COD_SETOR = 5
	order by COD_SETOR;

-- item 16

select PRIMEIRO_NOME, ULTIMO_NOME, SALARIO from Funcionario
	where SALARIO > 2300 and COD_SETOR = 3;

