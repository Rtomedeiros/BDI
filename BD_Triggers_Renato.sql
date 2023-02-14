/* Triggers

"gatilho"

- Associado a uma tabela
- Procedimento invocado quando um comando DML é executado

Usos do trigger:
- Verificação de integridade dos dados
- Validação dos dados
- Rastreamento e registro de logs de atividades nas tabelas
- Arquivamento de registros excluídos

- Um Trigger é associado a uma tabela
- Armazenado no BD como um arquivo separado.
- Não são chamados diretamente, são invocados automaticamente

SINTAXE dos Triggers:

CREATE TRIGGER nome timing operação
ON tabela
FOR EACH ROW
declarações

timing = BEFORE | AFTER
operação = INSERT | UPDATE | DELETE */

create database loja
default charset utf8
default collate utf8_general_ci;
use loja;

CREATE TABLE produto (
idProduto INT NOT NULL AUTO_INCREMENT,
Nome_produto VARCHAR(45) NULL,
Preco_Normal DECIMAL(10,2) NULL,
Preco_Desconto DECIMAL(10,2) NULL,
PRIMARY KEY (idProduto));

-- Criando o Trigger:
CREATE TRIGGER tr_desconto BEFORE INSERT
ON produto
FOR EACH ROW
SET NEW.Preco_Desconto = (NEW.Preco_Normal * 0.90);

INSERT INTO produto (Nome_produto, Preco_Normal)
VALUES ('Monitor', 350.00);
INSERT INTO produto (Nome_produto, Preco_Normal)
VALUES ('DVD', 1.00), ('Pendrive', 18.00);

SELECT * FROM produto;


