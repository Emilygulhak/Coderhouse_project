/* apresentar o script de criação de 2 funções armazenadas com base 
nos dados do banco de dados do projeto final. */

-- Primeira Função vai calcular a soma de todas as contas juntas no meu banco de dados
-- Foi preciso acrescentar o de DELIMITER PARA FUNCIONAR E NÃO DAR ERRO
DELIMITER $$

CREATE FUNCTION saldo_total()
RETURNS DECIMAL(15, 2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(15, 2) DEFAULT 0;
    
    -- Soma os saldos de todas as contas bancárias
    SELECT IFNULL(SUM(saldo), 0) INTO total FROM conta;
    
    RETURN total;
END$$

DELIMITER ;

/* Como o saldo não ficou formatado dentro do select adicionei a função FORMAT que vai
formartar os números com casas decimais.
*/
SELECT FORMAT(saldo_total(), 2) AS saldo_Reais;
-- o AS vai nomear minha coluna.


-- Segunda Função vai calcular o juros dos usuários com emprestimo aprovado
DELIMITER $$

CREATE FUNCTION calcula_parcela_emprestimo(
    valor_emprestimo DECIMAL(15, 2), 
    taxa_juros DECIMAL(5, 2), 
    num_parcelas INT
)
RETURNS DECIMAL(15, 2)
DETERMINISTIC
BEGIN
    DECLARE parcela DECIMAL(15, 2);
    DECLARE taxa_mensal DECIMAL(10, 6);

    -- Converte a taxa de juros para porcentagem mensal (dividido por 100)
    SET taxa_mensal = taxa_juros / 100;

    -- Calcula o valor da parcela com base na fórmula do sistema Price
    SET parcela = valor_emprestimo * (taxa_mensal * POWER(1 + taxa_mensal, num_parcelas)) / (POWER(1 + taxa_mensal, num_parcelas) - 1);

    RETURN parcela;
END$$

DELIMITER ;

-- vou pegar informações de um usuario criado no banco.
-- id 1 valor contratado 6000 em 12 parcelas
-- 5% de juros
SELECT calcula_parcela_emprestimo(6000, 6, 12) AS valor_parcela;

-- será pago 715.66 em cada parcela
