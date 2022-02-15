-- CRIANDO TAVELA COM CHAVE PRIMÁRIA.

-- A documentação do Postgres define a chave primária como "uma coluna, ou grupo de colunas, que pode ser usada para identificar uma linha da tabela". 

CREATE TABLE curso (
  id INTEGER,
  nome VAHRCHAR(255)
);

-- A documentação do Postgres define a chave primária como "uma coluna, 
--ou grupo de colunas, que pode ser usada para identificar uma linha da tabela". 

INSERT INTO curso (id, nome) VALUES (NULL, NULL);

--É importante sabermos quais os campos não podem ficar vazios para informarmos no momento em que criarmos a tabela

-- Na nova tabela, informaremos que os campos não podem receber o valor nulo com o comando NOT NULL .
CREATE TABLE curso (
  id INTEGER NOT NULL,
  nome VARCHAR(255) NOT NULL
);
-- Se tentarmos executar novamente o comando INSERT INTO curso (id, nome) VALUES (NULL, NULL); , 
--receberemos uma mensagem de falha, informando que não pode haver valores nulos nestes campos.

--Contudo, temos que colocar outra limitação, como perceberemos com o exemplo a seguir.
INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (1, 'Javascript');
--Ao executarmos o código acima, percebemos a possibilidade de adicionar no nosso banco de dados um novo curso com o mesmo "id", 
--o que também é ruim. Para impedir que isso aconteça, quando criarmos uma tabela, temos que informar que cada "id" precisa ser único. 

--Faremos isso com o comando UNIQUE .
CREATE TABLE curso (
  id INTEGER NOT NULL UNIQUE,
  nome VARCHAR(255) NOT NULL
);

--Agora se formos incluir na tabela dois id's irá dar erro.
INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (1, 'Javascript');

--Com o "id" sendo uma chave primária, ele terá as mesmas características de antes, 
--então se tentarmos colocar o mesmo "id" para os dois cursos aparecerá a mensagem de erro que vimos anteriormente. 
--Só conseguimos adicionar os cursos de "HTML" e "Javascript" ao usarmos id's diferentes.
INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (2, 'Javascript');

--CRIANDO TABELA COM CHAVE ESTRANGEIRA.

-- A documentação do postgres define chave estrangeira como "uma limitação para especificar que o valor de uma coluna (ou múltiplas colunas) 
-- precisa corresponder a alguma linha de outra tabela".

-- Como o nosso banco de dados "aluno" tem muitas informações, vamos apagá-lo com DROP TABLE aluno; e criarmos outra tabela.

CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

INSERT INTO aluno (nome) VALUES ('Diogo');
INSERT INTO aluno (nome) VALUES ('Vinícius');

-- Então, atualmente temos uma tabela com dois alunos e outra tabela com dois cursos. 
-- Para relacionarmos os dois bancos de dados, criaremos uma tabela nova.
CREATE TABLE aluno_curso (
    aluno_id INTERGER,
    curso_id INTERGER,
    PRIMARY KEY (aluno_id, curso_id) --declaramos que tanto o id do aluno, quanto o id do curso é um campo único que não pode ser nulo.
);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1, 1); -- aluno 1 está no curso 1
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2, 1); -- aluno 2 está no curso 1

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3, 1); -- estamos incluindo o aluno 3, mas ele não existe. 
-- precisamos adicionar uma chave estrangeira. 

CREATE TABLE aluno_curso (
  aluno_id INTEGER,
  curso_id INTEGER,
  PRIMARY KEY (aluno_id, curso_id),

  FOREIGN KEY (aluno_id),
  REFERENCES aluno (id),

  FOREIGN KEY (curso_id),
  REFERENCES curso (id)
);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3, 1); -- agora se formos incluir o aluno 3 que não existe irá apresentar um errro. 
-- Portanto, no nosso exemplo, estamos informando para a chave estrangeira que ela deve consultar o campo "id" na tabela "aluno" 
-- para corresponder ao campo "aluno_id" na tabela "aluno_curso".

--  CONSULTAS COM RELACIONAMENTOS

SELECT aluno.nome as aluno,
       curso.nome as curso
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso ON curso.id = aluno_curso.curso_id
  
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2, 2);

-- LEFT, RIGHT, CROSS e FULL JOINS

INSERT INTO aluno (nome) VALUES ('Nico'); -- não está matriculado em nenhum curso. Não conseguimos trazer ao juntas as tabelas. 

-- Por isso aprenderemos comandos para juntar tabelas quando há informações faltando. O primeiro comando é o LEFT JOIN, 
--que significa que existe um dado na tabela da esquerda, mas não existe na tabela da direita.

SELECT aluno.nome as "Nome do Aluno",
        curso.nome as "Nome do Curso"
    FROM aluno
LEFT JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
LEFT JOIN curso ON curso.id = aluno_curso.curso_id -- ao usar o LEFT conseguimos trazer o dado mesmo que não tenha dado na outra tabela.
--Para termos o retorno da lista com todos os cursos, usamos o comando inverso, ou seja, o comando RIGHT JOIN 

SELECT aluno.nome as "Nome do Aluno",
        curso.nome as "Nome do Curso"
    FROM aluno
FULL JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
FULL JOIN curso ON curso.id = aluno_curso.curso_id
-- A terceira situação é quando não importa se o dado está apenas na tabela da direita ou apenas na tabela da esquerda, 
--queremos que ele apareça. Para isso usamos o código FULL JOIN.

SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
    FROM aluno
CROSS JOIN curso
--O CROSS JOIN , que colocamos no nosso código, não precisa de um campo para realizar o vínculo, 
--poque ele vai extrair os dados da tabela "aluno" (FROM aluno) e mesclar à tabela curso (CROSS JOIN curso), 
---como se cada aluno estivesse matriculado em todos os cursos, ou seja, 
--esse comando multiplica os dados da tabela "A" pelos dados da tabela "B".



