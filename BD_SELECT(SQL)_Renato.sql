#Criando o BD formula1
create database formula1
default charset utf8
default collate utf8_general_ci;
use formula1;

#Criando duas tabelas (piloto e carro)
create table piloto(
id_pil int not null,		#código do piloto (primary key)
nome_pil varchar(40),		#nome do piloto
nacio_pil varchar(20),		#nacionalidade do piloto
nascim_pil date,			#data de nascimento do piloto
qtde_tit_pil int,			#quantidade de títulos do piloto na F1
qtde_vit_pil int,			#quantidade de vitórias do piloto na F1
primary key(id_pil)
);

create table carro(
id_car int not null,		#código do carro (primary key)
nome_car varchar(40),		#nome do carro
marca_car varchar(20),		#marca do carro
ano_car int,				#ano do carro
tipo_motor_car varchar(20),	#tipo de motor do carro
potencia_car int,			#potência do carro (HP)
id_pil int not null,		#código do piloto que dirigiu o carro (foreign key)
primary key(id_car),
index fk_carro_piloto_idx(id_pil),
constraint fk_carro_piloto foreign key(id_pil) references piloto(id_pil)
);

#Colocando dados nas tabelas piloto e carro
insert into piloto values ('1', 'Ayrton Senna', 'Brasil', '1960-03-21', '3', '41');
insert into piloto values ('2', 'Lewis Hamilton', 'Reino Unido', '1985-01-07', '7', '95');
insert into piloto values ('3', 'Rubens Barrichello', 'Brasil', '1972-05-23', null, '11');
insert into piloto values ('4', 'Nelson Piquet', 'Brasil', '1952-08-17', '3', '23');
insert into piloto values ('5', 'Fernando Alonso', 'Espanha', '1981-07-29', '2', '32');
insert into piloto values ('6', 'Sebastian Vettel', 'Alemanha', '1987-07-03', '4', '53');
insert into piloto values ('7', 'Emerson Fittipaldi', 'Brasil', '1946-12-12', '2', '14');
insert into piloto values ('8', 'Niki Lauda', 'Áustria', '1949-02-22', '3','25');

insert into carro values ('1', 'McLaren MP4/4', 'McLaren', '1988', 'V6 Turbo', '670', '1');
insert into carro values ('2', 'Lotus 98T', 'Lotus', '1986', 'V6 Turbo', '900', '1');
insert into carro values ('3', 'McLaren MP4/6', 'McLaren', '1991', 'V12 Aspirado', '760', '1');
insert into carro values ('4', 'Brawn BGP 001', 'Brawn GP', '2009', 'V8 Aspirado', '750', '3');
insert into carro values ('5', 'Ferrari F2004', 'Ferrari', '2004', 'V10 Aspirado', '865', '3');
insert into carro values ('6', 'Mercedes-AMG F1 W11 EQ Performance', 'Mercedes', '2020', 'V6 Turbo', '950', '2');
insert into carro values ('7', 'Renault R26', 'Renault', '2006', 'V8 Aspirado', '775', '5');
insert into carro values ('8', 'Infiniti Red Bull RB9 Renault', 'Red Bull', '2013', 'V8 Aspirado', '750', '6');

#1-Mostrando a estrutura das tabelas 
describe piloto;

describe carro;

#2-Consulta que mostra as tabelas completas de piloto e carro:
select * from piloto;

select * from carro;

#3-Consulta que mostra o nome, a nacionalidade e a quantidade de vitorias do Ayrton Senna:
select nome_pil, nacio_pil, qtde_vit_pil from piloto where nome_pil = 'Ayrton Senna';

#4-Consulta que mostra o nome e a data de nascimento dos pilotos que começam com a letra n, colocar o label do nome como piloto, e o label da data de nascimento como nascimento:
select nome_pil as piloto, nascim_pil as nascimento from piloto where nome_pil like 'n%';

#5-Consulta que mostra o nome do piloto e a sua quantidade de vitórias em corridas, que não tem titulos na F1, colocar o label do nome como piloto e a quantidade de vitórias como vitórias:
select nome_pil as piloto, qtde_vit_pil as vitórias from piloto where qtde_tit_pil is null;

#6-Consulta que mostra o nome do piloto e a quantidade de títulos na F1, dos pilotos que tem titulos na F1,
#colocar o label do nome como piloto e a quantidade de títulos como títulos e ordenar o nome deles em ordem crescente:
select nome_pil as piloto, qtde_tit_pil as títulos from piloto where qtde_tit_pil is not null
order by nome_pil asc;

#7-Consulta igual a anterior, porem ordenando pelos títulos de forma decrescente:
select nome_pil as piloto, qtde_tit_pil as títulos from piloto where qtde_tit_pil is not null
order by qtde_tit_pil desc;

#8-Consulta que mostra o nome, a marca e o ano dos carros com potencia maior que 750 HP,
#colocar label respectivamente como carro, marca, ano
#e ordenar pelo ano do carro em ordem crescente:
select nome_car as carro, marca_car as marca, ano_car as ano from carro where potencia_car > '750'
order by ano_car asc;

#9-Consulta que mostra o id, o nome, e a quantidade de títulos dos pilotos nascidos na década de 1980:
#colocar label respectivamente como código, piloto, títulos:
select id_pil as código, nome_pil as piloto, qtde_tit_pil as títulos from piloto where nascim_pil like '198%';

#10-Consulta que mostra o nome, tipo do motor e a potência dos carros com potência entre 600 HP e 800 HP, e os motores são turbo
#colocar label respectivamente como nome, tipo do motor e potência:
select nome_car as 'nome', tipo_motor_car as 'tipo do motor', potencia_car as 'potência' from carro
where potencia_car between 600 and 800
and tipo_motor_car like '%turbo%';

#11-Consulta que mostra nome, a marca e o ano dos carros do piloto com código 3:
select nome_car, marca_car, ano_car from carro where id_pil = '3';

#12-Consulta igual a anterior, porem que tenha motor V8 Aspirado:
select nome_car, marca_car, ano_car from carro where id_pil = '3' and tipo_motor_car in ('v8 aspirado');

