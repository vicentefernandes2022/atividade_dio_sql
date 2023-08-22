-- drop database loja_virtual;
create database loja_virtual;
use loja_virtual;

create table cliente(
		idCliente int auto_increment primary key,
        nome varchar(10),
        sobrenome varchar(20),
        CPF char(11) not null,
        endereço varchar(60),
        dataNascimento date,
        constraint unique_cpf_cliente unique (CPF)
);

alter table cliente auto_increment = 1;

desc cliente;

create table produto(
		idProduto int auto_increment primary key,
        descriçãoProduto varchar(30) not null,
        tipo enum('Eletronico','Vestimenta','Brinquedos','Alimentos','Moveis') not null,
        informações_adicionais varchar(255)
);

alter table produto auto_increment = 1;


create table venda(
	idVenda int auto_increment primary key,
    idVendaCliente int,
    vendaStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    confirmaçãoPagamento bool default false,
    constraint fk_venda_cliente foreign key (idVendaCliente) references cliente(idCliente)
			on update cascade
);

alter table venda auto_increment = 1;

desc venda;


create table pagamento(
	idCliente int,
    idPagamento int,
    tipoPagamento enum('Boleto','Cartão de credito','Pix'),
    statusPagamento enum('Aprovado','Pendente','Reprovado') default 'Pendente',
    valorPago float,
    primary key (idCliente, idPagamento),
    constraint fk_pagamento_venda foreign key (idPagamento) references venda(idVenda)
);


create table fornecedor(
	idFornecedor int auto_increment primary key,
    razãoSocial varchar(255) not null,
    CNPJ char(15) not null,
    Contact char(11) not null,
    endereço varchar(255) not null,
    constraint unique_supplier unique (CNPJ)
);

alter table fornecedor auto_increment = 1;

desc fornecedor;


create table produtoEstoque(
	idProduto_estoque int,
    idFornecedor_estoque int,
    quantidade int default 0,
    valor int default 0,
    constraint fk_estoque_produto foreign key (idProduto_estoque) references produto(idProduto),
    constraint fk_estoque_fornecedor foreign key (idFornecedor_estoque) references fornecedor(idFornecedor)
);


create table produtoVenda(
	idproduto int,
    idVenda int,
    quantidade int default 1,
    valor float default 0,
    statusProduto enum('Disponível','Sem estoque') default 'Disponível',
    primary key (idProduto, idVenda),
    constraint fk_produto_venda_produto foreign key (idProduto) references produto(idProduto),
    constraint fk_produto_venda foreign key (idvenda) references venda(idVenda)
);

show tables;

show databases;

use information_schema;
show tables;
desc REFERENTIAL_CONSTRAINTS;
select * from REFERENTIAL_CONSTRAINTS where constraint_schema = 'loja_virtual';

use loja_virtual;
select * from cliente;
desc cliente;
