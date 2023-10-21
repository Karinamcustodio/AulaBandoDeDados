create table tb_clientes(
id int not null auto_increment, 
nome varchar(100) not null,
cpf varchar(11) not null,
email varchar(150), 
telefone varchar(14) not null,
rua varchar(45),
numero int,
bairro varchar(45),
cidade varchar(45),
estado varchar(45),
primary key(id) 
);
drop table tb_clientes;

create table tb_categorias(
id int not null auto_increment,
descricao varchar(45) not null,
primary key(id)
);
drop table tb_categorias;

create table tb_fornecedores(
id int not null auto_increment, 
nome varchar(100) not null,
cnpj varchar(14) not null,
email varchar(150) not null, 
telefone varchar(14) not null,
rua varchar(45),
numero int,
bairro varchar(45),
cidade varchar(45),
estado varchar(45),
primary key(id) 
);
drop table tb_fornecedores;

create table tb_produtos(
id int not null auto_increment, 
nome varchar(100) not null,
unidade varchar(10) not null,
tamanho varchar(10),
cor varchar(45),
quantidadeEstoque int not null,
valorTotal decimal not null not null,
tb_categorias_id int not null,
foreign key(tb_categorias_id) references tb_categorias(id),
primary key(id) 
);
drop table tb_produtos;

create table tb_fornecedores_tb_produtos(
tb_fornecedores_id int not null,
tb_produtos_id int not null,
foreign key(tb_fornecedores_id) references tb_fornecedores(id),
foreign key(tb_produtos_id) references tb_produtos(id),
codigo varchar(45) not null,
unidade varchar(10) not null,
valorUnitario decimal not null
);
drop table tb_fornecedores_tb_produtos;

create table tb_vendas(
id int not null auto_increment,
tb_clientes_id int not null,
foreign key(tb_clientes_id) references tb_clientes(id),
quantidade int not null,
valorTotal decimal not null,
pagamentoForma varchar(45) not null,
primary key(id) 
);
drop table tb_vendas;

create table tb_compras(
id int not null auto_increment,
quantidade int not null,
valorTotal decimal not null,
pagamentoForma varchar(45),
primary key(id) 
);
drop table tb_compras;

create table tb_contasApagar(
id int not null auto_increment,
tb_compras_id int not null,
foreign key(tb_compras_id) references tb_compras(id),
primary key(id) 
);
drop table tb_contasApagar;

create table tb_contasAreceber(
id int not null auto_increment,
tb_vendas_id int not null,
foreign key(tb_vendas_id) references tb_vendas(id),
primary key(id) 
);
drop table tb_contasAreceber;

create table tb_Compras_tb_Produtos(
tb_compras_id int not null,
tb_produtos_id int not null,
foreign key(tb_compras_id) references tb_compras(id),
foreign key(tb_produtos_id) references tb_produtos(id),
quantidade int not null,
valorUnitario decimal not null,
unidade varchar(10) not null
);
drop table tb_Compras_tb_Produtos;

create table tb_Produtos_tb_Vendas(
tb_vendas_id int not null,
tb_produtos_id int not null,
foreign key(tb_vendas_id) references tb_vendas(id),
foreign key(tb_produtos_id) references tb_produtos(id),
quantidade int not null,
valor decimal not null,
unidade varchar(10) not null
);
drop table tb_Produtos_tb_Vendas;

insert into tb_clientes(nome, cpf, email, telefone, rua, numero, bairro, cidade, estado) 
values('Karina', '08825444974', 'karina@gmail.com', '(47)99616-1518', 'General Osorio', '1283', 'Velha', 'Blumenau', 'SC'),
('Bruno', '25684201532', 'bruno@gmail.com', '(47)99607-3075', 'General Osorio', '1283', 'Velha', 'Blumenau', 'SC'), 
('Felipe', '35478965420', 'felipe@gmail.com', '(47)99780-0128', 'General Osorio', '1283', 'Velha', 'Blumenau', 'SC'), 
('Carolina', '65842698782', 'carol@gmail.com', '(47)99629-5384', 'General Osorio', '1283', 'Velha', 'Blumenau', 'SC');
select * from tb_clientes;

insert into tb_categorias(descricao) values('Blusas'), ('Calças'), ('Shorts'), ('Saias'), ('Vestidos');
select * from tb_categorias;

insert into tb_fornecedores(nome, cnpj, email, telefone, rua, numero, bairro, cidade, estado)
values('Aradefe', '82120460000118', 'contato@aradefe.com', '(47)3255-0000', 'Rod. Antônio Heil', '5320', 'Limoeiro', 'Brusque', 'SC'),
('JLM Tecidos', '04957761000197', 'contato@jlmtecidos.com', '(47) 3351-1222', 'Rod. Antônio Heil', '339', 'Centro 2', 'Brusque', 'SC');
select * from tb_fornecedores;

insert into tb_produtos(nome, unidade, tamanho, cor, quantidadeEstoque, valorTotal, tb_categorias_id)
values('camiseta polo', 'pc', 'G', 'Branco', '10', '499.00', 1 ),
('saia curta', 'pc', 'P', 'Nude', '25', '822.50', 4),
('vestido de alça midi', 'pc', 'M', 'Verde', '12', '1558.80', 5);
select * from tb_produtos;

alter table tb_fornecedores_tb_produtos add column valorUnitario decimal(6,2);
insert into tb_fornecedores_tb_produtos(tb_fornecedores_id, tb_produtos_id, codigo, unidade, valorUnitario)
values (2, 3, '325V', 'pc', 129.90);
select * from tb_fornecedores_tb_produtos;

insert into tb_vendas(tb_clientes_id, quantidade, valorTotal, pagamentoForma)
values (4, '1', '129.90', 'crédito');
select * from tb_vendas;