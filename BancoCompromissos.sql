

drop table tb_locais;

create table tb_compromissos(
id int not null auto_increment, 
descricao varchar(100) not null,
data date not null,
hora time not null,
primary key(id)
);

drop table tb_compromissos;

alter table tb_compromissos add column tb_usuarios_id int;
alter table tb_compromissos add constraint fk_usuarios foreign key (tb_usuarios_id) references tb_usuarios (id);

alter table tb_compromissos drop constraint fk_usuarios;
alter table tb_compromissos drop column tb_usuarios_id;

alter table tb_compromissos add column tb_locais_id int;
alter table tb_compromissos add constraint fk_locais foreign key (tb_locais_id) references tb_locais (id);

alter table tb_compromissos drop constraint fk_locais;
alter table tb_compromissos drop column tb_locais_id;

insert into tb_usuarios(nome, telefone, email) values('Karina', '(47)99616-1518','karina@gmail.com');
insert into tb_usuarios(nome, telefone, email) values('Bruno', '(47)99607-3075','bruno@gmail.com');
insert into tb_usuarios(nome, telefone, email) values('Felipe', '(47)99780-0128','felipe@gmail.com');
insert into tb_usuarios(nome, telefone, email) values('Carolina', '(47)99629-5384', 'carol@gmail.com');
select * from tb_usuarios;

insert into tb_locais(nome, rua, numero, bairro, cidade, estado) values('Loja', 'General Osório', '1283', 'Velha', 'Blumenau', 'Santa Catarina');
select * from tb_locais;

insert into tb_compromissos(descricao, data, hora, tb_usuarios_id, tb_locais_id) values('Inauguração coleção', '2023-11-01', '15:00:00', 1, 1);
insert into tb_compromissos(descricao, data, hora, tb_usuarios_id, tb_locais_id) values('Inauguração coleção', '2023-11-01', '15:00:00', 2, 1);
select * from tb_compromissos;