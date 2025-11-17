drop database if exists escola;
create database escola;
use escola;
show databases;
create table aluno (
	id int auto_increment primary key,
	nome varchar(100) not null,
	email varchar(100) not null,
	data_nascimento date,
	turma_id int
);
create table professor (
	id int auto_increment primary key,
	nome varchar(100) not null,
	especialidade varchar(100)
);
create table turma (
	id int auto_increment primary key,
	nome varchar(50) not null,
	professor_id int,
    horario time,
    foreign key (professor_id) references professores(id)
);
create table disciplina (
	id int auto_increment primary key,
	nome varchar(100) not null,
	carga_horaria int
);
create table nota (
	id int auto_increment primary key,
    aluno_id int,
    disciplina_id int,
    nota decimal (2, 1),
    bimestre int,
    foreign key (aluno_id) references alunos(id),
    foreign key (disciplina_id) references disciplinas(id)
);
alter table alunos add foreign key (turma_id) references turmas(id);
insert into professores (nome, especialidade) values
('carlos silva', 'matemática'),
('ana santos', 'português'),
('marcos lima', 'história'),
('julia costa', 'ciências'),
('roberto alves', 'geografia');
insert into turmas (nome, professor_id, horario) values
('1º anos A', 1,'08:00:00'),
('1º anos B', 2,'10:00:00'),
('2º anos A', 3,'08:00:00'),
('2º anos B', 4,'13:00:00'),
('3º anos A', 5,'14:00:00');



