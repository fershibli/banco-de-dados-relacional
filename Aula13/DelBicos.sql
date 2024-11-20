CREATE DATABASE DelBicos;

USE DelBicos;

CREATE TABLE Usuario
(
    id_usuario NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(30) NOT NULL,
    telefone VARCHAR(18) NULL,
    senha VARCHAR(40) NOT NULL --SHA1
);

CREATE TABLE Cliente
(
    id_cliente NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY NOT NULL,
    id_usuario NUMERIC(18,0) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    logradouro VARCHAR(50) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(50) NULL,
    cidade VARCHAR(30) NOT NULL,
    estado CHAR(2) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    CONSTRAINT fk_cliente_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Parceiro
(
    id_parceiro NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY NOT NULL,
    id_usuario NUMERIC(18,0) NOT NULL,
    cnpj VARCHAR(14) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    logradouro VARCHAR(50) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(50) NULL,
    cidade VARCHAR(30) NOT NULL,
    estado CHAR(2) NOT NULL,
    CONSTRAINT fk_parceiro_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Admin
(
    id_admin NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY NOT NULL,
    id_usuario NUMERIC(18,0) NOT NULL,
    CONSTRAINT fk_admin_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Categoria
(
    id_categoria NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY NOT NULL,
    nome VARCHAR(20) NOT NULL,
    descricao VARCHAR(100) NULL
);

CREATE TABLE Especialidade
(
    id_especialidade NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY NOT NULL,
    id_categoria NUMERIC(18,0) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    minutos NUMERIC(18,0) NOT NULL,
    valor FLOAT NOT NULL,
    descricao VARCHAR(100) NULL,
    CONSTRAINT fk_especialidade_categoria FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
);

CREATE TABLE Agenda
(
    id_agenda NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY NOT NULL,
    id_especialidade NUMERIC(18,0) NOT NULL,
    id_parceiro NUMERIC(18,0) NOT NULL,
    data DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fim TIME NOT NULL,
    descricao VARCHAR(100) NULL,
    status CHAR(1) NOT NULL,
    CONSTRAINT fk_agenda_especialidade FOREIGN KEY (id_especialidade) REFERENCES Especialidade(id_especialidade),
    CONSTRAINT fk_agenda_parceiro FOREIGN KEY (id_parceiro) REFERENCES Parceiro(id_parceiro)
);

CREATE TABLE Consulta
(
    id_consulta NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY NOT NULL,
    id_cliente NUMERIC(18,0) NOT NULL,
    id_agenda NUMERIC(18,0) NOT NULL,
    id_parceiro NUMERIC(18,0) NOT NULL,
    status CHAR(1) NOT NULL,
    descricao VARCHAR(100) NULL,
    valor FLOAT NOT NULL,
    CONSTRAINT fk_consulta_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    CONSTRAINT fk_consulta_agenda FOREIGN KEY (id_agenda) REFERENCES Agenda(id_agenda),
    CONSTRAINT fk_consulta_parceiro FOREIGN KEY (id_parceiro) REFERENCES Parceiro(id_parceiro)
);

CREATE TABLE Chamado
(
    id_chamado NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY NOT NULL,
    id_consulta NUMERIC(18,0) NOT NULL,
    categoria CHAR(1) NOT NULL,
    titulo VARCHAR(50) NOT NULL,
    descricao VARCHAR(100) NULL,
    status CHAR(1) NOT NULL,
    CONSTRAINT fk_chamado_consulta FOREIGN KEY (id_consulta) REFERENCES Consulta(id_consulta)
);