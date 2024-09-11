create database exercicio2;
use exercicio2;

-- item 1
create table Tbl_Clientes(
	Id int unique not null,
	Nome varchar(50) not null,
	Email varchar(100) unique not null,
	Telefone varchar(15) not null,
	constraint pk_tbl_clientes primary key(Id)
);

-- item 2
insert into Tbl_Clientes values (1, 'João Silva', 'joao@email.com', '(11) 1234-5678');

-- item 3
insert into Tbl_Clientes values
(2, 'Maria Santos', 'maria@email.com', '(15) 8427-1563'),
(3, 'José Menezes', 'jose@email.com', '(21) 8765-4231'),
(4, 'Ana Pinheiro', 'ana@email.com', '(31) 9876-5432'),
(5, 'Carlos Oliveira', 'carlos@email.com', '(41) 1234-5678'),
(6, 'Marta Costa', 'marta@email.com', '(51) 9876-5432'),
(7, 'Pedro Souza', 'pedro@email.com', '(61) 1234-5678'),
(8, 'Paula Lima', 'paula@email.com', '(71) 9876-5432'),
(9, 'Ricardo Almeida', 'ricardo@email.com', '(81) 1234-5678'),
(10, 'Sérgio Santos', 'sergio@email.com', '(91) 9876-5432'),
(11, 'Tânia Oliveira', 'tania@email.com', '(01) 1234-5678');

-- item 4
update Tbl_Clientes set Telefone='(11) 8765-4321' where Id=1;

-- item 5
create table Tbl_Produtos(
	Id int unique not null,
	Nome varchar(50) not null,
	Preco decimal(5,2) not null,
	Estoque int not null,
	constraint pk_tbl_produtos primary key(Id)
);

-- item 6
insert into Tbl_Produtos values (1, 'Camiseta', 29.99, 100);

-- item 7
insert into Tbl_Produtos values
(2, 'Calça', 59.99, 50),
(3, 'Tênis', 99.99, 30),
(4, 'Boné', 19.99, 80),
(5, 'Meia', 9.99, 200),
(6, 'Cinto', 14.99, 100),
(7, 'Bermuda', 39.99, 70),
(8, 'Chapéu', 24.99, 60),
(9, 'Blusa', 49.99, 40),
(10, 'Jaqueta', 79.99, 20),
(11, 'Vestido', 69.99, 25);

-- item 8
update Tbl_Produtos set Preco=39.99 where Id=1;

-- item 9
create table Tbl_Pedidos(
	Id int unique not null,
	ClienteId int not null,
	ProdutoId int not null,
	Quantidade int not null,
	DataPedido date not null,
	constraint pk_tbl_pedidos primary key(Id),
	constraint fk_tbl_pedidos_clientes foreign key(ClienteId) references Tbl_Clientes(Id),
	constraint fk_tbl_pedidos_produtos foreign key(ProdutoId) references Tbl_Produtos(Id)
);

-- item 10
insert into Tbl_Pedidos values (1, 1, 1, 2, GETDATE());

-- item 11
update Tbl_Pedidos set Quantidade=3 where Id=1;

-- item 12
insert into Tbl_Pedidos values
(2, 11, 5, 12, '2024-04-12'),
(3, 7, 3, 1, '2024-08-23'),
(4, 3, 10, 200, '2023-12-31'),
(5, 5, 2, 3, '2024-02-29'),
(6, 9, 8, 4, '2024-06-30'),
(7, 2, 4, 5, '2023-10-15'),
(8, 6, 6, 9, '2023-11-30'),
(9, 10, 9, 30, '2024-09-01'),
(10, 8, 7, 15, '2024-07-31'),
(11, 4, 11, 21, '2024-01-16');

-- item 13
create table Tbl_Funcionarios(
	Id int unique not null,
	Nome varchar(50) not null,
	Cargo varchar(50) not null,
	Salario decimal(8,2) not null,
	constraint pk_tbl_funcionarios primary key(Id)
);

-- item 14
insert into Tbl_Funcionarios values (1, 'Maria Santos', 'Gerente', 5000.00);

-- item 15
update Tbl_Funcionarios set Salario=6000 where Id=1;

-- item 16
insert into Tbl_Funcionarios values
(2, 'Rachel Barbosa', 'Marketing', 3000.00),
(3, 'Emanuele Vieira', 'Vendas', 2500.00),
(4, 'William Neves', 'Financeiro', 3500.00),
(5, 'Lucas Oliveira', 'Estoque', 2000.00),
(6, 'Mariana Silva', 'Compras', 2800.00),
(7, 'Rafaela Santos', 'RH', 3200.00),
(8, 'Fernando Costa', 'TI', 5500.00),
(9, 'Gabriel Souza', 'Logística', 2700.00),
(10, 'Patrícia Lima', 'Atendimento', 2300.00),
(11, 'Richarlinson Rodriguez', 'Produção', 2600.00);

-- item 17
create table Tbl_Vendas(
	Id int unique not null,
	ProdutoId int not null,
	Quantidade int not null,
	ValorTotal decimal(8,2) not null,
	DataVenda date not null,
	constraint pk_tbl_vendas primary key(Id),
	constraint fk_tbl_vendas_produtos foreign key(ProdutoId) references Tbl_Produtos(Id)
);

-- item 18
insert into Tbl_Vendas values (1, 1, 2, 79.98, GETDATE());

-- item 19
insert into Tbl_Vendas values
(2, 11, 3, 209.97, '2023-07-13'),
(3, 7, 1, 39.99, '2023-09-15'),
(4, 3, 100, 9999.00, '2023-03-31'),
(5, 5, 3, 29.97, '2024-05-19'),
(6, 9, 4, 199.96, '2023-08-30'),
(7, 2, 5, 299.95, '2023-12-26'),
(8, 6, 9, 134.91, '2024-01-20'),
(9, 10, 30, 2399.70, '2022-09-11'),
(10, 8, 15, 374.85, '2024-07-19'),
(11, 4, 21, 419.79, '2024-01-16');

-- item 20
delete from Tbl_Vendas where id=1;
