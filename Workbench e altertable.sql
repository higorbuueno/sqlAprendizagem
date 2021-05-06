create table aluno
(
	idAluno int primary key auto_increment,
    nomeAluno varchar(50)
);

alter table aluno add idadeAluno int;

alter table aluno drop column idadeAluno;

alter table aluno modify column nomeAluno varchar (80) not NULL;

alter table aluno change column nomeAluno nome_aluno varchar(30);
