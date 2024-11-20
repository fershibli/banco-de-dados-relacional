-- Criação do banco de dados DelBicos

CREATE DATABASE DelBicos;

USE DelBicos;

-- Criando tabelas

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
    cep VARCHAR(9) NOT NULL,
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

-- Inserindo dados

-- Inserção na tabela Usuario
INSERT INTO Usuario (nome, email, telefone, senha) VALUES ('João Silva', 'joao.silva@example.com', '123456789', 'senha123');
INSERT INTO Usuario (nome, email, telefone, senha) VALUES ('Maria Oliveira', 'maria.oliveira@example.com', '987654321', 'senha456');
INSERT INTO Usuario (nome, email, telefone, senha) VALUES ('Carlos Souza', 'carlos.souza@example.com', '456789123', 'senha789');
INSERT INTO Usuario (nome, email, telefone, senha) VALUES ('Ana Pereira', 'ana.pereira@example.com', '789123456', 'senha101');
INSERT INTO Usuario (nome, email, telefone, senha) VALUES ('Paulo Lima', 'paulo.lima@example.com', '321654987', 'senha202');

-- Inserção na tabela Cliente
INSERT INTO Cliente (id_usuario, cep, logradouro, numero, complemento, cidade, estado, cpf) VALUES (1, '12345678', 'Rua A', '100', 'Apto 1', 'Cidade A', 'SP', '12345678901');
INSERT INTO Cliente (id_usuario, cep, logradouro, numero, complemento, cidade, estado, cpf) VALUES (2, '23456789', 'Rua B', '200', 'Apto 2', 'Cidade B', 'RJ', '23456789012');
INSERT INTO Cliente (id_usuario, cep, logradouro, numero, complemento, cidade, estado, cpf) VALUES (3, '34567890', 'Rua C', '300', 'Apto 3', 'Cidade C', 'MG', '34567890123');
INSERT INTO Cliente (id_usuario, cep, logradouro, numero, complemento, cidade, estado, cpf) VALUES (4, '45678901', 'Rua D', '400', 'Apto 4', 'Cidade D', 'RS', '45678901234');
INSERT INTO Cliente (id_usuario, cep, logradouro, numero, complemento, cidade, estado, cpf) VALUES (5, '56789012', 'Rua E', '500', 'Apto 5', 'Cidade E', 'BA', '56789012345');

-- Inserção na tabela Parceiro
INSERT INTO Parceiro (id_usuario, cnpj, cpf, cep, logradouro, numero, complemento, cidade, estado) VALUES (1, '12345678000101', '12345678901', '12345678', 'Rua F', '600', 'Sala 1', 'Cidade F', 'SP');
INSERT INTO Parceiro (id_usuario, cnpj, cpf, cep, logradouro, numero, complemento, cidade, estado) VALUES (2, '23456789000102', '23456789012', '23456789', 'Rua G', '700', 'Sala 2', 'Cidade G', 'RJ');
INSERT INTO Parceiro (id_usuario, cnpj, cpf, cep, logradouro, numero, complemento, cidade, estado) VALUES (3, '34567890000103', '34567890123', '34567890', 'Rua H', '800', 'Sala 3', 'Cidade H', 'MG');
INSERT INTO Parceiro (id_usuario, cnpj, cpf, cep, logradouro, numero, complemento, cidade, estado) VALUES (4, '45678901000104', '45678901234', '45678901', 'Rua I', '900', 'Sala 4', 'Cidade I', 'RS');
INSERT INTO Parceiro (id_usuario, cnpj, cpf, cep, logradouro, numero, complemento, cidade, estado) VALUES (5, '56789012000105', '56789012345', '56789012', 'Rua J', '1000', 'Sala 5', 'Cidade J', 'BA');

-- Inserção na tabela Admin
INSERT INTO Admin (id_usuario) VALUES (1);
INSERT INTO Admin (id_usuario) VALUES (2);
INSERT INTO Admin (id_usuario) VALUES (3);
INSERT INTO Admin (id_usuario) VALUES (4);
INSERT INTO Admin (id_usuario) VALUES (5);

