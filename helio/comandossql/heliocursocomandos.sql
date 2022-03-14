/**
eliminando base de dados
só executa se existir
*/

drop database if exists projeto_helio_2;

create database projeto_helio_2; -- criando a base de dados

use projeto_helio_2;

create table estado(
id int primary key auto_increment
,nome varchar(200) not null unique -- constraint inline
,sigla char(2) not null unique
,ativo char(1) not null default 'S'
,data_cadastro datetime not null default current_timestamp
-- ,check (ativo in ('S', 'N')) -- constraint out of line - regra sem nome
,constraint estado_ativo_deve_ser_S_ou_N check (ativo in ('S', 'N')) -- regra com nome (vai aparecer o nome que você declarou caso dê erro)
);

insert into estado (nome,sigla) values ('PARANA','PR');
insert into estado (nome,sigla) values ('SAO PAULO','SP');

select id,nome,sigla,ativo,data_cadastro from estado;

create table cidade (
id int not null auto_increment
,nome varchar(200) not null
,ativo varchar(1) not null default 'S'
,data_cadastro datetime not null default current_timestamp
,estado_id int not null
,constraint pk_cidade primary key (id)
,constraint fk_cidade_estado foreign key (estado_id) references estado (id)
,constraint cidade_ativo_deve_ser_S_ou_N check (ativo in ('S', 'N'))
,constraint cidade_unica unique (nome, estado_id)
);

insert into cidade (nome,estado_id) values ('CURITIBA',1);
insert into cidade (nome,estado_id) values ('SAO PAULO',2);

select * from cidade;

create table funcionario(
id int primary key not null auto_increment
,nome varchar(200) not null
,CPF char(15) not null unique
,endereco varchar(200) not null
,ativo char(1) not null default 'S'
,data_cadastro datetime not null default current_timestamp
,cidade_id int not null
,constraint fk_funcionario_estado foreign key (cidade_id) references cidade (id)
,constraint funcionario_ativo_deve_ser_S_ou_N check (ativo in ('S', 'N'))
);

insert into funcionario (nome,CPF,endereco,cidade_id) values ('CLAYSON CAITANO DA SILVA','482.698.028-08','RUA DOMENIQUE DANESE',2);

select * from funcionario;

create table telefone(
id int primary key not null auto_increment
,descricao varchar(255) not null
,telefone char(14) not null unique
,ativo char(1) not null default 'S'
,data_cadastro datetime not null default current_timestamp
,funcionario_id int not null
,constraint fk_telefone_funcionario foreign key (funcionario_id) references funcionario (id)
,constraint telefone_ativo_deve_ser_S_ou_N check (ativo in ('S', 'N'))
);

select * from telefone;

create table caixa(
id int primary key not null auto_increment
,data_cadastro datetime not null default current_timestamp
,ativo char(1) not null default 'S'
,saldo decimal(9,2) not null
,funcionario_id int not null
,constraint fk_caixa_funcionario foreign key (funcionario_id) references funcionario (id)
,constraint caixa_ativo_deve_ser_S_ou_N check (ativo in ('S', 'N'))
);

select * from caixa;

create table itemcaixa(
id int primary key not null auto_increment
,descricao varchar(255)
,valor decimal(9,2) not null
,natureza varchar(45) not null
,hora datetime not null default current_timestamp
,caixa_id int not null
,constraint fk_itemcaixa_caixa foreign key (caixa_id) references caixa (id)
);

select * from itemcaixa;

create table produto(
id int primary key not null auto_increment
,nome varchar(200) not null
,descricao varchar(255) not null
,preco decimal(9,2) not null
,estoque int not null
,ativo char(1) not null default 'S'
,data_cadastro datetime not null default current_timestamp
,constraint produto_ativo_deve_ser_S_ou_N check (ativo in ('S', 'N'))
);

select * from produto;

create table categoria(
id int primary key not null auto_increment
,nome varchar(200) not null
,descricao varchar(255) not null
,ativo char(1) not null default 'S'
,data_cadastro datetime not null default current_timestamp
,constraint categoria_ativo_deve_ser_S_ou_N check (ativo in ('S', 'N'))
);

select * from categoria;

create table produtocategoria(
produto_id int not null
,categoria_id int not null
,ativo char(1) not null default 'S'
,data_cadastro datetime not null default current_timestamp
,constraint fk_produtocategoria_produto foreign key (produto_id) references produto (id)
,constraint fk_produtocategoria_categoria foreign key (categoria_id) references categoria (id)
,constraint produtocategoria_ativo_deve_ser_S_ou_N check (ativo in ('S', 'N'))
);

select * from produtocategoria;

create table tipo(
id int primary key not null auto_increment
,nome varchar(200) not null
,descricao varchar(255) not null
,ativo char(1) not null default 'S'
,data_cadastro datetime not null default current_timestamp
,constraint tipo_ativo_deve_ser_S_ou_N check (ativo in ('S', 'N'))
);

