SELECT
	music_name AS cancao,
    COUNT( r.music_id) AS reproducoes
FROM
	musics
    INNER JOIN historic r ON r.music_id = musics.music_id
GROUP BY
	music_name
ORDER BY
	reproducoes DESC,
    music_name
LIMIT 2;