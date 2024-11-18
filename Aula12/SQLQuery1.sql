-- TRIGGERS

-- TRIGGER AFTER

CREATE TABLE LogPreco (
	ProdutoID INT,
	NovoPreco decimal(10,2),
	DataAlteracao DATE);

CREATE TRIGGER trg_LogPrecoAlterado 
ON Produto 
AFTER UPDATE 
as 
BEGIN 
	insert into LogPreco(ProdutoID, NovoPreco, DataAlteracao)
	select ProdutoID, Preco, GETDATE() 
	FROM inserted 
END;

UPDATE Produto set Preco = 4500 where ProdutoId=2;

select * from LogPreco;

-- TRIGGER INSTEAD

CREATE TRIGGER trg_LimitePreco
ON Produto
INSTEAD OF INSERT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM inserted WHERE Preco > 10000)
		BEGIN
			RAISERROR ('O preço do produto não pode exceder $10.000.', 16, 1)
			ROLLBACK TRANSACTION
		END
	ELSE
		BEGIN
			INSERT INTO Produto (ProdutoID, NomeProduto, CategoriaID, Preco)
			SELECT ProdutoId, NomeProduto, CategoriaID, Preco
			FROM inserted
		END
END;

insert into Produto values (11, 'Ultrabook', 8, 15800);

