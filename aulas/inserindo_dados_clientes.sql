INSERT INTO CLIENTE VALUES(NULL, 'JOAO', 'M', 'JOAO@GMAIL.COM', '1234567891011');
INSERT INTO CLIENTE VALUES(NULL, 'Maria', 'F', 'MARIA@GMAIL.COM', '22312345678');
INSERT INTO CLIENTE VALUES(NULL, 'JOSE', 'M', 'JOSE@GMAIL.COM', '764634789');
INSERT INTO CLIENTE VALUES(NULL, 'GABRIEL', 'M', 'GABRIEL@GMAIL.COM', '09876543212');
INSERT INTO CLIENTE VALUES(NULL, 'MARCAI', 'F', 'MARCIA@GMAIL.COM', '87639813209');
INSERT INTO CLIENTE VALUES(NULL, 'JOANA', 'F', NULL, '1234567891011');


+-----------+---------+------+-------------------+---------------+
| IDCLIENTE | NOME    | SEXO | EMAIL             | CPF           |
+-----------+---------+------+-------------------+---------------+
|         1 | JOAO    | M    | JOAO@GMAIL.COM    | 1234567891011 |
|         2 | Maria   | F    | MARIA@GMAIL.COM   | 22312345678   |
|         3 | JOSE    | M    | JOSE@GMAIL.COM    | 764634789     |
|         4 | GABRIEL | M    | GABRIEL@GMAIL.COM | 09876543212   |
|         5 | MARCAI  | F    | MARCIA@GMAIL.COM  | 87639813209   |
+-----------+---------+------+-------------------+---------------+

INSERT INTO ENDERECO VALUES(NULL, 'RUA 1', 'CENTRO', 'CIDADE 1', 'PE', 1);
INSERT INTO ENDERECO VALUES(NULL, 'RUA 2', 'Boa vista', 'CIDADE 2', 'RJ', 2);
INSERT INTO ENDERECO VALUES(NULL, 'RUA 3', 'má vista', 'CIDADE 3', 'AL', 3);
INSERT INTO ENDERECO VALUES(NULL, 'RUA 4', 'cadeirado', 'CIDADE 4', 'SP', 4);
INSERT INTO ENDERECO VALUES(NULL, 'RUA 5', 'subindo', 'CIDADE 5', 'MG', 5);
INSERT INTO ENDERECO VALUES(NULL, 'RUA 6', 'descendo', 'CIDADE 6', 'AM', 6);

+------------+-------+-----------+----------+--------+------------+
| IDENDERECO | RUA   | BAIRRO    | CIDADE   | ESTADO | ID_CLIENTE |
+------------+-------+-----------+----------+--------+------------+
|          1 | RUA 1 | CENTRO    | CIDADE 1 | PE     |          1 |
|          3 | RUA 2 | Boa vista | CIDADE 2 | PE     |          2 |
|          4 | RUA 3 | má vista  | CIDADE 3 | PE     |          3 |
|          5 | RUA 4 | cadeirado | CIDADE 4 | PE     |          4 |
|          6 | RUA 5 | subindo   | CIDADE 5 | PE     |          5 |
+------------+-------+-----------+----------+--------+------------+


INSERT INTO TELEFONE VALUES (NULL, 'CEL', '981142054', 5);
INSERT INTO TELEFONE VALUES (NULL, 'RES', '981415443', 5);
INSERT INTO TELEFONE VALUES (NULL, 'COM', '431541545', 1);
INSERT INTO TELEFONE VALUES (NULL, 'CEL', '764365366', 1);
INSERT INTO TELEFONE VALUES (NULL, 'RES', '091090908', 1);
INSERT INTO TELEFONE VALUES (NULL, 'CEL', '5623523I5', 3);
INSERT INTO TELEFONE VALUES (NULL, 'CEL', '768494030', 3);
INSERT INTO TELEFONE VALUES (NULL, 'CEL', '981144243', 2);
INSERT INTO TELEFONE VALUES (NULL, 'COM', '981425676', 4);
INSERT INTO TELEFONE VALUES (NULL, 'CEL', '542565262', 4);


+------------+--------+------------+------------+
| IDTELEFONE | TIPO   | NUMERO     | ID_CLIENTE |
+------------+--------+------------+------------+
|          1 | CEL    | 981142054  |          5 |
|          2 | RES    | 981415443  |          5 |
|          3 | COM    | 431541545  |          1 |
|          4 | CEL    | 764365366  |          1 |
|          5 | RES    | 091090908  |          1 |
|          6 | CEL    | 5623523I5  |          3 |
|          7 | CEL    | 768494030  |          3 |
|          8 | CEL    | 981144243  |          2 |
|          9 | COM    | 981425676  |          4 |
|         10 | CEL    | 542565262  |          4 |
+------------+--------+------------+------------+

