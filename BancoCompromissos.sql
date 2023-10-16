/*create table tb_usuarios(
id int not null auto_increment,
nome varchar(45) not null,
telefone varchar(45),
email varchar(100),
primary key(id)
)*/

/*drop table tb_usuarios;*/

/*create table tb_locais(
id int not null auto_increment, 
nome varchar(45),
rua varchar(130),
numero int,
bairro varchar(45),
cidade varchar(45),
estado varchar(45),
primary key(id)
)*/

/*drop table tb_locais;*/

/*create table tb_compromissos(
id int not null auto_increment, 
descricao varchar(100) not null,
data date not null,
hora time not null,
primary key(id)
)*/

/*drop table tb_compromissos;*/

alter table tb_compromissos add column tb_usuarios_id int;
alter table tb_compromissos add constraint fk_usuarios foreign key (tb_usuarios_id) references tb_usuarios (id);

alter table tb_compromissos drop constraint fk_usuarios;
alter table tb_compromissos drop column tb_usuarios_id;

alter table tb_compromissos add column tb_locais_id int;
alter table tb_compromissos add constraint fk_locais foreign key (tb_locais_id) references tb_locais (id);

alter table tb_compromissos drop constraint fk_locais;
alter table tb_compromissos drop column tb_locais_id;