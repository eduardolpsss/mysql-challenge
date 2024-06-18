-- 1 - SELECT
select
	u.nome,
	u.email
from
	usuarios u;

-- 2 - WHERE
select
	p.*
from
	posts p
where
	p.id_autor = 1;

-- 3 - AND, OR, NOT
select
	p.*
from
	posts p
where
	p.texto like '%primeiro%'
	and p.data_publicacao > '2024-06-18 11:00:00'
	or p.id_autor = 1;

-- 4 - ORDER BY
select p.* from posts p order by p.data_publicacao desc;

-- 5 - INSERT INTO
insert into
	usuarios(nome, email, senha)
values
	('Thiago', 'thiago@email.com', '12345678');

-- 6 - NULL Values
select p.* from posts p where p.id_grupo is null;

-- 7 - UPDATE
update
	usuarios u
set
	u.nome = 'Júnior',
	u.email = 'junior@email.com',
	u.senha = '987654321'
where
	u.nome = 'Eduardo'
	
-- 8 - DELETE
delete
from
	posts p
where
	p.id = 3;
	
-- 9 - LIMIT
insert
	into
	posts(texto)
values
	('1'),
	('2'),
	('3'),
	('4'),
	('5'),
	('6'),
	('7'),
	('8'),
	('9'),
	('10'),
	('11'),
	('12'),
	('13'),
	('14'),
	('15');

select
	p.*
from
	posts p
order by
	p.data_publicacao desc
limit 0, 10;
	
-- 10 - MIN and MAX
insert into 
	posts(texto, id_autor, id_grupo)
values
	('Este é segundo post do primeiro grupo', 1, 1);
	
select
	min(p.data_publicacao) as data_primeiro_post,
	max(p.data_publicacao) as data_ultimo_post,
	p.id_autor
from
	posts p
where
	p.id_autor = 1;
	
-- 11 - COUNT, AVG, SUM
select COUNT(*) as qtde_likes from likes l where l.id_post = 1;

select
	avg(count_like) as qtde_media_likes
from
	(
	select
		count(*) as count_like
	from
		likes l
	group by
		l.id_post) as count_likes; 
		
-- 12 - LIKE
insert into
	usuarios(nome, email, senha)
values
	('Amanda', 'amanda@email.com', '12345678');
	
select u.* from usuarios u where u.nome like 'A%';

-- 13 - Wildcards
insert into
	usuarios(nome, email, senha)
values
	('Devanir', 'devanir@email.com', '12345678');
	
select
	u.*
from
	usuarios u
where
	u.nome like '%dev%';

-- 14 - IN
select
	p.*
from
	posts p
where
	p.id_autor in (1, 3);

-- 15 - BETWEEN
select
	p.*
from
	posts p
where
	p.data_publicacao between '2024-06-18 11:38:00' and '2024-06-18 11:40:00'
	
-- 16 - Aliases
select
	u.nome as 'Autor',
	p.texto as 'Conteúdo'
from
	posts p
inner join usuarios u
where
	u.id = p.id_autor;
	
-- 17 - Joins
select
	u.nome,
	p.texto
from
	posts p
inner join usuarios u
where
	u.id = p.id_autor;

-- 18 - INNER JOIN
select
	u.nome,
	p.texto
from
	posts p
inner join usuarios u
where
	u.id = p.id_autor;
	
-- 19 - LEFT JOIN
select
	u.*,
	p.texto 
from
	usuarios u
left join posts p on
	p.id_autor = u.id; 

-- 20 - RIGHT JOIN
select
	p.*,
	u.nome
from
	usuarios u
right join posts p on
	p.id_autor = u.id; 

-- 21 - CROSS JOIN
select
	u.nome,
	g.nome
from
	usuarios u
cross join grupos g;

-- 22 - Self Union
select
	u1.nome as Nome_Amigo1,
	u2.nome as Nome_Amigo2
from
	amizades a
join usuarios u1 on
	a.id_usuario1 = u1.id
join usuarios u2 on
	a.id_usuario2 = u2.id;

-- 23 - UNION
select
	p.texto
from
	posts p
union
select
	mp.texto
from
	mensagens_privadas mp;
	
-- 24 - GROUP BY
select
	p.id_autor as 'ID dono do post',
	count(p.id) as 'Quantidade de posts'
from
	posts p
group by
	p.id_autor; 
	
-- 25 - HAVING
select
	g.nome as "Nome do grupo",
	count(mg.id_grupo) as qtde_membros
from
	membos_grupos mg
inner join grupos g on
	g.id = mg.id_grupo
group by
	mg.id_grupo
having
	qtde_membros >= 1;
	
-- 26 - EXISTS
select
	u.nome as "Usuários com pelo menos 1 post"
from
	usuarios u
where
	exists (
	select
		*
	from
		posts p
	where
		p.id_autor = u.id);
		
-- 27 - ANY, ALL
select
	p.*
from
	posts p
where
	p.id = any (
	select
		l.id_post
	from
		likes l)
		
-- 28 - INSERT SELECT
create table posts_backup like posts;

select * from posts_backup pb;

insert
	into
	posts_backup
select
	*
from
	posts p
where
	p.id_autor = 1;
	
-- 29 - CASE
select
	u.nome as nome_autor,
	p.texto
from
	posts p
left join usuarios u on
	p.id_autor = u.id;

select
	case
		when u.nome is null then 'Usuário anônimo'
		else u.nome
	end as nome_autor,
	p.texto
from
	posts p
left join usuarios u on
	p.id_autor = u.id;

-- 30 - Operators
select
	p.*
from
	posts p
where
	data_publicacao > '2024-06-18 11:38:00'
	and (
	select
		count(*)
	from
		likes l
	where
		l.id_post = p.id) >= 1;
	
-- 31 - Views
create or replace
view popular_posts as
select
	p.id,
	p.texto,
	count(l.id) as "Número de likes"
from
	posts p
inner join usuarios u on
	u.id = p.id_autor
inner join likes l on
	l.id_post = p.id
group by
	p.id
having
	count(l.id) >= 1;

select pp.* from popular_posts pp;
