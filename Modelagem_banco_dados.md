A década de 70 nos Estados Unidos foi marcada pela Crise do Software, que afetou não apenas a área de tecnologia, mas também todas as empresas que dependiam de sistemas tecnológicos para gerenciar seus negócios.

Naquela época, a programação era um processo artesanal. Era possível identificar quem escreveu o código apenas olhando para ele, devido ao pequeno número de programadores e aos métodos arcaicos de programação. Inicialmente, os profissionais de TI viram a necessidade de programar e começaram a desenvolver sistemas que funcionavam inicialmente, mas posteriormente geravam informações incorretas, levando à falência de várias empresas. Isso ocorreu porque os programadores sabiam programar, mas não entendiam os negócios das empresas para as quais estavam desenvolvendo sistemas. Sem compreender completamente os negócios, os programadores acabavam desenvolvendo sistemas voltados apenas para os procedimentos, o que se mostrou um erro fatal.

Peter Chen, diante desse cenário, afirmou que não se deveria criar bancos de dados voltados para procedimentos empresariais, pois os procedimentos estão sujeitos a alterações externas. A única coisa que não muda são os dados. Ele propôs o Modelo de Entidade e Relacionamento (MER) como uma forma de modelar os dados separadamente dos procedimentos.

Chen argumentou que deveríamos armazenar apenas os dados brutos, pois eles são suficientes para gerar informações. Ele destacou a importância de separar os dados dos processos para evitar inconsistências quando os procedimentos mudam.

Assim como Chen criou o MER, foram desenvolvidas as Formas Normais, que são diretrizes para aplicar na modelagem de bancos de dados transacionais (OLTP). Normalizar um banco de dados até a terceira forma normal é geralmente suficiente para garantir um trabalho limpo e livre de erros.

A modelagem de banco de dados é uma arte que se aprende com a prática, e as Formas Normais são ferramentas importantes nesse processo. Elas ajudam a garantir que o banco de dados seja estruturado de forma eficiente e livre de redundâncias

# Formais normais da modelagem de banco de dados:

### 1. Primeira forma normal:

1. Todo campo vetorizado se tronará outra tabela
    
    Exemplo com a coluna de telefones:
    
    | TELEFONE |
    | --- |
    | (87) 9 8112-8372 - (12) 3 4567-8903 |
    | (98) 9 5683-2686 |
    | (42) 5 4254-2425 |
    
    Como mostrado no campo acima, quando temos dois elementos vetorizados da mesma família de elementos no banco de dados temos que criar outra tabela para isso, e não colocar da forma descrita acima
    
2. Todo campo multivalorado se tronará outra tabela ou quando o campo for divisível 
    
    Todo campo multivalorado se tornará a outra tabela quando o campo for divisível 
    
    | endereco |
    | --- |
    | Av. José Leitão - Garanhuns - Pernambuco - PE |
    
    como descrito acima, eles são campos de famílias diferentes, logo tem que ficar em tabelas distintas, e não na mesma tabela. Isso se torna um erro de modelagem no nosso banco de dados 
    

1. Toda tabela precisa de ao menos uma coluna de identificado único, conhecido como ID ou primary key, que nunca se repita.
    1. `chave natural` pertence ao registro e vc não consegue remover, como ex: CPF
    2. `chave artificial` é a que você cria, que é a coluna do ID;
2. 

> "Chave estrangeira é a chave primária de uma tabela que é utilizada em outra tabela para fazer referência aos registros relacionados entre as duas tabelas, estabelecendo uma conexão entre elas.”
> 

### Relacionamentos entre entidades com chave estrangeiras

- Em relacionamentos 1x1 a chave estrangeira fica na tabela mais fraca
- Em relacionamentos 1xn a cardinalidade ficará sempre na cardinalidade N