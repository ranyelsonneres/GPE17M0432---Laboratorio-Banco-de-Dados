-- Aula 26/08/2024
-- Objetivos: CREATE, DROP e ALTER
-- Criar uma tabela
create database banco;

-- Criar a tabela
create table minhatabela (
	nome varchar(20)
);

create table pessoas (
	nome varchar(20),
    numero_sorte int,
    data_nascimento date
);

-- adicionar coluna em uma tabela
alter table pessoas add column profissao varchar(20);


-- remover uma tabela
drop table minhatabela;

create database banco2; -- criar o banco de dados
drop database banco2; -- remover o banco de dados
