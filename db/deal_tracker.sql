DROP TABLE deals;
DROP TABLE discounts;
DROP TABLE burgers;
DROP TABLE restaurants;




CREATE TABLE restaurants (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  tel VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  address VARCHAR(255) NOT NULL,
  logo_url VARCHAR(255),
  distance INT4,
  bio TEXT
);

CREATE TABLE burgers (
  id SERIAL4 PRIMARY KEY,
  restaurant_id INT REFERENCES restaurants(id) ON DELETE CASCADE,
  name VARCHAR(255) NOT NULL,
  type VARCHAR(255) NOT NULL,
  price FLOAT(2) NOT NULL,
  photo_url VARCHAR(255),
  description TEXT
);

CREATE TABLE discounts (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  multiplier FLOAT(2)
);

CREATE TABLE deals (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  discount_id INT REFERENCES discounts(id) ON DELETE CASCADE,
  day VARCHAR(255),
  burger_id INT4 REFERENCES burgers(id) ON DELETE CASCADE
);
