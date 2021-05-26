create table professor3
(
	cpf int primary key,
	nome varchar (50) not null,
    idade int not null
);

create table aluno3
(
	idAluno int primary key,
	nome varchar (50) not null,
    idade int not null,
    NomeResponsavel varchar (50) not null,
    fk_ProfessorCPF int,
    foreign key (fk_ProfessorCPF) references professor3(cpf)
);

create table disciplina3
(
	nome varchar (50) not null,
    idDisciplina int primary key
);

create table dados3
(
	fk_idAluno int,
    fk_idDisciplina int,
    
    foreign key (fk_idAluno) references aluno3(idAluno),
    foreign key (fk_idDisciplina) references disciplina3(idDisciplina)
);

alter table disciplina3 change nome nomeDisciplina varchar(50) not null;
alter table aluno3 change nome nomeAluno varchar(50) not null;
alter table professor3 change nome nomeProfessor varchar(50) not null;
alter table aluno3 change idade idadeAluno varchar(50) not null;
alter table aluno3 change NomeResponsavel NomeResponsavelAluno varchar(50) not null;

select d.nomeDisciplina, a.nomeAluno, a.idadeAluno, a.NomeResponsavelAluno, p.nomeProfessor from disciplina3 as d inner join aluno3 as a inner join professor3 as p;

select * from professor3;
insert into professor3(cpf, nomeProfessor, idade) values (12345678, 'Alciomar', 28);

select * from aluno3;
insert into aluno3(idAluno, nomeAluno, idadeAluno, NomeResponsavelAluno, fk_ProfessorCPF) values(0, 'Higor', 20, 'MeuPai', 12345678);

select * from disciplina3;
insert into disciplina3(nomeDisciplina, idDisciplina) values('Banco de dados', 0);

select d.nomeDisciplina, a.nomeAluno, a.idadeAluno, a.NomeResponsavelAluno, p.nomeProfessor from disciplina3 as d inner join aluno3 as a inner join professor3 as p;