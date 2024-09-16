-- Atividade SQL (DDL, DML e DQL)
-- criar a base de dados
create database livraria;

-- criar a tabela
create table livro (
	id_livro int not null primary key auto_increment,
    titulo varchar(100),
    autor varchar(100),
    ano_publicacao int,
    preco decimal,
    quantidade_estoque int
);

-- Inserção dos dados
insert into livro (titulo, autor, ano_publicacao, preco, quantidade_estoque) 
values ('Introdução ao SQL', 'João Silva', 2015, 50.00, 10),
('Mastering SQL', 'Marisa Sousa', 2018, 120.00, 5),
('SQL para Iniciantes', 'Paulo Santos', 2020, 75.00, 8);

-- Listar todos os livros, mostrando o título, autor e preço.
select titulo, autor, preco from livro;

-- Selecionar todos os livros publicados a partir de 2018, mostrando título e ano de publicação.
select titulo, ano_publicacao from livro where ano_publicacao >=2018;

-- Exibir os livros cujo preço esteja entre 60.00 e 100.00, mostrando o título e o preço.
select titulo, preco from livro where preco between 60 and 100;

-- Listar os livros com quantidade em estoque menor que 10, mostrando o título e a quantidade.
select titulo, quantidade_estoque from livro where quantidade_estoque <10;

-- Atualize as informações de estoque e preço:
-- O preço do livro "SQL para Iniciantes" aumentou para 80.00. Faça essa atualização.
update livro set preco = 80 where id_livro = 3;
select * from livro;

-- O estoque do livro "Introdução ao SQL" foi atualizado para 15. Atualize essa informação.
update livro set quantidade_estoque = 15 where id_livro = 1;

-- Um livro foi removido da livraria. Exclua o livro "Mastering SQL" da tabela.
delete from livro where id_livro = 2;

-- Bônus
-- Calcule o preço total dos livros disponíveis em estoque;
select sum(preco * quantidade_estoque) as valor_total from livro;

-- Encontre o livro mais caro da tabela;
select titulo, preco from livro order by preco desc limit 1;
