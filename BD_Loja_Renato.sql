create database loja
default charset utf8
default collate utf8_general_ci;
use loja;

create table classe(
cod_cla int not null,
nome_cla varchar(45) not null,
primary key(cod_cla)
);

create table produto(
cod_pro int not null,
desc_pro varchar(45) not null,
valor_pro double not null,
qtde_pro int not null,
cod_cla int not null,
primary key(cod_pro),
index fk_produto_classe1_idx
(cod_cla),
constraint fk_produto_classe1
foreign key(cod_cla)
references classe(cod_cla)
);

create table cidade(
cod_cid int not null,
nome_cid varchar(45) not null,
sigla_uf varchar(2) not null,
primary key(cod_cid)
);

create table cliente(
cod_cli int not null,
nome_cli varchar(45) not null,
data_nas date not null,
nm_logr varchar(100) not null,
nr_logr int not null,
nm_bairro varchar(45) not null,
nr_cep int not null,
cod_cid int not null,
primary key(cod_cli),
index fk_cliente_cidade1_idx
(cod_cid),
constraint fk_cliente_cidade1
foreign key(cod_cid)
references cidade(cod_cid)
);

create table venda(
cod_ven int not null,
data_ven date not null,
valor_ven double not null,
cod_cli int not null,
primary key(cod_ven),
index fk_venda_cliente1_idx
(cod_cli),
constraint fk_venda_cliente1
foreign key(cod_cli)
references cliente(cod_cli)
);

create table parcela(
cod_ven int not null,
cod_par int not null,
data_vcto date not null,
valor_par double not null,
data_pagto date,
valor_pago double,
primary key(cod_ven, cod_par),
index fk_parcela_venda_idx
(cod_ven),
constraint fk_parcela_venda
foreign key(cod_ven)
references venda(cod_ven)
);

create table produto_vendido(
cod_ven int not null,
cod_pro int not null,
qt_ven int not null,
primary key(cod_ven, cod_pro),
index fk_produtovendido_venda1_idx
(cod_ven),
index fk_produtovendido_produto1_idx
(cod_pro),
constraint fk_produtovendido_venda1
foreign key(cod_ven)
references venda(cod_ven),
constraint fk_produtovendido_produto1
foreign key(cod_pro)
references produto(cod_pro)
);

insert into classe
(cod_cla, nome_cla)
values
('1','Alimento seco');
insert into classe values ('2','Alimento conserva');
insert into classe values ('3','frios');
insert into classe values ('4','bebidas');
insert into classe values ('5','limpeza');

insert into produto values ('1','Coca Cola', '5.0', '100.0', '4');
insert into produto values ('2','Presunto Perdigão', '30.0', '50.0', '3');
insert into produto values ('3','Arroz Top', '15.0', '80.0', '1');
insert into produto values ('4','Extrato Tomate Pomarola', '8.0', '200.0', '2');
insert into produto values ('5','Detergente Ipê', '4.0', '30.0', '5');

insert into cidade values ('1', 'Ituiutaba', 'MG');
insert into cidade values ('2', 'Uberlândia', 'MG');
insert into cidade values ('3', 'Santa Vitória', 'MG');
insert into cidade values ('4', 'São Simão', 'GO');
insert into cidade values ('5', 'Capinópolis', 'MG');

insert into cliente values ('1', 'José da Silva', '1980-12-31', 'Rua Trinta', '71', 'Progresso', '3000000', '1');
insert into cliente values ('2', 'Renato Mendes', '1979-03-13', 'Avenida Barreira', '122', 'Sambão', '9876543', '2');
insert into cliente values ('3', 'Tião Toscano', '1999-08-21', 'Avenida Doze', '44', 'Bandeirantes', '1234567', '5');
insert into cliente values ('4', 'Maria Jurema', '2007-02-02', 'Rua Sete', '1001', 'Independência', '7654321', '4');
insert into cliente values ('5', 'João Abrão', '1968-07-05', 'Avenida São Luiz', '3344', 'Nova Cidade', '8800044', '4');

insert into venda values ('1', '2020-08-13', '100.0', '5');
insert into venda values ('2', '2020-09-21', '18.4', '5');
insert into venda values ('3', '2020-09-22', '200.8', '1');
insert into venda values ('4', '2021-01-04', '1000.77', '2');
insert into venda values ('5', '2021-02-18', '45.12', '3');

insert into parcela values ('4', '1', '2021-09-04', '150.30', '2021-02-04', '150.30');
insert into parcela values ('3', '3', '2021-01-22', '44.10', '2020-12-22', '175.18');
insert into parcela values ('1', '1', '2020-10-13', '50.0', '2020-09-13', '50.00');

insert into produto_vendido values ('1', '1', '8');
insert into produto_vendido values ('1', '2', '1');
insert into produto_vendido values ('2', '5', '2');
insert into produto_vendido values ('4', '5', '10');
insert into produto_vendido values ('3', '3', '2');

SELECT * FROM loja.classe;
SELECT * FROM loja.produto;
SELECT * FROM loja.cidade;
SELECT * FROM loja.cliente;
SELECT * FROM loja.venda;
SELECT * FROM loja.parcela;
SELECT * FROM loja.produto_vendido;