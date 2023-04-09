SELECT
	COUNT(h.user_id) AS musicas_no_historico
FROM 
	historic AS h
INNER JOIN 
	users AS u ON h.user_id = u.user_id
WHERE
	u.user_name = 'Barbara Liskov';