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
