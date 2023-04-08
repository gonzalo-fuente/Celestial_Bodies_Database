--CREATE DATABASE

CREATE DATABASE universe;


--CREATE TABLES

CREATE TABLE galaxy(
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  description TEXT,
  galaxy_type VARCHAR(255),
  distance_from_earth_ly DECIMAL(10, 2)
);

CREATE TABLE star(
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  description TEXT,
  spectral_type VARCHAR(255),
  age_in_millions_of_years INT,
  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet(
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  description TEXT,
  has_life BOOLEAN,
  is_spherical BOOLEAN,
  diameter_km DECIMAL(10, 2),
  distance_from_star DECIMAL(10, 2),
  number_of_moons INT,
  star_id INT NOT NULL REFERENCES star(star_id)
);

CREATE TABLE moon(
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  description TEXT,
  diameter_km DECIMAL(10, 2),
  planet_id INT NOT NULL REFERENCES planet(planet_id)
);

CREATE TABLE asteroid(
  asteroid_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  description TEXT,
  diameter_km DECIMAL(10, 2),	
  composition VARCHAR(255)
);


--FILL TABLES

INSERT INTO galaxy (name, description, galaxy_type, distance_from_earth_ly)
VALUES ('Milky Way', 'A barred spiral galaxy', 'Spiral', 100000),
       ('Andromeda', 'A spiral galaxy', 'Spiral', 2537000),
       ('Triangulum', 'A spiral galaxy', 'Spiral', 3000000),
       ('Sombrero', 'A lenticular galaxy', 'Lenticular', 28000000),
       ('Centaurus A', 'An elliptical galaxy with dust lane', 'Elliptical', 13000000),
       ('Whirlpool', 'A spiral galaxy', 'Spiral', 31000000);

INSERT INTO star (name, description, spectral_type, age_in_millions_of_years, galaxy_id)
VALUES ('Sun', 'A G-type main-sequence star', 'G', 4600, 1),
       ('Betelgeuse', 'A red supergiant star', 'M', 8000, 1),
       ('Vega', 'A main-sequence star', 'A', 600, 1),
       ('Sirius', 'A binary star system with a white dwarf and a main-sequence star', 'A', 250, 1),
       ('Alpha Centauri A', 'A main-sequence star', 'G', 6000, 5),
       ('Alpha Centauri B', 'A main-sequence star', 'K', 5500, 5);

INSERT INTO planet (name, description, has_life, is_spherical, diameter_km, distance_from_star, number_of_moons, star_id)
VALUES ('Earth', 'Third planet from the Sun', TRUE, TRUE, 12742.0, 147.10, 1, 1),
       ('Mars', 'Fourth planet from the Sun', FALSE, TRUE, 6779.0, 228.00, 2, 1),
       ('Venus', 'Second planet from the Sun', FALSE, TRUE, 12104.0, 108.20, 0, 1),
       ('Jupiter', 'Largest planet in the Solar System', FALSE, TRUE, 139820.0, 778.50, 79, 1),
       ('Saturn', 'Sixth planet from the Sun', FALSE, TRUE, 116460.0, 1429.00, 82, 1),
       ('Uranus', 'Seventh planet from the Sun', FALSE, TRUE, 50724.0, 2871.00, 27, 1),
       ('Neptune', 'Eighth planet from the Sun', FALSE, TRUE, 49244.0, 4495.00, 14, 1),
       ('Mercury', 'First planet from the Sun', FALSE, TRUE, 4879.0, 57.90, 0, 1),
       ('Pluto', 'Dwarf planet in the Solar System', FALSE, TRUE, 2374.0, 5906.00, 5, 1),
       ('Vega Planet 1', 'First planet of Vega star', FALSE, TRUE, 10000.0, 100.0, 3, 3),
       ('Vega Planet 2', 'Second planet of Vega star', TRUE, FALSE, 8000.0, 150.0, 1, 3),
       ('Sirius Planet 1', 'First planet of Sirius star', TRUE, TRUE, 12000.0, 80.0, 2, 4),
       ('Sirius Planet 2', 'Second planet of Sirius star', FALSE, TRUE, 9000.0, 110.0, 0, 4),
       ('Alpha Centauri A Planet 1', 'First planet of Alpha Centauri A star', FALSE, TRUE, 15000.0, 200.0, 5, 5),
       ('Alpha Centauri A Planet 2', 'Second planet of Alpha Centauri A star', TRUE, FALSE, 10000.0, 250.0, 3, 5);

INSERT INTO moon (name, description, diameter_km, planet_id)
VALUES ('Moon', 'Earth''s natural satellite', 3474.0, 1),
       ('Phobos', 'Mars''s innermost moon', 22.2, 2),
       ('Deimos', 'Mars''s outermost moon', 12.4, 2),
       ('Ganymede', 'Largest moon of Jupiter', 5268.0, 4),
       ('Callisto', 'Second-largest moon of Jupiter', 4821.0, 4),
       ('Io', 'Third-largest moon of Jupiter', 3637.0, 4),
       ('Europa', 'Fourth-largest moon of Jupiter', 3121.0, 4),
       ('Titan', 'Second-largest moon of Saturn', 5150.0, 5),
       ('Rhea', 'Second-largest moon of Saturn', 1528.0, 5),
       ('Iapetus', 'Third-largest moon of Saturn', 1469.0, 5),
       ('Miranda', 'Smallest and innermost moon of Uranus', 471.6, 6),
       ('Ariel', 'Fourth-largest moon of Uranus', 1157.0, 6),
       ('Umbriel', 'Fifth-largest moon of Uranus', 1169.0, 6),
       ('Titania', 'Largest moon of Uranus', 1577.0, 6),
       ('Oberon', 'Second-largest moon of Uranus', 1523.0, 6),
       ('Triton', 'Largest moon of Neptune', 2706.0, 7),
       ('Nereid', 'Third-largest moon of Neptune', 340.0, 7),
       ('Proteus', 'Second-largest moon of Neptune', 420.0, 7),
       ('Charon', 'Plutos largest moon', 1207.0, 9),
       ('Nix', 'Plutos inner moon', 42.0, 9);

INSERT INTO asteroid (name, description, diameter_km, composition)
VALUES ('Ceres', 'Largest asteroid and a dwarf planet', 940.0, 'Rock and ice'),
       ('Vesta', 'Second-largest asteroid', 525.0, 'Rock and metal'),
       ('Pallas', 'Third-largest asteroid', 550.0, 'Rock and metal'),
       ('Juno', 'Fourth-largest asteroid', 268.0, 'Rock and metal'),
       ('Hygiea', 'Fifth-largest asteroid', 434.0, 'Rock and metal'),
       ('Euphrosyne', 'Sixth-largest asteroid', 311.0, 'Rock and metal'),
       ('Davida', 'Seventh-largest asteroid', 326.0, 'Rock and metal'),
       ('Interamnia', 'Eighth-largest asteroid', 350.0, 'Rock and metal'),
       ('Psyche', 'Tenth-largest asteroid', 226.0, 'Metallic'),
       ('Icarus', 'Closest asteroid to the Sun', 1.4, 'Rock and metal');


--DELETE TABLES

DROP TABLE asteroid;
DROP TABLE moon;
DROP TABLE planet;
DROP TABLE star;
DROP TABLE galaxy;