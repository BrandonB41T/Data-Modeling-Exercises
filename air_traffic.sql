-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INT REFERENCES countries(id) ON DELETE CASCADE
);

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INT REFERENCES airlines(id),
  from_city_id INT REFERENCES cities(id),
  to_city_id INT REFERENCES cities(id),
  passenger_id INT REFERENCES passengers(id)
);





INSERT INTO airlines (name) VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('Avianca Brasil'),
  ('American Airlines');

INSERT INTO countries (name) VALUES
  ('United States'),
  ('Japan'),
  ('United Kingdom'),
  ('Mexico'),
  ('France'),
  ('Morocco'),
  ('UAE'),
  ('China'),
  ('Brazil'),
  ('Chile');

INSERT INTO cities (name, country_id) VALUES
  ('Washington DC', (SELECT id FROM countries WHERE name = 'United States')),
  ('Seattle', (SELECT id FROM countries WHERE name = 'United States')),
  ('Tokyo', (SELECT id FROM countries WHERE name = 'Japan')),
  ('London', (SELECT id FROM countries WHERE name = 'United Kingdom')),
  ('Los Angeles', (SELECT id FROM countries WHERE name = 'United States')),
  ('Las Vegas', (SELECT id FROM countries WHERE name = 'United States')),
  ('Mexico City', (SELECT id FROM countries WHERE name = 'Mexico')),
  ('Paris', (SELECT id FROM countries WHERE name = 'France')),
  ('Casablanca', (SELECT id FROM countries WHERE name = 'Morocco')),
  ('Dubai', (SELECT id FROM countries WHERE name = 'UAE')),
  ('Beijing', (SELECT id FROM countries WHERE name = 'China')),
  ('New York', (SELECT id FROM countries WHERE name = 'United States')),
  ('Charlotte', (SELECT id FROM countries WHERE name = 'United States')),
  ('Cedar Rapids', (SELECT id FROM countries WHERE name = 'United States')),
  ('New Orleans', (SELECT id FROM countries WHERE name = 'United States')),
  ('Sao Paolo', (SELECT id FROM countries WHERE name = 'Brazil')),
  ('Santiago', (SELECT id FROM countries WHERE name = 'Chile'));

INSERT INTO passengers (first_name, last_name) VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

INSERT INTO tickets (seat, departure, arrival, airline_id, from_city_id, to_city_id, passenger_id) VALUES
  ('33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', (SELECT id FROM airlines WHERE name = 'United'), (SELECT id FROM cities WHERE name = 'Washington DC'), (SELECT id FROM cities WHERE name = 'Seattle'), (SELECT id FROM passengers WHERE first_name = 'Jennifer' AND last_name = 'Finch')),
  ('8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', (SELECT id FROM airlines WHERE name = 'British Airways'), (SELECT id FROM cities WHERE name = 'Tokyo'), (SELECT id FROM cities WHERE name = 'London'), (SELECT id FROM passengers WHERE first_name = 'Thadeus' AND last_name = 'Gathercoal')),
  ('12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', (SELECT id FROM airlines WHERE name = 'Delta'), (SELECT id FROM cities WHERE name = 'Los Angeles'), (SELECT id FROM cities WHERE name = 'Las Vegas'), (SELECT id FROM passengers WHERE first_name = 'Sonja' AND last_name = 'Pauley')),
  ('20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', (SELECT id FROM airlines WHERE name = 'Delta'), (SELECT id FROM cities WHERE name = 'Seattle'), (SELECT id FROM cities WHERE name = 'Mexico City'), (SELECT id FROM passengers WHERE first_name = 'Jennifer' AND last_name = 'Finch')),
  ('23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', (SELECT id FROM airlines WHERE name = 'TUI Fly Belgium'), (SELECT id FROM cities WHERE name = 'Paris'), (SELECT id FROM cities WHERE name = 'Casablanca'), (SELECT id FROM passengers WHERE first_name = 'Waneta' AND last_name = 'Skeleton')),
  ('18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', (SELECT id FROM airlines WHERE name = 'Air China'), (SELECT id FROM cities WHERE name = 'Dubai'), (SELECT id FROM cities WHERE name = 'Beijing'), (SELECT id FROM passengers WHERE first_name = 'Thadeus' AND last_name = 'Gathercoal')),
  ('9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', (SELECT id FROM airlines WHERE name = 'United'), (SELECT id FROM cities WHERE name = 'New York'), (SELECT id FROM cities WHERE name = 'Charlotte'), (SELECT id FROM passengers WHERE first_name = 'Berkie' AND last_name = 'Wycliff')),
  ('1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', (SELECT id FROM airlines WHERE name = 'American Airlines'), (SELECT id FROM cities WHERE name = 'Cedar Rapids'), (SELECT id FROM cities WHERE name = 'Chicago'), (SELECT id FROM passengers WHERE first_name = 'Alvin' AND last_name = 'Leathes')),
  ('32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', (SELECT id FROM airlines WHERE name = 'American Airlines'), (SELECT id FROM cities WHERE name = 'Charlotte'), (SELECT id FROM cities WHERE name = 'New Orleans'), (SELECT id FROM passengers WHERE first_name = 'Berkie' AND last_name = 'Wycliff')),
  ('10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', (SELECT id FROM airlines WHERE name = 'Avianca Brasil'), (SELECT id FROM cities WHERE name = 'Sao Paolo'), (SELECT id FROM cities WHERE name = 'Santiago'), (SELECT id FROM passengers WHERE first_name = 'Cory' AND last_name = 'Squibbes'));