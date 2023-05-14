SELECT
A.artist_name AS artista,
CASE
  WHEN COUNT(F.music_id) >= '5' THEN 'A' 
  WHEN COUNT(F.music_id) > '2' THEN 'B'
  WHEN COUNT(F.music_id) > 0 THEN 'C'
  ELSE '-'
END AS ranking
FROM artists AS A
INNER JOIN albums AS Alb
ON A.artist_id = Alb.artista_id
INNER JOIN musics AS M
ON Alb.album_id = M.album_id
LEFT JOIN favorites_musics AS F
ON M.music_id = F.music_id
GROUP BY A.artist_id
ORDER BY COUNT(F.music_id) DESC, A.artist_name;