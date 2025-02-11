{ { config(MATERIALIZED = 'view') } } -- 
WITH silver_orders AS (
    SELECT
        *
    FROM
        main.orders o
    WHERE
        date_part('year', o.o_orderdate) = 1992 -- Temporal filter
),
source_data AS (
    SELECT
        *
    FROM
        silver_orders so
        JOIN main.customer c ON c.c_custkey = so.o_custkey
        JOIN main.lineitem l ON l.l_orderkey = so.o_orderkey
        JOIN main.part p ON p.p_partkey = l.l_partkey
        JOIN main.partsupp ps ON ps.ps_partkey = l.l_partkey
        JOIN main.supplier s ON s.s_suppkey = ps.ps_suppkey
)
SELECT
    *
FROM
    source_data