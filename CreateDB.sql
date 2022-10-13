/* Автор - Шкатов Евгений Александрович
 * Группа - PD-62
 */

/* Переделал полностью базу данных! Так как очень многое сделал неправильн*/
/* Очень много прешлось перечитать и пересмотреть кучу разного кода, надеюсь что не зра)*/


/* Таблица с жанрами*/

CREATE TABLE IF NOT EXISTS Genre (
	genre_id SERIAL PRIMARY KEY, 
	genre_name TEXT NOT NULL,
	UNIQUE (genre_name)); /*UNIQUE (genre_name) означает чт значение уникально*/

	
/*Таблица с исполнителями*/
	
CREATE TABLE IF NOT EXISTS Artist (
	artist_id SERIAL PRIMARY KEY,
	artist_name TEXT NOT NULL,
	artist_nickname TEXT);

/*Таблица альбомов*/

CREATE TABLE IF NOT EXISTS Album (
	album_id SERIAL PRIMARY KEY,
	album_name TEXT NOT NULL,
	album_year INTEGER CHECK (album_year > 1990 AND album_year <= 2022)); /*Ограничили год альбомов с 1990 по 2022*/
	
/*Таблица треков*/
	
CREATE TABLE IF NOT EXISTS Track (
	track_id SERIAL PRIMARY KEY,
	album_id INTEGER REFERENCES Album(album_id), /*Связь с таблицей альбомов*/
	track_name TEXT NOT NULL,
	track_time INTEGER CHECK (track_time > 5 AND track_time < 600)); /*Ограничили треки от 5 секунд до 10 минут*/
	
/*Таблица коллекций*/
	
CREATE TABLE IF NOT EXISTS Collection (
	collection_id SERIAL PRIMARY KEY,
	collection_name TEXT NOT NULL,
	collection_year INTEGER CHECK (collection_year > 1990 AND collection_year <= 2022));

/*Связь исполнителей и жанров*/

CREATE TABLE IF NOT EXISTS Artist_genre (
	genre_id INTEGER REFERENCES Genre (genre_id),
	artist_id INTEGER REFERENCES Artist (artist_id),
	CONSTRAINT artist_genre_id PRIMARY KEY (genre_id, artist_id));

/*Связь исполнителей и альбомов*/

CREATE TABLE IF NOT EXISTS Artist_album (
	artist_id INTEGER REFERENCES Artist (artist_id),
	album_id INTEGER REFERENCES Album (album_id),
	CONSTRAINT artist_album_id PRIMARY KEY (artist_id, album_id));

/*Связь сборников и треков*/

CREATE TABLE IF NOT EXISTS Collection_track (
	collection_id INTEGER REFERENCES Collection (collection_id),
	track_id INTEGER REFERENCES Track (track_id),
	collection_track_id SERIAL PRIMARY KEY);


	





	
