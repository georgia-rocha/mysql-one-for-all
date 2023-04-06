SELECT
	name.user_name AS pessoa_usuaria,
    COUNT(h.music_id) AS musicas_ouvidas,
    ROUND(SUM(music.duration / 60), 2) AS total_minutos
FROM
	users AS name
    INNER JOIN historic AS h ON name.user_id = h.user_id
    INNER JOIN musics AS music ON music.music_id = h.music_id
GROUP BY
	name.user_name
ORDER BY
	name.user_name;