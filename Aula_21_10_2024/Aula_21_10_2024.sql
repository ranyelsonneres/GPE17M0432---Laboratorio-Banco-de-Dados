-- Aula 21/10/2024 - Stored Procedure

create database loja;

create table Cliente (
	idCliente int auto_increment primary key,
    nome varchar(100),
    email varchar(100),
    dataRegistro date
);

-- criar uma procedure
DELIMITER //
CREATE PROCEDURE HelloWorld()
BEGIN
	SELECT "Olá Mundo!!" as Mensagem;
END //
DELIMITER ;

-- chamar a procedure
CALL HelloWorld;

-- ####################################
DELIMITER //
CREATE PROCEDURE InserirCliente(
	IN p_nome varchar(100),
    IN p_email varchar(100),
    IN p_dataRegistro date 
)
BEGIN
	INSERT INTO cliente (nome, email, dataRegistro)
    VALUES (p_nome, p_email, p_dataRegistro);
END //
DELIMITER ;

CALL InserirCliente('Fulano Silva', 'fulano@email.com', '2024-10-21');
select * from cliente;

-- ####################################
-- atualizar os dados do cliente
DELIMITER //
CREATE PROCEDURE AtualizarCliente(
	IN p_idCliente int,
    IN p_nome varchar(100),
    IN p_email varchar(100)
)
BEGIN
	UPDATE cliente
    SET nome = p_nome, email = p_email
    WHERE idCliente = p_idCliente;
END //
DELIMITER ;

CALL InserirCLiente('Ciclano', 'ciclano@email.com', '2024-10-21');
select * from cliente;

CALL AtualizarCliente(2, 'Ciclano Carvalho', 'ciclano.carvalho@email.com');

-- ####################################
-- buscar um cliente
DELIMITER //
CREATE PROCEDURE BuscarCliente(
	IN p_idCliente int,
    OUT p_nome varchar(100)
)
BEGIN
	SELECT nome INTO p_nome
    FROM cliente
    WHERE idCliente = p_idCliente;
END //
DELIMITER ;

-- chamar a procedure
SET @nomeCliente = ''; -- criar a variável
CALL BuscarCliente(3, @nomeCliente); -- chamar a procedure
SELECT @nomeCliente; -- visualizar o conteúdo da variável

-- ####################################
-- excluir o cliente: usuario passe o ID
DELIMITER //
CREATE PROCEDURE ExcluirCliente (
	IN p_idCliente int
)
BEGIN
	DELETE FROM cliente
    WHERE idCliente = p_idCliente;
END //
DELIMITER ;

-- chamar a procedure
CALL ExcluirCliente(2);
select * from cliente;

-- exibir a quantidade de clientes (ex.: 2)
DELIMITER //
CREATE PROCEDURE ObterTotalClientes(
	OUT p_totalClientes int
)
BEGIN
	SELECT COUNT(*) INTO p_totalClientes
    FROM cliente;
END //
DELIMITER ; 


SET @totalClientes = 0; -- variavel
CALL ObterTotalClientes(@totalClientes); -- chamar a procedure
select @totalClientes; -- visualizar o resultado da variável


show procedure status; -- visualizar todas as procedures criadas
