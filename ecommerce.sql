-- eCommerce Simulation - No Hints
-- Let’s simulate an e-commerce site. We’re going to need to keep track of users, products, and the products users have added to their cart.

-- users need an id, name, and an email

-- products need an id, name, and a price

-- cart should be a middle table that has an id, references both users and products, and has a quantity

-- Instructions

-- Create 3 tables following the criteria in the summary.

CREATE TABLE users (
  id SERIAL PRIMARY KEY, 
  name VARCHAR(100), 
  email VARCHAR(255)
  );
  
CREATE TABLE products (
  id SERIAL PRIMARY KEY, 
  name VARCHAR(100), 
  price FLOAT(5)
  );
  
CREATE TABLE cart (
  id SERIAL PRIMARY KEY, 
  users_id INT,
  products_id INT,
  FOREIGN KEY(users_id)
  	REFERENCES users(id),
  FOREIGN KEY(products_id)
  	REFERENCES products(id),
  quantity INT
  );


-- Add some data to fill up each table.
-- At least 3 users

INSERT INTO users ( name, email )
VALUES ('Michael', 'Michael@gmail.com'), ('Luke', 'Luke@gmail.com'), ('James', 'James@gmail.com')

-- At least 5 products

INSERT INTO products ( name, price )
VALUES ('TV', 999.99 ), ('iPhone', 1199.99), ('XBOX', 499.99), ('Playstation', 549.99), ('MacBook', 2349.99);

-- Each user should have at least 2 different products in their cart

-- Run queries against your data.
-- Get all products in your first user’s cart

SELECT name, price, quantity FROM products
JOIN cart 
ON products.id = cart.id
WHERE users_id = 1;

-- or --

SELECT * FROM products WHERE id IN 
(SELECT products_id FROM cart WHERE users_id = 1)

-- Get products in all carts with all the users’ information

SELECT * FROM products
JOIN cart ON products.id = cart.id
JOIN users ON cart.id = users.id;

-- or --

SELECT users.name, users.email, products.name, cart.quantity, products.price FROM products
JOIN cart ON products.id = cart.id
JOIN users ON cart.id = users.id;

-- Get the total cost of an order (sum the price of all products on an cart).

SELECT users.name, SUM(products.price * cart.quantity) AS total_cost FROM users
JOIN cart ON cart.id = users.id
JOIN products ON products.id = cart.products_id
GROUP BY users.name;

-- Update the quantity of a product in a user’s cart where the user’s id is 2

UPDATE cart SET quantity = 4
WHERE users_id = 2 AND products_id = 2;