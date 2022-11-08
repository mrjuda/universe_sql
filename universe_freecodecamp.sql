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
    distance_mly numeric(7,3),
    age_byo integer,
    has_been_visited boolean DEFAULT false NOT NULL,
    times_visited integer DEFAULT 0 NOT NULL,
    details text
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
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_byo integer,
    distance_mly numeric(7,3),
    has_been_visited boolean DEFAULT false NOT NULL,
    times_visited integer DEFAULT 0 NOT NULL,
    details text
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
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_byo integer,
    distance_mly numeric(7,3),
    has_been_visited boolean DEFAULT false NOT NULL,
    times_visited integer DEFAULT 0 NOT NULL,
    details text
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
-- Name: space_ship; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_ship (
    space_ship_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    passengers_capacity integer DEFAULT 2 NOT NULL,
    autonomy_months integer DEFAULT 2 NOT NULL,
    weight_ton numeric(7,3),
    has_traveled boolean DEFAULT false NOT NULL,
    details text
);


ALTER TABLE public.space_ship OWNER TO freecodecamp;

--
-- Name: space_ship_space_ship_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_ship_space_ship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_ship_space_ship_id_seq OWNER TO freecodecamp;

--
-- Name: space_ship_space_ship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_ship_space_ship_id_seq OWNED BY public.space_ship.space_ship_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_byo integer,
    distance_mly numeric(7,3),
    has_been_visited boolean DEFAULT false NOT NULL,
    times_visited integer DEFAULT 0 NOT NULL,
    details text
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
-- Name: space_ship space_ship_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_ship ALTER COLUMN space_ship_id SET DEFAULT nextval('public.space_ship_space_ship_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0.000, 10, true, 93238, 'Has known and unknown forms of life');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 12.400, 11, false, 0, 'Once called the Great Andromeda Nebula, it is situated in the Andromeda constellation');
INSERT INTO public.galaxy VALUES (3, 'Triangululm', 325.600, 13, false, 0, 'Being a diffuse object, its visibility is strongly affected by even small amounts of light pollution');
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 925.700, 9, false, 0, 'has been spotted with the naked eye bt Stephen James of Meara');
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic', 117.600, 3, false, 0, 'Visible only from the southern hemisphere. It is also the brightest patch of nebulosity in the sky');
INSERT INTO public.galaxy VALUES (6, 'Virgo A', 632.000, 9, false, 0, 'A stellar stream in the contellation of Virgo, discovered in 2005');
INSERT INTO public.galaxy VALUES (7, 'Canis major', 197.300, 12, true, 1, 'A dwarf galaxy in the process of being pulled apart by the gravitational field of the more massive Milky Way galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', NULL, NULL, false, 0, 'The Marvelous lady of the night');
INSERT INTO public.moon VALUES (2, 2, 'Phobos', NULL, NULL, false, 0, 'Red Moon I');
INSERT INTO public.moon VALUES (3, 2, 'Deimos', NULL, NULL, false, 0, 'Red Moon II');
INSERT INTO public.moon VALUES (4, 3, 'Europa', NULL, NULL, false, 0, 'Another Jupiters giant moon');
INSERT INTO public.moon VALUES (5, 3, 'Ganimedes', NULL, NULL, false, 0, 'Another Jupiters giant moon');
INSERT INTO public.moon VALUES (6, 3, 'Calisto', NULL, NULL, false, 0, 'Another Jupiters giant moon');
INSERT INTO public.moon VALUES (7, 3, 'Amalteia', NULL, NULL, false, 0, 'Another Jupiters giant moon');
INSERT INTO public.moon VALUES (8, 3, 'Adrasteia', NULL, NULL, false, 0, 'Another Jupiters giant moon');
INSERT INTO public.moon VALUES (9, 3, 'Tebe', NULL, NULL, false, 0, 'Another Jupiters giant moon');
INSERT INTO public.moon VALUES (10, 3, 'Himalia', NULL, NULL, false, 0, 'Another Jupiters giant moon');
INSERT INTO public.moon VALUES (11, 3, 'IO', NULL, NULL, false, 0, 'Another Jupiters giant moon');
INSERT INTO public.moon VALUES (12, 6, 'ThreatLandMoon', NULL, NULL, false, 0, '');
INSERT INTO public.moon VALUES (13, 7, 'EarthCousantMoon', NULL, NULL, false, 0, '');
INSERT INTO public.moon VALUES (14, 8, 'EarthEnemyMoon', NULL, NULL, false, 0, '');
INSERT INTO public.moon VALUES (15, 9, 'WhyNotLiveHereMoon', NULL, NULL, false, 0, '');
INSERT INTO public.moon VALUES (16, 10, 'Far Far Away Moon', NULL, NULL, false, 0, '');
INSERT INTO public.moon VALUES (17, 11, 'Not your home moon', NULL, NULL, false, 0, '');
INSERT INTO public.moon VALUES (18, 12, 'WAYLAM', NULL, NULL, false, 0, '');
INSERT INTO public.moon VALUES (19, 13, 'The Sirius Black Moon', NULL, NULL, false, 0, '');
INSERT INTO public.moon VALUES (20, 14, 'The Aggressive Aliens Moon', NULL, NULL, false, 0, '');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', NULL, NULL, false, 0, 'Home to 8 billions of humans');
INSERT INTO public.planet VALUES (2, 1, 'Mars', NULL, NULL, false, 0, 'Home to billions of invisible red martians');
INSERT INTO public.planet VALUES (3, 1, 'Jupiter', NULL, NULL, false, 0, 'The giant hamburger');
INSERT INTO public.planet VALUES (4, 2, 'RedPsychosis', NULL, NULL, false, 0, 'The red diamond factory');
INSERT INTO public.planet VALUES (5, 3, 'OrionMaker', NULL, NULL, false, 0, '');
INSERT INTO public.planet VALUES (6, 3, 'ThreatLand', NULL, NULL, false, 0, '');
INSERT INTO public.planet VALUES (7, 4, 'EarthCousant', NULL, NULL, false, 0, '');
INSERT INTO public.planet VALUES (8, 4, 'EarthEnemy', NULL, NULL, false, 0, '');
INSERT INTO public.planet VALUES (9, 5, 'WhyNotLiveHere', NULL, NULL, false, 0, '');
INSERT INTO public.planet VALUES (10, 5, 'Far Far Away', NULL, NULL, false, 0, 'Too far away for visiting');
INSERT INTO public.planet VALUES (11, 6, 'Not your home', NULL, NULL, false, 0, 'Not for visiting');
INSERT INTO public.planet VALUES (12, 6, 'What r u looking at?', NULL, NULL, false, 0, 'Nothing to look at here');
INSERT INTO public.planet VALUES (14, 7, 'Aggressive Aliens Home', NULL, NULL, false, 0, '');
INSERT INTO public.planet VALUES (13, 7, 'The Sirius black home', NULL, NULL, true, 1, 'Home to Harry Potters best friend Sirius Black');