select * from tipo;

create table produtotipo(
produto_id int not null
,tipo_id int not null
,ativo char(1) not null default 'S'
,data_cadastro datetime not null default current_timestamp
,constraint fk_produtotipo_produto foreign key (produto_id) references produto (id)
,constraint fk_produtotipo_tipo foreign key (tipo_id) references tipo (id)
,constraint produtotipo_ativo_deve_ser_S_ou_N check (ativo in ('S', 'N'))
);

select * from produtotipo;

create table cliente(
id int primary key not null auto_increment
,nome varchar(200) not null
,CPF_CNPJ varchar(18) not null unique
,telefone varchar(14) not null
,contato varchar(100)
,ativo char(1) not null default 'S'
,data_cadastro datetime not null default current_timestamp
,cidade_id int not null
,constraint fk_cliente_cidade foreign key (cidade_id) references cidade (id)
,constraint cliente_ativo_deve_ser_S_ou_N check (ativo in ('S', 'N'))
);

select * from cliente;

create table venda(
id int primary key not null auto_increment
,desconto decimal(9,2)
,total decimal(9,2) not null
,ativo char(1) not null default 'S'
,data_cadastro datetime not null default current_timestamp
,cliente_id int not null
,constraint fk_venda_cliente foreign key (cliente_id) references cliente (id)
,constraint venda_ativo_deve_ser_S_ou_N check (ativo in ('S', 'N'))
);

select * from venda;

create table recebimento(
id int primary key not null auto_increment
,ativo char(1) not null default 'S'
,valor decimal(9,2) not null
,numero_parcela int not null
,desconto decimal(9,2)
,juros decimal(9,2)
,total_final decimal(9,2) not null
,data_cadastro datetime not null default current_timestamp
,venda_id int not null
,itemcaixa_id int not null
,constraint fk_recebimento_venda foreign key (venda_id) references venda (id)
,constraint fk_recebimento_itemcaixa foreign key (itemcaixa_id) references itemcaixa (id)
,constraint recebimento_ativo_deve_ser_S_ou_N check (ativo in ('S', 'N'))
);

select * from recebimento;

create table itemvenda(
venda_id int not null
,produto_id int not null
,quantidade int not null
,preco decimal(9,2) not null
,ativo char(1) not null default 'S'
,data_cadastro datetime not null default current_timestamp
,constraint fk_itemvenda_venda foreign key (venda_id) references venda (id)
,constraint fk_itemvenda_produto foreign key (produto_id) references produto (id)
,constraint itemvenda_ativo_deve_ser_S_ou_N check (ativo in ('S', 'N'))
);

select * from itemvenda;

create table fornecedor(
id int primary key not null auto_increment
,nome varchar(200) not null
,CNPJ char(18) not null unique
,telefone char(14) not null
,contato varchar(45)
,ativo char(1) not null default 'S'
,data_cadastro datetime not null default current_timestamp
,cidade_id int not null
,constraint fk_fornecedor_cidade foreign key (cidade_id) references cidade (id)
,constraint fornecedor_ativo_deve_ser_S_ou_N check (ativo in ('S', 'N'))
);

select * from fornecedor;

create table compra(
id int primary key not null auto_increment
,desconto decimal(9,2)
,total decimal(9,2) not null
,ativo char(1) not null default 'S'
,data_cadastro datetime not null default current_timestamp
,fornecedor_id int not null
,constraint fk_compra_forncedor foreign key (fornecedor_id) references fornecedor (id)
,constraint compra_ativo_deve_ser_S_ou_N check (ativo in ('S', 'N'))
);

select * from compra;

create table pagamento(
id int primary key not null auto_increment
,ativo char(1) not null default 'S'
,valor decimal(9,2) not null
,numero_parcela int not null
,desconto decimal(9,2)
,juros decimal(9,2)
,total_final decimal(9,2) not null
,data_cadastro datetime not null default current_timestamp
,compra_id int not null
,itemcaixa_id int not null
,constraint pk_pagamento_compra foreign key (compra_id) references compra (id)
,constraint pk_pagamento_itemcaixa foreign key (itemcaixa_id) references itemcaixa (id)
,constraint pagamento_ativo_deve_ser_S_ou_N check (ativo in ('S', 'N'))
);

select * from pagamento;

create table itemcompra(
compra_id int not null
,produto_id int not null
,quantidade int not null
,preco decimal(9,2) not null
,ativo char(1) not null default 'S'
,data_cadastro datetime not null default current_timestamp
,constraint fk_itemcompra_compra foreign key (compra_id) references compra (id)
,constraint fk_itemcompra_produto foreign key (produto_id) references produto (id)
,constraint itemcompra_ativo_deve_ser_S_ou_N check (ativo in ('S', 'N'))
);

select * from itemcompra;
