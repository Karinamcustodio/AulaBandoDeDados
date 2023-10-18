create table tb_usuarios(
id int not null auto_increment,
nome varchar(45) not null,
telefone varchar(45),
email varchar(100),
primary key(id)
); /*cria a tabela*/

drop table tb_usuarios; /*deleta a tabela*/

create table tb_locais(
id int not null auto_increment, 
nome varchar(45),
rua varchar(130),
numero int,
bairro varchar(45),
cidade varchar(45),
estado varchar(45),
primary key(id)
);

drop table tb_locais;

create table tb_compromissos(
id int not null auto_increment, 
descricao varchar(100) not null,
data date not null,
hora time not null,
primary key(id)
);

drop table tb_compromissos;

create table tb_compromissos_has_tb_usuarios(
tb_usuarios_id int not null,
tb_compromissos_id int not null,
foreign key(tb_usuarios_id) references tb_usuarios(id),
foreign key(tb_compromissos_id) references tb_compromissos(id)
);

drop table tb_compromissos_has_tb_usuarios;

alter table tb_compromissos add column tb_usuarios_id int; /*inserir uma coluna*/
alter table tb_compromissos add constraint fk_usuarios foreign key (tb_usuarios_id) references tb_usuarios (id); /*inserir a chave estrangeira*/

alter table tb_compromissos drop constraint fk_usuarios;
alter table tb_compromissos drop column tb_usuarios_id;

alter table tb_compromissos add column tb_locais_id int;
alter table tb_compromissos add constraint fk_locais foreign key (tb_locais_id) references tb_locais (id);

alter table tb_compromissos drop constraint fk_locais;
alter table tb_compromissos drop column tb_locais_id;

insert into tb_usuarios(nome, telefone, email) values('Karina', '(47)99616-1518','karina@gmail.com'), /*inserir valores = inserir linhas*/
('Bruno', '(47)99607-3075','bruno@gmail.com'), ('Felipe', '(47)99780-0128','felipe@gmail.com'), ('Carolina', '(47)99629-5384', 'carol@gmail.com');

select * from tb_usuarios; /*visualizar as tabelas*/

insert into tb_locais(nome, rua, numero, bairro, cidade, estado) values('Loja', 'General Osório', '1283', 'Velha', 'Blumenau', 'Santa Catarina');

select * from tb_locais;

insert into tb_compromissos(descricao, data, hora, tb_usuarios_id, tb_locais_id) values('Inauguração coleção', '2023-11-01', '15:00:00', 1, 1),
('Inauguração coleção', '2023-11-01', '15:00:00', 2, 1);

insert into tb_compromissos_has_tb_usuarios(tb_compromissos_id, tb_usuarios_id) values(6, 2), (6, 1);

delete from tb_compromissos where id < 5; /*deletar da tabela compromissos o id menor que 5*/
delete from tb_compromissos where tb_compromissos_id = 1; /*verificar se esta certo*/

select * from tb_compromissos;

select descricao, data, hora, nome from tb_compromissos, tb_usuarios where tb_compromissos.tb_usuarios_id = tb_usuarios.id;
select descricao, data, hora, tb_usuarios.nome, tb_locais.nome from tb_compromissos, tb_usuarios, tb_locais where tb_compromissos.tb_usuarios_id = tb_usuarios.id && tb_compromissos.tb_locais_id = tb_locais.id;
select tb_compromissos.id, descricao, data, hora, tb_usuarios.nome, tb_locais.nome from tb_compromissos, tb_usuarios, tb_locais where tb_compromissos.tb_usuarios_id = tb_usuarios.id && tb_compromissos.tb_locais_id = tb_locais.id;
select tb_compromissos.id, descricao, data, hora, tb_usuarios.nome as usuario, tb_locais.nome as local from tb_compromissos, tb_usuarios, tb_locais where tb_compromissos.tb_usuarios_id = tb_usuarios.id && tb_compromissos.tb_locais_id = tb_locais.id; /*mudando o nome das colunas com AS*/
select tb_compromissos.id, descricao, data, hora, tb_usuarios.nome as usuario from tb_compromissos inner join tb_usuarios on tb_compromissos.tb_usuarios_id = tb_usuarios.id where tb_compromissos.tb_usuarios_id = 2; /*Quando for pra ver somente o usuario espeficico*/

select * from tb_compromissos_has_tb_usuarios;
select tb_usuarios.nome as usuario, tb_compromissos.descricao as compromisso from tb_compromissos_has_tb_usuarios, tb_compromissos, tb_usuarios where tb_compromissos_has_tb_usuarios.tb_usuarios_id = tb_usuarios.id && tb_compromissos_has_tb_usuarios.tb_compromissos_id = tb_compromissos.id;