-- Inserção na tabela Categoria
INSERT INTO Categoria (nome, descricao) VALUES ('Categoria 1', 'Descrição da Categoria 1');
INSERT INTO Categoria (nome, descricao) VALUES ('Categoria 2', 'Descrição da Categoria 2');
INSERT INTO Categoria (nome, descricao) VALUES ('Categoria 3', 'Descrição da Categoria 3');
INSERT INTO Categoria (nome, descricao) VALUES ('Categoria 4', 'Descrição da Categoria 4');
INSERT INTO Categoria (nome, descricao) VALUES ('Categoria 5', 'Descrição da Categoria 5');

-- Inserção na tabela Especialidade
INSERT INTO Especialidade (id_categoria, nome, minutos, valor, descricao) VALUES (1, 'Especialidade 1', 60, 100.0, 'Descrição da Especialidade 1');
INSERT INTO Especialidade (id_categoria, nome, minutos, valor, descricao) VALUES (2, 'Especialidade 2', 90, 150.0, 'Descrição da Especialidade 2');
INSERT INTO Especialidade (id_categoria, nome, minutos, valor, descricao) VALUES (3, 'Especialidade 3', 120, 200.0, 'Descrição da Especialidade 3');
INSERT INTO Especialidade (id_categoria, nome, minutos, valor, descricao) VALUES (4, 'Especialidade 4', 30, 50.0, 'Descrição da Especialidade 4');
INSERT INTO Especialidade (id_categoria, nome, minutos, valor, descricao) VALUES (5, 'Especialidade 5', 45, 75.0, 'Descrição da Especialidade 5');

-- Inserção na tabela Agenda
INSERT INTO Agenda (id_especialidade, id_parceiro, data, hora_inicio, hora_fim, descricao, status) VALUES (1, 1, '2023-01-01', '08:00', '09:00', 'Descrição da Agenda 1', 'A');
INSERT INTO Agenda (id_especialidade, id_parceiro, data, hora_inicio, hora_fim, descricao, status) VALUES (2, 2, '2023-01-02', '09:00', '10:30', 'Descrição da Agenda 2', 'A');
INSERT INTO Agenda (id_especialidade, id_parceiro, data, hora_inicio, hora_fim, descricao, status) VALUES (3, 3, '2023-01-03', '10:30', '12:30', 'Descrição da Agenda 3', 'A');
INSERT INTO Agenda (id_especialidade, id_parceiro, data, hora_inicio, hora_fim, descricao, status) VALUES (4, 4, '2023-01-04', '13:00', '13:30', 'Descrição da Agenda 4', 'A');
INSERT INTO Agenda (id_especialidade, id_parceiro, data, hora_inicio, hora_fim, descricao, status) VALUES (5, 5, '2023-01-05', '14:00', '14:45', 'Descrição da Agenda 5', 'A');

-- Inserção na tabela Consulta
INSERT INTO Consulta (id_cliente, id_agenda, id_parceiro, status, descricao, valor) VALUES (1, 1, 1, 'A', 'Descrição da Consulta 1', 100.0);
INSERT INTO Consulta (id_cliente, id_agenda, id_parceiro, status, descricao, valor) VALUES (2, 2, 2, 'A', 'Descrição da Consulta 2', 150.0);
INSERT INTO Consulta (id_cliente, id_agenda, id_parceiro, status, descricao, valor) VALUES (3, 3, 3, 'A', 'Descrição da Consulta 3', 200.0);
INSERT INTO Consulta (id_cliente, id_agenda, id_parceiro, status, descricao, valor) VALUES (4, 4, 4, 'A', 'Descrição da Consulta 4', 50.0);
INSERT INTO Consulta (id_cliente, id_agenda, id_parceiro, status, descricao, valor) VALUES (5, 5, 5, 'A', 'Descrição da Consulta 5', 75.0);

