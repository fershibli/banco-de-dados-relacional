create database exercicio1;
use exercicio1;

-- item 1
create table Professores(
	Id int not null,
	Nome varchar(50),
	Disciplina varchar(15),
	constraint pk_professores primary key(Id)
);

-- item 2
insert into Professores values (1, 'Ana Oliveira', 'Português');

-- item 3
update Professores set Nome='Ana Silva' where Id=1;

-- item 4
insert into Professores values 
(2, 'Dean', 'Biologia'),
(3, 'Sam', 'Direito Civil'),
(4, 'Cass', 'Teologia'),
(5, 'Bobby', 'História'),
(6, 'Garth', 'Dramaturgia'),
(7, 'Ellen', 'Psicologia'),
(8, 'Jo', 'Educação Física'),
(9, 'Crowley', 'Direito Penal'),
(10, 'Chuck', 'Roteiros'),
(11, 'Kevin', 'Arqueologia');

-- item 5
delete from Professores where id=2;

-- item 6
create table Turmas(
	Id int not null,
	Nome varchar(50),
	ProfessorResponsavel int not null,
	constraint fk_professores foreign key(ProfessorResponsavel) references Professores(Id),
	constraint pk_turmas primary key(Id)
)

-- item 7
insert into Turmas values (1, '9A', 1); 

-- item 8
insert into Turmas values
(2, '1A', 11),
(3, '2B', 10),
(4, '3C', 9),
(5, '4E', 8),
(6, '5A', 7),
(7, '6B', 6),
(8, '7C', 5),
(9, '8D', 4),
(10, '9E', 3),
(11, '1B', 1);

-- item 9
create table Alunos(
	Id int not null,
	Nome varchar(50),
	DataNascimento date,
	TurmaId int not null,
	constraint pk_alunos primary key(Id),
	constraint fk_turmas foreign key(TurmaId) references Turmas(Id)
)

-- item 10
insert into Alunos values (1, 'Maria Souza', '2005-10-15', 1);

-- item 11
insert into Alunos values
(2, 'Adão', '1900-11-11', 11),
(3, 'Eva', '1900-11-11', 10),
(4, 'Caim', '1901-11-11', 9),
(5, 'Abel', '1901-11-11', 8),
(6, 'Noé', '2000-11-11', 7),
(7, 'David', '1977-11-11', 6),
(8, 'Golias', '1977-11-11', 5),
(9, 'Mazekein', '1900-11-11', 4),
(10, 'Jesus', '1-1-1', 3),
(11, 'Judas', '1-1-1', 1);

select * from Alunos;