DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT UNIQUE,
    preferred_region_id INT REFERENCES regions(region_id)
);

INSERT INTO users (first_name, last_name, email, preferred_region_id) VALUES
('Michael', 'Johnson', 'michael@example.com', 1),
('Lisa', 'Miller', 'lisa@example.com', 2);

CREATE TABLE regions (
    region_id SERIAL PRIMARY KEY,
    name TEXT
);

INSERT INTO regions (name) VALUES
('Maryland'),
('Georgia'),
('Texas');

CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(user_id),
    title TEXT,
    text TEXT,
    location TEXT,
    region_id INTEGER REFERENCES regions(region_id)
);

INSERT INTO posts (user_id, title, text, location, region_id) VALUES
(1, 'Software Engineer Needed', 'Looking for an experienced engineer', 'SF Bay Area', 1),
(2, 'Apartment for Rent', 'Nice apartment in Atlanta', 'Atlanta Downtown', 2);

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name TEXT
);

INSERT INTO categories (name) VALUES
('Jobs'),
('Housing'),
('Services');

CREATE TABLE post_categories (
    post_id INTEGER REFERENCES posts(post_id),
    category_id INTEGER REFERENCES categories(category_id),
    PRIMARY KEY (post_id, category_id)
);

INSERT INTO post_categories (post_id, category_id) VALUES
(1, 1),
(2, 2);