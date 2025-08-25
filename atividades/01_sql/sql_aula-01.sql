

-- AULA 2015-08-20 (BACKEND - PHP) -- 

create table filmes (
	id_filme int primary key auto_increment,
	titulo varchar(100) not null    
);


create table clientes (
	id_cliente int primary key auto_increment,
    nome varchar(100) not null,
    id_filme int, foreign key (id_filme) references filmes (id_filme)
);


-- INSERIR FILMES
insert into filmes (titulo) values ('Poderoso Chefão 1');
insert into filmes (titulo) values ('Poderoso Chefão 2');
insert into filmes (titulo) values ('Poderoso Chefão 3');
insert into filmes (titulo) values ('Matrix');
insert into filmes (titulo) values ('Rocky I');
insert into filmes (titulo) values ('Rocky II');
insert into filmes (titulo) values ('Rocky III');
insert into filmes (titulo) values ('Rocky IV');


insert into clientes (nome, id_filme) values ('Lucas Almeida', 1);
insert into clientes (nome, id_filme) values ('Carla Santos', 3);


