--------------------------------------------------
Projeto: Análise de Vendas
Arquivo: 03_analises_dimensoes.sql
--------------------------------------------------

Objetivo:
Analisar o desempenho de vendas por diferentes
dimensões do negócio, como categoria de produto,
loja e região, para identificar padrões e oportunidades.
--------------------------------------------------

-- Faturamento por categoria
SELECT
    c.nome AS categoria,
    SUM(p.preco * pe.quantidade) AS faturamento_total
FROM pedidos pe
JOIN produtos p
    ON pe.produto_id = p.produto_id
JOIN categorias c
    ON p.categoria_id = c.categoria_id
GROUP BY c.nome
ORDER BY faturamento_total DESC;


-- Faturamento por loja
SELECT
    l.nome AS loja,
    SUM(p.preco * pe.quantidade) AS faturamento_total
FROM pedidos pe
JOIN produtos p
    ON pe.produto_id = p.produto_id
JOIN lojas l
    ON pe.loja_id = l.loja_id
GROUP BY l.nome
ORDER BY faturamento_total DESC;


-- Faturamento por região
SELECT
    r.nome AS regiao,
    SUM(p.preco * pe.quantidade) AS faturamento_total
FROM pedidos pe
JOIN produtos p
    ON pe.produto_id = p.produto_id
JOIN lojas l
    ON pe.loja_id = l.loja_id
JOIN regioes r
    ON l.regiao_id = r.regiao_id
GROUP BY r.nome
ORDER BY faturamento_total DESC;


-- Quantidade de pedidos por categoria
SELECT
    c.nome AS categoria,
    COUNT(pe.pedido_id) AS total_pedidos
FROM pedidos pe
JOIN produtos p
    ON pe.produto_id = p.produto_id
JOIN categorias c
    ON p.categoria_id = c.categoria_id
GROUP BY c.nome
ORDER BY total_pedidos DESC;


-- Faturamento total
SELECT SUM(faturamento) AS faturamento_total
FROM vw_vendas_comercial;

-- Ticket médio
SELECT
    SUM(faturamento) / COUNT(DISTINCT id_pedido) AS ticket_medio
FROM vw_vendas_comercial;

