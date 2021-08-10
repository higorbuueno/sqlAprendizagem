create table Professor
(
	nomeProf varchar(30),
    cpfProf int primary key,
    idade int
);

create table Aluno
(
	nomeAluno varchar(30),
    idade int,
    idAluno int primary key auto_increment,
	fk_cpfProf int,
    foreign key (fk_cpfProf) references Professor(cpfProf)
);

create table Disciplina
(
	NomeDisciplina varchar(30),
    idDisciplina int primary key auto_increment
);

create table AlunoXDisciplina
(
	fk_idDisciplina int,
    fk_idAluno int,

    foreign key (fk_idAluno) references Aluno(idAluno),
    foreign key (fk_idDisciplina) references Disciplina(idDisciplina)
);

insert into Professor(nomeProf, cpfProf, idade)
values
("Alciomar", 00000, "26");

insert into Aluno (nomeAluno, idade,fk_cpfProf)
values
("Higor", "21",00000),
("Pedro", "19",00000);

insert into Disciplina(NomeDisciplina) values ("Programação");
insert into Disciplina(NomeDisciplina) values ("Banco de dados");

select * from Disciplina;
select * from AlunoXDisciplina;

insert into AlunoXDisciplina(fk_idDisciplina, fk_idAluno)
values
(1,1),
(1,2),
(2,1);

select * from AlunoXDisciplina as AD
INNER JOIN	Disciplina as d on d.idDisciplina = AD.fk_idDisciplina
inner join Aluno as a on a.idAluno = AD.fk_idAluno
inner join professor as p on a.fk_cpfProf = p.cpfProf;