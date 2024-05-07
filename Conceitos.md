## Classes de comando do SQL
1. DDL ⇒ Data Definition Language → Trata de comandos do SQL para tratar da estrutura do banco de dados
    - **Create**     
    - **Drop**
    - **Alter** 
    - **Rename** 
    - **truncate** 

2. DML ⇒ Data manipulation Language → Todos os comandos do CRUD, quando vc manipula os registros da tabela.
    - **Select**
    - **Insert**
    - **Update**
    - **Delete** 


3. DCL ⇒ Data Control Language → Controle e permisões dadas, ex: criar usuários com determinadas autorizações ao banco de dados, um usuário que pode ler, outro que altera e assim por diante.
    - **Grant** → Dá a permissão
    - **Revoke** → REmove a permissão

4. TCL ⇒ Transaction Control Language → Trabalha o controle das transações dos dados
    - **Transaction**
    - **Start**
    - **Commit**
    - **RollBack**

--- 

## Como usar comandos DDL

- Para criar um banco de dados:
    ```SQL
    CREATE DATABASE nome_base_dados;
    ```

- Para deletar o banco de dados:
    ```SQL
    DROP DATABASE nome_base_dados;
    ```
    obs: Conseguimos deletar o banco apenas quando não está conectado ou quando não estamos usando ele. Quando o banco de dados está em uso não é possível deletar ele.


- Visualizar todos os banco de dados
```
\l
```

- Para saber qual banco de dados estou conectado naquele momento:
```SQL
\conninfo
```

- Para Conectar ao banco de dados:
```SQL
\c db_teste_a;
```

- Deletar um banco de dados na visão de um Administrador de banco de dados
    ```SQL

    ```

# projeção | Junção | Seleção 

## Projeção:
Isso é tudo aquilo que você ver na tela 
ex: quando vc dá um select em alguma coluna ou em tudo, aquilo que aprece é a projeção.

## Seleção:
OBS: banco de dados é teoria  dos conjuntos.

É quando filtramos um subconjuto da minha tabela, ou seja, é um subconjunto do meu cojunto universo, a clausula de seleção é o where.
ex:
```SQL
SELECT NOME, SEXO, EMAIL /*Projeção*/
FROM CLIENTE /*origem*/
WHERE SEXO = 'M'; /*Seleção*/
```

## Junção -> JOIN
Quando juntamos mais de uma tabela 


```SQL
SELECT NOME, EMAIL, IDCLIENTE 
FROM CLIENTE;
```
+---------+-------------------+-----------+
| NOME    | EMAIL             | IDCLIENTE |
+---------+-------------------+-----------+
| JOAO    | JOAO@GMAIL.COM    |         1 |
| Maria   | MARIA@GMAIL.COM   |         2 |
| JOSE    | JOSE@GMAIL.COM    |         3 |
| GABRIEL | GABRIEL@GMAIL.COM |         4 |
| MARCAI  | MARCIA@GMAIL.COM  |         5 |
+---------+-------------------+-----------+


```SQL
SELECT ID_CLIENTE, BAIRRO, CIDADE 
FROM ENDERECO;
```

+------------+-----------+----------+
| ID_CLIENTE | BAIRRO    | CIDADE   |
+------------+-----------+----------+
|          1 | CENTRO    | CIDADE 1 |
|          2 | Boa vista | CIDADE 2 |
|          3 | má vista  | CIDADE 3 |
|          4 | cadeirado | CIDADE 4 |
|          5 | subindo   | CIDADE 5 |
+------------+-----------+----------+

```sql
SELECT NOME, SEXO, BAIRRO, CIDADE /*projeção*/
FROM CLIENTE, ENDERECO /*ordem*/
WHERE IDCLIENTE = ID_CLIENTE; /*Junção*/
```

+---------+------+-----------+----------+
| NOME    | SEXO | BAIRRO    | CIDADE   |
+---------+------+-----------+----------+
| JOAO    | M    | CENTRO    | CIDADE 1 |
| Maria   | F    | Boa vista | CIDADE 2 |
| JOSE    | M    | má vista  | CIDADE 3 |
| GABRIEL | M    | cadeirado | CIDADE 4 |
| MARCAI  | F    | subindo   | CIDADE 5 |
+---------+------+-----------+----------+




