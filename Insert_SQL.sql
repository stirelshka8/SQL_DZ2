/*Жанры*/

INSERT INTO genre (genre_name) VALUES ('Rock');
INSERT INTO genre (genre_name) VALUES ('Metall');
INSERT INTO genre (genre_name) VALUES ('Heavy Metall');
INSERT INTO genre (genre_name) VALUES ('K-Pop');
INSERT INTO genre (genre_name) VALUES ('Hard Rock');


/*Исполнители*/

INSERT INTO artist (artist_name, artist_nickname) VALUES ('Babymetal','Судзука Накамото');
INSERT INTO artist (artist_name, artist_nickname) VALUES ('Слот','Дария Ставрович');
INSERT INTO artist (artist_name, artist_nickname) VALUES ('Ария','Валерий Кипелов');
INSERT INTO artist (artist_name, artist_nickname) VALUES ('ДДТ','Юрий Шевчук');
INSERT INTO artist (artist_name, artist_nickname) VALUES ('Marilyn Manson','Marilyn Manson & the Spooky Kids');
INSERT INTO artist (artist_name, artist_nickname) VALUES ('Бурановские бабушки','Брангуртысь песянайёс');
INSERT INTO artist (artist_name, artist_nickname) VALUES ('Алекса́ндр Бори́сович Гра́дский','Градский');
INSERT INTO artist (artist_name, artist_nickname) VALUES ('Алекса́ндр Влади́мирович Ре́вва','Арту́р Пирожко́в');

/*Альбомы*/

INSERT INTO album (album_name, album_year) VALUES ('Я придушу Шкатова', 1991); /*Это придумала жена))))*/
INSERT INTO album (album_name, album_year) VALUES ('Наша любовь', 2017);
INSERT INTO album (album_name, album_year) VALUES ('Теща', 2008);
INSERT INTO album (album_name, album_year) VALUES ('Россия', 1999);
INSERT INTO album (album_name, album_year) VALUES ('Gimme Chocolate', 2021);
INSERT INTO album (album_name, album_year) VALUES ('Река времени', 2005);
INSERT INTO album (album_name, album_year) VALUES ('Вавилон', 2004);
INSERT INTO album (album_name, album_year) VALUES ('Косово поле', 2017);

/*Сборники*/

INSERT INTO collection (collection_name, collection_year) VALUES ('СБОРНИК №1', 1999);
INSERT INTO collection (collection_name, collection_year) VALUES ('СБОРНИК №2', 2019);
INSERT INTO collection (collection_name, collection_year) VALUES ('СБОРНИК №3', 2000);
INSERT INTO collection (collection_name, collection_year) VALUES ('СБОРНИК №4', 2008);
INSERT INTO collection (collection_name, collection_year) VALUES ('СБОРНИК №5', 2014);
INSERT INTO collection (collection_name, collection_year) VALUES ('СБОРНИК №6', 2022);
INSERT INTO collection (collection_name, collection_year) VALUES ('СБОРНИК №7', 2013);
INSERT INTO collection (collection_name, collection_year) VALUES ('СБОРНИК №8', 2021);

/*Треки*/

WITH alb_id AS (SELECT album_id FROM album WHERE album_name = 'Я придушу Шкатова')
	INSERT INTO  track (album_id, track_name, track_time) VALUES ((SELECT * FROM alb_id), 'Track #1', 500), ((SELECT * FROM alb_id), 'Track #2', 215);
WITH alb_id AS (SELECT album_id FROM album WHERE album_name = 'Наша любовь')
	INSERT INTO  track (album_id, track_name, track_time) VALUES ((SELECT * FROM alb_id), 'Track #3', 417), ((SELECT * FROM alb_id), 'Track #4', 157);
WITH alb_id AS (SELECT album_id FROM album WHERE album_name = 'Теща')
	INSERT INTO  track (album_id, track_name, track_time) VALUES ((SELECT * FROM alb_id), 'Track #5', 368), ((SELECT * FROM alb_id), 'Track #6', 254);
WITH alb_id AS (SELECT album_id FROM album WHERE album_name = 'Россия')
	INSERT INTO  track (album_id, track_name, track_time) VALUES ((SELECT * FROM alb_id), 'Track #7', 114), ((SELECT * FROM alb_id), 'Track #8', 534);
WITH alb_id AS (SELECT album_id FROM album WHERE album_name = 'Gimme Chocolate')
	INSERT INTO  track (album_id, track_name, track_time) VALUES ((SELECT * FROM alb_id), 'Track #9', 245), ((SELECT * FROM alb_id), 'Track #10', 365);
