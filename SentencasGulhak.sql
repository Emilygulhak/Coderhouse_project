-- Criação de permissões e usuários 

/* Vou realizar a criação de dois usuarios */

CREATE USER 'Emily'@'localhost' IDENTIFIED  BY 'emily1_23';

CREATE USER 'Alice'@'localhost' IDENTIFIED  BY 'alice_234';

/*Vou conceder as devidas permissões aos dois usuários criados

Critéiro do Primerio usuário deverá ter permissões apenas de leitura sobre todas as tabelas.
Critério do Segundo usuario  deverá ter permissões de Leitura, Inserção e Modificação de Dados.

obs: Nenhum deles poderá eliminar registros das tabelas.
*/

-- Primeiro usuario será concedido as permissões apenas de leitura de todas as tabelas
GRANT SELECT ON bankcoderhouse.* TO 'Emily'@'localhost';
-- verifiquei que possui a possibilidade de colocar bankcoderhouse.(algumatabela), bankcoderhouse.* dando permissão ao banco inteiro

-- o select dará somente essa permissão ao meu usuario Emily.

-- Segundo usuario será concedido as permissões Leitura, Inserção e Modificação de Dados.
-- SELECT (LEITURA), INSERÇÃO (INSERT) E MODIFICAÇÃO VOU ACRESCENTAR (UPDATE, CREATE)
 GRANT SELECT, INSERT, UPDATE, CREATE ON bankcoderhouse.* TO 'Alice'@'localhost';

