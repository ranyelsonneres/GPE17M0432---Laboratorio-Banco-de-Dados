-- Aula 16-09-2024

-- base de dados (banco)
CREATE DATABASE loja;

-- criar a tabela clientes
CREATE TABLE Cliente (
	cliente_id int unsigned auto_increment primary key,
    nome varchar(100) not null,
    email varchar(150) not null unique,
    endereco varchar(100) not null,
    data_nascimento date not null check (data_nascimento > '1900-01-01'),
    status enum('ativo', 'inativo') not null default 'ativo'
);

select * from cliente;

-- criar a tabela pedido
create table Pedido (
	pedido_id int unsigned auto_increment primary key,
    cliente_id int unsigned not null,
	data_pedido date not null check (data_pedido > '1900-01-01'),
    valor_total decimal(10,2) not null default 0,
    status enum('pendente', 'processado', 'enviado', 'entregue') not null default 'pendente',
    foreign key (cliente_id) references Cliente (cliente_id) on delete cascade,
    index (cliente_id)
);

select * from pedido;

-- realizar as inserções de dados
insert into Cliente (nome, email, endereco, data_nascimento, status)
values 
('João Silva', 'joao.silva@email.com', 'Rua A', '1985-06-15', 'ativo'),
('Maria Oliveira', 'maria.oliveira@email.com', 'Rua B', '1990-12-22', 'ativo'),
('Carlos Souza', 'carlos.souza@email.com', 'Rua C', '1978-03-30', 'inativo');

insert into Pedido (cliente_id, data_pedido, valor_total, status)
values 
(1, '2024-09-10', 150.75, 'processado'),
(2, '2024-09-11', 299.99, 'enviado'),
(3, '2024-09-12', 50.00, 'pendente');

select * from pedido;

-- tentar quebrar as restrições
insert into Cliente (nome, email, endereco, data_nascimento, status)
values ('João', 'joao.silva2@email.com', 'Rua D', '1992-08-15', 'teste');

-- realizar as consultas SQL
select * from cliente;

select pedido_id, data_pedido, valor_total, status
from pedido
where cliente_id = 3;

select nome, email, status
from cliente
where status = 'ativo';

select pedido.pedido_id, pedido.data_pedido, pedido.valor_total, pedido.status,
cliente.nome, cliente.email
from pedido
inner join cliente on pedido.cliente_id = cliente.cliente_id
where pedido.data_pedido between '2024-09-10' and '2024-09-11';

select cliente.nome, pedido.valor_total
from cliente
inner join pedido on cliente.cliente_id = pedido.cliente_id
where pedido.valor_total > 200.00;

select pedido.cliente_id, pedido.data_pedido
from pedido
order by pedido.data_pedido desc
limit 2;

-- Alterações na base de dados
-- update cliente set status = 'ativo' where cliente_id = 3;

-- update pedido set status = 'enviado' where cliente_id = 3;

-- delete from pedido where cliente_id = 1;

