create table marca
(
	nomeMarca varchar(30) NOT NULL,
    idMarca int primary key auto_increment
);

create table carro
(
	renavam int primary key,
	modelo varchar(30) NOT NULL,
    valorAluguel double NOT NULL,
    fk_idMarca int NOT NULL,
    foreign key (fk_idMarca) references marca(idMarca)
);

create table cliente
(
	idCliente int primary key auto_increment,
    nomeCliente varchar(30) NOT NULL,
    enderecoCliente varchar(50) NOT NULL
);

create table aluga
(
	fk_idCliente int NOT NULL,
    foreign key (fk_idCliente) references cliente(idCliente),
    
    fk_renavam int NOT NULL,
    foreign key (fk_renavam) references carro(renavam)
    
);

drop table cliente;

select * from marca;
insert into marca (nomeMarca) values ("FIAT"); -- 1
insert into marca (nomeMarca) values ("HONDA"); -- 2

select * from carro;
insert into carro (renavam, modelo, valorAluguel, fk_idMarca) values (0012346, "PUNTO", "1000", 1); -- 0012346
insert into carro (renavam, modelo, valorAluguel, fk_idMarca) values (0012345, "PALIO", "500", 1); -- 0012345
insert into carro (renavam, modelo, valorAluguel, fk_idMarca) values (0012347, "CIVIC", "1500", 2); -- 0012347

select * from cliente;
insert into cliente(nomeCliente, enderecoCliente) values ("Dierison", "Amanda Garden"); -- 1
insert into cliente(nomeCliente, enderecoCliente) values ("Higor", "Amanda Garden"); -- 2 

select * from aluga;
insert into aluga (fk_idCliente, fk_renavam) values (1, 0012346);
insert into aluga (fk_idCliente, fk_renavam) values (2, 0012347);

select
 c.idCliente,
 c.nomeCliente,
 a.fk_renavam
from cliente as c
inner join aluga as a on c.idcliente = a.fk_idCliente
;

select * from carro
where valorAluguel between '500' and '1000';


