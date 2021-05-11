create table Artista
(
	codigo int primary key,
    nomeArtista varchar (50),
    nacionalidade varchar(30)
);

create table obra
(
	codigo int primary key,
    fk_codigoArtista int,
    titulo varchar(20),
    dataAquisicao date,
    dimensoes varchar(13)
);

