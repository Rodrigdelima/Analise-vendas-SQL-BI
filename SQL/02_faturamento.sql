---------------------------------------------------------------------------
Projeto: Análise de Vendas
Arquivo: 02_faturamento.sql
---------------------------------------------------------------------------
Objetivo:
Calcular o faturamento total e o faturamento ao longo do tempo
para análise de performance comercial.
---------------------------------------------------------------------------

-- Faturamento total
SELECT
  SUM(p.preco * pe.quantidade) AS faturamento_total
FROM pedidos pe
JOIN produtos p ON pe.produto_id = p.produto_id;

-- Faturamento por ano
SELECT
  EXTRACT(YEAR FROM pe.data_pedido) AS ano,
  SUM(p.preco * pe.quantidade) AS faturamento
FROM pedidos pe
JOIN produtos p ON pe.produto_id = p.produto_id
GROUP BY ano
ORDER BY ano;

-- Faturamento por mês (ano-mês)
SELECT
  DATE_TRUNC('month', pe.data_pedido) AS mes,
  SUM(p.preco * pe.quantidade) AS faturamento
FROM pedidos pe
JOIN produtos p ON pe.produto_id = p.produto_id
GROUP BY mes
ORDER BY mes;
