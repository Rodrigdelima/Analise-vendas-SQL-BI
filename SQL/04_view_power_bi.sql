------------------------------------------------------------
-- Projeto: Análise de Vendas
-- Arquivo: 04_view_power_bi.sql
-- Objetivo:
-- Criar uma view consolidada como fonte única de dados
-- para análises SQL e dashboards no Power BI.
------------------------------------------------------------

CREATE VIEW vw_vendas_comercial AS
SELECT
    
    p.id_pedido  AS pedido_id,
    p.data_venda AS data_pedido,

    pr.id_produto   AS produto_id,
    pr.nome_produto AS produto,
    c.nome          AS categoria,

    l.id_loja AS loja_id,
    l.loja    AS loja,
    lc.cidade,
    lc.estado,
    lc.regiao,

    p.qtd_vendida AS quantidade,
    p.preco_unit  AS preco_unitario,
    p.custo_unit  AS custo_unitario,

  
    (p.qtd_vendida * p.preco_unit) AS faturamento,
    (p.qtd_vendida * (p.preco_unit - p.custo_unit)) AS lucro
FROM pedidos p
JOIN produtos pr  ON p.id_produto = pr.id_produto
JOIN categorias c ON pr.id_categoria = c.id




-- visualizacao da view --
SELECT *
FROM vw_vendas_comercial
LIMIT 10;


-- verificar se existem valores NULL--
SELECT
    COUNT(*) AS total_linhas,
    COUNT(p.qtd_vendida) AS qtd_vendida_preenchido,
    COUNT(p.preco_unit) AS preco_preenchido,
    COUNT(p.custo_unit) AS custo_preenchido
FROM pedidos p;

    
JOIN lojas l      ON p.id_loja = l.id_loja
JOIN locais lc    ON l.id_local = lc.id_local;
