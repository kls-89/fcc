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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    galaxy_type text NOT NULL,
    age_in_millions_of_years integer,
    diameter integer NOT NULL
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
    planet_id integer,
    name character varying(255) NOT NULL,
    description text,
    diameter integer NOT NULL,
    has_water boolean DEFAULT false,
    age_in_millions_of_years integer
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
    star_id integer,
    name character varying(255) NOT NULL,
    description text,
    has_life boolean,
    has_water boolean DEFAULT false,
    distance_from_earth numeric,
    diameter integer NOT NULL,
    age_in_millions_of_years integer
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance_from_earth integer
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(255) NOT NULL,
    description text,
    distance_from_earth numeric NOT NULL,
    diameter integer NOT NULL,
    has_water boolean DEFAULT false,
    temperature_in_kelvin integer,
    age_in_millions_of_years integer
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
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Home sweet home', 'Spiral', 136100, 104000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', '2.5 m light years from earth, in the constellation andromeda', 'spiral', 4500, 220000);
INSERT INTO public.galaxy VALUES (3, 'Black Eye Galaxy', '17 m lya in coma berenices', 'spiral', 1328000, 52962);
INSERT INTO public.galaxy VALUES (4, 'Messier 81', '12 m lya in ursa major. popular among astronomers.', 'grand design spiral', 1331000, 90000);
INSERT INTO public.galaxy VALUES (5, 'Cartwheel Galaxy', 'lenticular galaxy and ring galaxy', 'lenticular and ring', 200, 150000);
INSERT INTO public.galaxy VALUES (6, 'Messier 82', 'aka the cigar galaxy', 'starburst', 133000, 37000);
INSERT INTO public.galaxy VALUES (7, 'Cosmos Redshift 7', 'one of the oldest, most distant galaxies known', 'high-redshift lyman-alpha emitter', 800, 12345);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (41, 13, 'Moon', 'The only natural satellite orbiting earth', 2159, false, 4530);
INSERT INTO public.moon VALUES (42, 14, 'Phobos', 'innermost martian moon', 14, false, 4503);
INSERT INTO public.moon VALUES (43, 14, 'Deimos', 'smaller martian moon', 6, false, 4503);
INSERT INTO public.moon VALUES (44, 15, 'Europa', 'Lorem Ipsum Descriptum Moonnium', 54, false, 12);
INSERT INTO public.moon VALUES (45, 15, 'Ganymede', 'Lorem Ipsum Descriptum Moonnium', 33, false, 13);
INSERT INTO public.moon VALUES (46, 15, 'Io', 'Lorem Ipsum Descriptum Moonnium', 213, true, 44);
INSERT INTO public.moon VALUES (47, 15, 'Callisto', 'Lorem Ipsum Descriptum Moonnium', 76, false, 1230);
INSERT INTO public.moon VALUES (48, 15, 'Amalthea', 'Lorem Ipsum Descriptum Moonnium', 10, false, 11);
INSERT INTO public.moon VALUES (49, 15, 'Himalia', 'Lorem Ipsum Descriptum Moonnium', 80, false, 87);
INSERT INTO public.moon VALUES (50, 15, 'Valetudo', 'Lorem Ipsum Descriptum Moonnium', 90, true, 34);
INSERT INTO public.moon VALUES (51, 15, 'Adrastea', 'Lorem Ipsum Descriptum Moonnium', 330, false, 40);
INSERT INTO public.moon VALUES (52, 15, 'Carme', 'Lorem Ipsum Descriptum Moonnium', 8540, false, 80);
INSERT INTO public.moon VALUES (53, 15, 'Elara', 'Lorem Ipsum Descriptum Moonnium', 326, false, 90);
INSERT INTO public.moon VALUES (54, 15, 'Ananke', 'Lorem Ipsum Descriptum Moonnium', 55, false, 70);
INSERT INTO public.moon VALUES (55, 15, 'Thebe', 'Lorem Ipsum Descriptum Moonnium', 123, false, 40);
INSERT INTO public.moon VALUES (56, 15, 'Pasiphae', 'Lorem Ipsum Descriptum Moonnium', 432, false, 440);
INSERT INTO public.moon VALUES (57, 15, 'Kalyke', 'Lorem Ipsum Descriptum Moonnium', 778, true, 176);
INSERT INTO public.moon VALUES (58, 15, 'Callirrhoe', 'Lorem Ipsum Descriptum Moonnium', 1231, false, 632);
INSERT INTO public.moon VALUES (59, 15, 'Eirene', 'Lorem Ipsum Descriptum Moonnium', 11, false, 120);
INSERT INTO public.moon VALUES (60, 15, 'Eupheme', 'Lorem Ipsum Descriptum Moonnium', 1, false, 111);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 2, 'Mercury', '1st Rock From the sun', false, true, 98, 3031, 4503);
INSERT INTO public.planet VALUES (14, 2, 'Venus', '2nd Rock From the sun', false, true, 85, 7520, 4503);
INSERT INTO public.planet VALUES (15, 2, 'Earth', '3rd Rock From the sun', true, true, 0, 7917, 4543);
INSERT INTO public.planet VALUES (16, 2, 'Mars', 'The red planet', false, true, 156, 4212, 4603);
INSERT INTO public.planet VALUES (17, 2, 'Jupiter', 'First Gas Giant', false, false, 536, 86881, 4603);
INSERT INTO public.planet VALUES (18, 2, 'Saturn', 'Known for its rings', false, false, 951, 72367, 4503);
INSERT INTO public.planet VALUES (19, 2, 'Uranus', '7th Rock From the sun', false, false, 1922, 31518, 4503);
INSERT INTO public.planet VALUES (20, 2, 'Neptune', '8th Rock From the sun', false, true, 2855, 30599, 4503);
INSERT INTO public.planet VALUES (21, 2, 'Planet X', 'Lorem Ipsum lorem', true, true, 24513, 11452, 4216);
INSERT INTO public.planet VALUES (22, 2, 'Planet Y', 'Lorem Ipsum lorem', true, true, 24513, 11452, 4216);
INSERT INTO public.planet VALUES (23, 2, 'Planet Z', 'Lorem Ipsum lorem', true, true, 24513, 11452, 4216);
INSERT INTO public.planet VALUES (24, 2, 'Planet Bugg', 'Lorem Ipsum lorem', true, true, 24513, 11452, 4216);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Sputnik 1', 2141542);
INSERT INTO public.satellite VALUES (2, 'CubeSat', 11454214);
INSERT INTO public.satellite VALUES (3, 'Satell-548', 2125412);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 1, 'Sun', 'The bright thing in the sky', 21452, 865370, false, 5778, 4603000);
INSERT INTO public.star VALUES (3, 2, 'Alpheratz', 'Brightest star in Andromeda galaxy', 21452, 165000, false, 8500, 70);
INSERT INTO public.star VALUES (4, 1, 'Betelgeuse', '10th brightest star; in the constellation orion.', 21452, 152800, false, 3600, 8);
INSERT INTO public.star VALUES (5, 1, 'Rigel', 'blue supergiant star in the constellation orion', 21452, 700000, false, 11000, 8);
INSERT INTO public.star VALUES (6, 1, 'Delta Sagittarii', 'a double star in sagittarius', 21452, 32000, false, 4203, 260);
INSERT INTO public.star VALUES (7, 1, 'Alpha Ophiuchi', 'brightest star in the constellation ophiuchus', 21452, 5200, false, 8000, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 73, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 33, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


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

