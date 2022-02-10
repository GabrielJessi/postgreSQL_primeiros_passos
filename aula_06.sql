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