```sql
SELECT NOME, SEXO, BAIRRO, CIDADE /*projeção*/
FROM CLIENTE, ENDERECO /*ordem*/
WHERE IDCLIENTE = ID_CLIENTE /*Junção*/
AND SEXO = 'F'; /*SELEÇÃO*/
```
+--------+------+-----------+----------+
| NOME   | SEXO | BAIRRO    | CIDADE   |
+--------+------+-----------+----------+
| Maria  | F    | Boa vista | CIDADE 2 |
| MARCAI | F    | subindo   | CIDADE 5 |
+--------+------+-----------+----------+

### Usando Join

#### DUAS TABELAS
```sql
SELECT NOME, SEXO, BAIRRO, CIDADE /*projeção*/
FROM CLIENTE /*Origem*/
    INNER JOIN ENDERECO /*Junção*/
    ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F'; /*seleção*/n
```


```SQL
SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM CLIENTE
INNER JOIN TELEFONE 
ON IDCLIENTE = ID_CLIENTE;
```

Fazer um join usando: NOME, SEXO, BAIRRO, TIPO, NUMERO
```SQL
SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE
INNER JOIN ENDERECO ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
INNER JOIN TELEFONE ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;
```

+---------+------+-----------+------+-----------+
| NOME    | SEXO | BAIRRO    | TIPO | NUMERO    |
+---------+------+-----------+------+-----------+
| JOAO    | M    | CENTRO    | CEL  | 981142054 |
| JOAO    | M    | CENTRO    | COM  | 431541545 |
| JOAO    | M    | CENTRO    | CEL  | 764365366 |
| JOAO    | M    | CENTRO    | RES  | 091090908 |
| Maria   | F    | Boa vista | CEL  | 981144243 |
| JOSE    | M    | má vista  | CEL  | 5623523I5 |
| JOSE    | M    | má vista  | CEL  | 768494030 |
| GABRIEL | M    | cadeirado | COM  | 981425676 |
| GABRIEL | M    | cadeirado | CEL  | 542565262 |
| MARCAI  | F    | subindo   | RES  | 981415443 |
+---------+------+-----------+------+-----------+



OUTRA FOMRA DE FAZER um join usando: NOME, SEXO, BAIRRO, TIPO, NUMERO
```SQL
SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T ON C.IDCLIENTE = T.ID_CLIENTE;
```
+---------+------+-----------+----------+------+-----------+
| NOME    | SEXO | BAIRRO    | CIDADE   | TIPO | NUMERO    |
+---------+------+-----------+----------+------+-----------+
| JOAO    | M    | CENTRO    | CIDADE 1 | CEL  | 981142054 |
| JOAO    | M    | CENTRO    | CIDADE 1 | COM  | 431541545 |
| JOAO    | M    | CENTRO    | CIDADE 1 | CEL  | 764365366 |
| JOAO    | M    | CENTRO    | CIDADE 1 | RES  | 091090908 |
| Maria   | F    | Boa vista | CIDADE 2 | CEL  | 981144243 |
| JOSE    | M    | má vista  | CIDADE 3 | CEL  | 5623523I5 |
| JOSE    | M    | má vista  | CIDADE 3 | CEL  | 768494030 |
| GABRIEL | M    | cadeirado | CIDADE 4 | COM  | 981425676 |
| GABRIEL | M    | cadeirado | CIDADE 4 | CEL  | 542565262 |
| MARCAI  | F    | subindo   | CIDADE 5 | RES  | 981415443 |
+---------+------+-----------+----------+------+-----------+



## Comandos DML
```SQL
insert into cliente values(Null, 'Paula', 'M', Null, '87981234932');

insert into endereco values (Null, 'Rua um', 'centro', 'recife', 'PE', 6);

select * from cliente 
where IDCLIENTE = 6;

UPDATE CLIENTE 
SET SEXO = 'F'
WHERE IDCLIENTE = 6;

```

## Comandos DDL

``` SQL
CREATE TABLE PRODUTO(
    IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
    NOME_PRODUTO VARCHAR (30) NOT NULL,
    PRECO INT,
    FRETE FLOAT(10, 2) NOT NULL
);
```

alterando o nome de uma coluna 

```SQL
ALTER TABLE PRODUTO 
CHANGE PRECO VALOR_UNITARIO INT NOT NULL;
```

adicionando colunas:

```SQL
ALTER TABLE PRODUTO 
ADD PESO FLOAT (10, 2) NOT NULL;
```

apagar coluna:
 
```SQL
ALTER TABLE PRODUTO 
DROP COLUMN PESO;
```