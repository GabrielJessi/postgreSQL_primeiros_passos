#Ordenando as consultas.

CREATE TABLE funcionarios (
  id SERIAL PRIMARY KEY,
  matricula VARCHAR(10),
  nome VARCHAR(255),
  sobrenome VARCHAR(255)
);

INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M001', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M002', 'Vinícius', 'Dias');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M003', 'Nico', 'Steppat');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M004', 'João', 'Roberto');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M005', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M006', 'Alberto', 'Martins');

SELECT * FROM funcionarios;

SELECT * 
    FROM funcionarios
    ORDER BY nome;
# Aqui estamos ordenando por nome.
    
 SELECT * 
    FROM funcionarios
    ORDER BY nome DESC;
# Colocando o DESC no final ele é ordernado por nome em ordem decrescente. 

SELECT * 
    FROM funcionarios
    ORDER BY nome, matricula DESC;
# Ordernar por nome e matricula. 

SELECT *
    FROM funcionarios
    ORDER BY 3, 4, 2
# Outra forma de realizar a ordenação é declarando a posição do campo, ou seja, 
# a coluna que ele ocupa, ao invés do seu nome. Na nossa tabela, o "id" ocupa a primeira posição, 
# "matrícula" a segunda e assim sucessivamente.


# LIMITANDO AS CONSULTAS

SELECT * FROM funcionarios;

# Imaginemos que só quiséssemos os cinco primeiros resultados.
# Nesse caso usaremos a cláusula LIMIT para limitamos o retorno.

SELECT * FROM funcionarios LIMIT 5;

SELECT *
  FROM funcionarios
  ORDER BY id
  LIMIT 5
  OFFSET 1; # ao colocar o 1 estou indicando que quero pular a primeira linha.
# Se precisarmos do retorno de dados que não estão no começo da tabela, 
# ou seja, exibir o resultado após avançar algumas linhas, codamos o comando OFFSET . 
# Essa cláusula pula a quantidade de linhas que estipularmos antes de exibir a busca

# FUNÇÕES DE AGRAGAÇÃO

# Essas são as que mais usamos:
-- COUNT - Retorna a quantidade de registros
-- SUM -   Retorna a soma dos registros
-- MAX -   Retorna o maior valor dos registros
-- MIN -   Retorna o menor valor dos registros
-- AVG -   Retorna a média dos registros

SELECT 
  COUNT(id),
  SUM(id),
  MAX(id),
  MIN(id),
  ROUND(AVG(id), 2) # O ROUND arredonda, quando informamos 2 dizemos que queremos duas casas decimais. 
  FROM funcionarios;

# AGRUPANDO CONSULTAS

INSERT  INTO funcionarios (nome) VALUES ('Diogo');

INSERT  INTO funcionarios (nome) VALUES ('Diogo');

SELECT nome 
  FROM funcionarios; 
  ORDER BY nome;
  
# Adicionando o comando ORDER BY nome; à nossa busca, perceberemos a presença de três Diogo s
# Existem duas formas desse nome não se repetir nos resultados. A primeira que conheceremos será a partir do DISTINCT.

SELECT DISTINCT
        nome, sobreno
  FROM funcionarios
  ORDER BY nome;
# O DISTINCT garante que os dados do campo solicitado não se repitam.


SELECT
       nome,
       sobrenome,
       COUNT(*)
  FROM funcionarios
  GROUP BY nome, sobrenome
  ORDER BY nome; 
# O comando GROUP BY é um agrupamento para realização de buscas com funções de agregação. 
# Em outras palavras, se o agrupamento da busca não precisar de agregação, realizamos com DISTINCT , do contrário, codaremos com GROUP BY .

