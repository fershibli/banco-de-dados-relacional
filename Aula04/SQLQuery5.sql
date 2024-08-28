use test_db3
insert into estado(cdestado, Nomeestado) values ('NN', 'Não cadastrado');

insert into Cidade(Codcidade, Nomecidade, cdestado) values ('3','Itu', 'NN');
insert into Cidade(Codcidade, Nomecidade, cdestado) values ('4','Itapira', 'NN');

update cidade set cdestado='SP' where cdestado='NN';

create table Tbl_Clientes(
	Codigo int identity(1,1) primary key,
	Nome varchar(100),
	UF varchar(2));

insert into Tbl_Clientes values('Bruce Wayne', 'SP');
insert into Tbl_Clientes values('Clark Kent', 'MG');
insert into Tbl_Clientes values('Anakin Skywalker', 'SE');
insert into Tbl_Clientes values('Bruce Wayne', 'SP');

select * from Tbl_Clientes;

	select IDENT_CURRENT('Tbl_Clientes');
