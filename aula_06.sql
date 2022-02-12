-- ORDERNANDO AS CONSULTAS

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
-- Aqui estamos ordenando por nome.
    
 SELECT * 
    FROM funcionarios
    ORDER BY nome DESC;
-- Colocando o DESC no final ele é ordernado por nome em ordem decrescente. 

SELECT * 
    FROM funcionarios
    ORDER BY nome, matricula DESC;
-- Ordernar por nome e matricula. 

SELECT *
    FROM funcionarios
    ORDER BY 3, 4, 2
-- Outra forma de realizar a ordenação é declarando a posição do campo, ou seja, 
-- a coluna que ele ocupa, ao invés do seu nome. Na nossa tabela, o "id" ocupa a primeira posição, 
-- "matrícula" a segunda e assim sucessivamente.


-- LIMITANDO AS CONSULTAS

SELECT * FROM funcionarios;
-- Imaginemos que só quiséssemos os cinco primeiros resultados.
-- Nesse caso usaremos a cláusula LIMIT para limitamos o retorno.

SELECT * FROM funcionarios LIMIT 5;

SELECT *
  FROM funcionarios
  ORDER BY id
  LIMIT 5
  OFFSET 1; -- ao colocar o 1 estou indicando que quero pular a primeira linha.
-- Se precisarmos do retorno de dados que não estão no começo da tabela, 
-- ou seja, exibir o resultado após avançar algumas linhas, codamos o comando OFFSET . 
-- Essa cláusula pula a quantidade de linhas que estipularmos antes de exibir a busca

-- FUNÇÕES DE AGRAGAÇÃO

-- Essas são as que mais usamos:
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
-- AGRUPANDO CONSULTAS

INSERT  INTO funcionarios (nome) VALUES ('Diogo');

INSERT  INTO funcionarios (nome) VALUES ('Diogo');

SELECT nome 
  FROM funcionarios; 
  ORDER BY nome;
  
-- Adicionando o comando ORDER BY nome; à nossa busca, perceberemos a presença de três Diogo s
-- Existem duas formas desse nome não se repetir nos resultados. A primeira que conheceremos será a partir do DISTINCT.

SELECT DISTINCT
        nome, sobreno
  FROM funcionarios
  ORDER BY nome;
-- O DISTINCT garante que os dados do campo solicitado não se repitam.


SELECT
       nome,
       sobrenome,
       COUNT(*)
  FROM funcionarios
  GROUP BY nome, sobrenome
  ORDER BY nome; 
-- O comando GROUP BY é um agrupamento para realização de buscas com funções de agregação. 
-- Em outras palavras, se o agrupamento da busca não precisar de agregação, realizamos com DISTINCT , do contrário, codaremos com GROUP BY .


SELECT *
    FROM aluno
    JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
    JOIN curso ON curso.id = aluno_curso.curso_id;

SELECT curso.nome,
	COUNT (aluno.id)
    FROM aluno
    JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
    JOIN curso ON curso.id = aluno_curso.curso_id
    GROUP BY 1
    ORDER BY 1
-- Executando o código, constatamos que o count retornou a quantidade de alunos por curso, contados pela quantidade de ids.

-- FILTRANDO CONSULTAS AGRUPADAS

SELECT * FROM aluno;
SELECT * FROM aluno_curso;
SELECT * FROM curso

SELECT *
    FROM curso
    LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
    LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
--tentaremos descobrir quais cursos não têm alunos matriculados. Essa informação pode ser utilizada para, por exemplo, 
--um relatório ou a exclusão do curso. Para isso, precisamos, inicialmente exibir todos os cursos, tanto com alunos matriculados quanto os sem alunos.

--Outra forma de analisarmos essa informação é exibindo na busca a quantidade de alunos em cada curso, utilizando o comando COUNT().

SELECT curso.nome,
	COUNT (aluno.id)
	FROM curso
	LEFT JOIN aluno_curso ON aluno_curso.curso_id = curso.id
	LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
	GROUP BY 1;
--Lembrete: Sempre que aplicarmos um agrupamento na busca, é necessário codarmos o comando GROUP BY nome_ou_posição_do_campo .

--Para isso, após o GROUP BY , adicionaremos o HAVING , que é um comando de filtro assim como o WHERE . 
--A diferença da filtragem com HAVING é a possibilidade de utilizar as funções de agrupamento que aprendemos, enquanto o WHERE filtra a partir dos campos. 
--Vamos conferir isso nos testes.

SELECT *
    FROM curso
    LEFT JOIN aluno_curso ON aluno.curso_id = curso.id
    LEFT JOIN aluno ON aluno.id = aluno_curso.aluno_id
GROUP BY 1
    HAVING COUNT (aluno.id) = 0
    
    
SELECT nome,
	COUNT (id)
	FROM funcionarios
	GROUP BY nome
	HAVING COUNT (id) >= 1; -- Para retornarmos a relação de funcionários que não têm o nome duplicado, 
-- trocaríamos o sinal > por =, ou seja, HAVING COUNT(id) = 1; .
	
