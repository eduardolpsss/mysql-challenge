create database if not exists desafio_mysql;

create table usuarios (
	id int auto_increment primary key,
	nome varchar(255) not null,
	email varchar(255) unique not null,
	senha varchar(255) not null,
	data_registro datetime default current_timestamp
);

create table grupos (
	id int auto_increment primary key,
	nome varchar(255) not null,
	descricao text
);

create table posts (
	id int auto_increment primary key,
	id_autor int default null,
	texto text not null,
	data_publicacao timestamp default current_timestamp,
	id_grupo int,
	foreign key (id_autor) references usuarios(id),
	foreign key (id_grupo) references grupos(id)
);

create table comentarios (
	id int auto_increment primary key,
	id_autor int,
	id_post int,
	texto text not null,
	data_publicacao timestamp default current_timestamp,
	foreign key (id_post) references posts(id),
	foreign key (id_autor) references usuarios(id)
);

create table likes (
	id int auto_increment primary key,
	id_post int,
	id_autor int,
	foreign key (id_post) references posts(id),
	foreign key (id_autor) references usuarios(id)
);

create table mensagens_privadas (
	id int auto_increment primary key,
	id_remetente int,
	id_destinatario int,
	texto text,
	data_envio timestamp default current_timestamp,
	foreign key (id_remetente) references usuarios(id),
    foreign key (id_destinatario) references usuarios(id)
);

create table amizades (
	id int auto_increment primary key,
	id_usuario1 int,
	id_usuario2 int,
	data_inicio_amizade timestamp default current_timestamp,
	foreign key (id_usuario1) references usuarios (id),
	foreign key (id_usuario2) references usuarios (id)
);

create table membos_grupos (
	id int auto_increment primary key,
	id_usuario int,
	id_grupo int,
	data_entrada_grupo timestamp default current_timestamp,
	foreign key (id_usuario) references usuarios (id),
	foreign key (id_grupo) references grupos (id)
);
