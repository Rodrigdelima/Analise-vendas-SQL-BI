--------------------------------------------------------------------
Projeto: Análise de Vendas
Arquivo: 01_exploracao_dados.sql
--------------------------------------------------------------------
Objetivo:
Exploração inicial da base de dados para entender o volume
de registros nas principais tabelas do sistema.
--------------------------------------------------------------------

-- Total de pedidos
SELECT COUNT(*) AS total_pedidos
FROM pedidos;

-- Total de clientes
SELECT COUNT(*) AS total_clientes
FROM clientes;

-- Total de produtos
SELECT COUNT(*) AS total_produtos
FROM produtos;

-- Estrutura da tabela pedidos
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'pedidos';
