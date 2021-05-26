
create table estado
(
	 idEstado int primary key auto_increment,
     nomeEstado varchar(50)
);

create table municipio
(
	idMunicipio int primary key auto_increment,
	nomeMunicipio varchar(50),
	fk_idEstado int,
	foreign key (fk_idEstado) references estado (idEstado)
    
);

insert into estado (NomeEstado) values ("São Paulo");
insert into estado (NomeEstado) values ("Rio de Janeiro");
insert into estado (NomeEstado) values ("Espirito Santo");


insert into municipio (NomeMunicipio, fk_idEstado) values ("Hortolândia",1);
insert into municipio (NomeMunicipio, fk_idEstado) values ("Sumaré",1);
insert into municipio (NomeMunicipio, fk_idEstado) values ("Campinas",1);
insert into municipio (NomeMunicipio, fk_idEstado) values ("Rio de Janeiro",2);
insert into municipio (NomeMunicipio, fk_idEstado) values ("Petrópolis",2);
insert into municipio (NomeMunicipio) values ("Ouro Preto");

select * from estado;
select * from municipio;


 -- AQUI O CÓDIGO É TUDO NUMA LINHA SÓ --------------
select
 m.idMunicipio,
 m.nomeMunicipio,
 m.fk_idEstado,
 e.idEstado,
 e.nomeEstado
from municipio as m
inner join estado as e on e.idEstado = m.fk_idEstado
;
-- ----------------------------------------
-- NÃO PUXOU O OURO PRETO!!!!
-- NÃO PUXOU ESPIRITO SANTO!!!!

-- PARA CONSEGUIR PUXAR OURO PRETO:
-- AQUI O CÓDIGO É TUDO NUMA LINHA SÓ --------------
select
*
from municipio as m
left join estado as e on e.idEstado = m.fk_idEstado  -- LEFT JOIN TA VENDO QUE TÁ COM ESQUERDA??? É A TABELA QUE COMECEI A PUXAR, OU SEJA A MUNICIPIO
;
-- ----------------------------------------


-- PARA CONSEGUIR PUXAR ESPIRITO SANTO:
-- AQUI O CÓDIGO É TUDO NUMA LINHA SÓ --------------
select
*
from municipio as m
right join estado as e on e.idEstado = m.fk_idEstado  -- RIGHT JOIN TA VENDO QUE TÁ COM DIREITA??? É A TABELA QUE REFERENCIEI, OU SEJA A ESTADO
;
-- ----------------------------------------



-- PARA CONSEGUIR PUXAR TUDO:
-- AQUI O CÓDIGO É TUDO NUMA LINHA SÓ --------------
select
*
from municipio as m
-- ANALISAR // PESQUISAR COMO FUNCIONA -->>> full  join estado as e on e.idEstado = m.fk_idEstado  -- PUXA TUDO, MESMO COM VALORES NULOS 
; -- NÃO CONSEGUI ENCONTRAR UM JEITO DE PUXAR TUDO! Ver com o professor depois.
-- ----------------------------------------