WITH alb_id AS (SELECT album_id FROM album WHERE album_name = 'Река времени')
	INSERT INTO  track (album_id, track_name, track_time) VALUES ((SELECT * FROM alb_id), 'Track #11', 241), ((SELECT * FROM alb_id), 'Track #12', 255);
WITH alb_id AS (SELECT album_id FROM album WHERE album_name = 'Вавилон')
	INSERT INTO  track (album_id, track_name, track_time) VALUES ((SELECT * FROM alb_id), 'Track #13', 354), ((SELECT * FROM alb_id), 'Track #14', 599);
WITH alb_id AS (SELECT album_id FROM album WHERE album_name = 'Косово поле')
	INSERT INTO  track (album_id, track_name, track_time) VALUES ((SELECT * FROM alb_id), 'Track #15', 345), ((SELECT * FROM alb_id), 'Track #16', 114);

/*Связь исполнителей и альбомов*/

WITH alb_id AS (SELECT album_id FROM album WHERE album_name = 'Я придушу Шкатова'), art_id AS (SELECT artist_id FROM artist WHERE artist_name = 'Babymetal')
	INSERT INTO Artist_album (artist_id, album_id) VALUES ((SELECT * FROM art_id), (SELECT * FROM alb_id));
WITH alb_id AS (SELECT album_id FROM album WHERE album_name = 'Наша любовь'), art_id AS (SELECT artist_id FROM artist WHERE artist_name = 'Слот')
	INSERT INTO Artist_album (artist_id, album_id) VALUES ((SELECT * FROM art_id), (SELECT * FROM alb_id));
WITH alb_id AS (SELECT album_id FROM album WHERE album_name = 'Теща'), art_id AS (SELECT artist_id FROM artist WHERE artist_name = 'Ария')
	INSERT INTO Artist_album (artist_id, album_id) VALUES ((SELECT * FROM art_id), (SELECT * FROM alb_id));
WITH alb_id AS (SELECT album_id FROM album WHERE album_name = 'Россия'), art_id AS (SELECT artist_id FROM artist WHERE artist_name = 'ДДТ')
	INSERT INTO Artist_album (artist_id, album_id) VALUES ((SELECT * FROM art_id), (SELECT * FROM alb_id));
WITH alb_id AS (SELECT album_id FROM album WHERE album_name = 'Gimme Chocolate'), art_id AS (SELECT artist_id FROM artist WHERE artist_name = 'Marilyn Manson')
	INSERT INTO Artist_album (artist_id, album_id) VALUES ((SELECT * FROM art_id), (SELECT * FROM alb_id));
WITH alb_id AS (SELECT album_id FROM album WHERE album_name = 'Река времени'), art_id AS (SELECT artist_id FROM artist WHERE artist_name = 'Бурановские бабушки')
	INSERT INTO Artist_album (artist_id, album_id) VALUES ((SELECT * FROM art_id), (SELECT * FROM alb_id));
WITH alb_id AS (SELECT album_id FROM album WHERE album_name = 'Вавилон'), art_id AS (SELECT artist_id FROM artist WHERE artist_name = 'Алекса́ндр Бори́сович Гра́дский')
	INSERT INTO Artist_album (artist_id, album_id) VALUES ((SELECT * FROM art_id), (SELECT * FROM alb_id));
WITH alb_id AS (SELECT album_id FROM album WHERE album_name = 'Косово поле'), art_id AS (SELECT artist_id FROM artist WHERE artist_name = 'Алекса́ндр Влади́мирович Ре́вва')
	INSERT INTO Artist_album (artist_id, album_id) VALUES ((SELECT * FROM art_id), (SELECT * FROM alb_id));
WITH alb_id AS (SELECT album_id FROM album WHERE album_name = 'Я придушу Шкатова'), art_id AS (SELECT artist_id FROM artist WHERE artist_name = 'ДДТ')
	INSERT INTO Artist_album (artist_id, album_id) VALUES ((SELECT * FROM art_id), (SELECT * FROM alb_id));
WITH alb_id AS (SELECT album_id FROM album WHERE album_name = 'Теща'), art_id AS (SELECT artist_id FROM artist WHERE artist_name = 'Babymetal')
	INSERT INTO Artist_album (artist_id, album_id) VALUES ((SELECT * FROM art_id), (SELECT * FROM alb_id));

/*Связь исполнителей и жанров*/

