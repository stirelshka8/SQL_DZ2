/*Количество исполнителей в каждом жанре*/

SELECT ag.genre_id, g.genre_name, COUNT(ag.genre_id) FROM artist_genre ag
	JOIN genre g ON ag.genre_id = g.genre_id 
	GROUP BY g.genre_name, ag.genre_id
	ORDER BY COUNT (ag.genre_id);
	
/*Количество треков, вошедших в альбомы 2019-2020 годов*/

SELECT a.album_name, a.album_year, COUNT (t.track_id) FROM album a
	JOIN track t ON a.album_id = t.album_id 
	WHERE album_year BETWEEN 2018 AND 2020
	GROUP BY a.album_name, a.album_year;
	
/* Cредняя продолжительность треков по каждому альбому  */

SELECT a.album_name, a.album_year, AVG (t.track_time) FROM album a
	JOIN track t ON a.album_id = t.album_id 
	GROUP BY a.album_name, a.album_year;
	
/* Все исполнители, которые не выпустили альбомы в 2020 году */

SELECT DISTINCT a.artist_name  FROM artist a
	JOIN artist_album aa ON a.artist_id = aa.artist_id 
	JOIN album a2 ON aa.album_id = a2.album_id 
	WHERE album_year != 2020;
	
/* Названия сборников, в которых присутствует конкретный исполнитель (выберите сами)*/

SELECT collection_name, collection_year  FROM collection c
	JOIN collection_track ct ON c.collection_id = ct.collection_id 
	JOIN track t ON t.track_id = ct.track_id 
	JOIN album a ON a.album_id = t.album_id 
	JOIN artist_album aa ON a.album_id = aa.album_id 
	JOIN artist a2 ON a2.artist_id = aa.artist_id 
	WHERE a2.artist_name = 'ДДТ';
	
/* Название альбомов, в которых присутствуют исполнители более 1 жанра */

SELECT a.album_name FROM album a
	FULL JOIN artist_album aa ON a.album_id = aa.album_id 
	FULL JOIN artist a2 ON aa.artist_id = a2.artist_id 
	FULL JOIN artist_genre ag ON ag.artist_id = a2.artist_id 
	GROUP BY a.album_name, a2.artist_name 
	HAVING COUNT (ag.artist_id) > 1; 
	
/* Наименование треков, которые не входят в сборники */

SELECT t.track_name FROM track t 
	FULL JOIN collection_track ct ON t.track_id = ct.track_id 
	GROUP  BY t.track_name, ct.track_id 
	HAVING ct.track_id IS NULL;
	
/* Исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько) */

SELECT a2.artist_name,t.track_name, MIN (t.track_time) FROM track t
	JOIN album a ON t.album_id = a.album_id 
	JOIN artist_album aa ON a.album_id = aa.album_id 
	JOIN artist a2 ON aa.artist_id = a2.artist_id 
	WHERE t.track_time = (SELECT MIN( t.track_time) FROM track t)
	GROUP BY a2.artist_name, t.track_name;

/* Название альбомов, содержащих наименьшее количество треков */

SELECT a.album_name, COUNT_TRACK FROM (SELECT t.album_id, COUNT(t.album_id) COUNT_TRACK FROM track t GROUP BY t.album_id) ttt
	JOIN album a ON a.album_id = ttt.album_id
	GROUP BY a.album_name, ttt.COUNT_TRACK
	HAVING COUNT_TRACK = (SELECT MIN(counter) FROM (SELECT album_id, COUNT(album_id) counter FROM track GROUP BY album_id) AS MINIMY); 






















