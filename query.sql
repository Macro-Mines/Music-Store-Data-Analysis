use music_db;

-- Who is the senior most employee based on job title?
SELECT 
    first_name, last_name, levels
FROM
    employee
ORDER BY levels DESC
LIMIT 1;

--  Which countries have the most Invoices?
SELECT * FROM invoice;

SELECT 
    billing_country AS Country, COUNT(*) AS total_invoices
FROM
    invoice
WHERE
    billing_country IS NOT NULL
GROUP BY billing_country
ORDER BY total_invoices DESC LIMIT 5;


-- What are top 3 values of total invoice?
SELECT 
    *
FROM
    invoice
ORDER BY total DESC
LIMIT 3;


-- Which city generates the most revenue?
SELECT 
    billing_city, ROUND(SUM(total), 2) AS total_revenue
FROM
    invoice
GROUP BY billing_city
ORDER BY total_revenue DESC
LIMIT 1;

-- Who is the best customer?
 SELECT 
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    ROUND(SUM(invoice.total), 2) AS total_revenue
FROM
    customer
        JOIN
    invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total_revenue DESC
LIMIT 1;

-- Find the email, first name, last name, and genre of all Rock music listeners. Return the list alphabetically by email, starting with A.
SELECT DISTINCT
    c.email, c.first_name, c.last_name, g.`name` AS genre
FROM
    customer AS c
        JOIN
    invoice AS i ON c.customer_id = i.customer_id
        JOIN
    invoice_line AS il ON i.invoice_id = il.invoice_id
        JOIN
    track AS t ON il.track_id = t.track_id
        JOIN
    genre AS g ON t.genre_id = g.genre_id
WHERE
    g.name = 'Rock'
ORDER BY c.email ASC LIMIT 5;


--
SELECT 
    a.name AS artist_name,
    COUNT(t.track_id) AS total_rock_tracks
FROM
    artist AS a
        JOIN
    album AS al ON a.artist_id = al.artist_id
        JOIN
    track AS t ON al.album_id = t.album_id
        JOIN
    genre AS g ON t.genre_id = g.genre_id
WHERE
    g.name = 'Rock'
GROUP BY a.artist_id , a.name
ORDER BY total_rock_tracks DESC , artist_name ASC
LIMIT 10;

-- Return all the track names that have a song length longer than the average song length. Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first
SELECT 
    AVG(milliseconds) AS average_track_length
FROM
    track;









