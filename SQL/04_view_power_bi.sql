------------------------------------------------------------
-- Projeto: Análise de Vendas
-- Arquivo: 04_view_power_bi.sql
-- Objetivo:
-- Criar uma view consolidada como fonte única de dados
-- para análises SQL e dashboards no Power BI.
------------------------------------------------------------

CREATE OR REPLACE VIEW vw_vendas_comercial AS
SELECT
    -- Identificadores

    p.id_pedido            AS pedido_id,
    p.data_venda           AS data_pedido,

    -- Produto
    
    pr.id_produto          AS produto_id,
    pr.nome_produto        AS produto,
    c.nome                 AS categoria,

    
    -- Loja e localização
    l.id_loja              AS loja_id,
    l.loja                 AS loja,
    lc.cidade,
    lc.estado,
    lc.regiao,
    

    -- Métricas base
    p.qtd_vendida          AS quantidade,
    p.preco_unit           AS preco_unitario,
    p.custo_unit           AS custo_unitario,


    
    -- Métricas calculadas
    
    (p.qtd_vendida * p.preco_unit) AS faturamento,
    (p.qtd_vendida * (p.preco_unit - p.custo_unit)) AS lucro

FROM pedidos p
JOIN produtos pr
    ON p.id_produto = pr.id_produto
JOIN categorias c
    ON pr.id_categoria = c.id
JOIN lojas l
    ON p.id_loja = l.id_loja
JOIN locais lc
    ON l.id_local = lc.id_local;
