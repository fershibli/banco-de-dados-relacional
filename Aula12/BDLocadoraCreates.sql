--CRIAÇÃO DAS TABELAS

CREATE DATABASE LOCADORA;

CREATE TABLE CLIENTES
(
	COD_CLIENTE NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY NOT NULL,
	RG VARCHAR(9) NOT NULL,
	NOME VARCHAR(50) NOT NULL,
	ENDERECO VARCHAR(50) NULL,
	BAIRRO VARCHAR(30) NULL,
	CIDADE VARCHAR(30) NULL, 
	ESTADO CHAR(2) NOT NULL,
	TELEFONE VARCHAR(15) NULL,
	EMAIL VARCHAR(30) NULL,
	DATANASCIMENTO DATETIME NULL,
	sexo char(1)
);

CREATE TABLE CATEGORIA
(
	COD_CATEGORIA NUMERIC(10,0) IDENTITY(1,1) PRIMARY KEY NOT NULL,
	NOME_CATEGORIA VARCHAR(20) NOT NULL,
);

CREATE TABLE FILME
(
	COD_FILME NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY NOT NULL,
	FILME VARCHAR(30) NOT NULL,
	COD_CATEGORIA NUMERIC(10,0) NOT NULL,
	DIRETOR VARCHAR(50) NOT NULL,
	VALOR_LOCACAO FLOAT NOT NULL,
	RESERVADA CHAR(1) NOT NULL
);

CREATE TABLE LOCACOES
(
	COD_LOCACAO NUMERIC(18,0) IDENTITY(1,1) NOT NULL,
	COD_CLIENTE NUMERIC(18,0) NOT NULL,
	COD_FILME NUMERIC(18,0) NOT NULL,
	DATA_RETIRADA DATETIME NOT NULL,
	DATA_DEVOLUCAO DATETIME NULL,
	CONSTRAINT PK_LOCACAO_CLIENTE PRIMARY KEY(COD_LOCACAO, COD_CLIENTE, COD_FILME)
);
