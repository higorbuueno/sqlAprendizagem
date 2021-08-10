create table loja (	
	nome varchar (50),
    cnpj int 
);

create table funcionario (
	idFuncionario int primary key,
    nomeFuncionario varchar (50) not null
);

create table cliente (
	cpf int primary key,
    nome varchar (50) not null,
    dataNascimento int,
    endereco varchar (50) not null
);

create table produtos (
	nome varchar (50) not null,
    preco int not null,
    sku int primary key,
    fk_departamento_idDepartamento int,
    foreign key (fk_departamento_idDepartamento) references departamento (idDepartamento) 
);

create table servico (
	idServico int primary key,
    tipo varchar (50)
);

create table departamento (
	nomeDepartamento varchar (50) not null,
    idDepartamento int primary key
);

create table carrinho (
	qtyProdutos int not null,
    total int not null,
    fk_produtos_sku int,
    fk_cliente_cpf int,
    fk_servico_idServico int,
    fk_funcionario_idFuncionario int,
    foreign key (fk_produtos_sku) references produtos (sku),
    foreign key (fk_cliente_cpf) references cliente (cpf),
    foreign key (fk_servico_idServico) references servico (idServico),
    foreign key (fk_funcionario_idFuncionario) references funcionario (idFuncionario)
);

insert into loja (nome, cnpj) values ("Pirula Tech", 123456789);
select * from loja;

alter table funcionario modify column nomeFuncionario varchar (60) not null;
insert into funcionario (idFuncionario, nomeFuncionario) values ("Higor", 00);
delete from funcionario 
where idFuncionario = 0 and nomeFuncionario = 0; 
insert into funcionario (idFuncionario, nomeFuncionario) values (00, "Higor");

insert into funcionario (idFuncionario, nomeFuncionario) values (01, "Maria");

insert into funcionario (idFuncionario, nomeFuncionario) values (02, "Joao");
select * from funcionario;

alter table cliente modify dataNascimento date;
alter table cliente change column endereço endereco varchar (50);
insert into cliente (cpf, nome, dataNascimento, endereco) values (12345678, "Dierison", 03101995, "Jose Bonifacio");
update cliente
set dataNascimento = '1995-10-03'
where cpf = 12345678;
select * from cliente;

insert into departamento (nomeDepartamento, idDepartamento) values ("PC", 00);
insert into departamento (nomeDepartamento, idDepartamento) values ("Perifericos", 01);
insert into departamento (nomeDepartamento, idDepartamento) values ("Hardware", 02);
select * from departamento;

alter table produtos modify column preco double;
insert into produtos (nome, preco, sku, fk_departamento_idDepartamento) values ("Pc Gamer", 7999.99, 000, 00);
insert into produtos (nome, preco, sku, fk_departamento_idDepartamento) values ("Pc Trabalho", 3999.99, 001, 00);
insert into produtos (nome, preco, sku, fk_departamento_idDepartamento) values ("Pc Home", 1999.99, 002, 00);
insert into produtos (nome, preco, sku, fk_departamento_idDepartamento) values ("Monitor", 999.99, 100, 01);
insert into produtos (nome, preco, sku, fk_departamento_idDepartamento) values ("Processador", 999.99, 200, 02);
select * from produtos;

alter table servico add preco int;
alter table servico modify column preco double;
insert into servico (idServico, tipo, preco) values (00, "Formatar", 119.99);
insert into servico (idServico, tipo, preco) values (01, "Backup", 299.99);
insert into servico (idServico, tipo, preco) values (03, "Limpeza", 149.99);
insert into servico (idServico, tipo, preco) values (04, "Analise", 49.99);
insert into servico (idServico, tipo, preco) values (05, "Manutencao", 99.99);
select * from servico;

alter table carrinho modify column total double;
insert into carrinho (qtyProdutos, total, fk_produtos_sku, fk_cliente_cpf, fk_servico_idServico, fk_funcionario_idFuncionario) values (2, 4319.98, 001, 12345678, 00, 00);
select * from carrinho;

select idServico, tipo, preco
from servico
where preco like 49.99; 

select count(*) from servico;
select count(tipo) from servico;

select avg(preco) from servico;
select sum(preco) from servico;

select * from servico
where preco between '129' and '499';

select tipo, preco
from servico
order by preco;

select total, sum(total) as total
from carrinho
group by total;

select 
*
from produtos
inner join departamento on idDepartamento = fk_departamento_idDepartamento;

select 
*
from produtos
left join departamento on idDepartamento = fk_departamento_idDepartamento;

select 
*
from produtos
right join departamento on idDepartamento = fk_departamento_idDepartamento;
