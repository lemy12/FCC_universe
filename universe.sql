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
    name character varying(30) NOT NULL,
    planetsnumber integer,
    age integer NOT NULL,
    area numeric(2,0),
    altname text,
    seenfromearth boolean,
    hassun boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance integer,
    age integer NOT NULL,
    area numeric(2,0),
    altname text,
    habitable boolean,
    has_water boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance integer,
    age integer NOT NULL,
    area numeric(2,0),
    altname text,
    habitable boolean,
    has_water boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: space_ships; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_ships (
    space_ships_id integer NOT NULL,
    name character varying(30) NOT NULL,
    nationality text NOT NULL,
    aboard text,
    galaxy_id integer,
    planet_id integer
);


ALTER TABLE public.space_ships OWNER TO freecodecamp;

--
-- Name: space_ships_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_ships_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_ships_id_seq OWNER TO freecodecamp;

--
-- Name: space_ships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_ships_id_seq OWNED BY public.space_ships.space_ships_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance integer,
    age integer NOT NULL,
    area numeric(2,0),
    altname text,
    part_of_const boolean,
    seen_from_everywhere boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: space_ships space_ships_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_ships ALTER COLUMN space_ships_id SET DEFAULT nextval('public.space_ships_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Solar System', 9, 90000, 67, 'Ours', true, true);
