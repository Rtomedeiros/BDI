CREATE DATABASE `aniversarios`;

USE aniversarios;

CREATE TABLE torneios (
nome varchar(30),
vitorias real,
melhor real,
tamanho real
);

INSERT INTO torneios (nome, vitorias, melhor, tamanho)
VALUES ('Dolly', '7', '245', '8.5'),
('Etta', '4', '283', '9'),
('Irma', '9', '266', '7'),
('Barbara', '2', '197', '7.5'),
('Gladys', '13', '273', '8');

CREATE TABLE refeicoes (
nome varchar(30),
data_nascimento date,
entrada varchar(30),
acompanhamento varchar(30),
sobremesa varchar(30)
);

INSERT INTO refeicoes (nome, data_nascimento, entrada, acompanhamento, sobremesa)
VALUES ('Dolly', '1946-01-19', 'steak', 'salad', 'cake'),
('Etta', '1938-01-25', 'chicken', 'fries', 'ice cream'),
('Irma', '1941-02-18', 'tofu', 'fries', 'cake'),
('Barbara', '1948-12-25', 'tofu', 'salad', 'ice cream'),
('Gladys', '1944-05-28', 'steak', 'fries', 'ice cream');

SELECT nome FROM refeicoes;

SELECT nome, data_nascimento FROM refeicoes;

SELECT * FROM torneios;
SELECT * FROM refeicoes;

SELECT tamanho FROM torneios WHERE nome = 'Irma';

SELECT entrada FROM refeicoes WHERE entrada LIKE 't%';

SELECT nome AS n, data_nascimento AS d, sobremesa AS s FROM refeicoes;

SELECT COUNT(entrada) FROM refeicoes WHERE entrada = 'tofu';

SELECT AVG(melhor) FROM torneios;

SELECT SUM(vitorias) FROM torneios;

SELECT SUM(entrada) FROM refeicoes;

SELECT MIN(vitorias) FROM torneios;

SELECT MAX(vitorias) FROM torneios;

SELECT MIN(nome) FROM refeicoes;

SELECT MAX(nome) FROM refeicoes;

SELECT COUNT(nome), entrada FROM refeicoes GROUP BY entrada;

SELECT nome, data_nascimento FROM refeicoes ORDER BY data_nascimento;

SELECT nome, data_nascimento FROM refeicoes ORDER BY data_nascimento DESC;

describe torneios;

describe refeicoes;

drop database aniversarios;



