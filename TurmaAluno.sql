create table turma
(
	idTurma int primary key auto_increment,
    nome varchar (50)
);

create table aluno2
(
	idAluno int primary key auto_increment,
    nome varchar (50),
    idade int
);

create table cadastros
(
	fk_idAluno int,
	foreign key (fk_idAluno) references aluno2 (idAluno),
    
    fk_idTurma int,
    foreign key (fk_idTurma) references turma (idTurma)
);


insert into turma (idTurma, nome) values ('','SI1');
insert into turma (idTurma, nome) values ('','SI2');
insert into turma (idTurma, nome) values ('', 'SI3');
insert into turma (nome) values ('SI5');

select * from turma;

insert into aluno2 (nome, idade) values ('Higor', '20');
insert into aluno2 (nome, idade) values ('Alciomar', '28');
insert into aluno2 (nome, idade) values ('Pedro', '19');

select * from aluno2, turma;

insert into cadastros (fk_idAluno, fk_idTurma) values (1,3);
insert into cadastros (fk_idAluno, fk_idTurma) values (2,4);
insert into cadastros (fk_idAluno, fk_idTurma) values (2,3);

select * from cadastros;
