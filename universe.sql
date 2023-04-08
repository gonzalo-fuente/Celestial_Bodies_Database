--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    diameter_km numeric(10,2),
    composition character varying(255)
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    galaxy_type character varying(255),
    distance_from_earth_ly numeric(10,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    diameter_km numeric(10,2),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    diameter_km numeric(10,2),
    distance_from_star numeric(10,2),
    number_of_moons integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    spectral_type character varying(255),
    age_in_millions_of_years integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Largest asteroid and a dwarf planet', 940.00, 'Rock and ice');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'Second-largest asteroid', 525.00, 'Rock and metal');
INSERT INTO public.asteroid VALUES (3, 'Pallas', 'Third-largest asteroid', 550.00, 'Rock and metal');
INSERT INTO public.asteroid VALUES (4, 'Juno', 'Fourth-largest asteroid', 268.00, 'Rock and metal');
INSERT INTO public.asteroid VALUES (5, 'Hygiea', 'Fifth-largest asteroid', 434.00, 'Rock and metal');
INSERT INTO public.asteroid VALUES (6, 'Euphrosyne', 'Sixth-largest asteroid', 311.00, 'Rock and metal');
INSERT INTO public.asteroid VALUES (7, 'Davida', 'Seventh-largest asteroid', 326.00, 'Rock and metal');
INSERT INTO public.asteroid VALUES (8, 'Interamnia', 'Eighth-largest asteroid', 350.00, 'Rock and metal');
INSERT INTO public.asteroid VALUES (9, 'Psyche', 'Tenth-largest asteroid', 226.00, 'Metallic');
INSERT INTO public.asteroid VALUES (10, 'Icarus', 'Closest asteroid to the Sun', 1.40, 'Rock and metal');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'A barred spiral galaxy', 'Spiral', 100000.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'A spiral galaxy', 'Spiral', 2537000.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A spiral galaxy', 'Spiral', 3000000.00);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'A lenticular galaxy', 'Lenticular', 28000000.00);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'An elliptical galaxy with dust lane', 'Elliptical', 13000000.00);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'A spiral galaxy', 'Spiral', 31000000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s natural satellite', 3474.00, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars''s innermost moon', 22.20, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars''s outermost moon', 12.40, 2);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Largest moon of Jupiter', 5268.00, 4);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Second-largest moon of Jupiter', 4821.00, 4);
INSERT INTO public.moon VALUES (6, 'Io', 'Third-largest moon of Jupiter', 3637.00, 4);
INSERT INTO public.moon VALUES (7, 'Europa', 'Fourth-largest moon of Jupiter', 3121.00, 4);
INSERT INTO public.moon VALUES (8, 'Titan', 'Second-largest moon of Saturn', 5150.00, 5);
INSERT INTO public.moon VALUES (9, 'Rhea', 'Second-largest moon of Saturn', 1528.00, 5);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'Third-largest moon of Saturn', 1469.00, 5);
INSERT INTO public.moon VALUES (11, 'Miranda', 'Smallest and innermost moon of Uranus', 471.60, 6);
INSERT INTO public.moon VALUES (12, 'Ariel', 'Fourth-largest moon of Uranus', 1157.00, 6);
INSERT INTO public.moon VALUES (13, 'Umbriel', 'Fifth-largest moon of Uranus', 1169.00, 6);
INSERT INTO public.moon VALUES (14, 'Titania', 'Largest moon of Uranus', 1577.00, 6);
INSERT INTO public.moon VALUES (15, 'Oberon', 'Second-largest moon of Uranus', 1523.00, 6);
INSERT INTO public.moon VALUES (16, 'Triton', 'Largest moon of Neptune', 2706.00, 7);
INSERT INTO public.moon VALUES (17, 'Nereid', 'Third-largest moon of Neptune', 340.00, 7);
INSERT INTO public.moon VALUES (18, 'Proteus', 'Second-largest moon of Neptune', 420.00, 7);
INSERT INTO public.moon VALUES (19, 'Charon', 'Plutos largest moon', 1207.00, 9);
INSERT INTO public.moon VALUES (20, 'Nix', 'Plutos inner moon', 42.00, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Third planet from the Sun', true, true, 12742.00, 147.10, 1, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Fourth planet from the Sun', false, true, 6779.00, 228.00, 2, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Second planet from the Sun', false, true, 12104.00, 108.20, 0, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'Largest planet in the Solar System', false, true, 139820.00, 778.50, 79, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Sixth planet from the Sun', false, true, 116460.00, 1429.00, 82, 1);
INSERT INTO public.planet VALUES (6, 'Uranus', 'Seventh planet from the Sun', false, true, 50724.00, 2871.00, 27, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 'Eighth planet from the Sun', false, true, 49244.00, 4495.00, 14, 1);
INSERT INTO public.planet VALUES (8, 'Mercury', 'First planet from the Sun', false, true, 4879.00, 57.90, 0, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf planet in the Solar System', false, true, 2374.00, 5906.00, 5, 1);
INSERT INTO public.planet VALUES (10, 'Vega Planet 1', 'First planet of Vega star', false, true, 10000.00, 100.00, 3, 3);
INSERT INTO public.planet VALUES (11, 'Vega Planet 2', 'Second planet of Vega star', true, false, 8000.00, 150.00, 1, 3);
INSERT INTO public.planet VALUES (12, 'Sirius Planet 1', 'First planet of Sirius star', true, true, 12000.00, 80.00, 2, 4);
INSERT INTO public.planet VALUES (13, 'Sirius Planet 2', 'Second planet of Sirius star', false, true, 9000.00, 110.00, 0, 4);
INSERT INTO public.planet VALUES (14, 'Alpha Centauri A Planet 1', 'First planet of Alpha Centauri A star', false, true, 15000.00, 200.00, 5, 5);
INSERT INTO public.planet VALUES (15, 'Alpha Centauri A Planet 2', 'Second planet of Alpha Centauri A star', true, false, 10000.00, 250.00, 3, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'A G-type main-sequence star', 'G', 4600, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'A red supergiant star', 'M', 8000, 1);
INSERT INTO public.star VALUES (3, 'Vega', 'A main-sequence star', 'A', 600, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 'A binary star system with a white dwarf and a main-sequence star', 'A', 250, 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'A main-sequence star', 'G', 6000, 5);
INSERT INTO public.star VALUES (6, 'Alpha Centauri B', 'A main-sequence star', 'K', 5500, 5);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--