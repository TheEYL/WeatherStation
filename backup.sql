--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.5
-- Dumped by pg_dump version 9.4.5
-- Started on 2016-02-27 18:36:30 WAT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 2053 (class 1262 OID 50036)
-- Name: simpleweatherstation; Type: DATABASE; Schema: -; Owner: stationuser
--

CREATE ROLE stationuser LOGIN
  ENCRYPTED PASSWORD 'md53aa26101b4253b51cf080e98d2e35a70'
  SUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;


CREATE DATABASE simpleweatherstation WITH TEMPLATE = template0 ;


ALTER DATABASE simpleweatherstation OWNER TO stationuser;

\connect simpleweatherstation

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 177 (class 3079 OID 11893)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2056 (class 0 OID 0)
-- Dependencies: 177
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 172 (class 1259 OID 50037)
-- Name: sensors_info; Type: TABLE; Schema: public; Owner: stationuser; Tablespace: 
--

CREATE TABLE sensors_info (
    sensor_data character varying(44),
    sensor_date date,
    id integer NOT NULL,
    sensor_time time without time zone,
    sensor_id integer NOT NULL
);


ALTER TABLE sensors_info OWNER TO stationuser;

--
-- TOC entry 173 (class 1259 OID 50040)
-- Name: sensor_info_id_seq; Type: SEQUENCE; Schema: public; Owner: stationuser
--

CREATE SEQUENCE sensor_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sensor_info_id_seq OWNER TO stationuser;

--
-- TOC entry 2057 (class 0 OID 0)
-- Dependencies: 173
-- Name: sensor_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stationuser
--

ALTER SEQUENCE sensor_info_id_seq OWNED BY sensors_info.id;


--
-- TOC entry 174 (class 1259 OID 50042)
-- Name: sensor_info_sensor_id_seq; Type: SEQUENCE; Schema: public; Owner: stationuser
--

CREATE SEQUENCE sensor_info_sensor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sensor_info_sensor_id_seq OWNER TO stationuser;

--
-- TOC entry 2058 (class 0 OID 0)
-- Dependencies: 174
-- Name: sensor_info_sensor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stationuser
--

ALTER SEQUENCE sensor_info_sensor_id_seq OWNED BY sensors_info.sensor_id;


--
-- TOC entry 175 (class 1259 OID 50044)
-- Name: sensors; Type: TABLE; Schema: public; Owner: stationuser; Tablespace: 
--

CREATE TABLE sensors (
    sensor_name character varying(44),
    sensor_type character varying(55),
    sensor_location character varying(44),
    sensor_update_time integer,
    sensor_id integer NOT NULL
);


ALTER TABLE sensors OWNER TO stationuser;

--
-- TOC entry 176 (class 1259 OID 50047)
-- Name: sensors_sensor_id_seq; Type: SEQUENCE; Schema: public; Owner: stationuser
--

CREATE SEQUENCE sensors_sensor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sensors_sensor_id_seq OWNER TO stationuser;

--
-- TOC entry 2059 (class 0 OID 0)
-- Dependencies: 176
-- Name: sensors_sensor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stationuser
--

ALTER SEQUENCE sensors_sensor_id_seq OWNED BY sensors.sensor_id;


--
-- TOC entry 1927 (class 2604 OID 50049)
-- Name: sensor_id; Type: DEFAULT; Schema: public; Owner: stationuser
--

ALTER TABLE ONLY sensors ALTER COLUMN sensor_id SET DEFAULT nextval('sensors_sensor_id_seq'::regclass);


--
-- TOC entry 1925 (class 2604 OID 50050)
-- Name: id; Type: DEFAULT; Schema: public; Owner: stationuser
--

ALTER TABLE ONLY sensors_info ALTER COLUMN id SET DEFAULT nextval('sensor_info_id_seq'::regclass);


--
-- TOC entry 1926 (class 2604 OID 50051)
-- Name: sensor_id; Type: DEFAULT; Schema: public; Owner: stationuser
--

ALTER TABLE ONLY sensors_info ALTER COLUMN sensor_id SET DEFAULT nextval('sensor_info_sensor_id_seq'::regclass);


--
-- TOC entry 2060 (class 0 OID 0)
-- Dependencies: 173
-- Name: sensor_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stationuser
--

SELECT pg_catalog.setval('sensor_info_id_seq', 123, true);