-- Inserção na tabela Chamado
INSERT INTO Chamado (id_consulta, categoria, titulo, descricao, status) VALUES (1, 'A', 'Chamado 1', 'Descrição do Chamado 1', 'A');
INSERT INTO Chamado (id_consulta, categoria, titulo, descricao, status) VALUES (2, 'B', 'Chamado 2', 'Descrição do Chamado 2', 'A');
INSERT INTO Chamado (id_consulta, categoria, titulo, descricao, status) VALUES (3, 'C', 'Chamado 3', 'Descrição do Chamado 3', 'A');
INSERT INTO Chamado (id_consulta, categoria, titulo, descricao, status) VALUES (4, 'D', 'Chamado 4', 'Descrição do Chamado 4', 'A');
INSERT INTO Chamado (id_consulta, categoria, titulo, descricao, status) VALUES (5, 'E', 'Chamado 5', 'Descrição do Chamado 5', 'A');

-- Consultas

-- Consulta para obter informações de clientes e seus respectivos usuários

SELECT 
    c.id_cliente, 
    u.nome, 
    u.email, 
    u.telefone, 
    c.cep, 
    c.logradouro, 
    c.numero, 
    c.complemento, 
    c.cidade, 
    c.estado, 
    c.cpf
FROM 
    Cliente c
JOIN 
    Usuario u 
ON 
    c.id_usuario = u.id_usuario;

-- Consulta para obter informações de parceiros e seus respectivos usuários

SELECT 
    p.id_parceiro, 
    u.nome, 
    u.email, 
    u.telefone, 
    p.cnpj, 
    p.cpf, 
    p.cep, 
    p.logradouro, 
    p.numero, 
    p.complemento, 
    p.cidade, 
    p.estado
FROM
    Parceiro p
JOIN
    Usuario u
ON
    p.id_usuario = u.id_usuario;

-- Consulta para obter detalhes das consultas, incluindo informações do cliente, parceiro e agenda

SELECT 
    con.id_consulta, 
    con.status AS status_consulta, 
    con.descricao AS descricao_consulta, 
    con.valor AS valor_consulta, 
    cli.cpf AS cpf_cliente, 
    ucli.nome AS nome_cliente, 
    par.cnpj AS cnpj_parceiro, 
    upar.nome AS nome_parceiro, 
    age.data AS data_agenda, 
    age.hora_inicio AS hora_inicio_agenda, 
    age.hora_fim AS hora_fim_agenda 
FROM 
    Consulta con
JOIN 
    Cliente cli ON con.id_cliente = cli.id_cliente
JOIN 
    Usuario ucli ON cli.id_usuario = ucli.id_usuario
JOIN 
    Parceiro par ON con.id_parceiro = par.id_parceiro
JOIN 
    Usuario upar ON par.id_usuario = upar.id_usuario
JOIN 
    Agenda age ON con.id_agenda = age.id_agenda;

-- Consulta para obter informações das especialidades e suas respectivas categorias

SELECT 
    e.id_especialidade, 
    e.nome AS nome_especialidade, 
    e.minutos, 
    e.valor, 
    e.descricao AS descricao_especialidade, 
    c.nome AS nome_categoria, 
    c.descricao AS descricao_categoria 
FROM 
    Especialidade e
JOIN 
    Categoria c ON e.id_categoria = c.id_categoria;

--Consulta para obter detalhes dos chamados, incluindo informações da consulta e do cliente

SELECT 
    ch.id_chamado, 
    ch.categoria AS categoria_chamado, 
    ch.titulo AS titulo_chamado, 
    ch.descricao AS descricao_chamado, 
    ch.status AS status_chamado, 
    con.id_consulta, 
    con.descricao AS descricao_consulta, 
    cli.cpf AS cpf_cliente, 
    ucli.nome AS nome_cliente 
FROM 
    Chamado ch
JOIN 
    Consulta con ON ch.id_consulta = con.id_consulta
JOIN 
    Cliente cli ON con.id_cliente = cli.id_cliente
JOIN 
    Usuario ucli ON cli.id_usuario = ucli.id_usuario;