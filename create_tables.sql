CREATE DATABASE BankCoderHouse;
use BankCoderHouse;

CREATE TABLE usuario 
(
id_usuario INT PRIMARY KEY NOT NULL auto_increment,
nome VARCHAR(100), 
data_nascimento DATETIME,
cpf VARCHAR(11),
email VARCHAR(255),
telefone VARCHAR(15),
usuario_endereco INT, FOREIGN KEY (usuario_endereco) REFERENCES endereco(id_endereco)
);


CREATE TABLE endereco
(
id_endereco INT PRIMARY KEY NOT NULL auto_increment,
cep VARCHAR(20),
logadouro VARCHAR(55),
estado VARCHAR(20)
);


CREATE TABLE transacoes 
(
id_transacoes INT PRIMARY KEY NOT NULL auto_increment,
data_do_movimento DATETIME,
status_do_movimento VARCHAR(10),
tipo_do_movimento VARCHAR(15),
valor_do_movimento INT 
);

CREATE TABLE emprestimo 
(
id_emprestimo INT PRIMARY KEY NOT NULL auto_increment,
status_aprovacao BOOLEAN,
valor_disponibilizado INT,
valor_contratado INT,
data_da_solicitacao DATETIME,
vencimento_do_pagamento DATETIME,
parcelas INT
);

CREATE TABLE conta 
(
id_conta INT PRIMARY KEY NOT NULL auto_increment,
agencia VARCHAR(4),
nroconta VARCHAR(8),
abertura_da_conta DATETIME,
saldo INT,
conta_transacoes INT, FOREIGN KEY (conta_transacoes) REFERENCES transacoes(id_transacoes),
conta_usuario INT, FOREIGN KEY (conta_usuario) REFERENCES usuario(id_usuario),
conta_emprestimo INT, FOREIGN KEY (conta_emprestimo) REFERENCES emprestimo(id_emprestimo)
);



SELECT * FROM conta


