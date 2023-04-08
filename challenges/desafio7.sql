SELECT
	art.artist_name AS artista,
    alb.album_name AS album,
    COUNT(seg.artist_id) AS pessoas_seguidoras
FROM
	artists AS art
INNER JOIN
	albums AS alb ON art.artist_id = alb.artista_id
INNER JOIN
	follow AS seg ON alb.artista_id = seg.artist_id
GROUP BY
	artista, album
ORDER BY
	pessoas_seguidoras DESC, artista, album;