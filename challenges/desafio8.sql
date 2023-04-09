SELECT 
	art.artist_name AS  artista,
    alb.album_name AS album
FROM
	artists AS art
INNER JOIN
	albums AS alb ON art.artist_id = alb.artista_id
WHERE art.artist_name = 'Elis Regina'
ORDER BY album;