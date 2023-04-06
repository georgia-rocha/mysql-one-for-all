SELECT
	DISTINCT(user_name) AS pessoa_usuaria,
    IF(
		MAX(YEAR(h.last_play)) > 2020,
        'Ativa',
        'Inativa') AS status_pessoa_usuaria
FROM
	users
    INNER JOIN historic h ON h.user_id = users.user_id
GROUP BY 
	user_name
ORDER BY
	user_name;