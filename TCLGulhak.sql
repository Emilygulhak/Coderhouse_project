-- Entrega das atividades TCL

/* Na primeira tabela, se tiver registros, deverá eliminar alguns deles iniciando previamente uma transação. 
Se não tiver registros, substitua eliminação por inserção. */

-- Primeira tabela escolhida é a 'Usuario'
SELECT * FROM usuario;

-- Inicio
START TRANSACTION; 

/* Vou excluir os registros pelo id, tive que excluir nessaduas tabelas por que eles
possuem conexão por chave extrangeira */
DELETE FROM conta WHERE conta_usuario IN (1, 10, 18, 20);
DELETE FROM usuario WHERE id_usuario IN (1, 10, 18, 20);

-- Retornar
Rollback;

-- Confirmar a exclusão
Commit;


/* Na segunda tabela, insira oito novos registros, iniciando também uma transação.*/

-- Segunda tabela escolhida é Endereco
SELECT * FROM endereco;

-- Inicio
START TRANSACTION; 

-- Criação do ponto de segurança
SAVEPOINT insercao_enderecos1;

-- inserção dos primeiros 4 registros
INSERT INTO endereco (cep, logadouro, estado) VALUES ('01001-000', 'Praça da Sé', 'São Paulo' );
INSERT INTO endereco (cep, logadouro, estado) VALUES ('20010-000', 'Avenida Rio Branco', 'Rio De Janeiro');
INSERT INTO endereco (cep, logadouro, estado) VALUES ('30110-010', 'Praça Sete de Setembro', 'Minas Gerais');
INSERT INTO endereco (cep, logadouro, estado) VALUES ('40020-000', 'Avenida Sete de Setembro', 'Bahia');

SAVEPOINT insercao_enderecos2;


-- inserção de mais 4 registros
INSERT INTO endereco (cep, logadouro, estado) VALUES ('60060-110', 'Rua Senador Pompeu', 'Ceara');
INSERT INTO endereco (cep, logadouro, estado) VALUES ('70040-010', 'Esplanada dos Ministérios', 'Bahia');
INSERT INTO endereco (cep, logadouro, estado) VALUES ('80010-010', 'Rua XV de Novembro', 'Paraná');
INSERT INTO endereco (cep, logadouro, estado) VALUES ('90010-240', 'Rua dos Andradas', 'São Paulo');

-- Finalização das criações dos Rollback
RELEASE SAVEPOINT insercao_enderecos1;
RELEASE SAVEPOINT insercao_enderecos2;

Rollback;

Commit; 