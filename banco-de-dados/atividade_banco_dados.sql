-- database: banco_atividade.db


-- Criação das tabelas do meu banco de dados:

CREATE TABLE alunos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL
);

CREATE TABLE notas (
    aluno_id INTEGER,
    nota REAL,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id)
);

CREATE TABLE funcionarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cargo TEXT
);

CREATE TABLE estados (
    nome TEXT PRIMARY KEY,
    regiao TEXT
);

CREATE TABLE cidades (
    nome TEXT PRIMARY KEY,
    estado TEXT,
    FOREIGN KEY (estado) REFERENCES estados(nome)
);

CREATE TABLE professores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL
);


-- Inserção dos dados nas tabelas para resulver as questões:
INSERT INTO alunos (nome) VALUES 
('Jeová'),
('Jeová'),
('Jota'),
('Jeoviro'),
('Jheonifer'),
('Jhonta'),
('Josué'),
('Jesus'),
('João'),
('Joas'),
('Ana'),
('Maria'),
('Beatriz'),
('Joaquim');

INSERT INTO notas (aluno_id, nota) VALUES 
(1, 10),
(2, 9),
(3, 8),
(4, 7),
(5, 6),
(6, 5),
(7, 4),
(8, 3),
(9, 2),
(10, 1);

INSERT INTO funcionarios (nome, cargo) VALUES 
('João', 'Gerente'),
('Maria', 'Vendedora'),
('José', 'Faxineiro'),
('Ana', NULL),
('Pedro', NULL),
('Paulo', NULL),
('Leticia', NULL);

INSERT INTO estados (nome, regiao) VALUES 
('Rio Grande do Sul', 'Sul'),
('Santa Catarina', 'Sul'),
('Paraná', 'Sul'),
('São Paulo', 'Sudeste'),
('Minas Gerais', 'Sudeste'),
('Rio de Janeiro', 'Sudeste'),
('Bahia', 'Nordeste'),
('Pernambuco', 'Nordeste'),
('Ceará', 'Nordeste'),
('Amazonas', 'Norte');

INSERT INTO cidades (nome, estado) VALUES 
('Porto Alegre', 'Rio Grande do Sul'),
('Florianópolis', 'Santa Catarina'),
('Curitiba', 'Paraná'),
('São Paulo', 'São Paulo'),
('Belo Horizonte', 'Minas Gerais'),
('Rio de Janeiro', 'Rio de Janeiro'),
('Salvador', 'Bahia'),
('Recife', 'Pernambuco'),
('Fortaleza', 'Ceará'),
('Manaus', 'Amazonas');

INSERT INTO professores (nome) VALUES 
('João'),
('Maria'),
('José'),
('Ana'),
('Pedro'),
('Paulo'),
('Leticia');

INSERT INTO notas (aluno_id, nota) VALUES 
(1, 10),
(2, 9),
(3, 8);



-- Respostas da atividade:

-- selecionar todos os registros da tabela "alunos" e exiba os campos "id" e "nome".
SELECT nome, id FROM ALUNOS;

-- Selecione todos os registros da tabela "alunos" onde o nome seja igual a "algum nome da base".
SELECT * FROM alunos WHERE nome = "Jeová";

-- Selecione todos os registros da tabela "alunos" onde o nome comece com a letra "J". (populem a base de dados)
SELECT * FROM alunos WHERE nome LIKE "J%";

-- Selecione todos os registros da tabela "alunos" onde o nome não comece com a letra "definir uma letra".
SELECT * FROM alunos WHERE nome NOT LIKE "J%";

-- Selecione todos os nomes únicos da tabela "alunos" (sem repetições).
SELECT DISTINCT nome FROM alunos;

-- Selecione todos os registros da tabela "alunos" ordenados pelo nome em ordem alfabética.
SELECT id, nome FROM alunos ORDER BY nome ASC;

-- Selecione a nota média de todos os alunos na tabela "notas".
SELECT AVG(nota) FROM notas;

-- Selecione a nota média apenas dos alunos que tiverem a média maior que 7 na tabela "notas")
SELECT aluno_id, AVG(nota) AS media_notas
FROM notas
GROUP BY aluno_id
HAVING AVG(nota) > 7;

-- Selecione todos os funcionários que não têm cargo atribuído (ou seja, o campo "cargo" é nulo) na tabela "funcionarios". (popular a base antes)
SELECT * FROM funcionarios WHERE cargo IS NULL;

-- Selecione todas as cidades que pertencen a um estado da região "sul" usando as tabelas "cidades" e "estados". (popular a base antes)
SELECT cidades.nome 
FROM cidades 
JOIN estados ON cidades.estado = estados.nome 
WHERE estados.regiao = "Sul";

-- Selecione o nome do aluno e sua nota correspondente usando a tabela "alunos" e a tabela "notas".
SELECT alunos.nome, notas.nota
FROM alunos
JOIN notas ON alunos.id = notas.aluno_id;

-- Selecione todos os alunos da tabela "alunos" e suas notas, se tiverem alguma, usando a tabela "alunos" e a tabela "notas". Caso contrário, exiba o nome do aluno com a mensagem "Sem nota".
SELECT alunos.nome, COALESCE(CAST(notas.nota AS TEXT), 'Sem nota') AS nota
FROM alunos
LEFT JOIN notas ON alunos.id = notas.aluno_id;

-- Selecione o nome do professor e sua nota correspondente, incluindo todos os professores, mesmo que não tenham notas atribuídas, usando as tabelas "professores" e "notas". (popular tabela professor) - usar função case + is not null ou coalesce
SELECT professores.nome, COALESCE(CAST(notas.nota AS TEXT), 'Sem nota') AS nota
FROM professores
LEFT JOIN notas ON professores.id = notas.aluno_id;

-- Exclua o aluno com "id" igual a 2 na tabela "alunos".
SELECT * FROM notas WHERE aluno_id = 2;
DELETE FROM notas WHERE aluno_id = 2;

-- Atualizar o nome do aluno com "id" igual a 3 para "Mariana" na tabela "alunos".
UPDATE alunos SET nome = 'Mariana' WHERE id = 3;

