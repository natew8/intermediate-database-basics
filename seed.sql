-------Joining---------
-- SELECT * FROM invoice i 
-- JOIN invoice_line il ON il.invoice_id = i.invoice_id
-- WHERE unit_price > 0.99;

-- SELECT i.invoice_date, c.first_name, c.last_name, i.total FROM invoice i 
-- JOIN customer c ON c.customer_id = i.customer_id;

-- SELECT c.first_name, c.last_name, e.first_name AS Rep_First_Name, e.last_name AS Rep_last_name FROM customer c
-- JOIN employee e ON e.employee_id = c.support_rep_id;

-- SELECT al.title, ar.name FROM album al
-- JOIN artist ar ON ar.artist_id = al.artist_id;

-- SELECT plt.track_id FROM playlist_track plt
-- JOIN playlist pl ON pl.playlist_id = plt.playlist_id
-- WHERE pl.name = 'Music';

-- SELECT t.name FROM track t
-- JOIN playlist_track plt ON plt.track_id = t.track_id
-- WHERE plt.playlist_id = 5;

-- SELECT t.name, pl.name FROM track t
-- JOIN playlist_track plt ON plt.track_id = t.track_id
-- JOIN playlist pl ON pl.playlist_id = plt.playlist_id;

-- SELECT t.name, al.title FROM track t
-- JOIN album al ON al.album_id = t.album_id
-- JOIN genre g ON g.genre_id = t.genre_id
-- WHERE g.name = 'Alternative & Punk';

-- SELECT t.name as Track_Title, g.name as Genre, al.title as Album_Name, ar.name as Artist_Name FROM track t
-- JOIN playlist_track plt ON plt.track_id = t.track_id
-- JOIN playlist pl ON pl.playlist_id = plt.playlist_id
-- JOIN genre g ON g.genre_id = t.genre_id
-- JOIN album al ON al.album_id = t.album_id
-- JOIN artist ar ON ar.artist_id = al.artist_id
-- WHERE pl.name = 'Music';

------------Nested Queries-----------------


-- SELECT * FROM invoice 
-- WHERE invoice_id IN(
-- 	SELECT invoice_id FROM invoice_line WHERE unit_price > 0.99
-- );

-- SELECT * from playlist_track
-- WHERE playlist_id IN(
-- 	SELECT  playlist_id FROM playlist WHERE name = 'Music'
-- );

-- SELECT name
-- FROM track
-- WHERE track_id IN (
-- 	SELECT track_id FROM playlist_track WHERE playlist_id = 5
-- );

-- SELECT * 
-- FROM track
-- WHERE genre_id IN (
-- 	SELECT genre_id FROM genre WHERE name = 'Comedy'  
-- );

-- SELECT * 
-- FROM track 
-- WHERE album_id IN (SELECT album_id FROM album WHERE title = 'Fireball');

-- SELECT * 
-- FROM track
-- WHERE album_id IN (
-- 	SELECT album_id FROM album WHERE artist_id IN (
--   	SELECT artist_id FROM artist WHERE name = 'Queen'
--   )
-- );


----------Updating Rows---------------

-- UPDATE customer
-- SET fax = null
-- WHERE fax IS NOT null;
-- SELECT * FROM customer;

-- UPDATE customer
-- SET company = 'Self'
-- WHERE company IS null;
-- SELECT * FROM customer;

-- UPDATE customer
-- SET last_name = 'Thompson'
-- WHERE customer_id = 28;
-- SELECT * FROM customer;

-- UPDATE customer 
-- SET support_rep_id = 4
-- WHERE email = 'luisrojas@yahoo.cl';
-- SELECT * FROM customer;

-- UPDATE track
-- SET composer = 'The Darkness Around Us'
-- WHERE genre_id = (SELECT genre_id FROM genre WHERE name = 'Metal')
-- AND composer IS null;
-- SELECT * from track;


-----------Group By -------------


-- SELECT COUNT(*), g.name
-- FROM track t
-- JOIN genre g ON t.genre_id = g.genre_id
-- GROUP BY g.name;

-- SELECT COUNT(*), g.name
-- FROM track t
-- JOIN genre g ON t.genre_id = g.genre_id
-- GROUP BY g.name;

-- SELECT COUNT(*), g.name
-- FROM track t
-- JOIN genre g ON t.genre_id = g.genre_id
-- GROUP BY g.name;

-----------Use Distinct--------------------

-- SELECT DISTINCT composer
-- FROM track;

-- SELECT DISTINCT billing_postal_code
-- FROM invoice;

-- SELECT DISTINCT company 
-- FROM customer;

-------DELETE ROWS-------------------------

-- CREATE TABLE practice_delete ( name TEXT, type TEXT, value INTEGER );
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'bronze', 50);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'silver', 100);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'silver', 100);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);
-- INSERT INTO practice_delete ( name, type, value ) VALUES ('delete', 'gold', 150);

-- SELECT * FROM practice_delete;

-- DELETE
-- FROM practice_delete
-- WHERE type = 'bronze';
-- DELETE 
-- FROM practice_delete
-- WHERE type = 'silver';
-- DELETE 
-- FROM practice_delete
-- WHERE value = 150;

-- SELECT * FROM practice_delete;

-------------eCommerce Simulation-------------

-- CREATE TABLE users (
--   user_id SERIAL PRIMARY KEY,
--   name VARCHAR(150),
--   email VARCHAR(500)
--  );

-- CREATE TABLE products (
--   product_id SERIAL PRIMARY KEY,
--   name VARCHAR(200),
--   price INT
--  );
-- DROP TABLE orders;
-- CREATE TABLE orders (
--   order_id SERIAL PRIMARY KEY,
--   product_id INT REFERENCES products(product_id),
--   order_item VARCHAR(200),
--   order_date TIMESTAMP  
-- );

-- INSERT INTO users (name,email)
-- VALUES ('Nate','nate@gmail.com'),('Kaylie','kaylie@email.com'),('Bash','imababy@hotmail.com'),('Luca','imasmallerbaby@yahoo.com');
-- SELECT * FROM users;

-- INSERT INTO products (name, price)
-- VALUES('Guitar',1500),('Hairbrush',10),('Dinosaur',100),('Diapers',30),('Shirt',25),('Robot',300),('House',5000),('KitchenAid',250),('Arial Silks',400);
-- SELECT * FROM products;
