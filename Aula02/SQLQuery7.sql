use test_db2

create table cliente (
	cod_cli int not null,
	nome_cli varchar(40) not null,
	end_cli varchar(30) not null,
	bai_cli varchar(20) not null,
	cid_cli varchar(20) not null,
	uf_cli  varchar(3) not null,
	tel_cli varchar(15) null,
	constraint PK_Cliente Primary Key(cod_cli)
	);