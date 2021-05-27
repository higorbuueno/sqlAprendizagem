create table municipio_v2
(
	idMunicipio int primary key auto_increment,
    nomeMunicipio varchar(50) not null,
    totalPopulacao float not null,
    fk_estado int,
    foreign key (fk_estado) references estado (idEstado)
);

 insert into municipio_v2 (nomeMunicipio, totalPopulacao, fk_estado) values ("Hortolândia", 200000, 1);
 insert into municipio_v2 (nomeMunicipio, totalPopulacao, fk_estado) values ("Sumaré", 100000, 1);
 insert into municipio_v2 (nomeMunicipio, totalPopulacao, fk_estado) values ("Campinas", 1000000, 1);
 insert into municipio_v2 (nomeMunicipio, totalPopulacao, fk_estado) values ("Monte Mor", 100000, 1);
 
 insert into municipio_v2 (nomeMunicipio, totalPopulacao, fk_estado) values ("Caldas", 20000, 2);
 insert into municipio_v2 (nomeMunicipio, totalPopulacao, fk_estado) values ("BH", 200000, 2);
 
 
 
select count(*), e.nomeEstado
from municipio_v2 as m
inner join estado as e
on e.idEstado = m.fk_estado
where e.nomeEstado like "%Rio%";

select count(*), e.nomeEstado
from municipio_v2 as m
inner join estado as e
on e.idEstado = m.fk_estado
where e.nomeEstado like "%São%";

select count(*), e.nomeEstado
from municipio_v2 as m
inner join estado as e
on e.idEstado = m.fk_estado
group by e.nomeEstado;

select avg(m.totalPopulacao), e.nomeEstado
from municipio_v2 as m
inner join estado as e
on e.idEstado = m.fk_estado
group by e.nomeEstado;

