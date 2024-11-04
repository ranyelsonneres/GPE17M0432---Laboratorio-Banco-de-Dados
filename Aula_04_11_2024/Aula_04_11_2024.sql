-- Aula 04/11/2024

-- tabela de log para registrar todas as alterações feita na tabela cliente
create table cliente_log (
	logID INT auto_increment primary key,
    clienteID int,
    acao varchar(20), -- insert, update ou delete
    nomeAntigo varchar(100),
    nomeNovo varchar(100),
    dataAlteracao timestamp default current_timestamp
);

-- trigger para a inserção de dados
DELIMITER //
CREATE TRIGGER LogInsercaoClientes
AFTER INSERT on cliente
FOR EACH ROW
BEGIN
	-- INSTRUÇÕES
    INSERT INTO cliente_log (clienteID, acao, nomeAntigo, nomeNovo)
    VALUES (new.idCliente, 'INSERT', NULL, new.nome);
END //
DELIMITER ;

-- inserir um cliente
CALL InserirCLiente('Bob', 'bob@email.com', '2024-11-04');
select * from cliente;
select * from cliente_log;


-- trigger para a atualização
DELIMITER //
CREATE TRIGGER LogAtualizacaoClientes
AFTER UPDATE ON cliente
FOR EACH ROW
BEGIN
	INSERT INTO cliente_log (clienteID, acao, nomeAntigo, nomeNovo)
    VALUES (old.idCliente, 'UPDATE', old.nome, new.nome);
END //
DELIMITER ;

-- atualizar um cliente
CALL AtualizarCliente(4, 'Bob Silva Santos', 'bob@email.com');
select * from cliente;
select * from cliente_log;

-- trigger para a exclusão
DELIMITER //
CREATE TRIGGER LogExclusaoClientes
AFTER DELETE ON cliente
FOR EACH ROW
BEGIN
    INSERT INTO cliente_Log (clienteID, acao, nomeAntigo, nomeNovo)
    VALUES (OLD.idCliente, 'DELETE', OLD.nome, NULL);
END //
DELIMITER ;

-- remover algum cliente cadastrado
select * from cliente;
CALL ExcluirCliente(4);
select * from cliente_Log; -- registro da tabela cliente_log

