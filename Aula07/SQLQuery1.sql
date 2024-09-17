create database test_db4;
use test_db4;

create table Cidade(
	Codcidade int identity(1,1) not null primary key,
	Nomecidade varchar(40),
	cdestado varchar(2)
);

create table Empregado(
	Nrmatricula int identity(1,1) primary key,
	Nome varchar(50),
	Data_admissao datetime,
	Salario float
);

-- Cidades

insert into Cidade values('São Paulo', 'SP');
insert into Cidade values('Campinas', 'SP');
insert into Cidade values('Rio de Janeiro', 'RJ');
insert into Cidade values('Belo Horizonte', 'MG');
insert into Cidade values('Curitiba', 'PR');
insert into Cidade values('Porto Alegre', 'RS');
insert into Cidade values('Recife', 'PE');
insert into Cidade values('Salvador', 'BA');
insert into Cidade values('Fortaleza', 'CE');

-- Empregados

insert into Empregado values('João', '2019-01-01', 1000);
insert into Empregado values('Maria', '2019-01-01', 2000);
insert into Empregado values('José', '2019-01-01', 3000);
insert into Empregado values('Ana', '2019-01-01', 4000);
insert into Empregado values('Pedro', '2019-01-01', 5000);
insert into Empregado values('Paula', '2019-01-01', 6000);
insert into Empregado values('Carlos', '2019-01-01', 7000);
insert into Empregado values('Marta', '2019-01-01', 8000);

-- Concatenando Valores

Select 'Funcionario: '+nome+' Salário: '+CONVERT(VARCHAR, salario),
salario, nome
from empregado