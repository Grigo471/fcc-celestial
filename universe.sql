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
-- Name: cosmonaut; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.cosmonaut (
    cosmonaut_id integer NOT NULL,
    name character varying(100) NOT NULL,
    country character varying(100) NOT NULL
);


ALTER TABLE public.cosmonaut OWNER TO freecodecamp;

--
-- Name: cosmonauts_cosmonaut_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.cosmonauts_cosmonaut_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cosmonauts_cosmonaut_id_seq OWNER TO freecodecamp;

--
-- Name: cosmonauts_cosmonaut_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.cosmonauts_cosmonaut_id_seq OWNED BY public.cosmonaut.cosmonaut_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    magnitude numeric(4,2),
    distance_mly numeric(4,2) NOT NULL,
    constellation text
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
    name character varying(100) NOT NULL,
    planet_id integer,
    is_in_solar boolean,
    radius_km integer
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
    name character varying(100) NOT NULL,
    star_id integer,
    has_life boolean NOT NULL,
    mass numeric(6,3),
    radius numeric(4,1)
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
    name character varying(100) NOT NULL,
    galaxy_id integer,
    radius numeric(4,1) NOT NULL,
    distance_pc integer,
    mass numeric(4,1)
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
-- Name: cosmonaut cosmonaut_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cosmonaut ALTER COLUMN cosmonaut_id SET DEFAULT nextval('public.cosmonauts_cosmonaut_id_seq'::regclass);


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
-- Data for Name: cosmonaut; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.cosmonaut VALUES (1, 'Yuri Gagarin', 'USSR');
INSERT INTO public.cosmonaut VALUES (2, 'Neil Armstrong', 'USA');
INSERT INTO public.cosmonaut VALUES (3, 'Alexey Leonov', 'USA');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', -6.00, 0.00, 'Sagittarius');
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 0.00, 0.16, 'Dorado/Mensa');
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', 2.70, 0.20, 'Tucana');
INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy', 3.40, 2.50, 'Andromeda');
INSERT INTO public.galaxy VALUES (5, 'Sculptor Galaxy', 7.20, 12.00, 'Sculptor');
INSERT INTO public.galaxy VALUES (6, 'Bodes Galaxy', 6.94, 12.00, 'Ursa Major');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, true, 1738);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, true, 11267);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, true, 6);
INSERT INTO public.moon VALUES (4, 'Io', 5, true, 1821);
INSERT INTO public.moon VALUES (5, 'Europa', 5, true, 1560);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, true, 2634);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, true, 2410);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, true, 83);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, true, 70);
INSERT INTO public.moon VALUES (10, 'Elara', 5, true, 43);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 5, true, 30);
INSERT INTO public.moon VALUES (12, 'Sinope', 5, true, 19);
INSERT INTO public.moon VALUES (13, 'Lysithea', 5, true, 18);
INSERT INTO public.moon VALUES (14, 'Carme', 5, true, 23);
INSERT INTO public.moon VALUES (15, 'Ananke', 5, true, 14);
INSERT INTO public.moon VALUES (16, 'Leda', 5, true, 10);
INSERT INTO public.moon VALUES (17, 'Thebe', 5, true, 49);
INSERT INTO public.moon VALUES (18, 'Adrastea', 5, true, 8);
INSERT INTO public.moon VALUES (19, 'Metis', 5, true, 21);
INSERT INTO public.moon VALUES (20, 'Callirhoe', 5, true, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, 0.060, 0.4);
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, 0.800, 0.9);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, 1.000, 1.0);
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, 0.100, 0.5);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, 317.800, 11.2);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, 95.200, 9.5);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, 14.600, 4.0);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, 17.200, 3.9);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, false, 0.100, 0.0);
INSERT INTO public.planet VALUES (10, 'Kepler-90b', 4, false, NULL, 1.3);
INSERT INTO public.planet VALUES (11, 'Kepler-90c', 4, false, NULL, 1.2);
INSERT INTO public.planet VALUES (12, 'Kepler-90i', 4, false, NULL, 1.3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.0, 0, 1.0);
INSERT INTO public.star VALUES (2, 'R71', 2, 107.0, 50, 27.0);
INSERT INTO public.star VALUES (3, 'AB8', 3, 2.0, 61000, 19.0);
INSERT INTO public.star VALUES (4, 'Kepler-90', 1, 1.2, 780, 1.2);
INSERT INTO public.star VALUES (5, 'Nembus', 4, 21.5, 52, 2.3);
INSERT INTO public.star VALUES (6, 'Titawin', 4, 1.7, 13, 1.3);


--
-- Name: cosmonauts_cosmonaut_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.cosmonauts_cosmonaut_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: cosmonaut cosmonauts_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cosmonaut
    ADD CONSTRAINT cosmonauts_name_key UNIQUE (name);


--
-- Name: cosmonaut cosmonauts_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cosmonaut
    ADD CONSTRAINT cosmonauts_pkey PRIMARY KEY (cosmonaut_id);


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

