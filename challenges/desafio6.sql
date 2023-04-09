SELECT
	CONVERT(FORMAT(MIN(p.plan_price), 2), char) AS faturamento_minimo,
    CONVERT(ROUND(MAX(p.plan_price), 2), char) AS faturamento_maximo,
    CONVERT(ROUND(AVG(p.plan_price), 2), char) AS faturamento_medio,
    CONVERT(ROUND(SUM(p.plan_price), 2), char) AS faturamento_total
FROM
	plans AS p
INNER JOIN
	users AS u ON u.plan_id = p.plan_id;
