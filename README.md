# ComandoS SQL

![lOGO BANCO DE DADOS](simbolo-de-banco-de-dados-em-branco.png)

# Conceitos básicos:

- **Banco de Dados**: É um conjunto estruturado de dados armazenados eletronicamente em um sistema de computador.
- **Entidade**: Representa um conjunto distinto de informações, tratado como uma unidade em um banco de dados. Em termos práticos, uma entidade é frequentemente mapeada para uma tabela em um banco de dados relacional.
- **Campos**: Também conhecidos como atributos, são as características individuais que descrevem uma entidade.

# Modelagem de dados:

Fases do processo de modelagem:

1. **Modelagem conceitual:** Envolve esboçar a estrutura de dados de alto nível, muitas vezes no papel, ou usando ferramentas de desenho, para ter apenas uma ideia de como vai ficar
2. **Modelagem lógica:** Consiste em transformar o modelo conceitual em um modelo mais detalhada, normalmente usando ferramentas de modelagem mais especificas para banco de dados. Aqui, os conceitos são mapeados para estruturas mais especificas de um SGBD.
3. **Modelagem física:** Refere-se à implementação real do modelo de dados em um SGBD, incluindo a definição de tabelas relacionamentos, índices e outras estruturas físicas de armazenamento.

### Iniciando a modelagem física:

- **Criando banco de dados:**
    
    ```sql
    CREATE DATABASE PROJETO;
    ```
    

- **Conectando ao banco de dados:**
    
    ```sql
    USE PROJETO;
    ```
    

- **Criando tabela CLIENTE:**
    
    ```sql
    CREATE TABLE CLIENTE (
        NOME VARCHAR(30),
        SEXO CHAR(1),
        EMAIL VARCHAR(30),
        CPF INT(11),
        TELEFONE VARCHAR(30),
        ENDERECO VARCHAR(100)
    );
    ```
    

- **Visualizando a tabela e a descrição, com os tipos de campos que ela tem e os tipos que cada um desses campos tem:**
    
    ```sql
    SHOW TABLES;	
    DESC CLIENTE;
    ```
    

### **Tipos de Dados e Desempenho:**

- Os tipos de dados têm um impacto direto na velocidade e no desempenho do banco de dados. Escolher o tipo de dado apropriado para cada campo é crucial para otimizar consultas e operações de armazenamento;
1. **ENUM**:
    - O tipo de dado **`ENUM`** é usado para definir um conjunto de valores permitidos para um campo. Por exemplo, em uma tabela de clientes, você pode ter um campo chamado **`STATUS`** com os valores possíveis de 'Ativo', 'Inativo', 'Pendente', etc.
    - O **`ENUM`** é útil quando você tem um conjunto finito de valores possíveis para um campo e deseja restringir as opções válidas.
2. **NUMERIC**:
    - O tipo de dado **`NUMERIC`**, muitas vezes referido como **`DECIMAL`** ou **`NUMERIC(p, s)`**, é usado para armazenar números de ponto fixo com precisão arbitrária.
    - Você define **`p`** como a precisão total (número total de dígitos) e **`s`** como a escala (número de dígitos após o ponto decimal).
    - É útil quando você precisa de precisão exata, como em valores monetários ou cálculos financeiros.
3. **CHAR e VARCHAR**:
    - Ambos são usados para armazenar strings de caracteres.
    - **`CHAR`** é usado para armazenar strings de comprimento fixo, enquanto **`VARCHAR`** é usado para strings de comprimento variável.
    - Por exemplo, se você definir um campo como **`CHAR(10)`**, ele sempre ocupará 10 bytes de armazenamento, independentemente do tamanho real da string. Já **`VARCHAR(10)`** ocupará apenas o espaço necessário para a string.
    - O uso de **`CHAR`** pode levar ao desperdício de espaço se as strings armazenadas forem significativamente menores que o tamanho máximo definido, enquanto **`VARCHAR`** é mais eficiente nesse aspecto.
    - No entanto, o acesso a campos **`CHAR`** pode ser mais rápido em comparação com **`VARCHAR`**, especialmente em operações de leitura, porque os dados estão alinhados em blocos de tamanho fixo.

**Impacto no Desempenho**:

- A escolha dos tipos de dados certos pode ter um grande impacto no desempenho do banco de dados.
- Tipos de dados que ocupam menos espaço de armazenamento, como **`VARCHAR`**, podem ser mais eficientes em termos de uso de espaço em disco.
- No entanto, campos **`ENUM`** e **`CHAR`** podem ser mais rápidos em operações de consulta e ordenação, especialmente quando comparados com campos **`VARCHAR`**.
- Por outro lado, o tipo **`NUMERIC`**, especialmente quando usado com alta precisão, pode exigir mais espaço de armazenamento e pode ser mais lento em comparação com tipos de dados numéricos de ponto flutuante, como **`FLOAT`** ou **`DOUBLE`**.
- É importante equilibrar a escolha dos tipos de dados com os requisitos de armazenamento, precisão e desempenho do sistema.

