use test_db3;

-- Criação de tabela 
create table cliente(
	cod_cli int not null,
	nome_cli varchar(40) not null,
	end_cli varchar(30) not null,
	bai_cli varchar(20) not null,
	cid_cli varchar(20) not null,
	uf_cli char(3) not null,
	tel_cli  varchar(15) null,
	constraint pk_cliente primary key(cod_cli)
	);

-- Selecionando todas as tabelas
	Select * from cliente

create Table NotaFiscal(
	Num_Nota int not null,
	Cod_Cli int not null,
	Serie_Nota varchar(10) not null,
	Emissao_Nota smalldatetime null,
	Vtot_Nota SmallMoney not null,
	Constraint pk_NotaFiscal Primary key(Num_Nota),
	Constraint fk_Cliente Foreign Key(Cod_Cli) References cliente(Cod_Cli)
	);

	Select * from NotaFiscal

create table Cidade(
	Codcidade varchar(2) not null,
	Nomecidade varchar(40),
	);

create table Empregado(
	Nmatricula int,
	Nome varchar(50),
	Data_demissao datetime,
	Salario float,
	);

create table estado(
	cdestado varchar(2) not null, 
	Nomeestado varchar(30),
	);

-- Alterando chave da tabela
Alter table cidade
Add primary key(codcidade);

-- Adiciona coluna
Alter table cidade
Add cdestado char(2) not null,
teste varchar(1) null;

-- Apaga coluna 
Alter table cidade
Drop column teste;

-- Altera a coluna de char pra varchar
Alter table cidade
Alter column cdestado varchar(2);

-- Apaga chave
Alter table cidade
Drop constraint PK__Cidade__9ED2CA96B8A649FA;

-- Adiciona chave 
Alter table cidade
Add constraint pk_codcidade primary key(codcidade);

-- Adiciona chave 
Alter table estado
Add primary key(cdestado);

-- Adiciona chave
Alter table cidade
Add foreign key (cdestado) references estado (cdestado);

-- Incluir no banco de dados
Insert into estado
values 
('SP', 'São Paulo');

Insert into cidade
values
('1', 'Votorantim', 'SP');

Insert into cidade
values
('2', 'Sorocaba', 'SP');

select * from estado
select *from cidade