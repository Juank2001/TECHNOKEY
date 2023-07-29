--
-- PostgreSQL database cluster dump
--

-- Started on 2023-07-29 12:57:47

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-07-29 12:57:47

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

-- Completed on 2023-07-29 12:57:47

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-07-29 12:57:47

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

--
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3341 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16426)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(225) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16425)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 3342 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 218 (class 1259 OID 16445)
-- Name: vuelos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vuelos (
    vuelo_id integer NOT NULL,
    fecha date NOT NULL,
    hora_salida time without time zone NOT NULL,
    hora_llegada time without time zone,
    tiempo time without time zone,
    destino character varying(50) NOT NULL,
    origen character varying(50),
    costo double precision NOT NULL
);


ALTER TABLE public.vuelos OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16444)
-- Name: vuelos_vuelo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vuelos_vuelo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vuelos_vuelo_id_seq OWNER TO postgres;

--
-- TOC entry 3343 (class 0 OID 0)
-- Dependencies: 217
-- Name: vuelos_vuelo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vuelos_vuelo_id_seq OWNED BY public.vuelos.vuelo_id;


--
-- TOC entry 3179 (class 2604 OID 16429)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 3181 (class 2604 OID 16448)
-- Name: vuelos vuelo_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelos ALTER COLUMN vuelo_id SET DEFAULT nextval('public.vuelos_vuelo_id_seq'::regclass);


--
-- TOC entry 3333 (class 0 OID 16426)
-- Dependencies: 216
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, email, password, created_at) FROM stdin;
1	usuario1	usuario1test.com	password	2023-07-29 09:18:02.327765
\.


--
-- TOC entry 3335 (class 0 OID 16445)
-- Dependencies: 218
-- Data for Name: vuelos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vuelos (vuelo_id, fecha, hora_salida, hora_llegada, tiempo, destino, origen, costo) FROM stdin;
3	2023-07-29	11:41:49	\N	\N	Medellin	bogota	500000
1	2023-07-29	11:26:01	12:36:52	01:10:51	Madrid	Bogota	3000000
2	2023-07-29	11:40:59	12:37:59	00:57:00	España	Medellin	2000000
4	2023-07-29	12:38:55	\N	\N	España	bogota	2000000
5	2023-07-29	12:39:00	\N	\N	España	bogota	2000000
6	2023-07-29	12:39:04	\N	\N	España	bogota	2000000
7	2023-07-29	12:39:07	\N	\N	España	bogota	2000000
8	2023-07-29	12:39:10	\N	\N	España	bogota	2000000
9	2023-07-29	12:39:13	\N	\N	España	bogota	2000000
10	2023-07-29	12:39:16	\N	\N	España	bogota	2000000
11	2023-07-29	12:39:19	\N	\N	España	bogota	2000000
12	2023-07-29	12:39:22	\N	\N	España	bogota	2000000
\.


--
-- TOC entry 3344 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, true);


--
-- TOC entry 3345 (class 0 OID 0)
-- Dependencies: 217
-- Name: vuelos_vuelo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vuelos_vuelo_id_seq', 12, true);


--
-- TOC entry 3183 (class 2606 OID 16436)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3185 (class 2606 OID 16432)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3187 (class 2606 OID 16434)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 3189 (class 2606 OID 16450)
-- Name: vuelos vuelos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vuelos
    ADD CONSTRAINT vuelos_pkey PRIMARY KEY (vuelo_id);


-- Completed on 2023-07-29 12:57:48

--
-- PostgreSQL database dump complete
--

--
-- Database "prueba" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-07-29 12:57:48

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

--
-- TOC entry 3330 (class 1262 OID 16398)
-- Name: prueba; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE prueba WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';


ALTER DATABASE prueba OWNER TO postgres;

\connect prueba

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
-- TOC entry 215 (class 1259 OID 16400)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(225) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16399)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 3331 (class 0 OID 0)
-- Dependencies: 214
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 3173 (class 2604 OID 16403)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 3324 (class 0 OID 16400)
-- Dependencies: 215
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, email, password, created_at) FROM stdin;
1	usuario1	usuario1test.com	password	2023-07-28 10:36:34.11033
2	usuario2	usuario2test.com	password	2023-07-28 10:36:34.116556
\.


--
-- TOC entry 3332 (class 0 OID 0)
-- Dependencies: 214
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 2, true);


--
-- TOC entry 3176 (class 2606 OID 16410)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3178 (class 2606 OID 16406)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3180 (class 2606 OID 16408)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


-- Completed on 2023-07-29 12:57:48

--
-- PostgreSQL database dump complete
--

--
-- Database "pruebaTecnica" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-07-29 12:57:48

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

--
-- TOC entry 3315 (class 1262 OID 16411)
-- Name: pruebaTecnica; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "pruebaTecnica" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';


ALTER DATABASE "pruebaTecnica" OWNER TO postgres;

\connect "pruebaTecnica"

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

-- Completed on 2023-07-29 12:57:48

--
-- PostgreSQL database dump complete
--

-- Completed on 2023-07-29 12:57:48

--
-- PostgreSQL database cluster dump complete
--

