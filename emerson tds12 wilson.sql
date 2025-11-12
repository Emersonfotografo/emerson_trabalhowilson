
-- 1
select * from alunos;
-- 2
select nome, idade from alunos;
-- 3
select * from alunos where disciplina = 'modelagem de Sistema';
-- 4
select * from alunos where idade > 19;
-- 5
select * from alunos order by nome asc;
-- 6
select * from alunos order by idade asc;
-- 7
select * from alunos where disciplina in ('Banco de Dados', 'Programação mobile');
-- 8
select count(*) as total_alunos from alunos;
-- 9
select avg(idade) from alunos;
-- 10
select disciplina, count(*) from alunos group by disciplina;
-- 11
update alunos set idade = 19 where nome = 'Ana Souza';
-- 12
update alunos set disciplina = 'Programação de Aplicativos';
-- 13
delete from alunos where nome = 'Andre Gregório';
-- 14
alter table alunos add email varchar(100);
-- 15
alter table alunos modify column disciplina varchar(150);
-- 16
alter table alunos drop column email;
-- 17
select * from alunos where nome like 'A%';
-- 18
select * from alunos where nome like '%a';
-- 19
select * from alunos where nome like '%e%';
-- 20
select disciplina from alunos group by disciplina having avg(idade) > 19;
-- 21
select nome, idade from alunos where idade = (select max(idade) from alunos);
use teste;
-- 22
create table alunos_bd as select * from alunos where disciplina = 'Banco de Dados';
select * from alunos_bd