--
-- TOC entry 2061 (class 0 OID 0)
-- Dependencies: 174
-- Name: sensor_info_sensor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stationuser
--

SELECT pg_catalog.setval('sensor_info_sensor_id_seq', 1, false);


--
-- TOC entry 2047 (class 0 OID 50044)
-- Dependencies: 175
-- Data for Name: sensors; Type: TABLE DATA; Schema: public; Owner: stationuser
--

COPY sensors (sensor_name, sensor_type, sensor_location, sensor_update_time, sensor_id) FROM stdin;
bdb	TEMPERATURE	57.0,75.0	100	3
\.


--
-- TOC entry 2044 (class 0 OID 50037)
-- Dependencies: 172
-- Data for Name: sensors_info; Type: TABLE DATA; Schema: public; Owner: stationuser
--

COPY sensors_info (sensor_data, sensor_date, id, sensor_time, sensor_id) FROM stdin;
89	2016-02-27	5	18:28:39.442	3
44	2016-02-27	6	18:28:49.631	3
86	2016-02-27	7	18:29:03.634	3
22	2016-02-27	8	18:29:03.775	3
85	2016-02-27	9	18:29:03.908	3
23	2016-02-27	10	18:29:04.041	3
77	2016-02-27	11	18:29:04.186	3
3	2016-02-27	12	18:29:04.308	3
74	2016-02-27	13	18:29:04.43	3
57	2016-02-27	14	18:29:04.564	3
1	2016-02-27	15	18:29:04.697	3
0	2016-02-27	16	18:29:04.83	3
4	2016-02-27	17	18:29:04.952	3
67	2016-02-27	18	18:29:05.085	3
12	2016-02-27	19	18:29:05.241	3
54	2016-02-27	20	18:29:05.385	3
47	2016-02-27	21	18:29:05.529	3
85	2016-02-27	22	18:29:05.673	3
22	2016-02-27	23	18:29:05.818	3
88	2016-02-27	24	18:29:05.951	3
51	2016-02-27	25	18:29:06.095	3
85	2016-02-27	26	18:29:06.251	3
71	2016-02-27	27	18:29:06.417	3
68	2016-02-27	28	18:29:06.561	3
18	2016-02-27	29	18:29:06.706	3
87	2016-02-27	30	18:29:06.85	3
54	2016-02-27	31	18:29:07.027	3
65	2016-02-27	32	18:29:07.194	3
31	2016-02-27	33	18:29:07.361	3
33	2016-02-27	34	18:29:07.494	3
87	2016-02-27	35	18:29:07.638	3
3	2016-02-27	36	18:29:07.805	3
96	2016-02-27	37	18:29:08.016	3
24	2016-02-27	38	18:29:08.149	3
16	2016-02-27	39	18:29:08.293	3
22	2016-02-27	40	18:29:08.505	3
11	2016-02-27	41	18:29:08.649	3
41	2016-02-27	42	18:29:08.804	3
91	2016-02-27	43	18:29:08.949	3
78	2016-02-27	44	18:29:09.093	3
100	2016-02-27	45	18:29:09.237	3
2	2016-02-27	46	18:29:09.37	3
44	2016-02-27	47	18:29:09.515	3
48	2016-02-27	48	18:29:09.659	3
84	2016-02-27	49	18:29:09.803	3
40	2016-02-27	50	18:29:09.948	3
13	2016-02-27	51	18:29:10.081	3
19	2016-02-27	52	18:29:10.214	3
4	2016-02-27	53	18:29:10.348	3
16	2016-02-27	54	18:29:10.47	3
84	2016-02-27	55	18:29:10.614	3
21	2016-02-27	56	18:29:10.747	3
36	2016-02-27	57	18:29:10.88	3
36	2016-02-27	58	18:29:11.013	3
74	2016-02-27	59	18:29:11.157	3
80	2016-02-27	60	18:29:11.32	3
50	2016-02-27	61	18:29:11.457	3
20	2016-02-27	62	18:29:11.591	3
18	2016-02-27	63	18:29:11.735	3
96	2016-02-27	64	18:29:11.868	3
74	2016-02-27	65	18:29:12.012	3
56	2016-02-27	66	18:29:12.157	3
37	2016-02-27	67	18:29:12.301	3
70	2016-02-27	68	18:29:12.446	3
10	2016-02-27	69	18:29:12.578	3
32	2016-02-27	70	18:29:12.712	3
22	2016-02-27	71	18:29:12.856	3
59	2016-02-27	72	18:29:12.989	3
80	2016-02-27	73	18:29:13.163	3
13	2016-02-27	74	18:29:13.377	3
46	2016-02-27	75	18:29:13.522	3
14	2016-02-27	76	18:29:13.667	3
36	2016-02-27	77	18:29:13.8	3
14	2016-02-27	78	18:29:13.944	3
1	2016-02-27	79	18:29:14.077	3
59	2016-02-27	80	18:29:14.199	3
24	2016-02-27	81	18:29:14.344	3
16	2016-02-27	82	18:29:14.477	3
76	2016-02-27	83	18:29:14.61	3
26	2016-02-27	84	18:29:14.754	3
67	2016-02-27	85	18:29:14.888	3
48	2016-02-27	86	18:29:15.032	3
69	2016-02-27	87	18:29:15.176	3
41	2016-02-27	88	18:29:15.321	3
84	2016-02-27	89	18:29:15.465	3
71	2016-02-27	90	18:29:15.619	3
44	2016-02-27	91	18:29:15.754	3
39	2016-02-27	92	18:29:15.898	3
17	2016-02-27	93	18:29:16.042	3
28	2016-02-27	94	18:29:16.187	3
34	2016-02-27	95	18:29:16.331	3
88	2016-02-27	96	18:29:16.476	3
85	2016-02-27	97	18:29:16.609	3
58	2016-02-27	98	18:29:16.742	3
70	2016-02-27	99	18:29:16.875	3
80	2016-02-27	100	18:29:17.02	3
32	2016-02-27	101	18:29:17.164	3
71	2016-02-27	102	18:29:17.308	3
55	2016-02-27	103	18:29:17.453	3
50	2016-02-27	104	18:29:17.597	3
37	2016-02-27	105	18:29:17.752	3
5	2016-02-27	106	18:29:17.897	3
40	2016-02-27	107	18:29:18.041	3
90	2016-02-27	108	18:29:18.174	3
29	2016-02-27	109	18:29:18.319	3
20	2016-02-27	110	18:29:18.452	3
19	2016-02-27	111	18:29:18.608	3
16	2016-02-27	112	18:29:18.752	3
87	2016-02-27	113	18:29:18.896	3
44	2016-02-27	114	18:29:19.03	3
34	2016-02-27	115	18:29:19.174	3
91	2016-02-27	116	18:29:19.413	3
18	2016-02-27	117	18:29:19.584	3
96	2016-02-27	118	18:29:19.717	3
41	2016-02-27	119	18:29:19.862	3
54	2016-02-27	120	18:29:20.006	3
21	2016-02-27	121	18:29:20.139	3
49	2016-02-27	122	18:29:20.339	3
3	2016-02-27	123	18:29:20.51	3
\.


