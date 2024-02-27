-- database: :memory:
--  Modelagem básica 
-- entidade == tabela
-- campos são chamdos de atributos



--CLIENTE 

--NOME -- caracter(30)
--CPF  -- numerico(11)
--EMAIL -- caracter(30)
--TELEFONE -- caracter(30)
--ENDERECO -- caracter(100)
--SEXO -- caracter(1)

---------------------------------------------------------------------

-- PROCESSOS DE MODELAGEM

-- # Fase 01 e fase 02 --> fica a criterio do adm de dados

--MODELAGEM CONCEITUAL: rascunho, no papel, em software, qualquer rascunho 
--MODELAGEM LOGICA: Modelagem em programas de modelagem, como o umlstar, etc... pode ser qualquer programa de modelagem

-- # fase 03 --> dba ou adm de dados
--MODELAGEM FISICA:  scripts do banco de daados


-------------------------------------------------------------------------


-- Iniciando a modelagem fisica:

--Criando banco de dados:
CREATE DATABASE PROJETO;
CREATE DATABASE exemplo;


-- conectando ao banco de dados 
USE PROJETO;

-- criando a tablea clientes
CREATE TABLE CLIENTE (
    NOME VARCHAR(30),
    SEXO CHAR(1),
    EMAIL VARCHAR(30),
    CPF INT(11),
    TELEFONE VARCHAR(30),
    ENDERECO VARCHAR(100)
);

--> ad/dba == oltp / bi == olap / dc / tudo isso está ligado ao profissinal de turing 

-- visualizando tabelas do nosso banco de dados:
SHOW TABLES;

-- descobrindo como é a estrutura de uma tabela, os campus, tipos e descição:
DESC CLIENTE;




------------------------------------------------------------------------
-- os tipos de dados está diretamento ligado a velocidade e a performaçe do banco de dados 

------------------------------------------------------------------------

-- # enserindo dados na minha tabela

--  sintaxe basica de inserção
-- INSERT INTO TABELA ...

    