/*1.Complete o código a seguir para atualizar o valor do campo 'cartaz' 
para '1' onde o id é igual a 3 */
UPDATE cinema SET cartaz = 1 WHERE id = 3;

/*2. Complete o código abaixo seguindo as instruções da lista:
- Retornar apenas os campos 'nome' e 'pontos';
- Retornar os dois últimos colocados;
- A ordenação deve ser feita pelo campo 'posicao'. */
SELECT TOP *2 nome, pontos FROM ranking ORDER BY posicao DESC;


/*3. Complete o código para atualizar 
apenas o campo 'carro' do registro 'Golf' para 'Gol' utilizando seu 'id'*/
UPDATE loja SET carro = 'Gol' WHERE id = 1;

/*4.Qual das alternativas abaixo retorna 
apenas os alunos com nota maior que 5 ordenados da menor nota para a maior */
SELECT nome, nota FROM alunos WHERE nota > 5 ORDER BY nota ASC;

/*5. Qual das alternativas a seguir retorna apenas os carros da fabricante 'Nissan'*/
SELECT carro FROM loja WHERE fabricante LIKE 'Nissan';

/*6.Qual das alternativas abaixo retorna o top 3 carros menos vendidos*/
SELECT TOP * 3 carro, fabricante FROM loja ORDER BY vendas ASC;