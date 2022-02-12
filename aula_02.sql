-- INCLUINDO UM REGISTRO NA TABELA

-- 'estou dizendo'
-- insira na tabela 'aluno' no campo (nome, cpf,  observacao, idade, dinheiro, altura, ativo, data_nascimento, 
-- hora_aula, matriculado_em) os VALORES (*****************)
INSERT INTO aluno (
    nome,
    cpf,
    observacao,
    idade,
    dinheiro,
    altura,
    ativo,
    data_nascimento,
    hora_aula,
    matriculado_em
) VALUES (
    'Diogo',
    '12345678901',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac dui et nisl vestibulum consequat. Integer vitae magna egestas, finibus libero dapibus, maximus magna. Fusce suscipit mi ut dui vestibulum, non vehicula felis fringilla. Vestibulum eget massa blandit, viverra quam non, convallis libero. Morbi ut nunc ligula. Duis tristique purus augue, nec sodales sem scelerisque dignissim. Sed vel rutrum mi. Nunc accumsan magna quis tempus rhoncus. Duis volutpat nulla a aliquet feugiat. Vestibulum rhoncus mi diam, eu consectetur sapien eleifend in. Donec sed facilisis velit. Duis tempus finibus venenatis. Mauris neque nisl, pulvinar eu volutpat eu, laoreet in massa. Quisque vestibulum eros ac tortor facilisis vulputate. Sed iaculis purus non sem tempus mollis. Curabitur felis lectus, aliquam id nunc ut, congue accumsan tellus.',
    35,
    100.50,
    1.81,
    TRUE,
    '1984-08-27',
    '17:30:00',
    '2020-02-08 12:32:45'
);

-- ATUALIZANDO UM REGISTRO NA TABELA

SELECT *
    FROM aluno
WHERE id = 1 -- para filtrar apenas os dados que desejo.

UPDATE aluno
    SET nome = 'Nico',
    cpf = '10987654321',
    observacao = 'Teste',
    idade = 38,
    dinheiro = 15.23,
    altura = 1.90,
    ativo = FALSE,
    data_nascimento = '1980-01-15',
    hora_aula = '13:00:00',
    matriculado_em = '2020-01-02 15:00:00'
WHERE id = 1; -- aqui estou informando qual coluna quero atualizar.

--Atenção: Não esqueça de colocar um = antes de atribuir um novo valor.


-- EXCLUINDO UM REGISTRO DA TABELA

SELECT FROM * aluno
  WHERE nome = 'Nico'; --estamos primeiro fazendo um filtro. 
  -- selecio na tabela aluno na coluca nome = 'Nico.
  
DELETE 
  FROM aluno
  WHERE nome = 'Nico';
-- 'estou dizendo': deleta da tabela aluno no campo nome = 'NICO'
  