## Inserindo dados no banco de dados

### Forma 1: Excluindo as tabelas

```sql
INSERT INTO CLIENTE VALUES (
	'João', 'M', 'Joao@gmail.com', 123456789, '981142054', 'Correntes - Pernambuco - PE'
);

INSERT INTO CLIENTE VALUES (
	'Maria', 'F', 'Maria@gmail.com', 123456789, '981142054', 'Correntes - Pernambuco - PE'
);

INSERT INTO CLIENTE VALUES (
	'Jorge', 'M', 'Jorge@gmail.com', 123456789, '981142054', 'Correntes - Pernambuco - PE'
);
```

Quando usa esse método de exclusão das colunas, temos que ter cuidado com a ordem dos valores, pois eles vão ser inseridos na ordem da query, e com isso não vamos especificar o local.

### Forma 2 - Colocando as colunas

```sql
INSERT INTO CLIENTE(NOME, SEXO, ENDERECO, TELEFONE, CPF) VALUES (
	'Laura', 'F', 'Garanhuns- Pernambuco - PE', '981142054', 234567890
);

INSERT INTO CLIENTE(NOME, SEXO, ENDERECO, TELEFONE, CPF) VALUES (
	'marcos', 'M', 'Garanhuns- Pernambuco - PE', '981142054', 234567890
);
```

Aqui eu posso omitir dados, e não como o primeiro, que se eu fosse omitir eu colocaria um valor null, aqui eu posso simplesmente colocar as colunas eu eu quero cada campo e colocar eles na mesma ordem.
Essa forma é mais segura.

## Selecionando no banco de dados

### O comando SELECT:

```sql
SELECT NOW();
```

```sql
SELECT 'Maria';
SELECT 'marcos';
```

### SELECT de colunas:

```sql
SELECT NOME, SEXO, EMAIL FROM CLIENTE;

SELECT NOME, SEXRO, EMAIL, ENDERECO FROM CLIENTE;

```

### Selecionando todos os dados da minha tabela

Não use no meio empresarial, uso apenas para fins acadêmicos.

```sql
SELECT * FROM CLIENTE;
```

### Posso dar nome as minhas colunas na exibição

```sql
SELECT NOME as CLIENTES FROM CLIENTE;
```

## Projeção, junção e seleção:

1. Projeção:
    - A projeção é uma operação que extrai apenas as colunas desejadas de uma ou mais tabelas. Em uma consulta SQL, você pode especificar quais colunas deseja incluir no resultado da consulta. Por exemplo:
        
        ```sql
        SELECT nome, idade FROM clientes;
        ```
        
    - Neste exemplo, apenas as colunas "nome" e "idade" da tabela "clientes" serão incluídas no resultado da consulta.
2. Junção:
    - A junção é uma operação que combina registros de duas ou mais tabelas com base em uma condição de associação. As condições de junção geralmente envolvem colunas que estão presentes em ambas as tabelas e que têm valores correspondentes.
    - Existem diferentes tipos de junção, como INNER JOIN, LEFT JOIN, RIGHT JOIN e FULL JOIN, que determinam como os registros são combinados com base na presença ou ausência de correspondências nas tabelas envolvidas.
    - Por exemplo:
        
        ```sql
        SELECT clientes.nome, pedidos.numero
        FROM clientes
        INNER JOIN pedidos ON clientes.id = pedidos.cliente_id;
        ```
        
    - Neste exemplo, estamos juntando as tabelas "clientes" e "pedidos" com base na condição de que o "id" do cliente na tabela "clientes" seja igual ao "cliente_id" na tabela "pedidos". Estamos selecionando o nome do cliente e o número do pedido.
3. Seleção:
    - A seleção é uma operação que filtra registros com base em uma condição especificada. A condição é definida na cláusula WHERE da consulta SQL e determina quais registros devem ser incluídos no resultado.
    - Por exemplo:
        
        ```sql
        SELECT * FROM produtos WHERE preco > 100;
        ```
        
    - Neste exemplo, estamos selecionando todos os registros da tabela "produtos" onde o valor na coluna "preco" é superior a 100.
    

## Filtrando dados

```sql
SELECT NOME, SEXO FROM CLIENTE WHERE SEXO = 'M';
```

```sql
SELECT NOME, ENDERECO FROM CLIENTE WHERE SEXO = 'M';
```

Seleciona os campos nome e sexo da tabela cliente, onde endereço `contém` ”PE”

```sql
SELECT NOME, SEXO 
FROM CLIENTE 
WHERE ENDERECO LIKE '%PE%';
```

## Operadores lógicos no SQL:

