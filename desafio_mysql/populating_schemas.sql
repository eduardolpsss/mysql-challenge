insert into
	usuarios(nome, email, senha)
values
	('Eduardo', 'eduardo@email.com', '12345678'),
	('Lucas', 'lucas@email.com', '12345678'),
	('Henrique', 'henrique@email.com', '12345678'),
	('Carlos', 'carlos@email.com', '12345678');

insert into
	grupos(nome, descricao)
values 
	('Grupo 1', 'Primeiro grupo'),
	('Grupo 2', 'Segundo grupo');

insert into
	membos_grupos(id_usuario, id_grupo)
values
	(1, 1),
	(2, 1),
	(3, 2),
	(4, 2);

insert into 
	amizades(id_usuario1, id_usuario2)
values
	(1,2),
	(2,1),
	(3,4),
	(4,3);

insert into 
	posts(texto, id_autor, id_grupo)
values
	('Este é o primeiro grupo', 1, 1);


insert into 
	posts(texto, id_autor, id_grupo)
values
	('Este é o segundo grupo', 3, 2);

insert into
	comentarios(texto, id_autor, id_post)
values
	('Olá Eduardo', 2, 1);

insert into
	comentarios(texto, id_autor, id_post)
values
	('Olá Henrique', 4, 2);

insert into 
	likes(id_post, id_autor)
values
	(1, 2),
	(2, 4);

insert into 
	mensagens_privadas(texto, id_remetente, id_destinatario)
values
	('Oi Eduardo', 2, 1);

insert into 
	mensagens_privadas(texto, id_remetente, id_destinatario)
values
	('Oi Henrique', 4, 3);

insert into 
	posts(texto)
values
	('Post para exclusão');



