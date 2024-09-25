-- TRIGGERS --

--  1 trigger é referente a tabela emprestimo, onde vai calcular juros do valor contratado automaticamente, caso tenha o valor disponibilizado por isso foi adicionado o if 

DELIMITER //

CREATE TRIGGER calcular_juros
BEFORE INSERT ON emprestimo
FOR EACH ROW
BEGIN
    DECLARE juros DECIMAL(10,2);

    -- Verifica se o valor disponibilizado é maior que 0
    IF NEW.valor_disponibilizado > 0 THEN
        -- Calcula os juros sobre o valor disponibilizado (5% neste exemplo)
        SET juros = NEW.valor_disponibilizado * 0.05;
        
        -- Atualiza o valor do campo valor_contratado com os juros
        SET NEW.valor_contratado = NEW.valor_disponibilizado + juros;
    END IF;
END //

DELIMITER ;

-- após inserir esse novo registro o valor contratado já vai ter o juros de 0,5 em ima do valor disponibilizado
INSERT INTO emprestimo (status_aprovacao, valor_disponibilizado, data_da_solicitacao, vencimento_do_pagamento, parcelas)
VALUES (1, 10000, NOW(), '2024-12-01', 12);

-- realizei o select para verificar, e foi adicionado já o juros no valor_contratado
SELECT * from emprestimo where id_emprestimo = 51;




-- 2  trigger foi criada para os dados do cliente ser atualizados após essa inserção 
DELIMITER //

CREATE TRIGGER atualizar_endereco_cliente
AFTER UPDATE ON usuario
FOR EACH ROW
BEGIN
    -- Verifica se o campo usuario_endereco foi alterado
    IF NEW.usuario_endereco <> OLD.usuario_endereco THEN
        -- Atualiza o endereço correspondente na tabela endereco
        UPDATE endereco
        SET cep = (SELECT cep FROM endereco WHERE id_endereco = NEW.usuario_endereco),
            logradouro = (SELECT logradouro FROM endereco WHERE id_endereco = NEW.usuario_endereco),
            estado = (SELECT estado FROM endereco WHERE id_endereco = NEW.usuario_endereco)
        WHERE id_endereco = OLD.usuario_endereco;
    END IF;
END //

DELIMITER ;

