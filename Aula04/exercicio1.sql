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
);

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
);

-- item 10
insert into Alunos values (1, 'Maria Souza', '2005-10-15', 1);

-- item 11
update Alunos set Nome='Maria da Silva' where id=1;

-- item 12
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

-- item 13
delete from Alunos where Id=2;

-- item 14
create table Notas(
	Id int not null,
	AlunoId int not null,
	Disciplina varchar(15) not null,
	Nota Decimal(5,2) not null,
	constraint pk_notas primary key(Id),
	constraint fk_alunos foreign key(AlunoId) references Alunos(Id)
);

-- item 15
insert into Notas values (1, 1, 'Matemática', 8.5);

-- item 16
update Notas set Nota=9.0 where Id=1;

-- item 17
insert into Notas values
(2, 11, 'Biologia', 6.2),
(3, 10, 'Direito Civil', 5.4),
(4, 9, 'Dramaturgia', 8.45),
(5, 8, 'História', 10.0),
(6, 6, 'Direito Penal', 6.66),
(7, 7, 'Teologia', 7.77),
(8, 5, 'Psicologia', 5.8),
(9, 4, 'Roteiros', 1.71),
(10, 3, 'Educação Física', 7.0),
(11, 1, 'Arqueologia', 1.11);

-- item 18
delete from Notas where Id=1;

-- item 19
create table Matriculas(
	Id int not null,
	AlunoId int not null,
	TurmaId int not null,
	DataMatricula date not null,
	constraint pk_matriculas primary key(Id),
	constraint fk_alunos_matricula foreign key(AlunoId) references Alunos(Id),
	constraint fk_turmas_matricula foreign key(TurmaId) references Turmas(Id)
);

-- item 20
insert into Matriculas values (1, 1, 1,'2022-02-15');

-- item 21
insert into Matriculas values
(2, 11, 11, '2011-11-02'),
(3, 10, 10, '2010-10-03'),
(4, 9, 9, '2009-09-04'),
(5, 8, 8, '2008-08-05'),
(6, 7, 7, '2007-07-06'),
(7, 6, 6, '2006-06-07'),
(8, 5, 5, '2005-05-08'),
(9, 4, 4, '2004-04-09'),
(10, 3, 3, '2003-03-10'),
(11, 9, 1, '2001-09-11');
