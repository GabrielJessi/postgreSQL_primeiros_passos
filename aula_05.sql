# Usando DELETE CASCADE
SELECT * FROM aluno;
SELECT * FROM aluno_curso;
SELECT * FROM curso;
# Como não definimos nossas restrições, se tentarmos excluir um dado dessas tabelas, aparecerá uma mensagem de erro.

DELETE FROM aluno WHERE id = 1;
# não conseguimos apagar os dados do Diogo, porque seu registro está associado a um curso na tabela "aluno_curso".

DROP TABLE aluno_curso;

CREATE TABLE aluno_curso (
  aluno_id INTEGER,
  curso_id INTEGER,
  PRIMARY KEY (aluno_id, curso_id),
  
  FOREIGN KEY (aluno_id)
  REFERENCES aluno (id)
  ON DELETE CASCADE,
  
  FOREIGN KEY (curso_id)
  REFERENCES CURSO (id)
);
# Quando criamos a nossa FOREIGN KEY, o padrão dela é o comando ON DELETE RETRICT, 
# ou seja, a chave estrangeira restringe o apagamento de dados que estão em duas tabelas. Ao trocarmos para ON DELETE CASCADE , 
# sempre que apagarmos um dado de um banco, o registro será apagado de todas as tabelas que o contém, ou seja, 
# cquando apagarmos o dado do aluno, ele também será excluído do curso.

# Vamos incluir os alunos

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1,3);

SELECT * FROM aluno_curso;

SELECT aluno.nome as "Nome do Aluno",
       curso.nome as "Nome do Curso"
    FROM aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
    JOIN curso ON curso.id = aluno_curso.curso_id
  
# vamos tentar agora rodar o mesmo DELETE que tinhamos tentado antes.

DELETE FROM aluno WHERE id = 1;
# Ao codarmos novamente a query, notaremos que os registros do Diogo não aparecem. Consultando a tabela "aluno" com SELECT * FROM aluno , confirmamos 
# que os dados do Diogo foram apagados e, da mesma forma, consultando a tabela "aluno_curso", veremos que não tem a matrícula do aluno com "id = 1".

# Vamos no caso agora do UPDATE CASCADE

UPDATE aluno
    SET id = 10
    WHERE id = 2;
    
# Nosso código solicitou ao programa a atualização do "id = 2" para o "id = 10", mas a execução retorna uma mensagem de erro. 
# Isso acontece pelo mesmo motivo que não conseguíamos apagar os registros antes, ou seja, não conseguimos atualizar os dados de uma tabela relacionada 
# a outro banco de dados. Tanto que se tentarmos atualizar o id do João, que não está matriculado em nenhum curso, teremos sucesso.

# Vamos alterar nossa regra de négocio. 

DROP TABLE aluno_curso;

CREATE TABLE aluno_curso (
    	aluno_id INTEGER,
      curso_id INTEGER,
      PRIMARY KEY (aluno_id, curso_id),

      FOREIGN KEY (aluno_id)
      REFERENCES aluno (id)
      ON DELETE CASCADE
      ON  UPDATE CASCADE,

      FOREIGN KEY (curso_id)
      REFERENCES curso (id)

);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2,1)
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3,1)

SELECT 
  aluno.id as aluno_id,
  aluno.nome as "Nome do Aluno",
  curso.id as "curso_id",
  curso.nome as "Nome do Curso"
  FROM aluno
  JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
  JOIN curso ON curso.id = aluno_curso.curso_id
  
# Vamos tentar fazer o mesmo UPDATE de antes.
  
  UPDATE aluno
    SET id = 10
    WHERE id = 2;
# A auteração feita na relação de tabela reflete para todas as tabelas. 
