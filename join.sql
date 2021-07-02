-- Join
-- Get all invoices where the unit_price on the invoice_line is greater than $0.99.

SELECT * FROM invoice
    JOIN invoice_line
    ON invoice_line.invoice_id = invoice.invoice_id
    WHERE unit_price > 0.99;

-- Get the invoice_date, customer first_name and last_name, and total from all invoices.

SELECT invoice_date, customer.first_name, customer.last_name, total
    FROM invoice
    JOIN customer
    ON customer.customer_id = invoice.customer_id;

-- Get the customer first_name and last_name and the support rep’s first_name and last_name from all customers.
-- Support reps are on the employee table.

SELECT customer.first_name, customer.last_name, employee.first_name, employee.last_name
    FROM customer
    JOIN employee
    ON customer.customer_id = employee.employee_id;

-- Get the album title and the artist name from all albums.

SELECT title, artist.name
	FROM album
    JOIN artist
    ON album.artist_id = artist.artist_id;

-- Get all playlist_track track_ids where the playlist name is Music.

SELECT playlist_track.track_id, playlist.name
FROM playlist_track
JOIN playlist
ON playlist_track.track_id = playlist.playlist_id
WHERE playlist.name = 'Music';

-- Get all track name`s for `playlist_id 5.

SELECT track.name, playlist_track.playlist_id
FROM track
JOIN playlist_track
ON playlist_track.track_id = track.track_id
WHERE playlist_id = 5

-- Get all track name`s and the playlist `name that they’re on ( 2 joins ).

SELECT track.name, playlist.name
FROM track
JOIN playlist_track ON track.track_id = playlist_track.track_id
JOIN playlist ON playlist_track.playlist_id = playlist.playlist_id;


-- Get all track name`s and album `title`s that are the genre `Alternative & Punk ( 2 joins ).

SELECT track.name, album.title
FROM track
JOIN album ON track.album_id = album.album_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name = 'Alternative & Punk';