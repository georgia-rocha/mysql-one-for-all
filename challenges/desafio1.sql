DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE plans(
	plan_id INT PRIMARY KEY AUTO_INCREMENT,
  plan_type VARCHAR(20) NOT NULL,
  plan_price REAL NOT NULL
);

CREATE TABLE users(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
  user_name VARCHAR(50) NOT NULL,
  user_age INT NOT NULL,
  plan_id INT NOT NULL,
  register_date DATE NOT NULL,
  FOREIGN KEY (plan_id) REFERENCES plans (plan_id)    
);

CREATE TABLE artists(
	artist_id INT PRIMARY KEY AUTO_INCREMENT,
  artist_name VARCHAR(50) NOT NULL
);

CREATE TABLE albums(
	album_id INT PRIMARY KEY AUTO_INCREMENT,
  album_name VARCHAR(50) NOT NULL,
  artista_id INT NOT NULL,
  release_year INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES artists (artist_id)
);

CREATE TABLE musics(
	music_id INT PRIMARY KEY AUTO_INCREMENT,
  music_name VARCHAR(50) NOT NULL,
  duration INT NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albums (album_id)
);

CREATE TABLE historic(
	user_id INTEGER NOT NULL,
  music_id INTEGER NOT NULL,
  last_play DATETIME NOT NULL,
	CONSTRAINT PRIMARY KEY (user_id, music_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (music_id) REFERENCES musics (music_id)
);

CREATE TABLE follow(
	user_id INTEGER NOT NULL,
  artist_id  INTEGER NOT NULL,
  CONSTRAINT PRIMARY KEY (user_id, artist_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
);

INSERT INTO plans(plan_type, plan_price)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);

INSERT INTO users(user_name, user_age,register_date, plan_id)
VALUES
  ('Barbara Liskov', 82,'2019-10-20', 1),
  ('Robert Cecil Martin', 58, '2017-01-06', 1),
  ('Ada Lovelace', 37, '2017-12-30', 2),
  ('Martin Fowler', 46, '2017-01-17', 2),
  ('Sandi Metz', 58, '2018-04-29', 2),
  ('Paulo Freire', 19, '2018-02-14', 3),
  ('Bell Hooks', 26, '2018-01-05', 3),
  ('Christopher Alexander', 85, '2019-06-05', 4),
  ('Judith Butler', 45, '2020-05-13', 4),
  ('Jorge Amado', 58, '2017-02-17', 4);

INSERT INTO artists(artist_name)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

INSERT INTO albums(album_name, artista_id, release_year)
VALUES
  ('Renaissance', 1, '2022'),
  ('Jazz', 2, '1978'),
  ('Hot Space', 2, '1982'),
  ('Falso Brilhante', 3, '1998'),
  ('Vento de Maio', 3, '2001'),
  ('QVVJFA?', 4, '2003'),
  ('Somewhere Far Beyond', 5, '2007'),
  ('I Put A Spell On You', 6, '2012');

INSERT INTO musics(music_name, duration, album_id)
VALUES
  ("BREAK MY SOUL", 279, 1),
  ("VIRGO'S GROOVE", 369, 1),
  ("ALIEN SUPERSTAR", 116, 1),
  ("Don't Stop Me Now", 203, 2),
  ("Under Pressure", 152, 3),
  ("Como Nossos Pais", 105, 4),
  ("O Medo de Amar é o Medo de Ser Livre", 207, 5),
  ("Samba em Paris", 267, 6),
  ("The Bard's Song", 244, 7),
  ("Feeling Good", 100, 8);

INSERT INTO historic(user_id, music_id, last_play)
VALUES
  (1, 8, '2022-02-28 10:45:55'),
  (1, 2, '2020-05-02 05:30:35'),
  (1, 10, '2020-03-06 11:22:33'),
  (2, 10, '2022-08-05 08:05:17'),
  (2, 7, '2020-01-02 07:40:33'),
  (3, 10, '2020-11-13 16:55:13'),
  (3, 2, '2020-12-05 18:38:30'),
  (4, 8, '2021-08-15 17:10:10'),
  (5, 8, '2022-01-09 01:44:33'),
  (5, 5, '2020-08-06 15:23:43'),
  (6, 7, '2017-01-24 00:31:17'),
  (6, 1, '2017-10-12 12:35:20'),
  (7, 4, '2011-12-15 22:30:49'),
  (8, 4, '2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22'),
  (10, 3, '2015-12-13 08:30:22');

INSERT INTO follow(user_id, artist_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);