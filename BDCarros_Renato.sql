#Criando o BD "BDCarros"
create database bdcarros
default charset utf8
default collate utf8_general_ci;
use bdcarros;

#Criando as tabelas do BDCarros (cliente, vendedor, veículo, pedido)
create table cliente(
cpf int not null,				#cpf do cliente (primary key)
nome varchar(30) not null,		#nome do cliente
ender varchar(30) not null,		#endereço do cliente
idade int(2),					#idade do cliente
primary key(cpf)				#definindo a primary key da tabela cliente
);

create table vendedor(
id_func int not null,			#id do vendedor (primary key)
nome varchar(30) not null,		#nome do vendedor
ender varchar(30) not null,		#endereço do vendedor
idade int(2),					#idade do vendedor
primary key(id_func)			#definindo a primary key da tabela vendedor
);

create table veiculo(
renavam int not null,			#renavam do veículo (primary key)
nome varchar(30) not null,		#nome do veículo
marca varchar(30) not null,		#marca do veículo
ano int(4),						#ano do veículo
primary key(renavam)			#definindo a primary key da tabela veículo
);

create table pedido(
codigo int not null,			#código do pedido (primary key)
cpf_cliente int not null,		#cpf do cliente relacionado ao pedido (FK)
id_func_vendedor int not null,	#id do vendedor relacionado ao pedido (FK)
renavam_veiculo int not null,	#renavam do veículo relacionado ao pedido (FK)
primary key(codigo),			#definindo a primary key da tabela pedido

#definindo a foreign key da tabela cliente
index fk_pedido_cliente_idx(cpf_cliente),
constraint fk_pedido_cliente 
foreign key(cpf_cliente) 
references cliente(cpf),

#definindo a foreign key da tabela vendedor
index fk_pedido_vendedor_idx(id_func_vendedor),
constraint fk_pedido_vendedor 
foreign key(id_func_vendedor) 
references vendedor(id_func),

#definindo a foreign key da tabela veículo
index fk_pedido_veiculo_idx(renavam_veiculo),
constraint fk_pedido_veiculo 
foreign key(renavam_veiculo) 
references veiculo(renavam)
);

#Inserindo dados nas tabelas (cliente, vendedor, veículo, pedido)
insert into cliente values ('12345', 'João da Silva', 'Rua A 101', '40');
insert into cliente values ('98795', 'Renato Mendez', 'Rua B 1000', '30');
insert into cliente values ('99988', 'Maria Antonieta', 'Rua A 1', '19');
insert into cliente values ('54312', 'Juca Baleia', 'Rua X 90', '25');
insert into cliente values ('10101', 'João Tota', 'Rua X 92', '80');

insert into vendedor values ('3', 'Paulo Costa', 'Rua X 98', '22');
insert into vendedor values ('41', 'José Silveira', 'Rua A 8', '31');
insert into vendedor values ('9', 'Zeca Freitas', 'Rua B 1010', '47');
insert into vendedor values ('18', 'Fernanda Medeiros', 'Rua D 2100', '28');
insert into vendedor values ('55', 'Maria Lima', 'Rua X 80', '32');

insert into veiculo values ('10000', 'Palio', 'Fiat', '2010');
insert into veiculo values ('22233', 'Uno', 'Fiat', '2014');
insert into veiculo values ('98778', 'Gol', 'Volkswagen', '2020');
insert into veiculo values ('40370', 'Civic', 'Honda', '2020');
insert into veiculo values ('20202', 'Gol', 'Volkswagen', '2017');

insert into pedido values ('1', '12345', '9', '22233');
insert into pedido values ('2', '54312', '3', '20202');
insert into pedido values ('3', '10101', '9', '40370');
insert into pedido values ('4', '99988', '55', '10000');
insert into pedido values ('5', '10101', '18', '98778');

#Questões usando os comandos em SQL:
#1)Consultar a quantidade de carros comprados agrupados pelas marcas.
select count(nome), marca from veiculo group by marca;

#2)Consultar o nome e a idade dos clientes pela idade de forma crescente.
select nome, idade from cliente order by idade;

#3)Consultar o nome e a idade dos clientes pela idade de forma decrescente.
select nome, idade from cliente order by idade desc;

#4)Consultar o ano do carro mais antigo vendido.
select min(ano) from veiculo;

#5)Consultar a idade do vendedor mais velho.
select max(idade) from vendedor;

#6)Consultar o id, o nome e o endereço dos vendedores com id 3, 9 e 55.
select id_func, nome, ender from vendedor where id_func in (3, 9, 55);

#7)Consulta que faz a soma da idade dos clientes que tem idade entre 20 e 35 anos 
#e mostra a quantidade de clientes que estão nesta faixa de idade.
select sum(idade), count(nome) from cliente where idade between 20 and 35;

#8)Consulta que mostra o nome e a idade dos clientes que moram na Rua X.
select nome, idade from cliente where ender like 'Rua X%';

#9)Consulta que mostra a média de idade dos clientes que moram na Rua X.
select avg(idade) from cliente where ender like 'Rua X%';

#10)Consulta que mostra a média do ano dos carros, das marcas Fiat e Volkswagen.
select avg(ano) from veiculo where marca in ('Fiat', 'Volkswagen');

#11)Consulta que mostra a relação entre os dados: o codigo do pedido, nome do cliente e o nome do vendedor
#e os dados de indentificação (nome, marca e ano) do veículo.
select pedido.codigo as 'pedido', cliente.nome as 'cliente', vendedor.nome as 'vendedor', veiculo.nome as 'veículo', veiculo.marca as 'marca', veiculo.ano as 'ano'
from pedido
join cliente on cliente.cpf=pedido.cpf_cliente 
join vendedor on vendedor.id_func=pedido.id_func_vendedor 
join veiculo on  veiculo.renavam=pedido.renavam_veiculo;

#12)Consulta que mostra a relação entre os dados: o nome, o cpf do cliente,
#e o nome, o ano e o renavam do veículo, filtrando apenas os veículos da marca Honda.
select cliente.nome as 'cliente', cliente.cpf as 'cpf', veiculo.nome as 'veículo', veiculo.ano as 'ano', veiculo.renavam as 'renavam' 
from pedido
join cliente on cliente.cpf=pedido.cpf_cliente 
join veiculo on  veiculo.renavam=pedido.renavam_veiculo
where veiculo.marca = 'Honda';