WITH gen_id AS (SELECT genre_id FROM genre WHERE genre_name = 'Rock'), art_id AS (SELECT artist_id FROM artist WHERE artist_name = 'Babymetal')
	INSERT INTO artist_genre (genre_id, artist_id) VALUES ((SELECT * FROM gen_id), (SELECT * FROM art_id));
WITH gen_id AS (SELECT genre_id FROM genre WHERE genre_name = 'Heavy Metall'), art_id AS (SELECT artist_id FROM artist WHERE artist_name = 'Babymetal')
	INSERT INTO artist_genre (genre_id, artist_id) VALUES ((SELECT * FROM gen_id), (SELECT * FROM art_id));
WITH gen_id AS (SELECT genre_id FROM genre WHERE genre_name = 'Metall'), art_id AS (SELECT artist_id FROM artist WHERE artist_name = 'Слот')
	INSERT INTO artist_genre (genre_id, artist_id) VALUES ((SELECT * FROM gen_id), (SELECT * FROM art_id));
WITH gen_id AS (SELECT genre_id FROM genre WHERE genre_name = 'Rock'), art_id AS (SELECT artist_id FROM artist WHERE artist_name = 'Ария')
	INSERT INTO artist_genre (genre_id, artist_id) VALUES ((SELECT * FROM gen_id), (SELECT * FROM art_id));
WITH gen_id AS (SELECT genre_id FROM genre WHERE genre_name = 'Heavy Metall'), art_id AS (SELECT artist_id FROM artist WHERE artist_name = 'ДДТ')
	INSERT INTO artist_genre (genre_id, artist_id) VALUES ((SELECT * FROM gen_id), (SELECT * FROM art_id));
WITH gen_id AS (SELECT genre_id FROM genre WHERE genre_name = 'Rock'), art_id AS (SELECT artist_id FROM artist WHERE artist_name = 'Marilyn Manson')
	INSERT INTO artist_genre (genre_id, artist_id) VALUES ((SELECT * FROM gen_id), (SELECT * FROM art_id));
WITH gen_id AS (SELECT genre_id FROM genre WHERE genre_name = 'Heavy Metall'), art_id AS (SELECT artist_id FROM artist WHERE artist_name = 'Бурановские бабушки')
	INSERT INTO artist_genre (genre_id, artist_id) VALUES ((SELECT * FROM gen_id), (SELECT * FROM art_id));
WITH gen_id AS (SELECT genre_id FROM genre WHERE genre_name = 'Hard Rock'), art_id AS (SELECT artist_id FROM artist WHERE artist_name = 'Алекса́ндр Бори́сович Гра́дский')
	INSERT INTO artist_genre (genre_id, artist_id) VALUES ((SELECT * FROM gen_id), (SELECT * FROM art_id));
WITH gen_id AS (SELECT genre_id FROM genre WHERE genre_name = 'K-Pop'), art_id AS (SELECT artist_id FROM artist WHERE artist_name = 'Алекса́ндр Влади́мирович Ре́вва')
	INSERT INTO artist_genre (genre_id, artist_id) VALUES ((SELECT * FROM gen_id), (SELECT * FROM art_id));
WITH gen_id AS (SELECT genre_id FROM genre WHERE genre_name = 'Heavy Metall'), art_id AS (SELECT artist_id FROM artist WHERE artist_name = 'Слот')
	INSERT INTO artist_genre (genre_id, artist_id) VALUES ((SELECT * FROM gen_id), (SELECT * FROM art_id));

/*Связь сборников и треков*/

WITH coll_id AS (SELECT collection_id FROM collection WHERE collection_name = 'СБОРНИК №1' AND collection_year = 1999), trk_id AS (SELECT track_id FROM track WHERE track_name = 'Track #1')
	INSERT INTO collection_track (collection_id, track_id) VALUES ((SELECT * FROM coll_id), (SELECT * FROM trk_id));
WITH coll_id AS (SELECT collection_id FROM collection WHERE collection_name = 'СБОРНИК №2' AND collection_year = 2019), trk_id AS (SELECT track_id FROM track WHERE track_name = 'Track #2')
	INSERT INTO collection_track (collection_id, track_id) VALUES ((SELECT * FROM coll_id), (SELECT * FROM trk_id));
WITH coll_id AS (SELECT collection_id FROM collection WHERE collection_name = 'СБОРНИК №3' AND collection_year = 2000), trk_id AS (SELECT track_id FROM track WHERE track_name = 'Track #3')
	INSERT INTO collection_track (collection_id, track_id) VALUES ((SELECT * FROM coll_id), (SELECT * FROM trk_id));
