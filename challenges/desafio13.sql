SELECT 
  CASE
      WHEN u.user_age > 60 THEN 'Maior de 60 anos'
      WHEN u.user_age > 30 THEN 'Entre 31 e 60 anos'
      ELSE 'Até 30 anos'
  END AS faixa_etaria,
  COUNT(DISTINCT u.user_id) AS total_pessoas_usuarias,
  COUNT(F.user_id) AS total_favoritadas
FROM
  users AS u
      LEFT JOIN
  favorites_musics AS F ON u.user_id = F.user_id
GROUP BY faixa_etaria;