--
-- Data for Name: space_ship; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_ship VALUES (1, 1, 'Apollo 10', 2, 5, 2.400, true, 'Almost took human kind to the Moon');
INSERT INTO public.space_ship VALUES (5, 13, 'The Sirius Black Space Bus', 9000, 5000, 19.400, true, 'Brought Sirius Black and his family back to Hogwarts to fight Voldemorts army');
INSERT INTO public.space_ship VALUES (2, 1, 'Apollo 11', 3, 5, 2.400, true, 'Actually took human kind to the Moon');
INSERT INTO public.space_ship VALUES (4, 2, 'Mars I', 400, 500, 12.400, false, 'Will bring martians to Earth (Allegedly)');
INSERT INTO public.space_ship VALUES (3, 1, 'Apollo 14', 10, 5, 2.400, false, 'Will take human kind to Mars (Allegedly)');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 3256, 0.000, true, 29, 'A nearly perfect ball of hot plasma');
INSERT INTO public.star VALUES (2, 2, 'Alpha', 313, 0.002, false, 0, 'The brightest star in the onstellation of Andromeda');
INSERT INTO public.star VALUES (3, 3, 'Gama Trianguli', 0, 12.530, false, 0, 'A binary star system in the contellation Triangulum');
INSERT INTO public.star VALUES (4, 4, 'Proxima Centauri', 9448, 10.270, false, 0, 'A red dwarf that forms a visual double with Alpha Centauri');
INSERT INTO public.star VALUES (5, 5, 'R71', 89346, 742.610, false, 0, 'A luminous blue variable and is one of the most luminous stars in the LMC');
INSERT INTO public.star VALUES (6, 6, 'Epsilon Virginis', 63431, 928.420, false, 0, 'A star in the zodiac constellation of Virgo');
INSERT INTO public.star VALUES (7, 7, 'Sirius', 951, 26.320, true, 1, 'The brightest star in the night sky, known as The Dog Star');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: space_ship_space_ship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_ship_space_ship_id_seq', 5, true);


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
-- Name: space_ship space_ship_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_ship
    ADD CONSTRAINT space_ship_name_key UNIQUE (name);


--
-- Name: space_ship space_ship_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_ship
    ADD CONSTRAINT space_ship_pkey PRIMARY KEY (space_ship_id);


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
-- Name: space_ship space_ship_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_ship
    ADD CONSTRAINT space_ship_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