--
-- TOC entry 2062 (class 0 OID 0)
-- Dependencies: 176
-- Name: sensors_sensor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stationuser
--

SELECT pg_catalog.setval('sensors_sensor_id_seq', 4, true);


--
-- TOC entry 1931 (class 2606 OID 50053)
-- Name: name; Type: CONSTRAINT; Schema: public; Owner: stationuser; Tablespace: 
--

ALTER TABLE ONLY sensors
    ADD CONSTRAINT name UNIQUE (sensor_name);


--
-- TOC entry 1929 (class 2606 OID 50055)
-- Name: primKey; Type: CONSTRAINT; Schema: public; Owner: stationuser; Tablespace: 
--

ALTER TABLE ONLY sensors_info
    ADD CONSTRAINT "primKey" PRIMARY KEY (id);


--
-- TOC entry 1933 (class 2606 OID 50057)
-- Name: sensID; Type: CONSTRAINT; Schema: public; Owner: stationuser; Tablespace: 
--

ALTER TABLE ONLY sensors
    ADD CONSTRAINT "sensID" PRIMARY KEY (sensor_id);


--
-- TOC entry 1934 (class 2606 OID 50058)
-- Name: sensID; Type: FK CONSTRAINT; Schema: public; Owner: stationuser
--

ALTER TABLE ONLY sensors_info
    ADD CONSTRAINT "sensID" FOREIGN KEY (sensor_id) REFERENCES sensors(sensor_id);


--
-- TOC entry 2055 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-02-27 18:36:30 WAT

--
-- PostgreSQL database dump complete
--

