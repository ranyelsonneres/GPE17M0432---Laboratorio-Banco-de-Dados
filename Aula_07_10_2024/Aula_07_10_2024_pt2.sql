-- Aula 07/10/2024
-- Inserção de dados

-- tabela jogo
insert into jogo (nomeJogo) values
("Game A"), -- 1
("Game B"), -- 2
("Game C"); -- 3
select * from jogo;

-- tabela plataforma
insert into plataforma (nomePlataforma) values
("PlayStation"), -- 1
("Xbox"), -- 2
("PC"); -- 3
select * from plataforma;


-- tabela jogo_plataforma
insert into jogo_plataforma (Jogo_idJogo, Plataforma_idPlataforma, precoPlataforma) values
(1, 1, 30.00), (1, 2, 40.00), (1, 3, 50.00), -- game a
(2, 1, 20.00), (2, 2, 35.00), -- game b
(3, 3, 25.00); -- game c
select * from jogo_plataforma;

-- select para visualizar os dados entre jogo e plataforma
select 
	j.nomeJogo as Nome,
    p.nomePlataforma as Plataforma,
    jp.precoPlataforma as Preço
from jogo j
inner join jogo_plataforma jp on j.idJogo = jp.Jogo_idJogo
inner join plataforma p on jp.Plataforma_idPlataforma = p.idPlataforma;

-- agregação
select count(*) as qtd
from plataforma;

select
	p.nomePlataforma,
    count(jp.Jogo_idJogo) as qtd_jogos
from plataforma p
inner join jogo_plataforma jp on p.idPlataforma = jp.Plataforma_idPlataforma
group by p.nomePlataforma;


select max(jp.precoPlataforma) as maior_preco
from jogo_plataforma jp;


