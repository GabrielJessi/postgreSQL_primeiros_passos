-- CREADO TABELA

CREATE DATABASE alura; -- para criar um banco de dados.

DROP DATABASE alura; -- para excluir um banco de dados.

CREATE TABLE aluno(
        id SERIAL, -- para se impletar automaticamente.
        nome VARCHAR(255), -- pode ter até 255 caracteres.
        cpf CHAR(11), -- a gente sabe o tamanho exato do texto que é de 11.
        observação TEXT, -- texte que não sabemos o tamanho dele.
        idade INTEGER, -- sem casa decimal.
        dinheiro NUMERIC(10,2), --(10,2) aqui representa 10 caracteres e duas casas decimais.
        altura REAL, 
	ativo BOOLEAN, -- VERDADEIRO ou FALSO.
        data_nascimento DATE, --tipo data.
        hora_aula TIME, --tipo TIME representa a horas.
        matriculado_em TIMESTAMP --
);

SELECT * FROM aluno; -- aqui estamos chamando os dados da tabela.
