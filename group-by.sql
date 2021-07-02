-- Find a count of how many tracks there are per genre. Display the genre name with the count.

SELECT COUNT(*), genre.name FROM track
JOIN genre ON track.genre_id = genre.genre_id
GROUP BY genre.name;

-- Find a count of how many tracks are the “Pop” genre and how many tracks are the “Rock” genre.

SELECT COUNT(*), genre.name FROM TRACK
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name = 'Pop' OR genre.name = 'Rock'
GROUP BY genre.name;

-- Find a list of all artists and how many albums they have.

SELECT artist.name, COUNT(*) FROM album
JOIN artist ON artist.artist_id = album.artist_id
GROUP BY artist.name;