1. **`AND`**: Retorna verdadeiro se ambas as condições especificadas forem verdadeiras.

Exemplo:

```sql
SELECT * FROM tabela WHERE condicao1 AND condicao2;
```

1. **`OR`**: Retorna verdadeiro se pelo menos uma das condições especificadas for verdadeira.

Exemplo:

```sql
SELECT * FROM tabela WHERE condicao1 OR condicao2;
```

1. **`NOT`**: Inverte o resultado de uma condição, retornando verdadeiro se a condição for falsa e vice-versa.

Exemplo:

```sql
SELECT * FROM tabela WHERE NOT condicao;
```

1. **`IN`**: Verifica se um valor está presente em um conjunto de valores.

Exemplo:

```sql
SELECT * FROM tabela WHERE coluna IN (valor1, valor2, ...);
```

1. **`BETWEEN`**: Verifica se um valor está dentro de um intervalo especificado (inclusive).

Exemplo:

```sql
sqlCopy code
SELECT * FROM tabela WHERE coluna BETWEEN valor1 AND valor2;

```

1. **`LIKE`**: Utilizado para fazer correspondência parcial de strings usando curingas (*).

Exemplo:

```sql
sqlCopy code
SELECT * FROM tabela WHERE coluna LIKE 'valor%';

```

Esses são os operadores lógicos mais comuns em SQL. Eles podem ser combinados e aninhados para criar condições mais complexas em consultas SQL, permitindo filtrar os resultados de acordo com critérios específicos.

1. **COUNT()**: A função **`COUNT()`** é usada para contar o número de linhas em um conjunto de resultados. Pode ser usada de várias maneiras, incluindo a contagem de todas as linhas em uma tabela ou a contagem de linhas que atendem a determinadas condições.
2. **GROUP BY**: A cláusula **`GROUP BY`** é usada para agrupar os resultados de uma consulta em conjuntos com base nos valores de uma ou mais colunas. Isso permite que você execute operações agregadas, como soma, média, mínimo, máximo ou contagem, em cada grupo separadamente.

Vamos ver um exemplo de como você pode usar **`COUNT()`** e **`GROUP BY`** juntos:

Suponha que temos uma tabela chamada **`pedidos`** com as seguintes colunas: **`id_pedido`**, **`cliente`** e **`quantidade`**:

| id_pedido | cliente | quantidade |
| --- | --- | --- |
| 1 | João | 5 |
| 2 | Maria | 3 |
| 3 | João | 2 |
| 4 | Carlos | 4 |
| 5 | Maria | 1 |

Agora, queremos contar quantos pedidos cada cliente fez. Podemos usar **`COUNT()`** e **`GROUP BY`** para isso:

```sql
SELECT cliente, COUNT(*) AS total_pedidos
FROM pedidos
GROUP BY cliente;
```

Isso retornaria:

| cliente | total_pedidos |
| --- | --- |
| João | 2 |
| Maria | 2 |
| Carlos | 1 |

Neste exemplo, a função **`COUNT(*)`** conta o número de linhas para cada grupo definido pela coluna **`cliente`**, e a cláusula **`GROUP BY cliente`** agrupa os resultados por cliente.

Então, **`COUNT()`** e **`GROUP BY`** são frequentemente usados juntos para realizar contagens em grupos de dados em uma consulta SQL.

# Filtrando valores nulos:

Pegar valores nulos não é da forma comparando por igualdade e sim pela forma de é nulo, pois algo que não existe não é se compara.

```sql
SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE EMAIL IS NULL;
```

vou a pessoa por nomes, sexo e endereço da tabela cliente onde o e-mail é nulo;

Para filtrar os que não são nulos:

```sql
SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE EMAIL IS NOT NULL;
```

# Update dados

⚠️NUNCA FAÇA ASSIM⚠️

```sql
UPDATE CLIENTE SET EMAIL = "JEOVA@GMAIL.COM";
```

Se vc fizer assim vai atualizar tudo e bagunçar tudo no banco de dados, não faça isso sem usar o `WHERE`

O `WHERE` vai ser o seu melhor amigo

A forma correta:

```sql
UPDATE CLEINTE
SET EMAIL = "JEOVALEITE5@GMAIL.COM" 
WHERE NOME = 'JEOVA';
```

# Delete

Devemos ter o mesmo cuidado do UPDATE, pois temos que ter cuidado par não deletar tudo kk

antes de deletar, primeiro vamos contar a quantidade de registros para ter certeza que vamos deletar o correto e apenas um

```sql
SELECT COUNT(*) FROM CLIENTE WHERE NOME = 'JEOVA';
```

Ai após isso vamos deletar

```sql
	DELETE FROM CLIENTE WHERE NOME = 'JEOVA';
```

Agora vamos contar novamente para ter certeza que deletamos apenas uma pessoa do nosso banco de dados