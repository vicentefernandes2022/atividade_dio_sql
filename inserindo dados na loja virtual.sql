use loja_virtual;
show tables;

insert into cliente (nome, sobrenome, CPF, endereço)
		values('Maria','Silva',12346789,'rua silva de prata 29, Carangola - cidade das flores'),
			  ('Mateus','Pimentel',987654321,'rua alameda 289 -centro - cidade das flores'),
			  ('Ricardo','Silva',456789123,'avenida alameda vinha 1079, centro - cidade das flores'),
			  ('Julia','França',789123456,'Rua laranjeiras 861, centro - cidade das flores'),
			  ('Roberta','Assis',978456254,'avenida Koller 19, centro - cidade das flores'),
			  ('Isabela','Cruz',654789123,'rua alameda das flores 2078, centro - cidade das flores');
              
select * from cliente;


insert into fornecedor (razãoSocial, CNPJ, contact, endereço) values
						('Almeida e filhos', 123456789123456, '21985474', 'Rua das ovelhas, 159, centro, Fortaleza'),
                        ('Eletrônicos Silva', 854519649143457, '21985484', 'Rua Aracati, 848, aldeota, Fortaleza'),
                        ('Eletronicos Valma', 985542222663351, '21544552', 'Rua jose de alencar, 841, centro, Aracati');

select * from fornecedor;

insert into produto (descriçãoProduto, tipo, informações_adicionais) values
						('Fone de ouvido','Eletrônico',null),
                        ('Barbie Elsa','Brinquedos',null),
                        ('Boby Carters','Vestimenta',null),
                        ('Microfone Vedo - Youtuber','Eletrônico','cor azul'),
                        ('Sofa retratil','Móveis','3x57x80'),
                        ('Farinha de arroz','Alimentos',null),
                        ('Fire stick amazon','Eletrônico',null);

select * from produto;

desc venda;

insert into venda (idVendaCliente, vendaStatus, confirmaçãoPagamento) values
						(1, default, default),
                        (2, default,default),
                        (3, 'Confirmado',default),
                        (4, default,default);



alter table venda auto_increment = 1;

select * from venda;

insert into produtoVenda (idProduto, idVenda, quantidade, valor, statusProduto) values
							(1, 1, 2, 50, default),
                            (2, 1, 1, 605.99, default),
                            (3, 2, 4, 151, default);
                            
select * from produtoVenda;

                     
insert into produtoEstoque (idProduto_estoque, idfornecedor_estoque, quantidade, valor) values
							(1, 2, 50, 30.50),
                            (2, 3, 100, 5.83);
                            
                            
                            
select * from produtoEstoque;
                    
desc pagamento;

                    
insert into pagamento values
					(1,2,'Boleto',default,100),
                    (2,3,'Cartão de credito','Aprovado',200);
   
select * from pagamento;
   
select count(*) from cliente;

select * from cliente c, venda o where c.idCliente = idVendaCliente;

select nome, sobrenome, idVenda, vendaStatus from cliente c, venda o where c.idCliente = idVendaCliente;

select concat(nome,' ', sobrenome) as Cliente, idVenda as Pedido, vendaStatus as Situação from cliente c, venda o where c.idCliente = idVendaCliente;

insert into venda (idVendaCliente, vendaStatus, confirmaçãoPagamento) values
						(1, default,default);
                        
select * from venda;

-- recuperação de pedido com produto associado
select * from cliente c
					inner join venda o on c.idCliente = o.idVendaCliente
					inner join produtoVenda p on p.idVenda = o.idvenda
				group by idCliente;

-- consultar quantidade de pedidos realizado pelos clientes
select idCliente, concat(nome,' ',sobrenome) as Nome, count(*) as Quantidade_de_pedidos from cliente c inner join venda o on c.idCliente = o.idVendaCliente
					inner join produtoVenda p on p.idVenda = o.idVenda
                    group by idCliente;