WITH coll_id AS (SELECT collection_id FROM collection WHERE collection_name = 'СБОРНИК №4' AND collection_year = 2008), trk_id AS (SELECT track_id FROM track WHERE track_name = 'Track #4')
	INSERT INTO collection_track (collection_id, track_id) VALUES ((SELECT * FROM coll_id), (SELECT * FROM trk_id));
WITH coll_id AS (SELECT collection_id FROM collection WHERE collection_name = 'СБОРНИК №5' AND collection_year = 2014), trk_id AS (SELECT track_id FROM track WHERE track_name = 'Track #5')
	INSERT INTO collection_track (collection_id, track_id) VALUES ((SELECT * FROM coll_id), (SELECT * FROM trk_id));
WITH coll_id AS (SELECT collection_id FROM collection WHERE collection_name = 'СБОРНИК №6' AND collection_year = 2022), trk_id AS (SELECT track_id FROM track WHERE track_name = 'Track #6')
	INSERT INTO collection_track (collection_id, track_id) VALUES ((SELECT * FROM coll_id), (SELECT * FROM trk_id));
WITH coll_id AS (SELECT collection_id FROM collection WHERE collection_name = 'СБОРНИК №7' AND collection_year = 2013), trk_id AS (SELECT track_id FROM track WHERE track_name = 'Track #7')
	INSERT INTO collection_track (collection_id, track_id) VALUES ((SELECT * FROM coll_id), (SELECT * FROM trk_id));
WITH coll_id AS (SELECT collection_id FROM collection WHERE collection_name = 'СБОРНИК №8' AND collection_year = 2021), trk_id AS (SELECT track_id FROM track WHERE track_name = 'Track #8')
	INSERT INTO collection_track (collection_id, track_id) VALUES ((SELECT * FROM coll_id), (SELECT * FROM trk_id));
WITH coll_id AS (SELECT collection_id FROM collection WHERE collection_name = 'СБОРНИК №1' AND collection_year = 1999), trk_id AS (SELECT track_id FROM track WHERE track_name = 'Track #9')
	INSERT INTO collection_track (collection_id, track_id) VALUES ((SELECT * FROM coll_id), (SELECT * FROM trk_id));
WITH coll_id AS (SELECT collection_id FROM collection WHERE collection_name = 'СБОРНИК №2' AND collection_year = 2019), trk_id AS (SELECT track_id FROM track WHERE track_name = 'Track #10')
	INSERT INTO collection_track (collection_id, track_id) VALUES ((SELECT * FROM coll_id), (SELECT * FROM trk_id));
WITH coll_id AS (SELECT collection_id FROM collection WHERE collection_name = 'СБОРНИК №3' AND collection_year = 2000), trk_id AS (SELECT track_id FROM track WHERE track_name = 'Track #11')
	INSERT INTO collection_track (collection_id, track_id) VALUES ((SELECT * FROM coll_id), (SELECT * FROM trk_id));
WITH coll_id AS (SELECT collection_id FROM collection WHERE collection_name = 'СБОРНИК №4' AND collection_year = 2008), trk_id AS (SELECT track_id FROM track WHERE track_name = 'Track #12')
	INSERT INTO collection_track (collection_id, track_id) VALUES ((SELECT * FROM coll_id), (SELECT * FROM trk_id));
WITH coll_id AS (SELECT collection_id FROM collection WHERE collection_name = 'СБОРНИК №5' AND collection_year = 2014), trk_id AS (SELECT track_id FROM track WHERE track_name = 'Track #13')
	INSERT INTO collection_track (collection_id, track_id) VALUES ((SELECT * FROM coll_id), (SELECT * FROM trk_id));
WITH coll_id AS (SELECT collection_id FROM collection WHERE collection_name = 'СБОРНИК №6' AND collection_year = 2022), trk_id AS (SELECT track_id FROM track WHERE track_name = 'Track #14')
	INSERT INTO collection_track (collection_id, track_id) VALUES ((SELECT * FROM coll_id), (SELECT * FROM trk_id));
WITH coll_id AS (SELECT collection_id FROM collection WHERE collection_name = 'СБОРНИК №7' AND collection_year = 2013), trk_id AS (SELECT track_id FROM track WHERE track_name = 'Track #15')
	INSERT INTO collection_track (collection_id, track_id) VALUES ((SELECT * FROM coll_id), (SELECT * FROM trk_id));
