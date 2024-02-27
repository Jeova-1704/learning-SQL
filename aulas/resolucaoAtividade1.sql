-- ciando a base de dados
CREATE DATABASE LIVRARIA;


-- criando a tablea livros
CREATE TABLE LIVROS(
    NOME_LIVRO VARCHAR(100),
    NOME_AUTOR VARCHAR(100),
    SEXO_AUTOR CHAR(1),     
    NUMERO_PAGINAS INT,
    NOME_EDITORA VARCHAR(100),
    VALOR_LIVRO DECIMAL(10,2),
    ESTADO_UF_EDITORA CHAR(2),
    ANO_PUBLICACAO INT(4)
);


-- Inserindo os dados na tabela para testes 
INSERT INTO LIVROS(NOME_LIVRO, NOME_AUTOR, SEXO_AUTOR, NUMERO_PAGINAS, NOME_EDITORA, VALOR_LIVRO, ESTADO_UF_EDITORA, ANO_PUBLICACAO) VALUES
    ('Cavaleiro Real', 'Ana Claudia', 'F', 465, 'Atlas', 49.9, 'RJ', 2009),
    ('SQL para leigos', 'João Nunes', 'M', 450, 'Addison', 98, 'SP', 2018),
    ('Receitas Caseiras', 'Celia Tavares', 'F', 210, 'Atlas', 45, 'RJ', 2008),
    ('Pessoas Efetivas', 'Eduardo Santos', 'M', 390, 'Beta', 78.99, 'RJ', 2018),
    ('Habitos Saudáveis', 'Eduardo Santos', 'M', 630, 'Beta', 150.98, 'RJ', 2019),
    ('A Casa Marrom', 'Hermes Macedo', 'M', 250, 'Bubba', 60, 'MG', 2016),
    ('Estacio Querido', 'Geraldo Francisco', 'M', 310, 'Insignia', 100, 'ES', 2015),
    ('Pra sempre amigas', 'Leda Silva', 'F', 510, 'Insignia', 78.98, 'ES', 2011),
    ('Copas Inesqueciveis', 'Marco Alcantara', 'M', 200, 'Larson', 130.98, 'RS', 2018),
    ('O poder da mente', 'Clara Mafra', 'F', 120, 'Continental', 56.58, 'SP', 2017);


-- Após a criação da tabela, deveremos entregar algumas queries prontas para que sejam enviadas para o programador. As queries são as seguintes:

/* 1 – Trazer todos os dados */
SELECT * FROM LIVROS;

/* 2 – Trazer o nome do livro e o nome da editora */
SELECT NOME_LIVRO, NOME_EDITORA FROM LIVROS;

/* 3 – Trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino. */
SELECT NOME_LIVRO, ESTADO_UF_EDITORA FROM LIVROS WHERE SEXO_AUTOR = 'M';

/* 4 - Trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo feminino */
SELECT NOME_LIVRO, NUMERO_PAGINAS FROM LIVROS WHERE SEXO_AUTOR = 'F';

/* 5 – Trazer os valores dos livros das editoras de São Paulo */
SELECT VALOR_LIVRO FROM LIVROS WHERE ESTADO_UF_EDITORA = 'SP';

/* 6 – Trazer os dados dos autores do sexo masculino que tiveram livros publicados por São Paulo ou Rio de Janeiro (Questão Desafio) */ 
SELECT * from LIVROS WHERE SEXO_AUTOR='M' and ESTADO_UF_EDITORA in ('SP','RJ');