INSERT INTO public.galaxy VALUES (2, 'Ulad System', 4, 2, 77, 'Ulad', true, true);
INSERT INTO public.galaxy VALUES (3, 'Nein System', 9, 9, 20, 'Nine', false, true);
INSERT INTO public.galaxy VALUES (4, 'True System', 1554, 7, 67, 'Only', false, false);
INSERT INTO public.galaxy VALUES (5, 'Trek System', 653, 2, 55, 'Brrr', true, true);
INSERT INTO public.galaxy VALUES (6, 'Ulada System', 4, 2, 77, 'Ulad', true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moona', 44, 12123, 55, 'Ksiezyc', true, true, 1);
INSERT INTO public.moon VALUES (2, 'Moonb', 44, 12123, 55, 'Ksiezyc', true, true, 2);
INSERT INTO public.moon VALUES (3, 'Moonc', 44, 12123, 55, 'Ksiezyc', true, true, 2);
INSERT INTO public.moon VALUES (4, 'Moond', 44, 12123, 55, 'Ksiezyc', true, true, 2);
INSERT INTO public.moon VALUES (5, 'Moone', 44, 12123, 55, 'Ksiezyc', true, true, 3);
INSERT INTO public.moon VALUES (6, 'Moonf', 44, 12123, 55, 'Ksiezyc', true, true, 4);
INSERT INTO public.moon VALUES (7, 'Moong', 44, 12123, 55, 'Ksiezyc', true, true, 4);
INSERT INTO public.moon VALUES (8, 'Moonh', 44, 12123, 55, 'Ksiezyc', true, true, 4);
INSERT INTO public.moon VALUES (9, 'Mooni', 44, 12123, 55, 'Ksiezyc', true, true, 5);
INSERT INTO public.moon VALUES (10, 'Moonj', 44, 12123, 55, 'Ksiezyc', true, true, 7);
INSERT INTO public.moon VALUES (11, 'Moonk', 44, 12123, 55, 'Ksiezyc', true, true, 7);
INSERT INTO public.moon VALUES (12, 'Moonl', 44, 12123, 55, 'Ksiezyc', true, true, 7);
INSERT INTO public.moon VALUES (13, 'Moonm', 44, 12123, 55, 'Ksiezyc', true, true, 8);
INSERT INTO public.moon VALUES (14, 'Moonn', 44, 12123, 55, 'Ksiezyc', true, true, 8);
INSERT INTO public.moon VALUES (15, 'Moono', 44, 12123, 55, 'Ksiezyc', true, true, 9);
INSERT INTO public.moon VALUES (16, 'Moonp', 44, 12123, 55, 'Ksiezyc', true, true, 9);
INSERT INTO public.moon VALUES (17, 'Moonq', 44, 12123, 55, 'Ksiezyc', true, true, 9);
INSERT INTO public.moon VALUES (18, 'Moonr', 44, 12123, 55, 'Ksiezyc', true, true, 9);
INSERT INTO public.moon VALUES (19, 'Moons', 44, 12123, 55, 'Ksiezyc', true, true, 10);
INSERT INTO public.moon VALUES (20, 'Moont', 44, 12123, 55, 'Ksiezyc', true, true, 11);
INSERT INTO public.moon VALUES (21, 'Moonu', 44, 12123, 55, 'Ksiezyc', true, true, 11);
INSERT INTO public.moon VALUES (22, 'Moonw', 44, 12123, 55, 'Ksiezyc', true, true, 11);
INSERT INTO public.moon VALUES (23, 'Moonx', 44, 12123, 55, 'Ksiezyc', true, true, 12);
INSERT INTO public.moon VALUES (24, 'Moony', 44, 12123, 55, 'Ksiezyc', true, true, 12);
INSERT INTO public.moon VALUES (25, 'Moonz', 44, 12123, 55, 'Ksiezyc', true, true, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Planeta', 6612, 23, 89, 'PLANET', false, true, 1);
INSERT INTO public.planet VALUES (2, 'Planetb', 6612, 23, 89, 'PLANET', false, true, 1);
INSERT INTO public.planet VALUES (3, 'Planetc', 6612, 23, 89, 'PLANET', false, true, 2);
INSERT INTO public.planet VALUES (4, 'Planetd', 6612, 23, 89, 'PLANET', false, true, 2);
INSERT INTO public.planet VALUES (5, 'Planete', 6612, 23, 89, 'PLANET', false, true, 3);
INSERT INTO public.planet VALUES (6, 'Planetf', 6612, 23, 89, 'PLANET', false, true, 3);
INSERT INTO public.planet VALUES (7, 'Planetg', 6612, 23, 89, 'PLANET', false, true, 4);
INSERT INTO public.planet VALUES (8, 'Planeth', 6612, 23, 89, 'PLANET', false, true, 4);
INSERT INTO public.planet VALUES (9, 'Planeti', 6612, 23, 89, 'PLANET', false, true, 5);
INSERT INTO public.planet VALUES (10, 'Planetj', 6612, 23, 89, 'PLANET', false, true, 5);
INSERT INTO public.planet VALUES (11, 'Planetk', 6612, 23, 89, 'PLANET', false, true, 6);
INSERT INTO public.planet VALUES (12, 'Planetl', 6612, 23, 89, 'PLANET', false, true, 6);


--
-- Data for Name: space_ships; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_ships VALUES (1, 'Spaceship A', 'American', 'John Doe', 4, 7);
INSERT INTO public.space_ships VALUES (2, 'Spaceship B', 'Brazilian', 'None', 1, 1);
INSERT INTO public.space_ships VALUES (3, 'Spaceship C', 'Canadian', 'Jane Doe', 3, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Stara', 55, 346, 78, 'Starrr', true, NULL, 1);
INSERT INTO public.star VALUES (2, 'Starb', 55, 346, 78, 'Starrr', true, NULL, 2);
INSERT INTO public.star VALUES (3, 'Starc', 55, 346, 78, 'Starrr', true, NULL, 3);
INSERT INTO public.star VALUES (4, 'Stard', 55, 346, 78, 'Starrr', true, NULL, 4);
INSERT INTO public.star VALUES (5, 'Stare', 55, 346, 78, 'Starrr', true, NULL, 5);
INSERT INTO public.star VALUES (6, 'Starf', 55, 346, 78, 'Starrr', true, NULL, 6);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 25, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: space_ships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_ships_id_seq', 3, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: moon name_unique_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_unique_moon UNIQUE (name);


--
-- Name: planet name_unique_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name_unique_planet UNIQUE (name);


--
-- Name: star name_unique_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name_unique_star UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: space_ships space_ships_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_ships
    ADD CONSTRAINT space_ships_name_key UNIQUE (name);


--
-- Name: space_ships space_ships_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_ships
    ADD CONSTRAINT space_ships_pkey PRIMARY KEY (space_ships_id);


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
-- Name: space_ships space_ships_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_ships
    ADD CONSTRAINT space_ships_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: space_ships space_ships_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_ships
    ADD CONSTRAINT space_ships_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

