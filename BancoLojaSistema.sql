create table tb_Clientes(
id int primary key auto_increment,
nome varchar(45) not null, 
email varchar(45), 
telefone varchar(45)
)

drop table tb_clientes;

create table tb_Clientes(
id int not null auto_increment, 
nome varchar(45) not null,
email varchar(45), 
telefone varchar(45),
rua varchar(45),
numero varchar(45),
primary key(id) 
)

create table tb_Categorias(
id int not null auto_increment,
descricao varchar(45) not null,
primary key(id)
)