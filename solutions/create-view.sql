CREATE VIEW rock AS
SELECT * FROM track 
WHERE genre_id IN (
    SELECT genre_id FROM genre WHERE name = 'Rock'
);

CREATE VIEW classical_count AS
SELECT COUNT(*)
FROM track t
JOIN playlist_track pt ON t.track_id = pt.track_id
JOIN playlist p ON pt.playlist_id = p.playlist_id
WHERE p.name = 'Classical';