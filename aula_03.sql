-- SELECIONANDO COLUNAS ESPECIFICAS.

SELECT * FROM aluno;
--Mas se não quisermos trazer todos os dados da tabela. Podemos selecionas campo especificos. 

SELECT nome AS 'Nome do Aluno',
       idade,
       matriculado_em AS quando_se_matriculou -- quando fizer busca vai trazer esse nome.
    FROM aluno; -- Estamos selecionado o campo nome, idade, matriculado_em da tabela 'aluno'
    
--FILTRANDO REGISTRO DE CAMPO DO TIPO TEXTO

INSERT INTO aluno (nome) VALUES ('Vinícius Dias');
INSERT INTO aluno (nome) VALUES ('Nico Steppat');
INSERT INTO aluno (nome) VALUES ('João Roberto');
INSERT INTO aluno (nome) VALUES ('Diego');

SELECT *
    FROM aluno
 WHERE nome = 'Diogo'; -- Vai buscar o campo o nome Diogo. Aqui estamos pesquisando extamaento o texto.
 
 SELECT *
    FROM aluno
 WHERE nome != 'Diogo'; -- Vai buscar todos os campos diferentes de 'Diogo' podemos também usar <>
 
 SELECT * 
    FROM aluno
 WHERE nome LIKE 'Di_go'; -- O LIKE funciona como paracido. Aqui busca nomes iniciando com Di e terminando com go.
 
 SELECT * 
    FROM aluno
 WHERE nome LIKE 'D%'; -- pesquisa todo mundo que começar com D.
 
  SELECT * 
    FROM aluno
 WHERE nome LIKE '%s'; -- pesquisa todo mundo que termina com S.
 
 SELECT * 
    FROM aluno
 WHERE nome LIKE '% %'; -- pesquisa nomes com espaços. 
 
 -- FILTRANDO REGISTROS DE CAMPO DO TIPO NUMÉRICO, DATA E BOLEANO. 
 
 SELECT *
    FROM aluno
 WHERE cpf IS NULL; -- busca todos os campos de cpf sem dados ou seja nulos.
 
 SELECT *
    FROM aluno
 WHERE idade BETWEEN 10 AND 20; --o BETWEEN é um comando inclusivo. Isso significa que ele começa a contar do menor valor declarado, 
 --ou seja, o "10", até o maior valor declarado, o "35". 
 
 -- FILTRANDO UTILIZANDO OPERADORES E e OU
 
 SELECT *
    FROM aluno
  WHERE nome LIKE 'D%' -- estou friltrando todos que começam com D 
    AND cpf IS NOT NULL; -- e o campo cpf não estela NULL.
 -- AND é quando as duas condições são verdadeiras. 
 
 SELECT *
    FROM aluno
  WHERE nome LIKE 'Diogo' -- filtra se o nome for Diogo ou Rodrigo.
    OR nome LIKE 'Rodrigo';
-- OR é quando uma das condições é verdadeira.

 
 
