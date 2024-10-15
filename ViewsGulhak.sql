-- CRIAÇÃO DE VIEWS 


/* 1. Crie uma view que retorne nome, agencia, conta e estado dos usuários com saldo maior que 3 mil */

CREATE VIEW vw_informação_Saldo AS
SELECT u.nome AS Nome, 
c.agencia AS Agência,
c.saldo AS Saldo, 
c.nroconta AS Número_Conta, 
e.estado AS Estado FROM usuario u INNER JOIN conta c ON u.id_usuario = c.conta_usuario
INNER JOIN endereco e ON u.usuario_endereco = e.id_endereco
WHERE saldo > 3000;

SELECT * FROM vw_informação_Saldo;

/*2.Crie um view que retorno nome e cpf de usuários que tem emprestimo aprovado */

CREATE VIEW vw_informacao_emprestimo AS 
SELECT u.nome AS Nome,
u.cpf AS CPF FROM usuario u INNER JOIN conta c ON u.id_usuario = c.conta_usuario
INNER JOIN emprestimo e ON e.id_emprestimo = c.conta_emprestimo
WHERE status_aprovacao = 1;

SELECT * FROM vw_informacao_emprestimo;

/*3. Criar uma view somente de usuarios que morem no Rio de Janeiro, que retornem as informações nome, saldo e estado */
CREATE VIEW vw_usuarios_regiao AS 
SELECT u.nome AS Nome, 
c.saldo AS Saldo, 
e.estado  AS Estado FROM usuario u INNER JOIN endereco e ON u.usuario_endereco = e.id_endereco
INNER JOIN conta c ON u.id_usuario = c.conta_usuario
WHERE estado = 'Rio de Janeiro';

SELECT * FROM vw_usuarios_regiao;

/*4. Criar uma view que retorne agencia, conta, nome e cpf de usuários com suas idades */
CREATE VIEW vw_idade_usuarios AS 
SELECT u.nome AS Nome, 
u.cpf AS CPF, 
c.agencia AS Agênica, TIMESTAMPDIFF(year, data_nascimento,CURDATE())  AS Idade  FROM usuario u 
INNER JOIN conta c ON u.id_usuario = c.conta_usuario;

-- tive a vontade de utilizar o order by dentro da criaçao da view, porem descobri que só é possivel adicionar na consulta pois a view nao vai identificar esse comando.
SELECT * FROM vw_idade_usuarios
order by Idade;

/*5.Criar uma view que retorne somente as transações canceladas, nome do usuario e agencia */
CREATE VIEW vw_inf_cancelamentos AS 
SELECT u.nome AS Nome, 
c.agencia AS Agência, 
t.status_do_movimento AS Movimento FROM usuario u INNER JOIN conta c ON u.id_usuario = c.conta_usuario
INNER JOIN transacoes t ON t.id_transacoes = c.conta_transacoes
WHERE status_do_movimento = 'FAILED';

SELECT * FROM vw_inf_cancelamentos;
