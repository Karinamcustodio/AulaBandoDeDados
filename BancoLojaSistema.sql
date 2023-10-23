create table clientes(
id int primary key auto_increment, 
nome varchar(100) not null,
cpf varchar(14) not null,
email varchar(150), 
telefone varchar(14) not null,
endereco_id int
);

create table fornecedores(
id int primary key auto_increment, 
nomeFantasia varchar(100) not null,
cnpj varchar(18) not null,
email varchar(150) not null, 
telefone varchar(14) not null,
endereco_id int
);

create table endereco(
id int primary key auto_increment,
rua varchar(45),
numero int,
bairro varchar(45),
cidade varchar(45),
estado varchar(45)
);

alter table clientes add constraint fk_enderecoClientes foreign key (endereco_id) references endereco(id);
alter table fornecedores add constraint fk_enderecoFornecedores foreign key (endereco_id) references endereco(id);

create table categorias(
id int primary key auto_increment,
descricaoCategoria varchar(45) not null
);

create table produtos(
id int primary key auto_increment, 
descricaoProduto varchar(100) not null,
unidadeMedida varchar(10) not null,
valorVenda decimal(6,2) not null,
categorias_id int not null
);

alter table produtos add constraint fk_categorias foreign key (categorias_id) references categorias(id);

create table estoque(
id int primary key auto_increment,
produtos_id int not null,
tamanhoProduto varchar(10),
corProduto varchar(45),
quantidadeEstoque int not null
);

alter table estoque add constraint fk_produtos foreign key (produtos_id) references produtos(id);

create table fornecedores_produtos(
fornecedores_id int not null,
produtos_id int not null,
codigoProdutoFornecedor varchar(45) not null,
unidadeMedidaFornecedor varchar(10) not null,
valorUnitario decimal(6,2) not null
);

alter table fornecedores_produtos add constraint fk_fornecedores foreign key (fornecedores_id) references fornecedores(id);
alter table fornecedores_produtos add constraint fk_produtosFornecedores foreign key (produtos_id) references produtos(id); 

create table vendas(
id int primary key auto_increment,
clientes_id int not null,
formaPagamento varchar(45) not null,
condicoesPagamento varchar(20) not null
);

alter table vendas add constraint fk_clientes foreign key (clientes_id) references clientes(id);

create table compras(
id int primary key auto_increment,
formaPagamento varchar(45) not null,
condicoesPagamento varchar(20) not null
);

create table compras_produtos(
compras_id int not null,
produtos_id int not null,
tamanhoProduto varchar(10),
corProduto varchar(45),
quantidadeProduto int not null,
valorTotalCompra decimal(6,2) not null
);

alter table compras_produtos add constraint fk_compras foreign key (compras_id) references compras(id);
alter table compras_produtos add constraint fk_produtosCompras foreign key (produtos_id) references produtos(id);

create table vendas_produtos(
vendas_id int not null,
produtos_id int not null,
tamanhoProduto varchar(10),
corProduto varchar(45),
quantidadeProduto int not null,
valorTotalVenda decimal(6,2) not null
);

alter table vendas_produtos add constraint fk_vendas foreign key(vendas_id) references vendas(id);
alter table vendas_produtos add constraint fk_produtosVendas foreign key(produtos_id) references produtos(id);

create table contasPagar(
id int primary key auto_increment,
compras_id int not null 
);

alter table contasPagar add constraint fk_comprasPagar foreign key (compras_id) references compras(id);

create table contasReceber(
id int primary key auto_increment,
vendas_id int not null
);

alter table contasReceber add constraint fk_vendasReceber foreign key (vendas_id) references vendas(id);

insert into endereco(rua, numero, bairro, cidade, estado)
values ('General Osorio', 1283, 'Velha', 'Blumenau', 'SC'),
('Rod. Jorge Fortulino', 07, 'Lagoa dos Esteves', 'Balneário Rincão', 'SC'),
('Av. Itajuba, Paralela BR 101', 2311, 'Itajubá', 'Barra Velha', 'SC'),
('Rod. Antônio Heil', 5320, 'Limoeiro', 'Brusque', 'SC'),
('Rod. Antônio Heil', 339, 'Centro 2', 'Brusque', 'SC');
select * from endereco;

insert into clientes(nome, cpf, email, telefone, endereco_id) 
values('Karina', '088.254.449-74', 'karina@gmail.com', '(47)99616-1518', 1),
('Bruno', '256.842.015-32', 'bruno@gmail.com', '(47)99607-3075', 2), 
('Felipe', '354.789.654-20', 'felipe@gmail.com', '(47)99780-0128', 3), 
('Carolina', '658.426.987-82', 'carol@gmail.com', '(47)99629-5384', 3);
select * from clientes;

