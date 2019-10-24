--SELECT * FROM Genre;
--INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Nirvana', 1989);
--SELECT * FROM Artist;
--delete from Artist where Id = 30;
--SELECT * FROM Artist;
--INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Nevermind', 1992, 1700, 'Geffen', 29, 2);
--SELECT * FROM Album;
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Come As You Are', 180, 1992, 2, 29, 23);
--SELECT * FROM Song;
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Smells Like Teen Spirit', 190, 1992, 2, 29, 23);
--select ReleaseDate from Song where Id = 22;
--update Song
--set ReleaseDate = '09/24/1991'
--where Id = 22;
--update Song
--set ReleaseDate = '09/24/1991'
--where Id = 23;
--SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.Id;
--SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.Id;


-- 5. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.


--SELECT s.Title, al.Title, a.ArtistName
--FROM Song s
--LEFT JOIN Album al ON s.AlbumId = al.Id
--LEFT JOIN Artist a ON s.ArtistId = a.Id
--WHERE ArtistName = 'Nirvana' and al.Title = 'Nevermind'

--Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

--SELECT Song.AlbumId,
--COUNT(*)
--FROM Song
--GROUP BY Song.AlbumId;

--Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

--SELECT Song.ArtistId,
--COUNT(*)
--FROM Song
--GROUP BY Song.ArtistId;

--Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

--SELECT Song.GenreId,
--COUNT(*) as NumOfSongs
--FROM Song
--GROUP BY Song.GenreId;

--Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

--SELECT Title, AlbumLength
--FROM Album
--WHERE AlbumLength IN (SELECT MAX(AlbumLength) FROM Album)

--Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

--SELECT Title, SongLength
--  FROM Song
-- WHERE SongLength IN (SELECT MAX(SongLength) FROM Song)


--Modify the previous query to also display the title of the album.

SELECT s.Title, s.SongLength, a.Title as AlbumTitle
  FROM Song s LEFT JOIN Album a on s.AlbumId = a.Id
 WHERE s.SongLength IN (SELECT MAX(s.SongLength)
  FROM Song s)
