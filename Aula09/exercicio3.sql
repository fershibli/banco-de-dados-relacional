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
	(2, 'Compras'),
	(3, 'Recursos Humanos'),
	(4, 'Diretoria'),
	(5, 'Vendas');

-- item 5

insert into Funcionario values
	(1, 'João', 'dos Santos', 'joaods@email.com', '(11) 91512-2765', '2023-09-09', 3267.45, 3),
	(2, 'Maria', 'Pinheiros', 'mpinheiros@email.com', '(11) 98151-1251', '2024-04-10', 24350.00, 1),
	(3, 'Felipe', 'Cervos', 'felpcervos@email.com', '(11) 91511-2416', '2003-06-05', 55000.00, 4),
	(4, 'Miriam', 'Braga', 'bragagem@email.com', '(11) 98101-2924', '2019-03-12', 4332.55, 2),
	(5, 'Roberto', 'da Silva', 'bobsilva@email.com', '(11) 97123-0124','2003-10-12', 1823.02, 5);

-- item 6

