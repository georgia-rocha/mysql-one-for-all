SELECT
 A.album_name AS album, COUNT(*) AS favoritadas
FROM albums AS A
INNER JOIN musics AS M
ON A.album_id = M.album_id
INNER JOIN favorites_musics AS F
ON M.music_id = F.music_id
GROUP BY A.album_name
ORDER BY favoritadas DESC
LIMIT 3;