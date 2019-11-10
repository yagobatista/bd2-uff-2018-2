# Trabalho de disciplina de banco de dados 2 uff (2019-2)

O SGBD utilizado para o trabalho foi o mysql versão 5.7.24, cada questão foi implementada em um arquivo separado e os comandos para execução se encontram no documento abaixo. Mais detalhes sobre o enunciado de cada questão estão nos arquivos pdf do repositório.

## import do Chinoo

```sh
mysql -u seu-usuario -p"sua-senha" -v < Chinook_MySql.sql
```

## Parte 1

### Q1 - Consultar as tabelas de catálogo para listar todos os índices existentes acompanhados das tabelas e colunas indexadas pelo mesmo

#### Comandos para execução da questão 1

```sh
mysql -u seu-usuario -p"sua-senha" < Parte1Q1.sql > resultParte1Q1.sql
```

### Q2 - Criar  usando  a  linguagem de  programação  do  SGBD  escolhido um procedimento que remova todos os índices de uma tabela informada como parâmetro

#### Comandos para execução da questão 2

```sh
mysql -u seu-usuario -p"sua-senha" < Parte1Q2.sql
```

### Q3 - Consultar  as  tabelas  de  catálogo  para  listar  todas  as  chaves  estrangeiras  existentes informando as tabelas e colunas envolvidas

#### Comandos para execução da questão 3

```sh
mysql -u seu-usuario -p"sua-senha" < Parte1Q3.sql > resultParte1Q3.sql
```

### Q4 - Criar usando a linguagem de programação do SGBD escolhido um script que construa de  forma  dinâmica a  partir  do  catálogo os  comandos  create  table das  tabelas existentes no esquema exemplo considerando  pelo  menos  as  informações  sobre colunas (nome, tipo e obrigatoriedade) e chaves primárias e estrangeiras

#### Comandos para execução da questão 4 

```sh
mysql -u seu-usuario -p"sua-senha" < Parte1Q4.sql > resultParte1Q4.sql
mysql -u seu-usuario -p"sua-senha" "database-escolhida" < resultParte1Q4.sql
mysql -u seu-usuario -p"sua-senha" "database-escolhida" -e "show tables" > resultParte1Q4-tabelas.sql
```

## Parte 2

### Q1 - Criar regras semânticas, que são regras que não podem ser garantidas pela estrutura do modelo relacional, usando o esquema exemplo fornecido. As regras criadas também devem ser descritas textualmente no trabalho a ser entregue

Quando se cria, atualiza ou deleta uma instância de InvoiceLine a coluna total da Invoice a qual ela está relacionada de ser atualizado de acordo

### Q2 - Implementar triggers que garantam a validação das regras semânticas criadas

```sh
mysql -u seu-usuario -p"sua-senha" < Parte2Q2.sql > resultParte2Q2.sql
```

### Q3 - Implementar procedimentos armazenados (stored procedures) que garantam a validação das regras semânticas criadas. Nesse caso, o mecanismo de permissões deve ser utilizado para criar um usuário que somente tenha acesso à manipulação dos dados envolvidos através do procedimento definido

### Q4 - A base original do Chinook possui uma coluna Total na tabela Invoice representada de forma redundante com as informações contidas nas colunas UnitPrice e Quantity na tabela InvoiceLine. Podemos identificar nesse caso uma regra semântica onde o valor Total de um Invoice deve ser igual à soma de UnitPrice * Quantity de todos os registros de InvoiceLine relacionados a um Invoice. Implementar uma solução que garanta a integridade dessa regra