insert into fornecedores(nomeFantasia, cnpj, email, telefone, endereco_id)
values('Aradefe', '82.120.460/0001-18', 'contato@aradefe.com', '(47)3255-0000', 4),
('JLM Tecidos', '04.957.761/0001-97', 'contato@jlmtecidos.com', '(47) 3351-1222', 5);
select * from fornecedores;

insert into categorias(descricaoCategoria) values('Blusas'), ('Calças'), ('Shorts'), ('Saias'), ('Vestidos');
select * from categorias;

insert into produtos(descricaoProduto, unidadeMedida, valorVenda, categorias_id )
values('camiseta polo', 'pc', 100.00, 1), ('saia curta', 'pc', 51.00, 4),
('vestido de alça midi', 'pc', 240.00, 5);
select * from produtos;

insert into estoque(produtos_id, tamanhoProduto, corProduto, quantidadeEstoque)
values(1, 'P', 'Branco', 15), (1, 'M', 'Branco', 15), (1, 'G', 'Branco', 10), 
(2, 'P', 'Nude', 25), (2, 'M', 'Nude', 25), (2, 'G', 'Nude', 20),
(3, 'P', 'Verde', 12), (3, 'M', 'Verde', 12), (3, 'G', 'Verde', 8);
select * from estoque;

insert into fornecedores_produtos(fornecedores_id, produtos_id, codigoProdutoFornecedor, unidadeMedidaFornecedor, valorUnitario)
values(2, 3, '325V', 'pc', 120.00);
select * from fornecedores_produtos;

insert into vendas(clientes_id, formaPagamento, condicoesPagamento)
values(4, 'crédito', '3 parcelas'), (2, 'crédito', '1 parcela'), (1, 'pix', 'a vista');
select * from vendas;

insert into compras(formaPagamento, condicoesPagamento)
values ('crédito', '2 parcelas');
select * from compras;

insert into compras_produtos(compras_id, produtos_id, tamanhoProduto, corProduto, quantidadeProduto, valorTotalCompra)
values(1, 3, 'M', 'Verde', 5, 600.00 );
select * from compras_produtos;

insert into vendas_produtos(vendas_id, produtos_id, tamanhoProduto, corProduto, quantidadeProduto, valorTotalVenda)
values(1, 3, 'P', 'Verde', 1, 391.00), (1, 1, 'P', 'Branco', 1, 391.00), (1, 2, 'P', 'Nude', 1, 391.00), (2, 1, 'M', 'Branco', 1, 100.00), (3, 2, 'G', 'Nude', 1, 51.00);
select * from vendas_produtos;

insert into contasPagar(compras_id) values(1);
select * from contasPagar;

insert into contasReceber(vendas_id) values(1), (2), (3);
select * from contasReceber;

/*Tabela Contas a receber com todas as informações desejadas*/
select contasReceber.id as IdReceber, vendas.id as IdVenda, clientes.nome as Cliente, produtos.descricaoProduto as Produto, categorias.descricaoCategoria as Categoria, produtos.unidadeMedida as Unidade, vendas_produtos.tamanhoProduto as Tamanho, vendas_produtos.corProduto as Cor, produtos.valorVenda as PreçoVenda, vendas_produtos.quantidadeProduto as Quantidade, vendas_produtos.valorTotalVenda as ValorTotal, vendas.formaPagamento as Pagamento, vendas.condicoesPagamento as Condições 
from contasReceber, vendas, clientes, produtos, categorias, vendas_produtos
where contasReceber.vendas_id = vendas.id && vendas.clientes_id = clientes.id && produtos.categorias_id = categorias.id && vendas_produtos.vendas_id = vendas.id && vendas_produtos.produtos_id = produtos.id;

/*Tabela Contas a pagar com todas as informações desejadas*/
select contasPagar.id as IdPagar, compras.id as IdCompras, fornecedores.nomeFantasia as Fornecedor, produtos.descricaoProduto as Produto, categorias.descricaoCategoria as Categoria, fornecedores_produtos.codigoProdutoFornecedor as Código, fornecedores_produtos.unidadeMedidaFornecedor as Unidade, compras_produtos.tamanhoProduto as Tamanho, compras_produtos.corProduto as Cor, fornecedores_produtos.valorUnitario as PreçoCompra, compras_produtos.quantidadeProduto as Quantidade, compras_produtos.valorTotalCompra as ValorTotal, compras.formaPagamento as Pagamento, compras.condicoesPagamento as Condições 
from contasPagar, compras, fornecedores, produtos, categorias, fornecedores_produtos, compras_produtos 
where contasPagar.compras_id = compras.id && fornecedores_produtos.fornecedores_id = fornecedores.id && produtos.categorias_id = categorias.id && compras_produtos.compras_id = compras.id && compras_produtos.produtos_id = produtos.id;