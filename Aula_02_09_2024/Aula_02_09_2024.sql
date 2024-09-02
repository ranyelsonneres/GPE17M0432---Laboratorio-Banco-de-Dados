-- -- Aula 02/09/2024
-- Objetivos: CREATE, DROP e ALTER, SELECT, INSERT, UPDATE e DELETE e CONSTRAINTS

-- excluir uma coluna
alter table pessoas drop column data_nascimento;

-- alterar atributos
alter table pessoas change profissao sobrenome VARCHAR(40);

-- inserir registros
insert into pessoas (nome, numero_sorte, sobrenome)
values ('Ranyelson', 2, 'Carvalho');

insert into pessoas (nome, numero_sorte, sobrenome)
values ('João', 5, 'Silva');

-- seleção
select * from pessoas;
select nome, sobrenome from pessoas;
select * from pessoas where numero_sorte = 8;

-- update
SET SQL_SAFE_UPDATES = 0; -- desabilitar o modo de segurança
update pessoas set numero_sorte = 10 where nome = 'Ranyelson';

-- delete
delete from pessoas where nome = 'Ranyelson';

