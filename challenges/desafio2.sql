SELECT
	COUNT(DISTINCT music.music_id) AS cancoes,
    COUNT(DISTINCT art.artist_id) AS artistas,
    COUNT(DISTINCT alb.album_id) AS albuns
FROM 
    musics AS music,
	artists AS art,
    albums AS alb;