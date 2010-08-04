--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.referal DROP CONSTRAINT referal_pkey;
ALTER TABLE ONLY public.reason DROP CONSTRAINT reason_pkey;
ALTER TABLE ONLY public.patients DROP CONSTRAINT patients_pkey;
ALTER TABLE ONLY public.logistics DROP CONSTRAINT logistics_pkey;
ALTER TABLE ONLY public.information DROP CONSTRAINT information_pkey;
ALTER TABLE ONLY public.imported DROP CONSTRAINT imported_pkey;
ALTER TABLE ONLY public.email DROP CONSTRAINT email_pkey;
ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pkey;
ALTER TABLE ONLY public.camp_locations DROP CONSTRAINT camp_locations_pkey;
ALTER TABLE ONLY public.camp_locations DROP CONSTRAINT camp_locations_location_id_key;
ALTER TABLE public.referal ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.reason ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.patients ALTER COLUMN pid DROP DEFAULT;
ALTER TABLE public.logistics ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.information ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.imported ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.email ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.clients ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.camp_locations ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.referal_id_seq;
DROP TABLE public.referal;
DROP SEQUENCE public.reason_id_seq;
DROP TABLE public.reason;
DROP SEQUENCE public.patients_pid_seq;
DROP TABLE public.patients;
DROP TABLE public.medical_informations;
DROP SEQUENCE public.logistics_id_seq;
DROP TABLE public.logistics;
DROP SEQUENCE public.information_id_seq;
DROP TABLE public.information;
DROP SEQUENCE public.imported_id_seq;
DROP TABLE public.imported;
DROP SEQUENCE public.email_id_seq;
DROP TABLE public.email;
DROP SEQUENCE public.clients_id_seq;
DROP TABLE public.clients;
DROP SEQUENCE public.camp_locations_id_seq;
DROP TABLE public.camp_locations;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: camp_locations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE camp_locations (
    id integer NOT NULL,
    location_id character varying,
    name character varying,
    site_type character varying,
    location_type character varying,
    latitude character varying,
    longitude character varying,
    belongs_to character varying
);


--
-- Name: camp_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE camp_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: camp_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE camp_locations_id_seq OWNED BY camp_locations.id;


--
-- Name: camp_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('camp_locations_id_seq', 683, true);


--
-- Name: clients; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE clients (
    id integer NOT NULL,
    date timestamp without time zone NOT NULL,
    site_id character varying NOT NULL,
    counsellor character varying,
    return_visit boolean,
    new_code boolean,
    client_code character varying,
    partner_code character varying,
    mother_maiden_name character varying,
    sex integer,
    age integer,
    occupation integer,
    education integer,
    martial_status integer,
    seen_as integer,
    pregnant integer,
    service_requiered integer,
    ever_sex boolean,
    hetrosexual_partners integer,
    homosexual_partners integer,
    condom_steady_patner integer,
    condom_non_steady_patner integer,
    condom_last_sex integer,
    not_tested_why integer,
    tested_before integer,
    hiv_test_1 integer,
    hiv_test_2 integer,
    tie_breaker integer,
    hiv_result integer,
    syphilis_result integer,
    couple_dicordant integer,
    condoms_given integer,
    created timestamp
);


--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE clients_id_seq OWNED BY clients.id;


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('clients_id_seq', 1600, true);


--
-- Name: email; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE email (
    id integer NOT NULL,
    mail_number integer,
    date timestamp without time zone,
    subject character varying,
    from_address character varying
);


--
-- Name: email_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE email_id_seq OWNED BY email.id;


--
-- Name: email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_id_seq', 1, true);


--
-- Name: imported; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE imported (
    id integer NOT NULL,
    test_site_id integer,
    province integer,
    district integer,
    date timestamp without time zone,
    number integer,
    created timestamp without time zone NOT NULL
);


--
-- Name: imported_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE imported_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: imported_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE imported_id_seq OWNED BY imported.id;


--
-- Name: imported_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('imported_id_seq', 1, false);


--
-- Name: information; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE information (
    id integer NOT NULL,
    client_id integer NOT NULL,
    information_id integer NOT NULL,
    created timestamp
);


--
-- Name: information_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE information_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: information_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE information_id_seq OWNED BY information.id;


--
-- Name: information_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('information_id_seq', 4123, true);


--
-- Name: logistics; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE logistics (
    id integer NOT NULL,
    site_id character varying NOT NULL,
    date timestamp without time zone,
    care_packs integer,
    hiv_tests integer,
    created timestamp
);


--
-- Name: logistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE logistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: logistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE logistics_id_seq OWNED BY logistics.id;


--
-- Name: logistics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('logistics_id_seq', 8, true);


--
-- Name: medical_informations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE medical_informations (
    pid integer NOT NULL,
    patient_source_id integer,
    funding_id integer,
    hiv_positive_date date,
    hiv_positive_test_location_id character varying,
    hiv_positive_clinic_start_date date,
    hiv_positive_who_stage integer,
    art_naive boolean,
    art_service_type_id integer,
    art_first_start_date date,
    art_eligibility_date date,
    art_indication_id integer,
    transfer_in_date date,
    transfer_in_district_id integer,
    transfer_in_facility character varying,
    transfer_out_date date,
    transfer_out_event text,
    date_pep_start date,
    pep_reason_id integer,
    art_eligible_who_stage integer,
    art_eligible_cd4 integer,
    art_start_weight numeric,
    art_start_height numeric,
    art_start_who_stage integer,
    art_second_start_date date,
    art_second_line_reason_id integer,
    drug_allergies character varying,
    user_id integer,
    created timestamp without time zone,
    modified timestamp without time zone
);


--
-- Name: patients; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE patients (
    pid integer NOT NULL,
    upn character varying,
    old_upn character varying,
    arvid character varying,
    vfcc character varying,
    surname character varying NOT NULL,
    forenames character varying NOT NULL,
    date_of_birth date,
    year_of_birth integer,
    sex character varying,
    mother character varying,
    occupation_id integer,
    education_id integer,
    marital_status_id integer,
    telephone_number character varying,
    location_id integer,
    village character varying,
    home character varying,
    nearest_church character varying,
    nearest_school character varying,
    nearest_health_centre character varying,
    nearest_major_landmark character varying,
    vf_testing_site character varying,
    status boolean DEFAULT true NOT NULL,
    inactive_reason_id integer,
    status_timestamp date,
    treatment_supporter_name character varying,
    treatment_supporter_relationship character varying,
    treatment_supporter_address character varying,
    treatment_supporter_telephone_number character varying,
    user_id integer,
    created timestamp without time zone,
    modified timestamp without time zone
);


--
-- Name: patients_pid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE patients_pid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: patients_pid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE patients_pid_seq OWNED BY patients.pid;


--
-- Name: patients_pid_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('patients_pid_seq', 1, false);


--
-- Name: reason; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reason (
    id integer NOT NULL,
    client_id integer NOT NULL,
    reason_id integer NOT NULL,
    created timestamp
);


--
-- Name: reason_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE reason_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: reason_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE reason_id_seq OWNED BY reason.id;


--
-- Name: reason_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('reason_id_seq', 3988, true);


--
-- Name: referal; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE referal (
    id integer NOT NULL,
    client_id integer NOT NULL,
    referal_id integer NOT NULL,
    created timestamp
);


--
-- Name: referal_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE referal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: referal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE referal_id_seq OWNED BY referal.id;


--
-- Name: referal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('referal_id_seq', 3880, true);


--
-- Name: result_values; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE result_values (
    id integer NOT NULL,
    result_id integer NOT NULL,
    value_decimal double precision,
    value_text character varying,
    value_lookup integer,
    user_id integer NOT NULL,
    created timestamp without time zone NOT NULL,
    modified timestamp without time zone NOT NULL
);


--
-- Name: result_values_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE result_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: result_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE result_values_id_seq OWNED BY result_values.id;


--
-- Name: result_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('result_values_id_seq', 1, true);


--
-- Name: results; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE results (
    id integer NOT NULL,
    pid integer NOT NULL,
    test_id integer NOT NULL,
    test_performed timestamp without time zone,
    created timestamp without time zone NOT NULL,
    modified timestamp without time zone NOT NULL,
    requesting_clinician character varying,
    user_id integer NOT NULL
);


--
-- Name: results_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE results_id_seq OWNED BY results.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE camp_locations ALTER COLUMN id SET DEFAULT nextval('camp_locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE clients ALTER COLUMN id SET DEFAULT nextval('clients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE email ALTER COLUMN id SET DEFAULT nextval('email_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE imported ALTER COLUMN id SET DEFAULT nextval('imported_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE information ALTER COLUMN id SET DEFAULT nextval('information_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE logistics ALTER COLUMN id SET DEFAULT nextval('logistics_id_seq'::regclass);


--
-- Name: pid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE patients ALTER COLUMN pid SET DEFAULT nextval('patients_pid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE reason ALTER COLUMN id SET DEFAULT nextval('reason_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE referal ALTER COLUMN id SET DEFAULT nextval('referal_id_seq'::regclass);
--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE result_values ALTER COLUMN id SET DEFAULT nextval('result_values_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE results ALTER COLUMN id SET DEFAULT nextval('results_id_seq'::regclass);


--
-- Data for Name: camp_locations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY camp_locations (id, location_id, name, site_type, location_type, latitude, longitude, belongs_to) FROM stdin;
1	A	Busia	\N	zone	\N	\N	\N
2	B	Bungoma	\N	zone	\N	\N	\N
3	C	Kakamega	\N	zone	\N	\N	\N
4	D	Vihiga	\N	zone	\N	\N	\N
5	1	Bunyala	\N	district	\N	\N	A
6	2	Samia	\N	district	\N	\N	A
7	3	Busia	\N	district	\N	\N	A
8	4	Teso	\N	district	\N	\N	A
9	5	Bungoma South	\N	district	\N	\N	B
10	6	Bungoma West	\N	district	\N	\N	B
11	7	Mt Elgon	\N	district	\N	\N	B
12	8	Bungoma East	\N	district	\N	\N	B
13	9	Bungoma North	\N	district	\N	\N	B
14	10	Mumias	\N	district	\N	\N	C
15	11	Kakamega Central	\N	district	\N	\N	C
16	12	Kakamega North	\N	district	\N	\N	C
17	13	Lugari	\N	district	\N	\N	C
18	14	Butere	\N	district	\N	\N	C
19	15	Kakamega South	\N	district	\N	\N	C
20	16	Kakamega East	\N	district	\N	\N	C
21	17	Emuhaya	\N	district	\N	\N	D
22	18	Vihiga	\N	district	\N	\N	D
23	19	Hamisi	\N	district	\N	\N	D
24	A01001	Port Victoria	Sub-District Hospital/Ccc	site	.0970	3.9758	1
25	A01002	Budalangi	Dispensary	site	.1305	4.0277	1
26	A01003	Sisenye	Dispensary	site	.1412	4.0144	1
27	A01004	Sirimba	Mission Dispensary	site	.1443	4.0583	1
28	A01005	Mukhobola 	H/C	site	.0816	4.0299	1
29	A01006	Rukala	Dispensary	site	.0563	3.9922	1
30	A01007	Mau Mau	Shopping Centre	site	.0706	3.9892	1
31	A01008	Makunda 	Sec School	site	.0873	4.0224	1
32	A01009	Bulemia	Shopping Centre	site	.1147	4.0009	1
33	A01010	Nabengele	Shopping Centre	site	.1593	4.0626	1
34	A02011	Sio Port	Dispensary	site	.2251	4.21	2
35	A02012	Agenga	Dispensary	site	.2527	4.0707	2
36	A02013	Nangina	Dispensary	site	.2773	4.0987	2
37	A02014	Namboboto	Dispensary	site	.3042	4.0918	2
38	A02015	Nambuku	Dispensary	site	.3182	4.1103	2
39	A02016	Kabuodo	Dispensary	site	.3046	4.1593	2
40	A02017	Wakhungu	Dispensary	site	.2688	4.1315	2
41	A02018	Ack Funyula	Church	site	.2771	4.1183	2
42	A02019	Buduta	Dispensary	site	.2220	4.1093	2
43	A02020	Rumbiye	Dispensary	site	.2037	4.0957	2
44	A02021	Namuduru	Dispensary	site	.1672	4.0973	2
45	A02022	Nabuganda	Dispensary	site	.1793	4.0376	2
46	A02023	Nanderema	Chiefs Office	site	.2049	4.0680	2
47	A02024	Busembe	Dispensary	site	.185	4.0162	2
48	A02025	Sio Port	Dispensary	site	.2251	4.0217	2
49	A02026	Agenga	Dispensary	site	.2527	4.0707	2
50	A02027	Nangina	Dispensary	site	.2773	4.0987	2
51	A02028	Namboboto	Dispensary	site	.3043	4.0918	2
52	A02029	Nambuku	Dispensary	site	.3182	4.1103	2
53	A02030	Kabuodo	Dispensary	site	.3045	4.1593	2
54	A02031	Wakhungu	Dispensary	site	.2683	4.1316	2
55	A02032	Ack Funyula	Church	site	.2770	4.1182	2
56	A02033	Buduta	Dispensary	site	.2220	4.1093	2
57	A02034	Rumbiye	Dispensary	site	.2037	4.0957	2
58	A02035	Namuduru	Dispensary	site	.1672	4.0973	2
59	A02036	Nabuganda	Dispensary	site	.1793	4.0376	2
60	A02037	Nanderema	Chiefs Office	site	.2051	4.0680	2
61	A02038	Busembe	Dispensary	site	.1852	4.0162	2
62	A03039	Busia(Ampath)	Ccc	site	.4599	4.1044	3
63	A03040	Trailer Park	Clinic	site	.463	4.0998	3
64	A03041	Tanaka	N.Home	site	.4527	4.1246	3
65	A03042	Busia GK Prison	Disp	site	.445	4.1450	3
66	A03043	Bukalama(New)	Disp	site	.4506	4.1874	3
67	A03044	Nasira ACK	Church	site	.4312	4.2023	3
68	A03045	Busibwabo	Disp	site	.4106	4.2011	3
69	A03046	Nambale	H/C	site	.455	4.238	3
70	A03047	Segero Catholic	Church	site	.4998	4.2668	3
71	A03048	Lupida	H/C	site	.5771	4.3425	3
72	A03049	Dulienge	School	site	.5646	4.3618	3
73	A03050	Igara	Disp	site	.5327	4.363	3
74	A03051	Madibo Ass Chiefs'	Office	site	.5250	4.3884	3
75	A03052	Khayo	Disp	site	.5105	4.3889	3
76	A03053	Madende	Disp	site	.476	4.3465	3
77	A03054	Mungatsi Ass Chiefs'	Office	site	.4707	4.3155	3
78	A03055	Your Family	Clinic	site	.4139	4.1466	3
79	A03056	Munongo	Disp	site	.3810	4.1212	3
80	A03057	Mayenje Ass Chiefs'	Office	site	.4187	4.1055	3
81	A03058	New Busia-Bulanda	N.Home	site	.4524	4.1020	3
82	A03059	Malanga	Disp	site	.4036	4.2963	3
83	A03060	Lwanyange(New)	Disp	site	.4294	4.2754	3
84	A03061	Buyende	School	site	.3838	4.1352	3
85	A03062	Matayos Community	Clinic	site	.3671	4.1635	3
86	A03063	Mabunge Chiefs'	Office	site	.4035	4.2619	3
87	A03064	St Claires Kisoko	Disp	site	.4492	4.2800	3
88	A03065	Nambale REEP	Y.F Centre	site	.451	4.254	3
89	A03066	Nasewa	H/C	site	.3860	4.2389	3
90	A03067	Matayos	H/C	site	.3566	4.1715	3
91	A03068	Bumala ""A""	H/C	site	.2916	4.1920	3
92	A03069	Busire ACK	Church	site	.3101	4.1997	3
93	A03070	Bujumba	Disp	site	.3225	4.214	3
94	A03071	Burinda	Disp	site	.3077	4.221	3
95	A03072	Ikonzo	Disp	site	.3438	4.2254	3
96	A03073	Namwitsula	School	site	.3607	4.209	3
97	A03074	Khunyangu(Ampath)	Ccc	site	.3374	4.2579	3
98	A03075	Bumutiru	Disp	site	.3761	4.2641	3
99	A03076	Sikoma ACK	Church	site	.3442	4.2771	3
100	A03077	Bukhalalire	Disp	site	.3182	4.2749	3
101	A03078	Butula REEP	YF Centre	site	.3413	4.3321	3
102	A03079	Butula Miss	H/C	site	.3420	4.3323	3
103	A03080	Sikarira	Disp	site	.3241	4.326	3
104	A03081	Masindabale	Disp	site	.3255	4.3738	3
105	A03082	Musibiriri	Disp	site	.3438	4.3928	3
106	A03083	Ogalo Calvary	Church	site	.3602	4.4042	3
107	A03084	Bumala ""B""	H/C	site	.3900	4.3500	3
108	A03085	Esibembe	School	site	.4086	4.3150	3
109	A03086	Bwaliro	Disp	site	.3781	4.3170	3
110	A04087	Tdh	Hospital	site	.6206	4.345	4
111	A04088	Malaba Dispensary	H/Facility	site	.6362	4.2868	4
112	A04089	Kamuriai H/C	H/Facility	site	.6646	4.2991	4
113	A04090	Akichelesit Disp.	H/Facility	site	.6913	4.3432	4
114	A04091	Angurai  H/C	H/Facility	site	.7093	4.3515	4
115	A04092	Aboloi	H/Facility	site	.6544	4.3933	4
116	A04093	Kolanya	H/Facility	site	.7057	4.3970	4
117	A04094	Chemasir	H/Facility	site	.7340	4.3933	4
118	A04095	Changara Mission	H/Facility	site	.7391	4.4162	4
119	A04096	Changara Gok	H/Facility	site	.7537	4.3480	4
120	A04097	Moding H/C	H/Facility	site	.6916	4.360	4
121	A04098	Kakapel	Pri. School	site	.6751	4.3534	4
122	A04099	Awata Market	Open Market	site	.6441	4.3443	4
123	A04100	Amagoro Pri. School	School	site	.6298	4.3314	4
124	A04101	Kamolo Disp.	H/Facility	site	.5875	4.2944	4
125	A04102	Malaba Ncbd	Cereal Board	site	.6354	4.2680	4
126	A04103	Chelelemuk Disp.	H/Facility	site	.620	4.3452	4
127	A04104	Amukura Mission	H/Facility	site	.57	4.2727	4
128	A04105	St. Pauls Amukura	School	site	.5685	4.2738	4
129	A04106	Amukura Hospital	Hospital	site	.5621	4.2732	4
130	A04107	Moru Karisa	H/Facility	site	.5476	4.2096	4
131	A04108	Apokor	H/Facility	site	.5290	4.2831	4
132	A04109	Kaliwa	School	site	.5120	4.2346	4
133	A04110	Obekai	H/Facility	site	.5116	4.2097	4
134	A04111	Ochude	H/Facility	site	.4799	4.1762	4
135	A04112	Alupe Sub-District	H/Facility	site	.4977	4.1304	4
136	A04113	Adungosi	Market	site	.5154	4.1516	4
137	A04114	Chakol Girls	School	site	.517	4.1631	4
138	A04115	Amaase	H/Facility	site	.523	4.1768	4
139	A04116	St. Marys' Pr. School	School	site	.5523	4.1787	4
140	A04117	Lukolis	H/Facility	site	.5826	4.2084	4
141	A04118	Fr. Okodoi	School	site	.5849	4.2107	4
142	A04119	St. Mark Ack Machakus	School	site	.6075	4.2330	4
143	B05120	Watoya Mkt	Chiefs Camp	site	.4544	4.5186	5
144	B05121	Kibachenje	Church	site	.519	4.4999	5
145	B05122	Mateka Mkt	D.O's Office	site	.5356	4.4970	5
146	B05123	Lunakwe Mkt	Church	site	.5240	4.4975	5
147	B05124	Nasianda	Disp	site	.4991	4.4545	5
148	B05125	Khulwanda	Disp	site	.4814	4.4156	5
149	B05126	Khasoko	H/C	site	.4840	4.4022	5
150	B05127	Mabusi(Chemaika)	School	site	.5223	4.4212	5
151	B05128	Khelela AC	School	site	.5362	4.4074	5
152	B05129	Bumula	H/C	site	.5488	4.4601	5
153	B05130	Myanga(Liporina Approved)	School	site	.5568	4.3841	5
154	B05131	Tulukui	School	site	.5874	4.3769	5
155	B05132	Kimaete	Disp	site	.6043	4.4076	5
156	B05133	Machwele	Disp	site	.5964	4.4427	5
157	B05134	Kibuke	Disp	site	.6039	4.4885	5
158	B05135	Grace Med. Centre	Disp	site	.5938	4.4994	5
159	B05136	Ng'oli	Chiefs Camp	site	.5840	4.5085	5
160	B05137	Kibabi	H/C	site	.6194	4.5255	5
161	B05138	Kakichuma RC	School	site	.6908	4.5352	5
162	B05139	Mayanja	Disp	site	.6556	4.5149	5
163	B05140	Mukwa RC	School	site	.6725	4.4945	5
164	B05141	Miluki	Disp	site	.6417	4.4963	5
165	B05142	Siboti	Disp	site	.6323	4.457	5
166	B05143	Netima	D.O's Office	site	.6553	4.4689	5
167	B05144	Musakasa RC	School	site	.6455	4.4482	5
168	B05145	Kitabisi	Church	site	.6428	4.4105	5
169	B05146	Bitobo RC	School	site	.6227	4.387	5
170	B05147	Posta Grounds	Church	site	.5678	4.5590	5
171	B05148	Namachanja	Chiefs Camp	site	.5641	4.5592	5
172	B05149	Mashambani	Church	site	.5702	4.5631	5
173	B05150	Mupeli Pri	School	site	.5574	4.5587	5
174	B05151	Oldrex	Church	site	.5592	4.5549	5
175	B05152	Mjini Muslim	School	site	.5513	4.5538	5
176	B05153	River Jordan	Med. Clinic	site	.5291	4.5319	5
177	B05154	Samoya RC	School	site	.5456	4.5278	5
178	B05155	Muanda Catholic 	Church	site	.5606	4.5081	5
179	B05156	Siritanyi Pri	School	site	.5776	4.5338	5
180	B05157	Kanduyi	D.O's Office	site	.59	4.553	5
181	B05158	Ndengelwa(Nalutiri Pri)	School	site	.5912	4.5998	5
182	B05159	Bukembe	Disp	site	.6085	4.6546	5
183	B05160	Nzoia Disp(Kongoli Pri)	School	site	.5680	4.6526	5
184	B05161	Sikalame SA Pri	School	site	.5122	4.6625	5
185	B05162	Mechimeru Disp	Disp	site	.5039	4.651	5
186	B05163	Fuchani FYM Pri	School	site	.4698	4.5859	5
187	B05164	Dorofu Mkt	Church	site	.4532	4.6137	5
188	B05165	Mwikhupo Pri	School	site	.4366	4.5859	5
189	B05166	Mumbule	Disp	site	.4894	4.6079	5
190	B05167	Mwibale Fath Church	Church	site	.4894	4.6112	5
191	B05168	Sanga'lo SDA	Church	site	.5180	4.6275	5
192	B05169	Ekitale	Disp	site	.5545	4.6125	5
193	B05170	Kitale Pri	School	site	.5753	4.6275	5
194	B05171	Ranje D.E.B	School	site	.5515	4.5767	5
195	B05172	Bulondo	Disp	site	.4850	4.5743	5
196	B05173	Namisi	School	site	.4638	4.5571	5
197	B05174	Naburereiya	School	site	.5029	4.5246	5
198	B05175	Vlm	Disp	site	.5029	4.5558	5
199	B05176	Kabula	Disp	site	.4822	4.5291	5
200	B06177	Sirisia	SDH(CCC)	site	.7551	4.5075	6
201	B06178	Namutokholo	School	site	.770	4.5299	6
202	B06179	Chwele Friends	Disp	site	.7614	4.5493	6
203	B06180	Kaptanai	Disp	site	.7865	4.5365	6
204	B06181	Kasiamo	School	site	.7543	4.4770	6
205	B06182	St Bonface	Disp	site	.7708	4.4778	6
206	B06183	Machakha	Disp	site	.7556	4.4390	6
207	B06184	Lwandanyi	Disp	site	.7894	4.4149	6
208	B06185	Lwakhakha	Disp	site	.789	4.3790	6
209	B06186	Korosiendet	Disp	site	.769	4.3932	6
210	B06187	Tamlega	Disp	site	.7075	4.4119	6
211	B06188	Malakisi	H/C	site	.6825	4.4207	6
212	B06189	Bukokholo	Disp	site	.6958	4.4631	6
213	B06190	Butonge	Disp	site	.7116	4.4695	6
214	B06191	St Teresa Wokape	Disp	site	.7091	4.4865	6
215	B06192	Bisunu Chief's Camp	Chief's Camp	site	.7091	4.5047	6
216	B06193	Chwele	H/C	site	.7343	4.5779	6
217	B06194	Chwele	CCC	site	.7340	4.5780	6
218	B06195	Makhonge	Church	site	.7648	4.5679	6
219	B06196	Mukuyuni	Chief's Office	site	.7581	4.6086	6
220	B06197	Lukhome	Disp	site	.7745	4.6042	6
221	B06198	Kimalewa	H/C	site	.7807	4.6397	6
222	B06199	Sikulu	Disp	site	.7512	4.6326	6
223	B06200	Chebukaka	Disp	site	.75	4.6145	6
224	B06201	Madisi	School	site	.7173	4.6296	6
225	B06202	Khachonge	Disp	site	.6849	4.6281	6
226	B06203	Luuya	Disp	site	.6519	4.6383	6
227	B06204	Mabanga	Farmers Centre	site	.5995	4.6212	6
228	B06205	Ngalasia	Disp	site	.6266	4.6140	6
229	B06206	Nalondo	Disp	site	.6553	4.5884	6
230	B06207	Lwanda	Disp	site	.6947	4.6037	6
231	B06208	Mukhweya	Market-D.O's Ofc	site	.6782	4.5766	6
232	B06209	Kabuchai	H/C	site	.6463	4.5598	6
233	B06210	Musokho	School	site	.6483	4.5408	6
234	B06211	Luucho	Disp	site	.6268	4.5581	6
235	B06212	Nangwe	Church	site	.6098	4.5825	6
236	B06213	Sikusi	Disp	site	.6933	4.557	6
237	B07214	Kamenjo	Dispensary	site	N00.85277	E034.77174	7
238	B07215	Kaborom	Dispensary	site	N00.86638	E034.78542	7
239	B07216	Kaptama	Health Center	site	N00.87918	E034.77702	7
240	B07217	Kaboywo	Health Center	site	N00.91243	E034.76319	7
241	B07218	Kaptalelio	Dispensary	site	N00.89057	E034.74822	7
242	B07219	Mt.Elgon D.H	Hospital	site	N00.84214	E034.71422	7
243	B07220	Kamuneru	Dispensary	site	N00.82261	E034.63985	7
244	B07221	Chepyuk	Church	site	N00.87348	E034.58943	7
245	B07222	Kopsiro 	Health Center	site	N00.82277	E034.59030	7
246	B07223	Kipsigon	Health Center	site	N00.83183	E034.55984	7
247	B07224	Ruanda	Dispensary	site	N00.82390	E034.54397	7
248	B07225	Chelebei	Church	site	N00.81258	E034.55774	7
249	B07226	Kapsambu	Dispensary	site	N00.80008	E034.59409	7
250	B07227	Tuikut	Dispensary	site	N00.81263	E034.49839	7
251	B07228	Kanganga	Dispensary	site	N00.83473	E034.46462	7
252	B07229	Chepkube 	Dispensary	site	N00.84009	E034.43328	7
253	B07230	Kimaswa	Church	site	N00.82265	E034.45517	7
254	B07231	Cheptais S.D.H	Hospital	site	N00.80289	E034.46232	7
255	B07232	Kapkota 	Dispensary	site	N00.79400	E034.48336	7
256	B07233	Chesikaki 	Dispensary	site	N00.79371	E034.51192	7
257	B07234	Kapkateny 	Dispensary	site	N00.80089	E034.62329	7
258	B07235	Sacha	Dispensary	site	N00.80338	E034.64190	7
259	B07236	Kamtiong	Market	site	N00.81155	E034.70322	7
260	B07237	Koshok	Dispensary	site	N00.83895	E034.66057	7
261	B07238	Mt.Elgon D.H	Ccc	site	N00.84200	E034.71399	7
262	B08239	Webuye DH	Hosp	site	.6133	4.7652	8
263	B08240	Webuye H/C	H/C	site	.6112	4.7678	8
264	B08241	Panpaper Disp	Disp	site	.5910	4.7775	8
265	B08242	Lugulu Mission	Hosp	site	.6614	4.7531	8
266	B08243	Sipala		site	.6448	4.7652	8
267	B08244	Mihuu Disp	Disp	site	.6255	4.7931	8
268	B08245	Furoi		site	.6165	4.6162	8
269	B08246	Lugusi		site	.6535	4.8134	8
270	B08247	Sinoko		site	.6992	4.791	8
271	B08248	Khaoya		site	.7288	4.7980	8
272	B08249	Ndivisi		site	.7129	4.8105	8
273	B08250	Namwaya		site	.720	4.7585	8
274	B08251	Yasulwe		site	.7434	4.7821	8
275	B08252	Mitukuyu		site	.657	4.779	8
276	B08253	Matulo		site	.5980	4.7412	8
277	B08254	Khalmuli		site	.5789	4.7138	8
278	B08255	Yalusi		site	.5429	4.7049	8
279	B08256	Mang'ana		site	.5222	4.6895	8
280	B08257	Kuywa		site	.5016	4.6861	8
281	B08258	Sitikho		site	.4746	4.6563	8
282	B08259	Milo		site	.5325	4.7226	8
283	B08260	Lurare		site	.5627	4.7536	8
284	B08261	Nasaka		site	.6356	4.6586	8
285	B08262	Mahanga		site	.6884	4.6530	8
286	B08263	Bukoli SDH		site	.7104	4.6619	8
287	B08264	Namilimo		site	.7044	4.6750	8
288	B08265	Miendo Disp		site	.6523	4.6906	8
289	B08266	Namawanga		site	.6807	4.7013	8
290	B08267	Sirisia		site	.6787	4.7111	8
291	B08268	Sirende		site	.7208	4.7001	8
292	B08269	Mukhe		site	.7119	4.7149	8
293	B08270	Makhese		site	.6768	4.7483	8
294	B08271	Nabuyole		site	.6110	4.7909	8
295	B08272	Kituni		site	.6633	4.7292	8
296	B08273	Wamangoli		site	.6225	4.7075	8
297	B09274	Kimilili District- Ccc	Hospital	site	N00.789170	E034.712610	9
298	B09275	Kamasielo	Polythecnic	site	N00.810720	E034.727950	9
299	B09276	Kamusinde (Rca)	Church	site	N00.813510	E 034.741530	9
300	B09277	Nasusi	Dispensary	site	N00.817860	E 034.758800	9
301	B09278	Namboani( Fym)	School	site	N00.841840	E 034.760770	9
302	B09279	Maeni	Dispensary	site	N00.782200	E 034.751810	9
303	B09280	Sikhendu Fym	School	site	N00.768490	E 034.760340	9
304	B09281	Chebkwabi	Polythecnic	site	N00.797410	E 034.667400	9
305	B09282	Nasianda (Kag)	Church	site	N00.761390	E 034.674560	9
306	B09283	Bituyu	Dispensary	site	N00.743920	E 034.699580	9
307	B09284	Kibingei	Dispensary	site	N00.741270	E 034.672660	9
308	B09285	Kibingei Farmers	Factory	site	N00.737190	E 034.687750	9
309	B09286	Salvation Army Hq	Church	site	N00.737190	E 034.687750	9
310	B09287	Chelekei	School	site	N00.731490	E 034.734360	9
311	B09288	Bahai	Dispensary	site	N00.738940	E 034.749280	9
312	B09289	Matili Rc	School	site	N00.759690	E 034.741110	9
313	B09290	Nakalira (Ctholic)	Church	site	N00.760100	E034.804970	9
314	B09291	Makhonge	Health Centre	site	N00.821240	E034.796980	9
315	B09292	Kamukuywa Proposed	Dispensary	site	N00.780330	E034.790000	9
316	B09293	Dreamland	Medical Centre	site	N00.807920	E034.696750	9
317	B09294	Khuiroro	School	site	N00.794260	E034.688840	9
318	B09295	Naitiri  Sdh  Ccc	Hospital	site	N00.756100	E034.891090	9
319	B09296	Kibisi	Dispensary	site	N00.697230	E034.862840	9
320	B09297	Karima	Dispensary	site	N00.725580	E034.855860	9
321	B09298	Soteni	Dispensary	site	N00.732070	E034.872060	9
322	B09299	Pwani	Dispensary	site	N00.697470	E034.901990	9
323	B09300	Sirakaru	Dispensary	site	N00.725760	E034.897220	9
324	B09301	Sango Kabuyefwe	Dispensary	site	N00.752950	E034.925670	9
325	B09302	Lungai	Dispensary	site	N00.779490	E034.898460	9
326	B09303	Makhanga	Dispensary	site	N00.808060	E034.887880	9
327	B09304	Sango Naitiri	Dispensary	site	N00.832090	E034.910340	9
328	B09305	Tabani	Dispensary	site	N00.848660	E034.943530	9
329	B09306	Minyali  Ack	Church	site	N00.871380	E034.966720	9
330	B09307	Ndalu	Health Centre	site	N00.843190	E034.993190	9
331	B09308	Misanga  Fym	Church	site	N00.804100	E035.023730	9
332	B09309	Makutano	Dispensary	site	N00.786760	E035.036940	9
333	B09310	Maresi  Fym	Church	site	N00.751370	E035.022340	9
334	B09311	Soysambu  Pag	Church	site	N00.765450	E035.003550	9
335	B09312	Ack  Soysambu	Dispensary	site	N00.765400	E035.003490	9
336	B09313	Tongaren	Health Centre	site	N00.774000	E034.968250	9
337	B09314	Lukhuna	Dispensary	site	N00.801160	E034.938140	9
338	B09315	Makhonge  Pefa	Church	site	N00.770870	E034.939930	9
339	B09316	Makunga   Pag	Church	site	N00.733010	E034.832130	9
340	B09317	Ack Kamukuywa	Dispensary	site	N00.766400	E034.831430	9
341	B09318	Lukhokhwe  Fym	Church	site	N00.797430	E034.842410	9
342	B09319	Wabukhonyi  Rc	Church	site	N00.803070	E034.866680	9
343	C10320	DMOH's Office	DMOH's Office	site	.339	4.4903	10
344	C10321	Khaunga Disp	Disp	site	.3768	4.5840	10
345	C10322	Mahola Pri	School	site	.383	4.5693	10
346	C10323	Malaha Disp	Disp	site	.355	4.6136	10
347	C10324	Muganga Disp	Disp	site	.3465	4.5786	10
348	C10325	Nyaporo Disp	Disp	site	.3296	4.6257	10
349	C10326	Makunga RHDC	H/C	site	.302	4.6235	10
350	C10327	Eluche Clinic	Clinic	site	.3289	4.5421	10
351	C10328	Khabakaya Pri	School	site	.3309	4.5621	10
352	C10329	Shianda Baptist Clinic	Clinic	site	.3158	4.5763	10
353	C10330	Mutono Pri	School	site	.2786	4.5892	10
354	C10331	Elwasambi Disp	Disp	site	.2889	4.5679	10
355	C10332	Bumwende Pri	School	site	.2809	4.5472	10
356	C10333	Lushea H/C	H/C	site	.3045	4.5360	10
357	C10334	Mumias Disp	Disp	site	.3344	4.4804	10
358	C10335	Shikalame Disp	Disp	site	.2569	4.4637	10
359	C10336	Eshihaka Pri	School	site	.2157	4.4644	10
360	C10337	Musanda Pri	School	site	.2197	4.4490	10
361	C10338	Bungasi H/C	H/C	site	.199	4.3912	10
362	C10339	Lukongo Pri	School	site	.2351	4.4075	10
363	C10340	Wang'nyang Pri	School	site	.2674	4.399	10
364	C10341	Bukaya H/C	H/C	site	.2	4.4493	10
365	C10342	Otiato Sch	School	site	.275	4.4408	10
366	C10343	Shikulu Community H/C	H/C	site	.3017	4.4392	10
367	C10344	Emuchimi Disp	Disp	site	.3281	4.4517	10
368	C10345	Ebubaka Pri	School	site	.3181	4.4196	10
369	C10346	Kamasha Pri	School	site	.2932	4.5067	10
370	C10347	Ichinga Pri	School	site	.3379	4.5056	10
371	C10348	Shibale Pri	School	site	.3626	4.4847	10
372	C10349	Musco	Disp	site	.3591	4.4926	10
373	C10350	St Marys Hosp	Hosp	site	.3269	4.4989	10
374	C10351	Enyaporo Disp	Disp	site	.3195	4.490	10
375	C10352	Mayoni Pri	School	site	.378	4.488	10
376	C10353	Mwira Pri	School	site	.3650	4.4495	10
377	C10354	Indangalasia Disp	Disp	site	.3167	4.3949	10
378	C10355	Mungungu Disp	Disp	site	.3990	4.4103	10
379	C10356	Lubanga Pri	School	site	.4123	4.3676	10
380	C10357	Lunganyiro Disp	Disp	site	.4326	4.3924	10
381	C10358	St Paul Ejinja Disp	Disp	site	.4024	4.4480	10
382	C10359	Matungu SDH	Hosp	site	.3879	4.4763	10
383	C10360	Namulungu Disp	Disp	site	.4511	4.4624	10
384	C10361	Mukhweya Pri	School	site	.4611	4.4891	10
385	C10362	Khalaba H/C	H/C	site	.4273	4.5483	10
386	C10363	Namamba Pri	School	site	.4442	4.5560	10
387	C10364	Bulimbo Mission	Church	site	.4405	4.5120	10
388	C10365	Khabukhoshe Pri	School	site	.4260	4.5121	10
389	C10366	Mirere H/C	H/C	site	.4547	4.4278	10
390	C10367	Shibanze Disp	Disp	site	.410	4.5244	10
391	C11368	Approved Disp	Disp	site	.2931	4.7613	11
392	C11369	Sichirai Market	Market	site	.3024	4.7632	11
393	C11370	Pgh-Kak	Hosp	site	.2743	4.760	11
394	C11371	Shitao Pri	School	site	.2605	4.7517	11
395	C11372	Chief's Camp Bukhungu	Camp	site	.2605	4.7517	11
396	C11373	Maraba Pri	School	site	.2952	4.7443	11
397	C11374	Nabongo Pri	School	site	.2845	4.7453	11
398	C11375	Rosterman Field		site	.2635	4.7292	11
399	C11376	Ikonyero Disp	Disp	site	.2808	4.7253	11
400	C11377	Elwesero Disp	Disp	site	.265	4.7164	11
401	C11378	Ibinzo Pri	School	site	.2562	4.6877	11
402	C11379	Eshisiru D.O's Office		site	.281	4.6736	11
403	C11380	Emusanda Disp	Disp	site	.2930	4.6470	11
404	C11381	Emusala Church	Church	site	.3297	4.7804	11
405	C11382	Emukaba Pri	School	site	.3416	4.7630	11
406	C11383	Ematiah Disp	Disp	site	.3615	4.7660	11
407	C11384	Bushiri Church	Church	site	.3650	4.7291	11
408	C11385	Ingotse Pri	School	site	.355	4.69	11
409	C11386	Shinoyi(Mukangu Mkt)	Market	site	.3453	4.66	11
410	C11387	Shikomari(Nangabo Mkt)	Market	site	.3210	4.6445	11
411	C11388	Eshiongo Disp	Disp	site	.3141	4.6938	11
412	C11389	Esumeiya		site	.3184	4.68	11
413	C11390	Eshikhuyu Disp	Disp	site	.2647	4.6559	11
414	C11391	Isumba Disp	Disp	site	.2422	4.6396	11
415	C11392	Mwiyenga ACK Church	Church	site	.2058	4.634	11
416	C11393	Buikulima SA Church	Church	site	.1931	4.613	11
417	C11394	Ekapwonje Pri	School	site	.2166	4.6143	11
418	C11395	Eshanda Church	Church	site	.2314	4.6201	11
419	C11396	Eshirembe Disp	Disp	site	.2543	4.6212	11
420	C11397	Ematsayi Pri	School	site	.278	4.6214	11
421	C11398	Shiyunzu Pri	School	site	.2907	4.7032	11
422	C11399	Ejinja Friends	Church	site	.2811	4.7117	11
423	C11400	Elukho Pri	School	site	.3228	4.7565	11
424	C11401	Emukoyani		site	.3217	4.7498	11
425	C11402	Emurumba Disp	Disp	site	.3032	4.7261	11
426	C11403	Shikoti Chief's Camp	Camp	site	.3177	4.7358	11
427	C11404	Ebushibo PAG	Church	site	.3062	4.6855	11
428	C11405	Lusumu Pri	School	site	.3650	4.6470	11
429	C11406	Nderema Pri	School	site	.363	4.6291	11
430	C11407	Busangavia Mkt	Market	site	.3637	4.6612	11
431	C11408	Kisembe Pri	School	site	.4004	4.6429	11
432	C11409	Matoi Disp	Disp	site	.3688	4.7116	11
433	C11410	Budonga Disp	Disp	site	.3981	4.6102	11
434	C11411	Sisokhe Disp	Disp	site	.4330	4.6118	11
435	C11412	Kharanda Disp	Disp	site	.4414	4.6368	11
436	C11413	Buchangu Disp	Disp	site	.4456	4.6708	11
437	C11414	Sivilie Disp	Disp	site	.4695	4.6967	11
438	C11415	Lutaso Disp	Disp	site	.4440	4.7108	11
439	C11416	Chekata Disp	Disp	site	.4672	4.7205	11
440	C11417	Siombe Pri	School	site	.4418	4.6850	11
441	C11418	Navakholo SDH	Hosp	site	.4137	4.6822	11
442	C11419	Namakoye Mkt	Market	site	.4209	4.6472	11
443	C11420	Nambacha Pri	School	site	.3933	4.6672	11
444	C12421	Chebwai	Disp	site	.4962	4.8328	12
445	C12422	Namagara	Disp	site	.5042	4.8785	12
446	C12423	Cheptuli	Church	site	.5051	4.8667	12
447	C12424	Makuche	Church	site	.514	4.7928	12
448	C12425	Chugulo	Disp	site	.5013	4.7812	12
449	C12426	Matsakha	Church	site	.5255	4.8160	12
450	C12427	Shivanga	Disp	site	.5321	4.8464	12
451	C12428	Chimoi	H/C	site	.5725	48307	12
452	C12429	Manda	Disp	site	.571	4.8629	12
453	C12430	Tumbeni 	School	site	.430	4.8685	12
454	C12431	Kimanget	Disp	site	.4317	4.9101	12
455	C12432	Ikoli	School	site	.3929	4.9414	12
456	C12433	Kuvasali	H/C	site	.4210	4.9433	12
457	C12434	Chimoroni	School	site	.4546	4.909	12
458	C12435	Shipala	School	site	.4700	4.8143	12
459	C12436	Malekha	Disp	site	.4478	4.7956	12
460	C12437	Shirugu	School	site	.4621	4.7902	12
461	C12438	Chombeli	H/C	site	.4562	4.7518	12
462	C12439	Malava	DH	site	.4488	4.85	12
463	C12440	Mugai	Disp	site	.4317	4.8075	12
464	C12441	Shamberere	Disp	site	.3770	4.8421	12
465	C12442	Shihome	Disp	site	.3912	4.7923	12
466	C12443	Chevoso	Disp	site	.3658	4.8123	12
467	C12444	Mahira	Church	site	.4032	4.8049	12
468	C12445	Muting'ong'o	Disp	site	.4048	4.8221	12
469	C12446	Ifwetere	School	site	.348	4.7900	12
470	C12447	Shivakala	Church	site	.3678	4.7773	12
471	C12448	Burundo	Church	site	.4406	4.7545	12
472	C12449	Sawawa	Market	site	.4177	4.7539	12
473	C12450	Mukume	Church	site	.3899	4.7528	12
474	C12451	Imbiakalo	Disp	site	.4103	4.7526	12
475	C13452	Lumakanda DH	Hosp	site	.634	4.9760	13
476	C13453	Nys Turbo	Disp	site	.6422	5.0492	13
477	C13454	Mautuma SDH	Hosp	site	.7247	4.9816	13
478	C13455	Mbagara Disp	Disp	site	.7257	5.0084	13
479	C13456	Mukuyu Disp	Disp	site	.7326	4.9497	13
480	C13457	Marakusi Disp	Disp	site	.6983	4.9522	13
481	C13458	Lugari Forest	Disp	site	.6610	4.9076	13
482	C13459	Lunyito Disp	Disp	site	.6735	4.875	13
483	C13460	Mapengo Disp	Disp	site	.6481	4.8599	13
484	C13461	Mahanga Disp	Disp	site	.6341	4.852	13
485	C13462	Koromati Disp	Disp	site	.6279	4.8842	13
486	C13463	Chekalini H/C	H/C	site	.619	4.8985	13
487	C13464	Musembe Disp	Disp	site	.6192	4.9300	13
488	C13465	Turbo Forest	Disp	site	.635	5.0624	13
489	C13466	Seregeya Disp	Disp	site	.6637	5.1074	13
490	C13467	Likuyani SDH	Hosp	site	.7108	5.1071	13
491	C13468	Sango Disp	Disp	site	.7289	5.0729	13
492	C13469	Lugulu Chiefs Camp	Chiefs Camp	site	.7676	5.0780	13
493	C13470	Soysambu Disp	Disp	site	.7771	5.1048	13
494	C13471	Kongoni H/C	H/C	site	.7830	5.1310	13
495	C13472	Matunda SDH	Hosp	site	.8255	5.1153	13
496	C13473	Mabusi H/C	H/C	site	.8342	5.080	13
497	C13474	Sinoko Disp	Disp	site	.8679	5.0762	13
498	C13475	Moi's Bridge N.Home	Maternity Home	site	.8808	5.118	13
499	C13476	Majengo Disp	Disp	site	.6485	5.0008	13
500	C13477	Munyuki Disp	Disp	site	.6349	4.939	13
501	C13478	Maturu Disp	Disp	site	.6059	4.8665	13
502	C13479	Nzoia Matete	Disp	site	.6039	4.8174	13
503	C13480	Matete H/C	H/C	site	.5651	4.8056	13
504	C13481	Nambilima	School	site	.5181	4.7498	13
505	C13482	Lumani	Disp	site	.4896	4.7238	13
506	C13483	Marukusi	School	site	.540	4.7872	13
507	C13484	Mbajo	School	site	.6108	4.9493	13
508	C13485	Mahemas	School	site	.6736	4.9661	13
509	C13486	Lwanda Lugari	School	site	.6766	4.9784	13
510	C13487	Ivona East	School	site	.7376	4.9988	13
511	C13488	Lukusi	School	site	.7137	5.063	13
512	C13489	Nasianda	School	site	.7508	5.1119	13
513	C13490	Lumino	Disp	site	.7104	5.1507	13
514	C13491	Aligula	School	site	.6655	5.1424	13
515	C13492	Moi's Bridge Pri	School	site	.8589	5.0985	13
516	C13493	Binyenya Friends 	Church	site	.80881	5.0663	13
517	C13494	Mwamba Pri	School	site	.6275	5.02	13
518	C13495	St Andrews Orthodox	Church	site	.7188	4.9439	13
519	C13496	St Marys	Disp	site	.7079	5.009	13
520	C14497	Mwihila	Mission Hosp	site	.1777	4.6139	14
521	C14498	Mwitseshe	Disp	site	.1847	4.6436	14
522	C14499	Ikomero	Disp	site	.1518	4.5008	14
523	C14500	Emalindi	H/C	site	.1317	4.6171	14
524	C14501	Mundobelwa	Disp	site	.1572	4.6129	14
525	C14502	Munyanza	MNH	site	.183	4.587	14
526	C14503	Emulunya	School	site	.1447	4.6552	14
527	C14504	Munjiti	School	site	.1352	4.6755	14
528	C14505	Ituti	Rotary Post	site	.2443	4.5814	14
529	C14506	Eshitari	School	site	.254	4.6028	14
530	C14507	Maondo	School	site	.1908	4.4440	14
531	C14508	Shatsala	School	site	.1749	4.4779	14
532	C14509	Butere	DH	site	.2086	4.493	14
533	C14510	Manyala	SDH	site	.1609	4.4524	14
534	C14511	Shitsiswi	H/C	site	.2632	4.5042	14
535	C14512	Shisaba	Disp	site	.2372	4.5468	14
536	C14513	Shimkoko	H/C	site	.2153	4.5658	14
537	C14514	Shiraha	H/C	site	.196	4.5707	14
538	C14515	Shikunga	H/C	site	.1826	4.5388	14
539	C14516	Lukohe	H/C	site	.1968	4.5998	14
540	C14517	Mabole	H/C	site	.1859	4.5062	14
541	C14518	Masaba	Disp	site	.1935	4.4641	14
542	C14519	Iranda	H/C	site	.244	4.5964	14
543	C14520	Eshibimbi	H/C	site	.210	4.5963	14
544	C14521	Imanga	H/C	site	.2753	4.4733	14
545	C14522	Shibuche	School	site	.2617	4.4822	14
546	C14523	Ebukhokolo	School	site	.1599	4.480	14
547	C14524	Emutsetsa	Disp	site	.1637	4.5302	14
548	C14525	Namasoli	H/C	site	.1443	4.528	14
549	C14526	Muhaka	Disp	site	.1228	4.4839	14
550	C14527	Walmar	Med Clinic	site	.0989	4.5560	14
551	C14528	Mundoli	H/C	site	.1094	4.5775	14
552	C14529	Mulwanda	Disp	site	.1434	4.5670	14
553	C14530	Khwisero	H/C	site	.1684	4.5960	14
554	C14531	Elwangale	H/C	site	.1555	4.6737	14
555	C14532	Eshinutsa	H/C	site	.1470	4.6351	14
556	C14533	Sonak	Med Centre	site	.1724	4.5925	14
557	C15534	Shikokho Friends	Church	site	.180	4.7201	15
558	C15535	Shikondi Pri	School	site	.187	4.7592	15
559	C15536	Ichina Pri 	School	site	.2112	4.7056	15
560	C15537	Shihalia Disp	Disp	site	.1772	4.6984	15
561	C15538	Shichinji Pri	School	site	.2092	4.6866	15
562	C15539	Bushiangala 	H/C	site	.1872	4.6839	15
563	C15540	St Pius Musoli	H/C	site	.2051	4.6643	15
564	C15541	Mutaho Pri	School	site	.2226	4.6700	15
565	C15542	Murudefu Pri	School	site	.1862	4.6515	15
566	C15543	Imuchenje Church	Church	site	.2123	4.6439	15
567	C15544	Imbale Pri	School	site	.2243	4.6356	15
568	C15545	Imulama Disp	Disp	site	.2399	4.6702	15
569	C15546	Shimanyiro Friends	Church	site	.2542	4.6883	15
570	C15547	Shiseso	H/C	site	.231	4.703	15
571	C15548	Iguhu DH	CCC	site	.1632	4.7460	15
572	C15549	Masyenze Pri	School	site	.179	4.7670	15
573	C15550	Savane Disp	Disp	site	.171	4.7898	15
574	C15551	Naliava Pri	School	site	.1584	4.7920	15
575	C15552	Shianjetso Pri	School	site	.1532	4.7321	15
576	C15553	Madivini Friends	Church	site	.1429	4.7073	15
577	C15554	Kaluni Pri	School	site	.1362	4.6980	15
578	C15555	Kilingili H/C	CCC	site	.1241	4.6808	15
579	C15556	Lwanaswa Pri	School	site	.1383	4.6843	15
580	C15557	Iregi H/C	H/C	site	.1543	4.7025	15
581	C15558	Imalaba Disp	Disp	site	.1625	4.6858	15
582	C15559	Itulubini Pri	School	site	.1664	4.6972	15
583	C15560	Ikhulili Pri	School	site	.1620	4.715	15
584	C15561	Shibwe SDH	CCC	site	.2056	4.7231	15
585	D17589	Ebusiekwe Ebukoolo Ack	Church	site	.0711	4.5652	17
586	D17590	Ebukanga Isanda Pri	School	site	.1088	4.6045	17
587	D17591	Emusire High Sch	School	site	.0793	4.6077	17
588	D17592	Essaba C.O.G	School	site	.0441	4.5913	17
589	D17593	Ebukhaya Emabuye C.O.G	Church	site	.0747	4.6198	17
590	D17594	Emanyinyia Sec	Church	site	.0957	4.6163	17
591	D17595	Ematsuli Pri	School	site	.1135	4.6326	17
592	D17596	Emurembe Pri	School	site	.1110	4.6741	17
593	D17597	Munungu C.O.G	School	site	.1159	4.6595	17
594	D17598	Ebunangwe Sec	School	site	.0889	4.6573	17
595	D17599	Ebusiloli C.O.G	Church	site	.074	4.6658	17
596	D17600	Ebusiratsi Sec	School	site	.0885	4.6376	17
597	D17601	Ematsi Sec	School	site	.0085	4.6206	17
598	D17602	Ebuyalu Sec	School	site	.0804	4.5718	17
599	D17603	Emmuli Esianduba Ack	Church	site	.0353	4.5677	17
600	D17604	Ebwiranyi ACK	Church	site	.0151	4.5601	17
601	D17605	Ebulonga Ekayila C.O.G	Church	site	.0307	4.5691	17
602	D17606	Ekwanda ACK	Church	site	.0200	4.5722	17
603	D17607	Ebulonga Ebusembe Ack	Church	site	.0098	4.5861	17
604	D17608	Ebusanda ACK	Church	site	.0024	4.5905	17
605	D17609	Coptic Orthodox	Church	site	.0108	4.6054	17
606	D17610	Emmuli Ebutuku C.O.G	Church	site	.0337	4.5581	17
607	D17611	Mumboha C.O.G	Church	site	.0249	4.5849	17
608	D17612	Epang'a COG	Church	site	.0315	4.6004	17
609	D17613	Ebulonga Ematioli Skyhigh	School	site	.0455	4.6164	17
610	D17614	Irumbi Pri	School	site	.0607	4.6298	17
611	D17615	Esongole Sec	School	site	.0483	4.6421	17
612	D17616	Ibubbi COG	Church	site	.0358	4.6357	17
613	D17617	Hobunaka Sec	School	site	.0211	4.633	17
614	D17618	Kima Mission Hosp	Hospital	site	.0257	4.6239	17
615	D17619	Emabwe Pri	School	site	.0948	4.5876	17
616	D18620	Vihiga D.H	District Hosp	site	.0794	4.7227	18
617	D18621	Idavaga Pri	School	site	.081	4.7210	18
618	D18622	Enanga Pri	School	site	.0052	4.6969	18
619	D18623	Kigadahi Pri	School	site	.0130	4.6774	18
620	D18624	Idereri Pri	School	site	.0139	4.6988	18
621	D18625	Vigetse Pri	Salvation Church	site	.0199	4.6929	18
622	D18626	Kisienya Pri	School	site	.0439	46660	18
623	D18627	Madzu Salvation	Church	site	.0318	4.673	18
624	D18628	Chanzeywe Pri	School	site	.0242	4.666	18
625	D18629	Kerongo Pri	School	site	.0090	4.6484	18
626	D18630	Madzugi Pri	School	site	.0096	4.679	18
627	D18631	Mbale Rural	Training Centre	site	.0802	4.7220	18
628	D18632	Chango Friends	Church	site	.057	4.7269	18
629	D18633	Navuhi Friends	Church	site	.0495	4.7334	18
630	D18634	Chanzaruka P.A.G	Church	site	.0436	4.7013	18
631	D18635	Vihiga Friends	Church	site	.037	4.7110	18
632	D18636	Vihiga H/C	Health Centre	site	.0390	4.7147	18
633	D18637	Vumale Pri	School	site	.0751	4.7276	18
634	D18638	Iduku Pri	School	site	.0780	4.6924	18
635	D18639	Busamo Salvation	Church	site	.0790	4.6771	18
636	D18640	Kereda P.A.G	Church	site	.052	4.6690	18
637	D18641	Magui Friends	Church	site	.0556	4.698	18
638	D18642	Buhani ACK	Church	site	.0170	46594	18
639	D18643	Kivagala Friends	Church	site	.0676	4.7538	18
640	D18644	Mudete PAG	Church	site	.1132	4.7856	18
641	D18645	Mabai Friends	Church	site	.0945	4.7011	18
642	D18646	Munugi Friends	Church	site	.0962	4.7101	18
643	D18647	Lwunza Friends	Church	site	.1137	4.7284	18
644	D18648	Walodeya PAG	Church	site	.1110	4.6473	18
645	D18649	Viyalo Friends	Church	site	.128	4.714	18
646	D18650	Kegondi Friends	Church	site	.1249	4.7497	18
647	D18651	Kisatiru Friends	Church	site	.1249	4.7497	18
648	D18652	Mulele PAG	Church	site	.1302	4.7584	18
649	D18653	Bugina Friends	Church	site	.1402	4.7682	18
650	D18654	Budagwa Friends	Church	site	.1436	4.7805	18
651	D18655	Chamakanga Catholic	Church	site	.1471	4.7955	18
652	D18656	Chavogere Mission	Church	site	.1509	4.8105	18
653	D18657	Busweta Friends	Church	site	.1222	4.814	18
654	D18658	Mudungu Salvation Army	Church	site	.1041	4.7971	18
655	D18659	Kigama Friends Church	Church	site	.092	4.7673	18
656	D18660	Malemba PAG	Church	site	.0992	4.7444	18
657	D18661	Tsimbalo PAG	Church	site	.084	4.7275	18
658	D18662	Sabatia CCC	Health Facility	site	.1208	4.7870	18
659	D19663	Bumuyange	Church	site	.0987	4.8162	19
660	D19664	Hamisi Stadium	Stadium	site	.0690	4.7160	19
661	D19665	Jebrongo Pri	School	site	.0725	4.7896	19
662	D19666	Buvai Israel	Church	site	.0724	4.7609	19
663	D19667	Kimogoi Disp	Facility	site	.0525	4.779	19
664	D19668	Saride Pri	School	site	.0289	4.7724	19
665	D19669	Tambua D.O's Office	Admin's Ofc	site	.0168	4.7650	19
666	D19670	Mwembe Mkt	Facility	site	.0306	4.8033	19
667	D19671	Kapsotik Pri	School	site	.0722	4.841	19
668	D19672	Wawani Catholic	Church	site	.0733	4.8364	19
669	D19673	Gimariani Pri	School	site	.0686	4.8289	19
670	D19674	Jiruani PAG	Church	site	.0848	4.8362	19
671	D19675	Kipchekwen PAG	Church	site	.0692	4.8173	19
672	D19676	Kaptech Disp	Facility	site	.1646	4.8244	19
673	D19677	Makuchi Friends	Church	site	.1519	4.8564	19
674	D19678	Mwiliza PAG	Church	site	.1572	4.9163	19
675	D19679	Chepkoyai D.O's Office	Admin's Ofc	site	.0229	4.7353	19
676	D19680	Tigoi Pri	School	site	.0067	4.7260	19
677	D19681	Boyani Poly	Facility	site	.0141	4.7348	19
678	D19682	Nyang'ori Disp	Facility	site	.0219	4.7440	19
679	D19683	Simbi Pri	School	site	.0041	4.7480	19
680	D19684	Kaimosi Mission Hosp	Facility	site	.1251	4.84	19
681	D19685	George Khaniri Pri	School	site	.1945	4.9252	19
682	D19686	Kisasi Friends	Church	site	.1049	4.8498	19
683	D19687	Shamakhokho Friends	Church	site	.107	4.8318	19
\.


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: -
--

COPY clients (id, date, site_id, counsellor, return_visit, new_code, client_code, partner_code, mother_maiden_name, sex, age, occupation, education, martial_status, seen_as, pregnant, service_requiered, ever_sex, hetrosexual_partners, homosexual_partners, condom_steady_patner, condom_non_steady_patner, condom_last_sex, not_tested_why, tested_before, hiv_test_1, hiv_test_2, tie_breaker, hiv_result, syphilis_result, couple_dicordant, condoms_given) FROM stdin;
1	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-0		mygjrv	1	18	3	\N	2	3	1	2	t	3	6	2	3	3	9	0	2	2	1	1	0	1	4
2	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-1		enptum	2	54	4	\N	5	2	2	3	t	4	10	9	4	2	2	3	1	0	0	0	9	1	4
3	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-2		xvlzpi	2	54	2	\N	2	3	2	1	f	11	4	1	3	2	3	2	9	0	0	1	0	1	3
4	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-3		poufbk	2	34	4	\N	5	4	2	2	f	9	6	2	0	2	2	3	2	2	0	1	0	9	4
5	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-4		lcgtuh	2	56	3	\N	5	1	0	3	t	7	12	9	3	0	1	2	9	9	0	0	9	1	8
6	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-5		nrixuq	1	17	2	\N	0	3	2	2	t	2	0	4	1	2	2	2	9	2	9	9	0	0	2
7	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-6		xlgwdn	1	51	2	\N	5	1	0	1	f	10	9	9	3	2	3	3	9	1	0	9	0	9	2
8	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-7		ptszfe	2	26	4	\N	5	3	2	3	f	9	1	4	1	0	9	2	0	2	1	1	0	1	8
9	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-8		fqwucr	1	43	1	\N	4	2	2	3	f	12	7	1	3	0	3	1	2	9	1	9	0	0	2
10	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-9		vhpcwi	1	55	4	\N	4	1	1	1	f	11	4	1	9	1	2	3	1	1	1	1	9	1	4
11	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-10		exqtcg	2	53	0	\N	0	3	1	2	f	0	6	2	3	2	2	1	1	1	1	0	1	0	3
12	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-11		vydsmi	2	55	3	\N	1	4	1	2	t	1	0	1	0	9	9	2	1	9	1	1	1	9	2
13	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-12		dtmrjw	1	65	0	\N	6	2	2	3	f	9	7	2	3	0	1	3	9	2	1	1	9	0	1
14	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-13		kfzjxd	1	51	3	\N	2	2	0	1	t	3	8	0	4	2	2	1	0	1	0	1	0	9	3
15	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-14		nczwbr	1	45	0	\N	0	2	1	3	t	10	11	4	0	0	2	0	9	0	1	0	9	0	3
16	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-15		mvnlgp	1	15	2	\N	5	2	2	2	f	9	4	3	1	3	3	0	1	9	9	0	9	9	8
17	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-16		hxnbua	2	65	0	\N	1	3	1	3	t	11	8	1	4	3	2	0	9	9	9	0	0	9	4
18	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-17		sybcnl	1	54	4	\N	6	1	1	1	t	6	8	2	0	3	3	0	1	1	9	9	0	9	2
19	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-18		oubfiv	1	36	2	\N	0	2	2	2	f	7	8	1	4	0	9	1	1	1	9	0	1	1	4
20	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-19		khwmgr	2	48	2	\N	1	3	2	3	t	8	2	1	4	0	3	0	2	1	9	9	1	1	8
21	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-20		nldzsw	2	39	3	\N	3	1	0	2	f	8	1	3	1	3	1	3	0	2	0	1	0	9	4
22	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-21		xnsuyf	1	64	3	\N	6	4	2	2	t	9	0	1	3	2	9	3	1	9	0	1	9	9	4
23	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-22		fkypmj	2	31	2	\N	2	3	0	2	t	0	0	3	2	2	2	2	0	9	1	0	9	0	3
24	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-23		pobvjx	2	41	1	\N	5	3	0	3	t	6	5	9	0	1	1	2	2	0	0	0	0	0	3
25	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-24		cmuibz	2	51	3	\N	5	2	2	2	t	12	9	1	0	1	3	0	2	1	0	9	0	9	1
26	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-25		zsybfd	2	64	3	\N	0	1	1	3	f	0	7	2	9	2	2	1	0	1	1	0	9	9	8
27	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-26		kwjalu	1	56	1	\N	3	3	2	3	t	3	5	9	3	1	1	2	2	2	1	9	9	0	2
28	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-27		iqhnew	1	37	3	\N	3	3	1	2	t	9	6	3	1	9	2	2	9	2	9	1	0	0	2
29	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-28		ygipuq	1	21	1	\N	3	4	2	3	t	11	1	2	0	1	1	3	2	0	9	1	1	9	2
30	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-29		ueiaso	2	25	3	\N	4	3	2	2	f	10	9	4	2	3	9	2	9	2	9	1	1	9	8
31	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-30		oaiwpm	2	51	4	\N	3	2	1	3	f	6	0	1	4	1	3	2	1	0	1	1	1	1	8
32	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-31		ladvkx	1	40	3	\N	1	3	0	1	t	2	6	0	4	1	3	3	0	1	0	9	1	1	2
33	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-32		esxzdo	2	32	2	\N	6	2	1	1	t	4	7	3	1	0	2	2	1	1	9	9	9	9	1
34	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-33		vkacdt	1	40	1	\N	5	1	2	3	t	10	4	0	9	9	2	2	9	0	9	9	9	1	8
35	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-34		xzpohk	1	56	0	\N	0	3	2	1	f	6	0	2	1	3	1	0	2	1	1	0	1	9	1
36	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-35		qzeugv	1	65	0	\N	0	4	0	3	t	6	1	1	4	3	9	3	2	0	0	0	9	0	8
37	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-36		ljkrxz	2	25	2	\N	4	2	2	3	t	12	10	0	1	3	3	2	2	2	1	0	1	1	8
38	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-37		qxahgy	2	65	2	\N	6	3	0	2	f	11	4	1	0	0	1	1	0	1	9	9	9	0	8
39	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-38		gwbhia	1	18	1	\N	2	2	1	1	f	7	12	0	4	0	1	1	0	9	0	0	9	0	2
40	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-39		hcmxbq	2	26	3	\N	2	2	2	3	t	3	12	9	2	2	2	1	1	0	1	9	1	1	8
41	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-40		odrlub	1	27	2	\N	6	3	1	2	t	10	5	1	3	0	1	3	1	1	9	9	1	0	1
42	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-41		bzgtyc	2	37	0	\N	1	1	1	2	t	0	5	4	3	2	1	0	0	1	1	9	9	1	4
43	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-42		gdaxeh	2	30	4	\N	2	4	0	3	t	2	2	3	9	3	1	3	9	0	1	1	0	0	2
44	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-43		zptiku	1	15	4	\N	5	2	1	2	t	9	2	1	4	9	2	0	1	1	9	0	1	9	2
45	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-44		cdlfak	1	58	3	\N	1	1	0	1	t	10	11	0	4	3	9	2	2	2	1	9	1	9	4
46	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-45		umpctd	2	41	4	\N	0	2	2	2	f	1	6	9	1	1	9	3	1	2	1	9	0	9	4
47	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-46		bktgis	1	39	4	\N	6	2	2	2	t	12	10	1	0	2	3	1	9	2	9	9	1	0	8
48	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-47		ofwnay	1	64	3	\N	1	1	0	3	t	7	7	0	2	2	9	3	0	9	9	1	0	0	3
49	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-48		xjogav	1	38	3	\N	6	2	1	2	f	11	11	3	2	3	1	0	2	0	9	0	9	0	8
50	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-49		huywjg	2	42	2	\N	5	1	0	3	f	2	2	9	2	2	3	3	2	0	1	9	0	1	4
51	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-50		gzlire	1	27	0	\N	5	2	2	1	f	1	1	9	3	3	3	0	2	2	1	1	1	9	8
52	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-51		jvncpk	1	17	2	\N	1	2	2	1	f	2	4	2	1	3	3	2	0	2	1	0	0	9	1
53	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-52		qwvfyh	1	15	2	\N	1	1	1	2	t	9	7	0	4	1	2	2	2	0	1	9	0	0	1
54	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-53		hgribl	2	22	1	\N	1	4	1	3	f	7	2	0	4	0	9	1	9	0	0	9	0	1	4
55	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-54		eyuktj	1	55	2	\N	3	2	0	1	t	8	11	9	4	1	2	3	2	0	1	0	9	9	3
56	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-55		dhursb	2	17	0	\N	0	1	0	3	t	5	12	9	4	0	2	3	2	0	9	9	0	0	4
57	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-56		smoqfr	1	25	1	\N	1	2	2	2	t	9	10	9	3	0	1	2	9	1	0	1	0	9	1
58	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-57		vmkust	1	19	0	\N	5	1	2	3	f	4	8	1	3	9	2	1	0	9	1	9	9	1	4
59	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-58		uhsjow	2	41	2	\N	3	2	2	1	t	0	10	3	2	9	2	3	9	1	0	9	0	0	1
60	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-59		yemlzv	2	24	3	\N	6	3	2	2	f	5	0	9	2	1	1	0	1	2	1	9	0	1	2
61	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-60		wgdvrm	2	20	0	\N	5	2	0	1	f	7	5	1	2	3	2	1	1	2	9	1	9	1	2
62	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-61		qwicbk	2	63	4	\N	5	3	1	1	t	3	9	2	1	0	2	1	0	1	0	9	0	1	1
63	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-62		sukewr	1	45	1	\N	4	2	1	1	t	10	12	3	2	2	3	0	0	9	0	0	0	9	3
64	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-63		yxtlkm	2	61	1	\N	4	2	0	3	f	11	7	1	3	9	9	2	9	0	0	0	9	1	1
65	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-64		aeudmt	1	43	0	\N	5	4	1	3	t	5	3	4	2	9	1	0	1	0	9	9	0	1	1
66	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-65		meriqa	2	57	1	\N	3	3	1	1	t	7	4	2	3	2	1	3	9	1	1	1	1	0	8
67	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-66		hyxemw	1	43	2	\N	1	4	1	3	f	7	2	4	9	1	9	1	1	1	1	9	1	1	2
68	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-67		mijlzu	1	19	1	\N	4	4	2	1	t	5	8	0	1	9	2	0	0	9	9	1	9	9	4
69	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-68		vzoaus	1	63	4	\N	5	2	0	3	t	12	11	0	9	3	3	3	2	1	0	1	0	0	8
70	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-69		qnoesl	2	32	1	\N	1	4	1	3	f	8	5	9	2	2	2	1	1	2	1	1	1	0	2
71	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-70		mxqcrt	1	46	0	\N	1	2	1	1	f	11	12	2	4	2	1	0	2	0	9	1	0	1	1
72	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-71		nqytzl	1	46	2	\N	4	2	2	1	t	2	10	1	3	2	1	2	0	9	0	1	0	0	1
73	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-72		ownijh	1	57	0	\N	3	2	1	3	t	7	7	3	1	0	9	1	0	1	1	1	1	0	8
74	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-73		wmlroj	1	30	4	\N	4	1	1	3	f	9	9	0	3	0	9	3	2	0	9	0	1	1	4
75	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-74		rxkozc	2	53	4	\N	6	3	2	1	f	7	5	4	1	0	9	3	2	9	1	0	1	9	8
76	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-75		lqejon	2	29	0	\N	6	3	1	3	t	5	4	0	2	9	1	2	0	2	9	0	0	9	2
77	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-76		xbifmg	2	48	3	\N	1	4	2	2	t	2	12	9	0	9	3	1	1	2	0	0	0	9	4
78	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-77		yntfqh	2	32	4	\N	3	2	2	2	t	3	3	3	4	0	1	0	2	2	9	9	1	1	8
79	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-78		fshglp	1	65	2	\N	3	3	2	3	t	6	7	3	2	3	2	2	2	0	1	9	1	0	1
80	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-79		rdfwpm	1	64	4	\N	4	2	1	2	t	8	8	9	4	1	2	2	9	0	1	9	9	9	4
81	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-80		hlwqpk	2	54	2	\N	1	4	1	3	t	5	12	9	2	1	9	2	9	9	0	1	9	9	4
82	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-81		lhkift	2	63	1	\N	5	1	0	3	f	2	2	9	2	1	1	0	1	9	1	1	0	1	8
83	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-82		revsxj	1	48	2	\N	4	2	2	3	f	2	1	0	9	3	9	1	9	1	1	0	9	9	1
84	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-83		ypujds	2	57	3	\N	3	3	2	3	f	11	0	4	1	9	2	3	2	1	1	0	0	0	8
85	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-84		eswjmx	2	20	3	\N	4	2	0	3	t	4	6	4	1	2	2	2	1	9	0	0	9	1	1
86	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-85		zfkerj	1	15	0	\N	4	3	2	1	f	1	9	9	0	0	2	1	2	0	0	9	1	9	2
87	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-86		gocdey	2	31	2	\N	3	1	0	3	f	5	0	4	0	9	3	2	1	1	1	0	9	9	2
88	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-87		eixpgm	1	34	0	\N	0	2	1	1	t	9	8	1	4	0	2	2	1	2	1	1	0	1	2
89	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-88		panhdu	2	33	2	\N	0	3	2	3	t	2	7	4	1	9	2	0	1	1	1	0	0	9	2
90	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-89		bvtqni	2	63	4	\N	6	4	0	3	f	2	4	4	0	9	9	0	1	2	1	1	0	9	8
91	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-90		lurczq	1	44	1	\N	3	3	2	1	f	8	12	3	4	9	3	1	9	0	9	1	0	9	3
92	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-91		wusghk	2	40	2	\N	5	1	1	2	t	11	2	3	4	2	3	1	9	9	1	0	1	1	1
93	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-92		enhazj	1	48	1	\N	5	1	2	2	f	8	12	2	1	3	3	0	9	9	9	1	1	1	4
94	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-93		vszeap	1	42	4	\N	3	4	1	2	t	12	1	3	0	3	3	3	1	2	0	0	1	1	8
95	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-94		syjkih	2	34	2	\N	4	2	1	2	t	2	11	4	1	1	2	0	9	9	9	0	1	1	1
96	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-95		yhudsc	1	51	2	\N	1	4	2	3	t	7	3	9	4	9	2	1	1	2	0	1	1	0	8
97	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-96		inwgmy	1	29	4	\N	0	4	2	3	t	6	4	9	0	9	1	3	1	9	9	0	9	9	4
98	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-97		gqesyo	2	42	4	\N	6	4	1	3	t	12	0	3	9	2	3	1	2	2	9	9	0	0	4
99	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-98		vslxbw	1	29	2	\N	4	2	1	3	f	7	3	1	4	2	1	2	2	2	0	1	9	0	3
100	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-99		gvnmxu	1	36	3	\N	2	2	1	1	f	0	5	1	3	0	1	2	2	0	0	9	0	0	8
101	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-100		ampdgc	1	18	3	\N	4	3	2	2	t	0	11	4	9	0	2	2	9	0	9	9	9	0	4
102	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-101		fztyah	2	36	0	\N	6	3	2	3	f	4	12	4	1	0	3	0	2	0	9	1	0	9	3
103	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-102		hwiryc	1	24	4	\N	0	2	2	3	t	12	9	4	3	2	2	2	9	0	0	0	9	9	1
104	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-103		olpaux	2	40	4	\N	0	3	2	1	f	1	8	2	9	2	1	0	0	9	0	1	0	9	2
105	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-104		qlpxbw	1	25	0	\N	5	3	0	1	f	10	3	9	0	1	2	1	1	2	9	9	1	9	1
106	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-105		phqdts	2	65	3	\N	5	3	0	3	f	6	1	9	0	3	1	0	9	2	1	0	1	1	2
107	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-106		hkbeva	1	46	2	\N	2	1	0	2	t	2	0	0	2	9	2	3	1	2	1	9	1	0	8
108	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-107		wuzcrn	2	34	1	\N	1	3	2	3	f	6	3	2	1	2	1	0	2	1	1	1	0	1	2
109	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-108		pqmyas	1	59	2	\N	3	4	1	2	f	11	0	2	3	2	3	1	2	2	1	1	0	0	2
110	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-109		hnrvwu	2	44	2	\N	5	3	1	1	f	1	2	3	1	0	9	1	2	1	9	0	0	9	3
111	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-110		jqyipe	1	61	3	\N	0	2	0	1	f	4	6	4	2	2	1	1	2	1	9	1	1	0	8
112	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-111		vaipsn	1	62	1	\N	1	3	0	2	t	5	5	0	2	1	3	3	9	0	9	9	9	9	1
113	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-112		uqindy	2	44	1	\N	5	4	2	1	t	7	9	0	9	2	2	0	2	2	1	0	0	9	1
114	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-113		hmzylu	1	50	2	\N	3	2	2	3	t	4	0	3	0	3	3	0	0	1	0	1	0	1	1
115	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-114		jworvq	2	52	3	\N	2	1	2	3	f	3	10	4	2	2	9	2	0	0	0	0	9	0	3
116	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-115		snxtfr	2	58	3	\N	3	1	2	3	t	2	0	0	3	1	1	3	0	0	1	9	0	9	4
117	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-116		gxcptd	2	46	0	\N	1	3	1	3	f	12	6	2	9	1	2	1	2	2	0	1	9	0	8
118	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-117		liykne	1	40	1	\N	5	2	1	3	t	10	6	3	9	0	2	3	0	0	0	1	9	9	3
119	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-118		awmuyh	2	30	3	\N	1	1	1	1	t	5	10	0	4	9	9	1	0	9	0	1	0	1	3
120	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-119		itwyca	1	25	3	\N	1	3	2	3	t	8	0	4	3	9	9	3	0	0	0	0	9	0	3
121	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-120		cunlew	2	48	3	\N	2	2	1	3	t	3	8	9	3	9	1	0	1	9	1	9	9	9	2
122	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-121		mupqhx	2	50	3	\N	2	1	1	2	t	2	7	0	2	3	2	3	1	9	9	1	0	9	1
123	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-122		wexqcg	2	18	1	\N	3	3	1	1	t	10	12	0	3	3	3	2	2	1	1	0	9	0	2
124	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-123		tpifhl	2	38	3	\N	1	1	1	2	f	2	6	3	2	2	1	1	0	2	0	9	0	9	2
125	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-124		vrtzxk	2	37	1	\N	0	3	1	1	t	8	11	4	2	3	9	0	1	2	1	1	9	9	2
126	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-125		wjlszv	2	17	4	\N	5	4	2	1	f	7	4	3	0	2	3	3	2	9	0	9	9	1	8
127	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-126		icxbmt	1	29	1	\N	5	1	0	3	f	9	2	9	2	1	3	2	0	9	9	9	0	0	4
128	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-127		oxpkvq	2	15	4	\N	6	1	1	1	f	9	2	0	4	1	1	1	0	1	1	0	0	0	1
129	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-128		ueidhv	2	46	4	\N	3	4	0	3	t	10	9	4	3	2	1	0	1	9	9	0	0	9	8
130	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-129		aznwoi	2	53	1	\N	5	3	0	3	f	1	11	0	9	2	3	1	0	1	1	0	9	9	2
131	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-130		eafyin	2	21	4	\N	6	1	0	2	t	4	7	0	4	1	9	3	2	9	0	0	9	0	3
132	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-131		bxgusf	2	36	2	\N	0	2	0	3	t	9	1	3	1	9	1	0	2	1	0	9	0	0	1
133	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-132		sbncdg	1	39	0	\N	2	2	1	3	t	4	8	0	2	1	1	0	1	1	0	1	9	0	4
134	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-133		fpmgyd	2	20	2	\N	6	4	0	3	f	7	5	4	0	0	1	2	1	1	1	1	0	1	4
135	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-134		wiulps	2	55	4	\N	0	2	0	3	f	4	8	4	9	1	1	3	2	9	9	9	9	0	2
136	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-135		nflipx	2	47	0	\N	2	1	0	2	f	0	0	1	0	2	1	0	9	0	0	0	9	9	8
137	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-136		boewun	2	29	1	\N	6	2	0	1	t	0	7	3	4	3	9	1	1	0	1	0	0	9	1
138	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-137		nofsza	1	38	4	\N	5	3	2	2	t	1	7	9	3	2	1	2	9	0	1	0	0	0	3
139	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-138		qzegdk	2	59	2	\N	6	4	1	1	t	11	4	4	0	1	9	0	1	9	9	9	9	1	3
140	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-139		zcmwhf	1	54	1	\N	6	2	2	3	t	6	3	4	1	2	1	3	9	9	9	9	9	0	4
141	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-140		pldxsn	2	23	1	\N	1	2	2	1	f	5	7	3	0	2	9	2	1	9	1	9	0	9	2
142	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-141		jifksx	1	39	4	\N	3	1	0	2	f	9	3	9	3	9	3	2	1	1	9	9	9	9	4
143	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-142		tlvwpx	2	45	2	\N	3	4	0	2	t	12	4	2	1	0	3	3	9	9	1	1	0	0	1
144	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-143		toseyc	2	54	1	\N	5	3	0	1	f	1	6	0	1	2	2	2	0	9	9	1	1	0	2
145	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-144		mktfjy	1	62	1	\N	0	3	1	1	f	0	6	4	1	3	2	3	9	1	0	1	1	1	1
146	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-145		vpcsfu	1	22	0	\N	0	4	2	3	t	1	7	0	9	3	1	1	9	2	0	0	1	1	2
147	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-146		gosltf	2	20	3	\N	5	1	1	3	t	11	5	4	0	2	3	1	9	2	1	0	1	9	4
148	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-147		mzrtxi	1	63	2	\N	6	4	1	1	t	6	2	3	2	3	3	2	9	9	0	1	1	1	2
149	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-148		lnitcm	2	23	2	\N	1	4	2	2	f	5	6	2	1	2	3	2	1	0	0	1	9	1	4
150	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-149		rltdmz	2	21	4	\N	6	2	1	1	f	8	8	3	0	0	9	0	0	1	0	0	0	9	4
151	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-150		jbqhzd	1	62	1	\N	6	4	2	3	f	1	2	1	2	9	1	0	2	1	9	0	9	1	8
152	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-151		waxbeo	2	57	4	\N	5	2	1	2	t	3	9	0	2	2	9	0	0	2	9	9	9	0	1
153	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-152		piswhl	1	19	0	\N	1	4	2	2	f	7	10	2	0	2	3	0	9	9	1	9	1	0	2
154	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-153		dazvjp	2	37	4	\N	6	1	2	1	t	6	10	3	0	1	1	1	0	2	0	9	1	0	3
155	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-154		afbtks	2	40	3	\N	0	3	2	3	t	10	8	4	0	2	9	2	1	9	1	0	1	0	1
156	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-155		meibfh	2	28	2	\N	5	1	2	1	f	9	3	2	1	3	1	1	1	0	1	9	1	1	3
157	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-156		aygnmf	1	16	4	\N	6	3	2	3	t	6	10	3	1	2	9	3	1	2	0	1	1	9	4
158	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-157		qhrotn	1	23	0	\N	6	4	2	1	f	5	3	0	4	3	3	1	1	2	0	0	0	1	1
159	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-158		qgysxl	1	16	0	\N	2	2	1	1	t	4	3	4	2	0	2	1	0	9	1	1	1	9	1
160	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-159		vadmnz	2	60	3	\N	5	4	2	3	f	10	12	3	9	0	3	0	1	1	1	1	9	1	4
161	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-160		bvpjcw	2	49	1	\N	4	4	2	2	t	8	1	2	0	9	2	0	0	9	1	1	9	9	2
162	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-161		gtldkz	1	48	2	\N	0	1	2	1	f	10	6	1	0	3	9	3	0	9	9	1	0	9	3
163	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-162		xnskia	2	37	4	\N	4	2	1	3	f	11	6	1	2	0	2	2	0	1	9	9	0	9	8
164	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-163		ahbznp	2	47	3	\N	5	1	0	1	t	5	1	2	0	9	1	3	2	9	9	0	0	1	2
165	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-164		yqxvmw	1	37	0	\N	4	4	1	2	f	7	10	2	0	9	3	0	2	9	0	9	1	1	4
166	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-165		iokhge	1	29	4	\N	6	2	1	3	f	7	3	3	9	1	2	2	0	2	1	0	9	9	8
167	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-166		agtfhp	2	50	2	\N	0	4	1	1	f	6	7	3	0	2	3	1	1	2	9	1	9	0	2
168	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-167		ljxhqv	1	53	2	\N	0	3	0	3	t	5	4	3	2	0	9	0	2	1	0	9	1	9	1
169	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-168		kvohwf	1	42	4	\N	1	3	2	3	f	12	8	3	9	3	3	1	9	2	1	1	9	1	8
170	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-169		lynvur	2	24	4	\N	1	1	0	1	t	4	3	9	0	1	2	0	0	9	9	0	1	1	8
171	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-170		hxmewb	1	29	0	\N	6	2	1	1	t	1	11	4	1	2	1	3	9	9	9	9	1	1	4
172	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-171		ndrlok	1	48	4	\N	6	2	0	3	f	8	1	0	4	9	1	1	9	2	9	9	0	0	1
173	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-172		xksayw	1	63	3	\N	5	3	0	1	f	5	7	9	2	2	2	3	0	0	0	1	0	1	8
174	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-173		jdxwzv	2	17	2	\N	4	3	0	2	f	2	5	3	4	2	9	3	2	9	1	9	9	9	8
175	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-174		cvlrkf	2	57	3	\N	2	1	1	3	f	11	10	0	1	9	1	2	0	1	0	9	0	1	3
176	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-175		lzhokt	2	15	0	\N	4	1	1	3	f	6	4	2	1	1	2	3	2	0	1	9	0	1	1
177	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-176		qcomjy	2	50	0	\N	1	3	0	3	f	11	5	1	9	0	2	1	1	2	1	0	0	0	3
178	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-177		nbmuyp	1	22	0	\N	4	4	1	3	f	7	10	0	3	9	9	0	0	1	1	0	1	0	2
179	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-178		qdmfgj	1	19	4	\N	6	1	1	2	t	8	11	0	1	1	2	1	2	2	9	1	0	0	3
180	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-179		ndkoxi	1	50	3	\N	2	3	2	2	f	11	11	9	1	3	3	2	9	9	0	1	9	0	1
181	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-180		dcjhes	1	27	1	\N	4	2	1	2	f	5	3	4	3	9	3	0	9	9	1	1	1	0	2
182	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-181		oygbri	1	20	4	\N	3	3	1	3	t	4	3	2	1	1	3	0	1	0	0	0	0	0	1
183	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-182		eitpym	1	16	1	\N	2	3	1	3	t	5	11	3	0	0	2	2	0	9	0	0	9	0	3
184	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-183		joykmp	1	45	4	\N	6	3	1	3	f	12	4	4	0	9	2	3	1	9	0	1	0	9	1
185	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-184		nlreus	1	31	1	\N	1	3	0	3	f	8	6	2	4	1	9	2	2	1	0	0	1	1	1
186	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-185		nkcota	1	19	2	\N	2	4	0	1	t	6	5	4	3	2	9	2	0	2	9	0	9	9	3
187	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-186		kihnvf	1	18	4	\N	6	1	2	3	t	2	8	9	3	2	2	3	0	0	0	0	0	9	4
188	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-187		xzemsl	2	28	4	\N	1	4	0	2	f	1	11	1	2	2	1	2	0	9	0	0	0	0	4
189	2010-07-12 00:00:00	A01001	A01001C3	t	f	A01001-188		notsqy	1	44	2	\N	1	1	1	3	t	3	4	2	9	0	3	0	1	2	0	0	9	0	8
190	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-189		xdpocw	1	55	3	\N	2	1	0	2	t	3	8	3	1	3	1	1	1	1	9	0	1	0	3
191	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-190		znqyov	1	53	3	\N	1	1	2	3	f	10	11	4	9	2	3	3	0	9	9	1	0	9	2
192	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-191		cgaosj	1	62	2	\N	5	1	2	2	t	11	1	3	1	3	9	3	1	0	0	9	0	1	3
193	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-192		acqxnt	1	24	1	\N	0	3	2	3	f	12	12	1	4	3	9	3	2	1	1	1	1	9	2
194	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-193		jrchvg	2	27	0	\N	0	4	1	2	f	2	1	1	0	0	2	0	1	1	9	1	1	0	8
195	2010-07-12 00:00:00	A01001	A01001C3	t	t	A01001-194		bwdkap	2	37	0	\N	5	3	0	2	t	11	4	2	0	3	3	1	0	2	1	1	9	1	8
196	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-195		hptwgo	1	45	4	\N	6	3	0	3	t	6	0	4	2	0	9	2	9	1	0	1	1	0	4
197	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-196		pigcvy	2	52	1	\N	5	3	1	3	t	6	6	2	1	2	2	1	0	2	0	0	1	9	2
198	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-197		yernkb	1	15	3	\N	2	1	1	1	t	9	10	1	2	0	9	0	0	9	0	0	9	1	3
199	2010-07-12 00:00:00	A01001	A01001C3	f	f	A01001-198		znpcrh	2	63	1	\N	6	4	2	1	f	1	2	1	4	0	1	2	2	0	1	0	1	9	3
200	2010-07-12 00:00:00	A01001	A01001C3	f	t	A01001-199		tujzgn	1	54	2	\N	5	4	1	3	f	1	12	0	9	9	1	1	9	9	1	1	0	0	2
201	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-200		kbetzc	2	25	2	\N	2	3	1	2	f	6	7	2	0	2	9	0	9	9	9	9	0	0	4
202	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-201		aphqlc	1	38	3	\N	1	2	0	2	f	1	8	2	0	2	3	0	0	0	9	1	9	1	3
203	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-202		qlfsmu	1	53	0	\N	0	1	2	1	t	6	0	4	0	1	3	0	9	2	9	0	0	1	4
204	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-203		wkuxsv	2	43	0	\N	4	3	0	2	t	3	7	2	9	0	3	0	1	2	0	1	9	0	4
205	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-204		cyfqhw	1	33	2	\N	4	2	1	1	t	6	3	0	9	1	9	3	1	9	9	9	1	0	8
206	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-205		nlbjsk	1	20	2	\N	6	1	0	2	t	11	12	0	3	1	2	2	0	0	1	9	9	9	2
207	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-206		narqbv	2	25	4	\N	6	3	1	1	f	3	11	9	4	1	3	1	2	9	1	0	0	9	8
208	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-207		lvagpu	2	53	1	\N	2	1	1	3	t	7	4	1	2	9	2	2	2	9	1	9	0	0	8
209	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-208		uzinft	2	18	1	\N	2	2	2	3	f	0	1	0	1	9	3	3	0	0	0	9	0	1	4
210	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-209		uxalfr	2	36	4	\N	0	2	1	3	t	11	7	0	3	3	3	1	1	2	9	0	1	1	4
211	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-210		xbuyhg	1	64	1	\N	3	3	1	2	t	5	0	3	2	0	3	1	9	2	0	0	9	9	3
212	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-211		utriyg	2	51	0	\N	5	1	0	2	t	9	4	3	0	9	1	0	0	2	0	0	9	9	3
213	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-212		bxvzpn	1	24	1	\N	0	4	1	2	f	1	12	1	2	0	9	0	2	1	9	0	1	9	3
214	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-213		pndxls	1	54	3	\N	3	2	0	1	t	11	1	1	3	9	9	2	2	0	9	0	0	9	4
215	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-214		eypqwc	1	30	3	\N	0	1	2	1	t	2	8	4	3	1	9	2	0	9	0	1	9	0	1
216	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-215		ewbvqc	1	41	0	\N	5	4	0	1	t	0	11	4	9	3	9	2	2	1	9	9	1	0	2
217	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-216		pmhldg	1	19	4	\N	5	4	0	3	t	11	8	2	4	2	1	0	1	0	9	1	9	1	3
218	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-217		eqodtv	1	48	3	\N	5	3	1	2	f	6	7	0	2	9	3	2	1	9	9	9	0	9	3
219	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-218		gzvtqa	2	57	1	\N	2	4	0	1	f	9	5	0	3	9	1	3	1	1	1	9	9	0	4
220	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-219		cgzmhn	1	39	2	\N	2	4	2	2	t	1	3	9	2	0	3	3	1	9	9	0	0	9	3
221	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-220		rnlzfp	1	20	1	\N	6	4	1	3	f	1	0	9	0	9	3	3	2	0	0	0	0	1	8
222	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-221		qhdaly	2	21	3	\N	1	4	2	3	f	9	2	4	9	2	1	2	9	1	0	0	0	9	8
223	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-222		fvpdhj	2	58	0	\N	1	3	1	2	f	2	4	9	2	0	3	3	2	2	1	0	1	1	2
224	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-223		muhocy	2	58	4	\N	1	4	1	2	t	5	12	4	9	2	2	3	0	9	9	0	1	0	1
225	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-224		rujody	1	41	2	\N	3	1	2	3	t	12	8	2	3	2	9	2	1	2	9	1	0	1	1
226	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-225		ekrndf	1	56	3	\N	2	4	1	1	t	7	1	2	3	1	3	0	1	2	9	0	0	9	1
227	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-226		ngosbe	2	20	4	\N	0	1	0	2	t	5	8	0	3	2	2	1	9	0	0	0	1	1	2
228	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-227		pxsvgz	2	31	2	\N	5	4	1	1	f	11	3	2	0	9	1	0	0	1	0	9	1	1	1
229	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-228		xkgsvj	2	46	1	\N	1	1	2	1	f	8	0	9	0	3	3	0	9	1	9	0	1	0	2
230	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-229		tihnms	1	45	3	\N	3	2	2	1	f	3	3	9	0	2	9	0	2	0	0	0	0	9	8
231	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-230		crfslj	2	35	0	\N	4	1	2	3	f	0	6	3	2	0	1	2	1	9	1	1	0	9	1
232	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-231		zcsrwq	2	57	3	\N	4	2	2	2	f	6	6	2	1	9	2	1	1	9	1	0	0	0	4
233	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-232		izvajn	2	55	2	\N	0	2	0	1	t	5	6	4	3	2	9	3	1	9	0	9	1	9	8
234	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-233		nvhwxj	2	51	3	\N	5	2	1	1	f	12	6	9	0	2	9	2	1	1	1	9	0	0	3
235	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-234		ptjxwv	2	35	0	\N	5	4	2	2	t	3	12	4	2	0	2	2	2	1	9	9	1	9	4
236	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-235		xwtqoa	2	27	0	\N	0	3	2	3	f	11	2	1	2	2	3	2	1	2	1	1	0	1	3
237	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-236		nmvzpg	1	59	2	\N	2	2	1	2	t	10	9	1	4	2	3	3	1	0	9	0	1	0	4
238	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-237		iwzyaq	1	62	0	\N	2	1	2	2	f	3	6	0	3	1	9	0	2	1	9	9	1	1	4
239	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-238		ufvips	2	34	0	\N	4	4	1	3	t	1	9	3	2	0	1	2	0	0	1	9	0	0	8
240	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-239		ymdhpx	2	46	2	\N	4	4	0	3	t	4	2	2	4	9	1	1	1	0	0	1	0	0	3
241	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-240		mvnhyo	2	25	4	\N	0	1	1	2	f	1	0	3	4	2	2	3	0	9	1	1	9	0	3
242	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-241		gmsoxi	1	56	0	\N	4	2	1	2	f	1	2	3	1	2	2	2	2	2	0	1	0	1	2
243	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-242		ruqgpc	2	54	2	\N	2	1	2	1	t	12	8	0	3	2	9	2	0	2	0	0	0	1	1
244	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-243		pwxrln	1	48	1	\N	3	3	2	3	f	5	10	9	4	3	1	1	1	1	1	9	1	0	2
245	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-244		upmjoe	2	26	2	\N	1	1	1	2	t	10	7	9	4	0	9	2	0	1	1	9	1	0	4
246	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-245		yextlb	1	51	0	\N	1	2	2	1	t	4	1	9	2	1	2	1	0	9	0	9	1	0	4
247	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-246		hbrpym	1	15	0	\N	1	1	2	1	f	10	10	3	1	2	9	0	1	2	1	1	9	1	1
248	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-247		hgovyq	1	28	1	\N	5	1	0	2	f	5	9	1	3	1	2	1	9	1	9	1	0	0	8
249	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-248		jhypna	2	43	3	\N	0	2	1	1	t	6	2	3	4	2	3	0	1	0	1	0	9	1	3
250	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-249		gqydcw	2	40	0	\N	3	1	2	3	f	5	5	2	4	3	1	0	9	0	0	9	1	1	4
251	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-250		enwzmd	1	17	1	\N	1	1	2	1	t	10	4	1	0	1	1	3	1	0	9	9	0	1	2
252	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-251		vhpwbn	2	40	2	\N	4	2	2	3	f	10	0	4	1	2	1	3	0	2	1	1	1	0	2
253	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-252		xcdgjb	1	53	3	\N	1	1	2	3	t	9	10	3	1	0	3	2	2	0	1	0	9	9	8
254	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-253		ilfpzm	2	48	2	\N	6	4	1	3	t	11	9	1	0	1	2	1	9	1	0	9	9	1	4
255	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-254		wexvky	2	48	3	\N	2	1	0	2	f	9	12	3	1	0	3	1	2	0	0	9	9	1	3
256	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-255		uxamon	1	20	4	\N	1	2	2	1	f	10	4	9	0	0	2	3	2	2	1	1	9	9	8
257	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-256		ebqjpz	1	50	3	\N	3	3	2	3	f	7	9	0	2	9	1	0	1	9	0	0	1	0	4
258	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-257		rtfqhw	2	63	1	\N	1	2	0	1	f	9	0	1	2	0	2	0	0	2	1	9	0	0	8
259	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-258		yqpjof	1	59	0	\N	4	4	0	2	f	3	3	2	3	9	1	3	2	2	9	1	9	0	3
260	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-259		dewjpt	1	47	0	\N	3	3	2	2	f	6	1	3	1	9	1	0	9	0	1	1	9	0	3
261	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-260		cqsnaz	2	33	2	\N	3	2	2	1	t	0	0	2	3	9	2	3	2	9	1	1	1	0	4
262	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-261		wqutif	2	39	0	\N	1	3	2	3	f	12	7	2	3	1	3	0	0	2	1	9	0	0	1
263	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-262		asxzng	1	52	4	\N	6	4	1	1	t	1	3	0	2	3	3	2	0	0	0	1	1	0	2
264	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-263		cksogu	2	17	3	\N	1	4	0	2	t	7	9	4	1	3	1	1	2	1	0	1	1	9	1
265	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-264		hlyoqu	2	56	3	\N	5	2	0	1	f	2	12	9	2	1	9	3	1	0	0	1	1	0	1
266	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-265		fqdpkx	1	30	4	\N	5	1	1	1	f	10	1	1	4	3	3	2	9	9	1	0	0	0	1
267	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-266		fhtolq	1	52	3	\N	1	2	0	2	f	6	10	0	4	1	3	1	0	0	9	9	1	9	2
268	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-267		zgmyqf	2	57	2	\N	0	2	0	3	t	0	8	9	2	9	2	0	0	9	9	9	0	0	8
269	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-268		lpuwys	1	48	1	\N	0	1	2	2	f	7	12	3	4	3	9	1	9	9	1	9	1	0	3
270	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-269		agrdws	1	65	4	\N	3	3	2	2	f	10	4	9	4	2	1	3	1	2	0	9	1	0	4
271	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-270		pekwru	1	55	2	\N	2	4	1	2	t	3	0	4	1	1	2	0	1	2	0	0	9	0	3
272	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-271		lzdrcx	1	24	2	\N	3	3	2	3	t	8	7	2	4	9	1	0	0	2	9	9	1	1	1
273	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-272		rejyfq	2	16	4	\N	4	3	1	2	t	12	1	3	9	9	2	2	2	0	9	0	1	1	3
274	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-273		gsnfhr	2	53	3	\N	2	2	2	2	t	5	2	4	1	3	3	2	1	0	9	9	9	9	1
275	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-274		fjlnpv	1	22	2	\N	3	1	2	3	t	8	8	1	4	2	3	0	1	0	9	9	1	1	4
276	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-275		klwprj	1	24	1	\N	2	2	2	3	f	11	12	1	9	9	3	2	1	0	0	1	9	0	4
277	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-276		aokelq	1	19	3	\N	4	1	1	3	t	2	0	0	4	0	1	2	0	0	1	1	0	0	8
278	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-277		naigcs	2	44	3	\N	1	2	0	1	f	2	4	2	0	0	3	3	2	2	9	1	0	1	3
279	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-278		ylwift	2	33	2	\N	1	4	0	3	t	1	5	3	0	9	9	0	1	1	9	1	0	1	8
280	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-279		jiduag	1	35	2	\N	5	4	1	2	t	3	9	1	2	0	3	3	9	9	0	9	0	0	2
281	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-280		lzmouc	1	29	2	\N	5	4	2	3	t	10	12	1	4	9	1	0	9	9	1	0	1	0	2
282	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-281		synewo	1	36	1	\N	4	1	0	3	f	1	5	4	2	2	9	1	1	0	1	1	0	9	8
283	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-282		sakygi	2	18	2	\N	5	4	1	2	f	10	4	3	4	9	9	2	1	0	1	0	1	0	4
284	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-283		sprbgj	2	50	0	\N	4	1	0	1	f	2	0	4	3	9	9	2	1	1	1	1	1	9	1
285	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-284		lhtbgw	1	61	2	\N	1	2	2	1	t	2	11	1	0	3	1	0	1	1	9	9	1	9	4
286	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-285		xjrufh	1	52	0	\N	6	1	2	2	f	10	11	1	4	1	9	3	0	1	9	1	9	1	2
287	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-286		jgaqlu	1	20	4	\N	6	4	0	3	t	3	6	2	4	3	1	1	0	9	0	9	9	0	2
288	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-287		aircly	2	36	4	\N	2	1	1	3	f	12	2	9	4	2	1	3	9	0	9	0	0	1	2
289	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-288		vsqjlh	1	15	0	\N	2	3	2	2	f	2	9	1	0	0	1	3	1	1	1	0	0	1	4
290	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-289		hdwqoi	2	29	2	\N	3	2	2	3	t	1	0	9	2	2	3	0	1	0	0	1	0	9	1
291	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-290		ntkrfy	2	61	4	\N	2	4	1	2	f	3	5	1	9	1	2	2	2	2	1	9	1	1	1
292	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-291		bhdafq	1	43	3	\N	2	4	0	3	t	11	10	2	9	3	2	1	0	9	9	9	0	9	3
293	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-292		kjctdx	1	60	0	\N	5	4	1	1	t	4	9	0	4	9	1	2	1	1	1	1	0	9	4
294	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-293		akuitb	2	50	1	\N	2	2	0	3	t	4	3	4	2	9	9	2	9	2	0	0	0	1	2
295	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-294		fbahiq	1	63	0	\N	1	4	1	3	t	0	4	0	1	2	3	1	0	1	9	1	0	9	1
296	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-295		zwbvil	1	64	0	\N	2	3	1	3	t	12	7	0	4	0	3	3	2	2	9	1	1	0	4
297	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-296		nosgmr	2	16	0	\N	0	4	0	3	t	7	11	1	0	9	9	0	9	1	0	1	0	0	4
298	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-297		yfpdcr	2	19	2	\N	1	1	1	2	t	8	1	1	0	3	2	2	1	9	0	0	0	1	4
299	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-298		oxeank	2	35	1	\N	6	2	2	2	t	1	12	4	3	0	2	1	2	2	0	0	9	1	1
300	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-299		xyrsij	1	18	3	\N	1	1	1	1	t	6	2	9	1	1	9	1	9	2	1	1	9	9	3
301	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-300		gtvkus	2	29	2	\N	2	3	2	3	f	11	3	9	2	3	9	0	1	0	0	0	0	9	3
302	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-301		uxcgdl	1	30	2	\N	5	2	1	1	f	1	1	9	4	9	3	0	0	1	0	0	1	9	4
303	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-302		vshjer	1	62	4	\N	4	1	1	3	f	11	8	3	1	1	9	2	2	0	9	0	9	1	2
304	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-303		hfndux	1	30	3	\N	6	3	0	1	t	9	10	3	0	3	3	0	9	2	1	1	9	0	8
305	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-304		duskxb	2	19	4	\N	0	4	1	2	f	11	2	4	3	0	2	3	1	9	1	1	9	0	2
306	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-305		iehnkb	1	31	4	\N	3	1	0	1	t	0	3	1	2	1	1	3	0	0	1	1	9	9	4
307	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-306		majeqg	2	15	0	\N	5	2	0	3	f	8	12	0	4	3	9	3	2	0	1	9	1	1	2
308	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-307		aclpgs	2	52	2	\N	4	1	1	3	t	10	12	9	1	9	9	2	0	9	9	1	1	9	2
309	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-308		ogebpw	1	17	0	\N	4	2	0	2	f	6	0	3	4	3	3	2	9	9	0	0	9	0	4
310	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-309		ryqdhi	2	58	3	\N	2	3	1	3	f	5	2	3	0	0	1	1	2	0	1	9	9	0	3
311	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-310		hlzafo	2	56	3	\N	2	3	0	2	f	10	0	4	1	3	3	3	1	9	1	9	9	9	8
312	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-311		kmynfc	2	40	2	\N	3	2	1	1	t	2	2	2	3	2	9	0	1	2	0	0	9	9	1
313	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-312		nuobmc	2	51	2	\N	0	2	0	2	f	11	1	1	3	1	9	3	1	1	0	9	1	9	8
314	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-313		bvdecm	1	33	1	\N	6	1	1	2	f	5	6	4	1	2	9	3	0	0	9	9	9	0	4
315	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-314		wksqvy	2	39	4	\N	5	3	2	1	f	9	9	9	2	3	3	2	2	9	9	0	0	9	1
316	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-315		xmnjos	2	40	0	\N	4	3	2	3	f	8	7	0	4	9	2	3	2	2	1	1	0	0	4
317	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-316		beqcud	2	35	1	\N	0	1	1	3	f	2	3	1	4	2	1	1	2	1	1	0	0	1	4
318	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-317		jrhagi	2	50	0	\N	0	4	2	1	t	4	7	1	3	9	9	0	1	2	9	0	9	1	1
319	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-318		jgxveb	2	62	0	\N	1	4	2	3	f	4	6	4	0	9	9	1	2	2	0	1	9	9	8
320	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-319		ieksun	1	54	4	\N	5	1	2	1	f	1	10	0	1	3	1	1	0	2	0	0	0	1	1
321	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-320		qatbji	2	22	4	\N	0	1	1	2	t	9	10	4	3	2	3	3	9	2	0	9	1	9	4
322	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-321		epgixj	2	23	0	\N	0	4	0	3	f	0	0	9	0	1	2	0	9	2	9	9	0	1	1
323	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-322		urxlyj	1	34	2	\N	1	1	0	2	f	9	0	2	0	1	9	1	0	2	1	0	1	1	4
324	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-323		gmldrq	1	25	0	\N	4	3	2	1	t	2	4	4	3	3	2	3	9	2	9	0	9	9	4
325	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-324		arsnfk	2	29	1	\N	6	2	1	1	f	5	4	1	3	2	3	0	0	2	0	0	9	1	2
326	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-325		vdpjrx	2	48	4	\N	5	4	2	1	f	12	4	3	4	2	1	2	1	0	0	0	0	1	8
327	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-326		ugfpzw	1	15	0	\N	3	4	2	1	t	5	2	2	1	0	3	3	1	0	0	1	9	0	1
328	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-327		mfkywq	2	55	3	\N	1	2	2	2	t	10	7	1	4	1	1	0	2	0	0	9	9	0	2
329	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-328		pxdwea	1	44	1	\N	2	1	1	1	t	4	11	0	1	1	2	2	1	9	9	0	0	0	1
330	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-329		ysmvfr	2	26	2	\N	1	4	1	3	f	9	8	3	0	9	1	1	9	1	1	9	1	9	1
331	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-330		ahnplq	1	56	1	\N	1	2	1	2	f	5	5	2	1	3	2	0	1	1	1	0	0	9	1
332	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-331		sidrka	1	63	2	\N	1	4	2	2	t	9	10	0	4	2	1	0	1	1	1	1	1	1	8
333	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-332		myhlwd	1	44	1	\N	3	3	1	2	t	11	5	2	1	1	3	1	9	2	9	9	1	0	2
334	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-333		pdbfky	2	42	3	\N	2	3	1	2	f	11	12	3	9	3	3	2	9	2	0	0	9	9	1
335	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-334		iwmuky	2	16	1	\N	3	2	0	1	f	3	11	9	3	1	1	1	1	1	1	1	0	0	2
336	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-335		hqgxac	2	31	2	\N	6	2	0	1	f	8	2	3	1	9	3	2	0	9	9	1	0	1	1
337	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-336		yizfva	2	64	1	\N	6	2	0	2	t	9	9	0	3	1	9	1	9	2	1	1	0	0	4
338	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-337		lvntoj	2	33	4	\N	3	3	0	2	f	6	1	3	2	2	9	3	1	2	0	0	1	1	1
339	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-338		fteuwd	1	44	0	\N	3	1	1	1	t	7	10	4	3	9	1	2	1	0	0	0	1	1	2
340	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-339		jmzwts	1	42	4	\N	1	1	1	1	t	4	1	9	1	2	9	2	9	9	0	0	0	0	2
341	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-340		ahfoxk	1	27	2	\N	6	1	2	3	f	12	10	4	9	2	9	1	0	1	1	0	9	9	4
342	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-341		lvngmx	1	64	2	\N	0	1	0	2	t	11	0	4	0	3	1	2	9	9	9	9	0	9	4
343	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-342		jbrfoc	2	39	2	\N	6	1	2	2	f	7	2	4	3	0	3	3	9	1	9	0	9	0	3
344	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-343		azdkch	2	15	0	\N	3	4	0	1	f	5	9	4	9	1	1	0	1	0	9	1	1	9	8
345	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-344		vfprwk	1	31	3	\N	6	4	2	1	f	4	10	3	9	3	3	2	9	9	1	1	9	0	4
346	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-345		lxjgqf	2	29	1	\N	0	1	1	2	t	6	2	0	4	3	1	0	2	9	9	0	9	0	2
347	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-346		tujmpg	1	61	1	\N	3	4	1	2	f	5	1	2	3	0	9	1	9	1	9	9	9	9	2
348	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-347		ckxpbh	1	23	0	\N	0	3	2	2	f	7	12	9	4	9	9	2	0	0	1	1	1	1	3
349	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-348		cvgiom	1	17	3	\N	3	2	2	2	t	4	4	1	4	1	3	0	0	9	9	1	0	9	1
350	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-349		bhiokv	1	58	3	\N	3	1	0	1	f	5	1	1	4	0	2	3	9	1	0	9	0	1	8
351	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-350		wodzak	2	57	4	\N	4	1	1	3	t	9	12	2	0	1	3	2	2	9	9	1	9	0	4
352	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-351		tdcxwb	1	35	2	\N	6	4	0	2	f	9	1	9	4	1	3	1	2	2	9	1	1	1	1
353	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-352		fnolcr	1	51	3	\N	0	3	0	2	t	3	9	4	3	0	2	0	0	0	9	9	0	0	2
354	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-353		nlickj	2	64	1	\N	2	2	0	3	t	8	7	4	9	1	2	0	0	1	9	9	0	0	3
355	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-354		zghnfe	2	32	2	\N	1	1	2	1	t	1	12	3	4	3	2	2	0	2	0	0	1	0	1
356	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-355		cdkjmy	2	47	0	\N	6	3	0	3	f	8	8	9	3	3	9	3	1	1	0	9	0	1	3
357	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-356		pdtsor	1	39	0	\N	1	1	0	2	f	11	12	9	1	3	9	2	1	0	1	0	1	9	8
358	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-357		gwxdmi	1	40	1	\N	6	2	0	1	t	9	4	0	9	1	9	1	1	2	0	1	9	0	1
359	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-358		cfhiov	2	36	3	\N	5	3	0	1	f	4	5	1	4	9	9	3	0	0	1	0	1	0	8
360	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-359		uzslie	2	31	4	\N	4	1	1	3	t	4	12	1	2	3	1	1	1	0	1	0	0	1	1
361	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-360		iuxwnv	1	30	3	\N	0	2	1	3	f	12	1	9	4	9	3	3	0	0	0	0	1	1	1
362	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-361		kxfpzn	1	51	3	\N	2	1	2	3	t	0	12	3	2	3	1	1	0	9	0	1	0	9	3
363	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-362		hrzjsw	1	24	4	\N	6	4	2	3	t	10	7	0	1	1	3	3	1	9	1	1	0	0	4
364	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-363		kgjdlz	2	24	1	\N	2	1	1	1	t	0	3	2	0	0	2	1	0	2	1	1	9	0	2
365	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-364		ahutim	2	39	3	\N	0	3	0	3	t	4	5	2	0	2	9	2	2	9	9	1	0	9	4
366	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-365		plvbam	2	56	3	\N	3	4	0	1	t	2	0	3	2	1	3	3	2	2	9	0	9	9	2
367	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-366		lpzven	2	27	0	\N	6	4	0	1	f	7	0	4	0	3	2	0	9	0	0	9	9	0	3
368	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-367		scvuda	2	15	2	\N	0	2	2	2	f	10	5	3	9	2	3	1	1	1	0	0	1	1	8
369	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-368		ekuqfm	1	18	4	\N	6	1	0	2	f	5	12	4	3	3	9	0	0	0	1	0	1	1	3
370	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-369		qwfijl	2	48	3	\N	0	3	1	1	f	7	11	3	2	3	1	1	0	1	9	0	1	1	8
371	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-370		cbmiqu	2	44	3	\N	5	2	0	3	t	3	9	0	2	9	2	1	1	2	0	0	9	1	2
372	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-371		cdtvew	2	23	2	\N	6	3	1	2	t	7	11	9	1	0	3	3	1	0	1	0	9	0	3
373	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-372		uapmko	1	16	2	\N	4	2	0	2	t	6	12	1	3	3	1	1	0	9	1	0	1	1	2
374	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-373		gwpqud	1	61	0	\N	4	2	2	3	t	12	11	4	9	9	3	3	9	9	0	9	0	1	4
375	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-374		zqpvre	1	54	1	\N	3	4	1	1	f	5	6	0	4	3	1	1	1	1	0	1	1	1	3
376	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-375		jxlodv	1	48	0	\N	3	1	2	3	t	2	2	3	0	0	2	0	0	1	0	9	0	0	1
377	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-376		hdgjot	2	56	4	\N	1	1	1	1	t	1	8	1	2	0	9	2	0	2	0	0	0	9	3
378	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-377		opvqds	1	44	2	\N	5	3	1	1	f	6	0	9	4	1	9	0	1	9	9	0	0	0	4
379	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-378		lcateq	1	18	1	\N	1	4	1	3	f	7	5	2	0	2	1	3	1	9	1	9	1	9	8
380	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-379		suimzx	2	27	2	\N	6	2	2	3	t	11	7	2	9	1	2	1	2	1	0	1	0	9	3
381	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-380		jxcrgp	2	60	1	\N	5	4	0	2	t	0	3	0	4	2	9	0	9	0	0	1	0	0	8
382	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-381		qpdcar	2	46	4	\N	1	3	0	3	t	12	3	1	4	3	3	0	9	2	9	0	9	1	2
383	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-382		tlages	1	21	2	\N	6	3	2	2	t	1	1	2	0	2	2	2	0	1	9	9	9	0	2
384	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-383		faydbc	2	46	1	\N	5	3	1	3	t	12	4	3	2	9	1	2	9	0	0	9	9	0	1
385	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-384		hrykwd	2	29	4	\N	6	3	0	1	t	9	5	4	1	9	3	0	9	0	9	0	9	1	2
386	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-385		pbvfhz	2	19	2	\N	6	2	1	3	t	2	9	0	4	3	3	1	1	9	9	0	9	1	8
387	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-386		yzncbu	2	36	2	\N	3	3	1	1	t	5	10	0	4	3	1	0	2	9	0	9	0	9	8
388	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-387		thimva	2	19	4	\N	6	4	0	1	t	7	7	2	1	0	9	2	1	1	1	9	9	1	8
389	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-388		eldauk	2	60	0	\N	5	3	2	1	f	3	10	9	2	3	2	1	0	0	9	0	0	0	1
390	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-389		swikcj	1	57	4	\N	2	2	1	2	t	2	1	3	9	0	9	0	1	1	9	1	9	0	8
391	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-390		zrakif	1	19	2	\N	6	3	2	2	f	0	11	1	4	0	2	0	9	1	0	0	9	0	1
392	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-391		yvxora	2	55	4	\N	1	3	1	1	t	12	10	2	9	9	1	3	9	9	1	1	1	9	8
393	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-392		lpmzfw	1	65	0	\N	2	3	0	2	t	5	1	0	9	9	2	0	0	1	1	9	9	0	1
394	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-393		tpukwo	2	36	0	\N	0	3	1	2	t	8	8	4	3	0	1	1	1	9	1	1	0	9	4
395	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-394		ndpglz	1	34	4	\N	5	2	0	2	t	6	6	1	0	3	2	2	9	9	1	1	0	0	1
396	2010-07-13 00:00:00	A01001	A01001C3	t	t	A01001-395		bgezsc	1	32	4	\N	0	1	1	2	f	3	10	2	9	0	1	0	1	2	1	9	0	1	8
397	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-396		vgwisj	1	24	2	\N	0	4	2	2	f	1	9	0	9	3	9	1	0	2	9	9	0	1	3
398	2010-07-13 00:00:00	A01001	A01001C3	f	t	A01001-397		tiaydh	1	16	2	\N	3	3	0	1	t	8	9	2	1	0	1	1	0	0	9	9	1	1	2
399	2010-07-13 00:00:00	A01001	A01001C3	t	f	A01001-398		dzxkcv	2	51	3	\N	3	1	2	3	t	12	8	2	0	1	1	3	2	9	1	1	0	9	3
400	2010-07-13 00:00:00	A01001	A01001C3	f	f	A01001-399		jochqt	2	51	2	\N	3	3	0	3	f	5	7	9	0	2	3	3	2	1	0	1	9	1	2
401	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-0		mqukcy	1	15	2	\N	6	3	0	3	f	11	8	0	9	2	9	3	1	0	9	9	0	1	2
402	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-1		drswno	1	61	4	\N	4	2	0	1	f	8	9	1	4	3	1	2	0	9	1	0	1	1	4
403	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-2		yalkpn	2	45	1	\N	3	4	0	2	f	5	10	4	2	1	3	1	0	2	0	9	9	0	4
404	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-3		vtozug	1	29	4	\N	6	2	2	3	f	12	3	2	3	3	2	1	9	9	9	0	0	9	4
405	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-4		enikaf	2	59	1	\N	5	4	1	3	f	12	8	9	4	9	2	1	1	1	9	1	1	0	3
406	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-5		vnxzeq	1	60	1	\N	0	1	1	2	t	11	10	9	4	0	1	3	9	0	0	1	0	9	8
407	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-6		hetfza	2	49	3	\N	0	2	2	2	t	2	0	2	9	1	3	3	9	9	9	9	9	1	3
408	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-7		cuvkxg	1	16	2	\N	0	4	1	1	t	11	3	9	2	1	3	1	1	2	0	0	1	1	3
409	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-8		xqilrz	1	34	2	\N	5	4	1	2	t	11	6	4	1	2	2	2	0	2	0	9	1	1	1
410	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-9		krgina	2	31	1	\N	0	2	2	3	f	7	1	0	9	0	9	0	0	1	9	0	9	1	1
411	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-10		wensmf	2	20	0	\N	4	2	1	2	f	9	1	9	3	1	9	1	9	9	1	0	1	0	3
412	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-11		dbgtvi	2	60	4	\N	4	2	1	2	t	2	7	4	0	9	1	0	9	1	0	0	1	9	3
413	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-12		ulbrox	1	57	4	\N	0	1	2	2	t	1	5	3	0	9	9	1	1	0	9	1	0	1	4
414	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-13		bhluyp	2	43	4	\N	4	1	2	3	f	0	12	4	3	1	9	1	9	2	0	9	0	1	1
415	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-14		pcmkfz	2	44	1	\N	5	4	1	3	t	12	6	1	9	1	1	3	9	9	0	1	9	0	1
416	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-15		mahgon	1	42	1	\N	3	1	2	3	t	8	12	3	9	2	9	0	2	0	0	1	9	9	1
417	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-16		ibqfvr	1	32	1	\N	5	4	1	1	f	5	10	1	3	9	2	3	1	2	1	1	0	9	8
418	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-17		qubvgs	1	40	0	\N	5	4	0	3	t	9	7	4	3	3	1	0	1	0	0	0	0	9	2
419	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-18		oscvad	1	28	4	\N	4	3	0	2	f	11	8	0	9	3	3	2	9	9	9	0	0	9	4
420	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-19		atsnqf	2	28	1	\N	3	4	2	3	f	4	7	9	2	2	1	3	0	2	9	9	0	1	8
421	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-20		hejftw	1	38	2	\N	1	2	1	3	f	2	11	1	0	3	2	1	9	2	1	9	1	0	4
422	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-21		cixjsa	2	63	4	\N	5	3	0	2	f	3	3	4	1	3	2	2	9	9	1	0	1	1	2
423	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-22		hqrkav	2	51	4	\N	2	4	2	2	t	8	0	2	0	0	3	2	1	1	1	9	9	0	2
424	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-23		fuotxy	1	46	1	\N	5	4	1	3	t	3	6	0	4	3	3	1	2	9	0	1	9	9	2
425	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-24		qliftp	2	43	1	\N	4	4	2	2	t	10	7	0	2	0	3	1	9	9	1	1	0	1	3
426	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-25		ymjdxp	1	20	3	\N	5	3	2	2	t	9	12	3	2	9	9	0	2	2	0	9	9	0	2
427	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-26		xriocq	2	49	0	\N	6	4	0	1	t	1	1	4	0	9	2	3	0	2	1	9	9	1	3
428	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-27		mfxzyt	1	24	1	\N	5	4	2	1	f	4	8	4	1	9	3	3	0	2	0	0	0	0	3
429	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-28		istfex	1	64	1	\N	6	3	2	1	f	9	5	0	9	1	9	3	9	0	9	0	1	9	8
430	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-29		idscyb	1	18	3	\N	1	3	2	3	t	2	12	3	4	0	9	0	9	2	0	1	0	0	4
431	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-30		ekzugf	1	24	0	\N	5	3	1	2	t	11	2	4	0	2	3	1	2	0	0	0	9	1	4
432	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-31		ubdalx	2	53	4	\N	4	3	2	1	t	7	10	4	2	9	9	1	2	9	1	1	1	1	4
433	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-32		gnvixh	1	51	0	\N	0	4	1	2	t	10	8	2	1	2	9	0	9	2	1	1	1	1	4
434	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-33		ezxojq	1	28	4	\N	6	1	2	2	f	8	11	1	9	9	9	3	1	1	1	0	0	0	4
435	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-34		zamycl	2	62	3	\N	5	3	2	1	f	10	3	2	1	9	3	2	1	2	0	9	9	0	4
436	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-35		riwpgd	1	45	2	\N	0	3	2	1	f	12	6	4	1	1	9	1	2	0	9	1	0	9	2
437	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-36		zonpkv	1	16	3	\N	4	4	1	1	f	4	0	2	3	9	2	3	0	0	9	0	9	9	1
438	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-37		vumndh	2	42	4	\N	2	1	1	2	t	5	7	3	9	1	9	3	0	0	0	9	9	1	8
439	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-38		avnrex	2	23	3	\N	6	4	2	1	f	12	8	3	4	3	2	2	2	0	1	9	1	1	3
440	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-39		xgsqlm	1	53	0	\N	0	3	1	3	t	11	9	1	9	0	2	3	1	2	0	1	0	1	8
441	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-40		luatdj	2	16	0	\N	1	4	0	2	f	10	2	0	9	3	3	0	9	1	9	0	1	1	1
442	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-41		pfyazc	2	52	2	\N	3	2	0	3	f	1	10	3	1	9	3	1	2	2	0	0	9	0	3
443	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-42		hlrgvz	2	19	4	\N	5	2	2	1	t	1	9	0	3	0	9	0	9	0	0	0	1	1	2
444	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-43		nylevq	1	58	0	\N	3	4	2	2	f	5	4	1	3	9	3	3	9	2	1	0	0	1	2
445	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-44		oiryun	2	61	4	\N	1	4	1	2	f	8	10	3	0	9	2	1	9	9	1	1	1	0	4
446	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-45		vecqtj	2	47	3	\N	3	4	2	1	t	9	4	2	3	1	3	2	1	9	1	0	0	9	2
447	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-46		iwncxv	2	54	2	\N	3	1	0	2	f	10	12	3	2	9	9	0	0	1	0	1	9	9	3
448	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-47		kwnpum	1	55	0	\N	4	1	2	1	t	11	10	9	3	0	3	0	0	0	0	1	0	9	1
449	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-48		ldeqzb	2	60	4	\N	1	3	2	2	f	0	11	2	9	1	2	1	9	9	0	0	0	9	3
450	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-49		ocemqw	1	27	1	\N	0	3	2	2	f	4	0	3	2	0	1	3	2	0	9	9	9	0	1
451	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-50		ladvzf	2	52	3	\N	4	1	0	2	f	2	5	2	9	1	2	0	9	2	1	9	0	0	4
452	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-51		nzvypw	1	33	4	\N	5	2	2	3	t	9	10	3	1	3	9	0	2	2	0	1	9	0	3
453	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-52		izsloq	2	61	1	\N	6	3	2	3	t	10	5	4	3	1	9	2	2	0	9	9	0	0	8
454	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-53		wmenqx	1	60	2	\N	3	1	1	1	t	10	11	3	4	9	9	2	9	9	1	9	9	0	4
455	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-54		dztmbv	1	61	1	\N	5	3	1	3	t	2	3	4	0	3	9	1	9	9	0	0	0	0	8
456	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-55		ebwfid	2	27	2	\N	3	1	1	1	t	7	12	2	1	1	1	2	0	1	1	0	1	1	4
457	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-56		fhyoxl	2	37	1	\N	5	2	0	1	t	1	0	2	0	2	9	3	9	0	1	1	9	9	1
458	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-57		upzeor	1	50	3	\N	0	2	0	2	f	0	6	9	4	0	2	1	0	9	1	9	0	1	8
459	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-58		bzglpa	1	23	0	\N	1	1	0	2	t	4	5	0	9	0	3	0	0	0	9	1	1	9	2
460	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-59		lrbyjz	1	56	3	\N	2	4	2	2	f	7	11	9	2	0	9	3	0	0	1	0	1	1	4
461	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-60		karsgd	2	43	4	\N	0	1	0	3	f	12	5	4	3	9	9	0	1	0	0	0	9	0	2
462	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-61		qdpmtw	2	63	1	\N	5	2	1	3	t	8	5	4	2	2	1	3	0	1	9	0	1	1	1
463	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-62		ijxqmo	1	56	3	\N	0	3	1	3	f	1	6	1	0	0	2	2	2	1	0	0	0	1	4
464	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-63		kxqezp	1	64	1	\N	6	2	0	1	f	9	12	0	2	1	3	3	2	9	9	1	1	0	1
465	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-64		haycie	1	25	0	\N	0	1	2	3	f	1	5	3	9	9	9	1	9	0	1	9	1	9	4
466	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-65		vbjyaw	2	34	1	\N	5	4	1	1	f	12	3	4	2	1	1	2	0	2	9	0	0	9	8
467	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-66		uszmex	1	42	1	\N	1	3	1	2	f	10	12	0	3	3	2	1	1	1	0	1	0	9	4
468	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-67		fycgzj	1	33	3	\N	5	1	2	2	f	2	1	4	1	3	2	2	0	2	9	0	1	1	3
469	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-68		dhybcj	1	58	4	\N	0	3	1	3	t	6	11	4	2	0	3	0	9	0	9	1	1	1	1
470	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-69		juchkg	1	35	1	\N	4	2	1	1	t	0	11	2	9	2	1	3	2	2	9	0	9	1	8
471	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-70		hymnso	2	60	2	\N	4	2	0	1	f	8	7	1	2	2	9	0	1	2	1	0	9	9	4
472	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-71		mbzrci	2	63	3	\N	1	1	0	1	t	3	2	3	2	9	3	2	0	1	9	1	9	1	2
473	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-72		qdbnlt	2	31	0	\N	1	2	2	3	f	4	12	2	4	9	1	0	2	2	1	1	0	0	8
474	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-73		umjdnf	1	38	2	\N	1	3	1	3	f	10	11	3	4	1	3	0	0	1	0	0	1	1	3
475	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-74		peyhfb	2	35	2	\N	0	4	2	2	f	8	7	0	3	2	1	1	0	2	9	0	0	9	8
476	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-75		narmpw	2	29	2	\N	3	3	0	1	t	5	8	1	9	0	3	1	2	0	9	9	9	9	4
477	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-76		kiftjr	1	33	2	\N	1	3	2	1	t	12	5	3	1	3	1	3	1	1	9	1	0	0	8
478	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-77		slfqhd	2	61	0	\N	2	4	2	2	f	5	2	2	3	3	1	2	2	1	0	1	0	9	2
479	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-78		tbkneq	2	59	0	\N	1	1	2	2	t	1	6	4	1	1	2	2	9	9	1	0	0	1	2
480	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-79		yfugxw	1	59	0	\N	3	4	2	3	t	2	4	4	2	2	3	3	0	1	1	1	1	0	3
481	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-80		uidtnj	1	50	0	\N	1	3	0	2	f	4	9	2	3	3	3	3	0	1	1	1	9	9	3
482	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-81		gedtry	1	63	0	\N	6	4	1	2	t	12	5	9	2	3	2	3	0	1	1	1	0	9	8
483	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-82		xvjsaw	2	50	0	\N	2	2	2	2	t	9	9	3	0	2	1	1	1	2	1	9	9	0	8
484	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-83		xyqdtr	1	40	4	\N	2	4	2	3	f	2	1	1	4	2	2	3	1	1	0	9	1	1	8
485	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-84		cyxbvh	2	34	4	\N	3	2	0	3	t	8	11	2	3	2	1	1	9	0	9	9	0	1	4
486	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-85		ekwihx	2	43	4	\N	5	1	2	1	f	10	3	4	9	2	9	0	1	9	0	9	9	1	4
487	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-86		pnrifu	2	59	2	\N	6	3	1	2	f	9	0	2	1	2	1	1	0	9	9	0	0	0	8
488	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-87		tpkfbu	2	35	2	\N	4	2	0	3	f	6	12	1	2	3	3	3	1	1	9	1	1	1	4
489	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-88		sdivun	1	42	0	\N	4	1	0	2	t	1	8	1	3	0	1	2	2	9	1	9	1	1	4
490	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-89		ziyovq	1	56	0	\N	3	4	2	3	t	9	10	9	2	9	1	2	0	0	1	9	1	9	4
491	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-90		vxhium	1	62	2	\N	3	1	0	2	t	5	6	4	0	2	3	0	0	2	9	9	0	9	2
492	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-91		acjlem	1	56	4	\N	5	4	2	1	t	9	11	2	1	3	2	2	9	2	1	1	9	0	8
493	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-92		zwkfpa	2	57	2	\N	3	4	2	3	f	6	10	2	4	9	2	1	2	0	0	9	1	0	1
494	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-93		kutmlv	1	40	4	\N	5	1	0	1	f	7	12	2	9	1	1	1	0	0	1	9	0	0	1
495	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-94		cogiqu	1	41	2	\N	5	1	0	2	t	1	5	2	0	9	3	1	0	2	9	0	9	9	8
496	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-95		qvgkrp	2	57	4	\N	1	3	1	3	t	2	5	1	9	1	1	3	1	0	9	0	0	0	2
497	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-96		pbuiwq	1	64	3	\N	3	1	0	3	t	10	0	0	9	0	9	3	9	9	9	0	0	9	8
498	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-97		hyfmdc	1	47	2	\N	2	1	1	1	t	5	7	3	4	3	3	0	0	1	9	1	9	0	3
499	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-98		svmwgl	1	27	3	\N	2	1	1	2	t	6	12	9	4	1	9	0	2	2	1	9	9	1	8
500	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-99		tczjhs	1	56	1	\N	6	4	1	2	f	2	11	2	0	1	2	3	2	2	0	0	0	0	2
501	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-100		whvqyf	2	15	4	\N	6	4	0	1	f	12	12	1	9	9	2	1	2	0	1	1	1	9	1
502	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-101		zmofqc	2	20	0	\N	5	4	0	1	f	12	6	2	1	1	2	2	1	2	1	9	1	1	3
503	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-102		poijdy	2	59	0	\N	4	1	1	2	f	4	3	4	3	0	2	3	1	9	0	9	9	1	2
504	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-103		qpeuok	2	45	2	\N	2	2	2	1	f	4	9	2	3	0	3	2	1	0	0	1	9	0	1
505	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-104		icgjbz	1	40	3	\N	5	1	2	2	f	5	5	2	3	9	1	3	0	1	0	9	1	9	3
506	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-105		mkrwgd	2	15	4	\N	1	2	2	1	f	0	0	0	1	9	1	2	9	2	0	1	9	0	1
507	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-106		zrythv	1	64	1	\N	2	3	1	3	t	5	9	4	1	3	1	2	2	9	9	9	9	0	8
508	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-107		tsoeni	2	63	0	\N	5	2	2	2	t	6	8	4	2	9	1	3	0	2	9	0	0	9	2
509	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-108		zyocgu	1	60	3	\N	1	2	2	1	f	9	6	1	0	0	2	1	0	2	1	9	1	1	2
510	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-109		yrajlu	1	53	3	\N	2	3	0	3	f	4	7	9	2	0	2	3	1	9	0	1	9	9	8
511	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-110		colfvd	2	59	0	\N	1	1	2	1	t	0	1	1	0	3	2	3	1	0	0	9	0	1	8
512	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-111		thiwrm	1	33	2	\N	3	4	2	2	f	9	11	9	3	3	9	1	1	2	9	1	0	1	8
513	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-112		dxntvw	1	15	4	\N	1	1	1	2	t	2	11	1	2	2	2	3	9	0	9	9	1	1	1
514	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-113		ousdcm	1	34	1	\N	3	2	1	2	t	5	9	3	2	1	9	3	1	0	1	9	0	9	4
515	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-114		nfhcst	2	63	0	\N	5	1	0	2	t	2	9	1	4	9	3	0	1	0	1	1	1	0	8
516	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-115		cykwzf	1	65	1	\N	5	3	0	2	f	0	8	4	1	2	3	2	0	1	1	1	0	1	1
517	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-116		umfvpw	1	65	0	\N	0	1	1	3	f	2	10	9	2	1	3	1	2	0	1	0	9	9	1
518	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-117		stnxoq	1	22	2	\N	5	1	2	2	f	0	5	3	2	9	1	3	0	1	1	0	0	9	8
519	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-118		nfokua	2	62	2	\N	2	3	2	3	f	1	3	4	1	3	3	2	2	0	9	9	1	1	2
520	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-119		xihcgd	2	28	1	\N	2	4	1	3	t	2	0	0	3	1	3	3	1	0	9	0	9	9	8
521	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-120		umxodz	2	57	2	\N	4	2	1	2	t	3	9	0	2	3	3	1	0	1	0	0	9	9	1
522	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-121		grhfup	2	24	1	\N	4	4	2	3	t	1	0	4	1	0	3	2	0	0	0	1	0	0	3
523	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-122		oetqlv	2	55	2	\N	3	1	1	3	t	8	11	4	9	9	9	3	2	2	9	0	0	0	4
524	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-123		szwlhy	2	20	1	\N	4	1	1	1	f	12	12	2	9	9	1	1	0	1	0	9	9	0	3
525	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-124		edhyxt	2	63	0	\N	3	1	0	1	f	1	1	4	0	9	1	2	2	2	1	1	0	0	3
526	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-125		puozjk	2	25	2	\N	0	4	1	3	t	0	8	4	0	2	3	2	1	1	9	9	9	1	8
527	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-126		jomsqu	1	63	1	\N	6	3	0	1	f	5	0	2	1	1	3	0	2	9	1	1	1	0	8
528	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-127		ptmrhl	2	49	1	\N	1	1	0	2	t	3	7	3	2	2	9	2	1	9	0	0	0	9	4
529	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-128		ieyzst	2	33	1	\N	3	4	2	2	t	11	5	9	0	3	9	0	0	1	1	9	9	0	4
530	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-129		wgumtx	1	47	2	\N	5	4	1	3	t	2	2	3	0	3	3	2	2	1	0	0	9	9	4
531	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-130		makqju	2	22	3	\N	5	2	0	2	t	11	8	2	0	2	3	3	1	2	1	0	0	9	4
532	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-131		aektwl	1	49	1	\N	1	4	2	2	t	6	4	0	2	9	2	2	0	0	1	0	9	1	8
533	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-132		ruwbpx	2	38	2	\N	5	1	0	1	t	11	7	1	0	2	3	0	9	1	9	0	1	1	4
534	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-133		zrqgay	2	27	2	\N	1	1	0	1	f	0	12	9	0	3	9	2	2	9	9	0	1	0	2
535	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-134		dvmiwo	1	34	4	\N	0	3	1	3	t	2	5	9	0	1	9	3	0	1	1	0	9	9	1
536	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-135		igvyph	2	19	2	\N	1	4	1	3	t	7	12	2	9	0	1	2	1	1	0	1	0	9	8
537	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-136		byqwih	1	46	0	\N	6	1	0	2	f	6	7	1	3	1	2	0	0	1	9	0	1	1	3
538	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-137		zqelit	2	50	1	\N	3	2	1	1	t	8	9	9	3	1	3	3	9	2	1	0	1	0	3
539	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-138		rvhbyl	2	50	0	\N	6	1	0	3	f	10	8	4	2	2	2	2	9	1	1	1	9	0	1
540	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-139		vigdco	2	58	1	\N	1	4	0	1	f	3	10	1	9	2	1	0	9	1	1	1	0	0	8
541	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-140		tvfznh	1	35	4	\N	3	2	1	3	t	12	4	9	4	9	2	1	0	0	1	0	0	1	2
542	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-141		czjhsg	1	65	3	\N	3	2	0	3	t	12	1	3	9	1	9	0	0	0	1	1	0	1	8
543	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-142		qpxlef	1	32	1	\N	1	3	2	1	t	0	4	9	3	9	9	0	0	9	1	1	1	9	3
544	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-143		xfvbgz	2	23	4	\N	4	4	2	2	t	11	0	9	2	9	2	1	2	0	1	9	0	1	3
545	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-144		ktzphr	1	33	3	\N	6	2	1	2	f	12	5	3	2	9	2	0	1	1	0	0	0	9	1
546	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-145		hukvxz	2	32	0	\N	4	2	2	2	f	12	8	3	0	1	3	2	9	9	9	1	9	1	4
547	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-146		polyvx	1	64	3	\N	6	3	0	1	t	2	7	9	3	9	3	0	9	9	9	1	1	1	1
548	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-147		pdqxlg	1	28	2	\N	5	4	0	3	f	9	9	3	0	1	3	0	0	2	9	9	9	0	8
549	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-148		ejtqiv	2	23	1	\N	6	3	1	1	f	9	7	1	3	0	2	3	9	1	9	0	1	9	1
550	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-149		yjnmef	1	23	1	\N	1	3	0	1	t	8	12	3	4	3	1	1	0	1	1	9	1	1	2
551	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-150		nimzdh	2	56	3	\N	0	1	1	2	f	0	4	3	1	0	2	0	9	0	9	0	0	0	3
552	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-151		pmuacb	1	35	0	\N	0	1	1	3	f	0	3	2	9	1	9	2	0	9	1	0	0	1	8
553	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-152		qhsyrw	2	47	0	\N	6	1	2	2	f	10	3	2	0	9	3	0	0	9	1	0	9	0	4
554	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-153		czbshu	2	29	3	\N	4	4	1	2	t	6	11	2	3	2	1	0	2	2	1	1	0	0	4
555	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-154		wqglru	1	17	2	\N	3	2	2	3	t	3	12	0	4	2	9	1	1	2	0	1	1	9	2
556	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-155		lrcoda	1	51	4	\N	1	2	0	3	t	12	5	4	9	9	1	3	0	1	1	0	1	0	1
557	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-156		qubhkv	1	25	4	\N	1	2	0	1	f	5	9	3	2	9	2	3	0	9	9	0	0	9	3
558	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-157		ywohcm	2	58	3	\N	2	2	1	1	f	12	11	0	9	2	2	2	2	9	1	0	0	9	3
559	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-158		bniezw	1	20	1	\N	4	1	2	2	f	2	1	9	3	1	2	3	9	1	0	0	1	0	2
560	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-159		vdewcs	1	49	1	\N	3	3	1	3	f	6	4	9	1	3	1	3	0	1	1	0	9	0	2
561	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-160		kmqywa	2	62	1	\N	0	3	1	3	t	11	2	0	4	1	3	2	2	2	9	1	9	9	3
562	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-161		oluigh	1	57	1	\N	1	2	2	1	f	0	8	3	4	2	3	0	0	1	9	9	0	9	2
563	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-162		vcxqip	1	15	2	\N	3	3	0	2	t	1	1	4	1	3	1	1	2	9	0	1	0	1	8
564	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-163		viukqh	2	58	1	\N	2	3	0	3	t	4	10	9	4	9	2	3	2	1	9	9	0	1	3
565	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-164		wekixo	1	44	0	\N	4	1	0	3	f	6	8	2	9	1	1	1	1	9	9	9	0	1	4
566	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-165		qaxkig	1	21	0	\N	3	1	2	1	t	9	8	0	1	9	9	3	9	9	0	1	9	1	1
567	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-166		wpdveu	2	37	4	\N	6	2	2	3	t	0	5	2	3	1	2	0	1	1	0	1	0	9	1
568	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-167		gieqof	2	50	3	\N	6	1	2	2	t	4	5	0	3	9	3	2	1	1	0	1	1	0	8
569	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-168		azsnix	1	59	4	\N	0	4	0	2	t	10	0	1	4	0	2	0	2	2	0	1	9	0	8
570	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-169		ilktsn	2	59	4	\N	5	3	0	2	f	0	8	4	1	1	1	0	2	2	1	1	9	1	4
571	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-170		xiskmn	2	65	1	\N	0	4	1	3	t	7	5	4	9	9	1	0	9	1	0	1	9	9	8
572	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-171		qixwck	2	43	1	\N	3	1	2	1	f	7	2	4	9	0	1	3	1	9	9	9	1	0	8
573	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-172		xvcgrm	1	23	3	\N	1	3	0	1	f	6	6	4	1	2	1	0	2	9	1	1	9	0	4
574	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-173		atghkx	1	19	4	\N	3	2	2	2	t	7	5	2	1	1	9	1	9	9	9	9	0	9	3
575	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-174		yalxhv	1	19	0	\N	3	4	2	2	t	4	10	0	2	0	2	1	0	2	9	9	1	0	8
576	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-175		xztasm	1	33	2	\N	0	2	0	1	f	7	9	3	4	2	2	1	2	2	9	1	1	9	1
577	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-176		fjyewk	2	22	0	\N	5	4	2	3	f	6	3	0	1	3	2	3	9	1	9	1	0	9	4
578	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-177		jsonpa	2	52	1	\N	2	4	0	3	f	10	8	4	2	9	3	3	1	9	1	0	0	1	1
579	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-178		jybkvl	2	20	2	\N	3	1	2	3	f	2	11	1	0	3	2	3	0	9	1	1	9	9	4
580	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-179		vciloe	2	29	1	\N	2	2	1	3	t	4	0	1	9	2	3	1	1	9	1	1	0	9	4
581	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-180		nbaltd	2	54	2	\N	1	2	1	3	t	10	5	9	2	1	1	1	2	2	0	0	1	0	8
582	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-181		grptxz	2	54	0	\N	1	1	0	1	f	10	2	9	0	9	3	1	2	1	9	9	0	9	2
583	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-182		ibxrld	1	48	3	\N	1	4	2	2	t	5	11	3	9	0	1	0	2	9	1	9	9	0	8
584	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-183		muyqzi	2	45	4	\N	0	2	2	2	f	10	12	4	0	3	3	1	2	0	0	9	9	9	4
585	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-184		msbouz	1	47	3	\N	4	4	2	1	t	6	7	4	1	1	9	1	2	9	9	1	9	1	1
586	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-185		qjxdce	2	18	4	\N	4	4	1	1	f	11	5	1	3	3	3	0	1	2	0	9	1	9	1
587	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-186		fynqjg	2	32	2	\N	5	3	1	2	f	7	5	1	4	1	9	2	0	1	9	1	1	9	8
588	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-187		xeohzv	2	21	2	\N	2	1	1	2	f	11	10	3	0	9	9	0	1	0	0	1	0	9	4
589	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-188		jztcfw	2	61	0	\N	3	3	2	1	t	5	2	2	3	0	9	2	9	0	9	9	0	0	4
590	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-189		ehikpb	2	37	2	\N	1	4	1	2	t	11	3	1	2	1	9	0	0	1	9	1	0	1	1
591	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-190		pkmihd	2	23	1	\N	0	3	2	2	f	11	11	1	4	2	2	3	1	0	9	9	1	1	4
592	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-191		eqyzxj	1	54	4	\N	4	1	2	3	t	12	6	2	9	1	2	0	1	2	0	1	1	1	8
593	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-192		jmnpgq	2	64	1	\N	5	2	0	3	t	4	4	2	3	2	3	2	2	0	9	1	1	0	8
594	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-193		wrximl	1	15	3	\N	6	3	1	1	f	3	3	0	9	0	1	0	9	0	0	0	0	1	8
595	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-194		gicukj	1	64	3	\N	2	2	0	2	f	10	5	3	2	0	1	2	0	1	1	9	1	9	4
596	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-195		bharyi	1	29	0	\N	1	3	0	3	t	6	5	2	9	9	2	0	1	2	0	0	0	9	1
597	2010-07-12 00:00:00	B05120	B05120C11	t	t	B05120-196		hyrtsx	2	28	0	\N	1	1	0	1	t	4	5	4	2	0	1	0	0	9	1	0	1	9	4
598	2010-07-12 00:00:00	B05120	B05120C11	f	f	B05120-197		ihubzc	2	58	1	\N	2	3	0	2	f	0	1	4	3	3	3	1	9	9	9	0	9	0	3
599	2010-07-12 00:00:00	B05120	B05120C11	f	t	B05120-198		czuxsj	2	32	2	\N	5	1	1	1	t	5	12	0	2	0	9	0	9	0	9	1	9	1	1
600	2010-07-12 00:00:00	B05120	B05120C11	t	f	B05120-199		sjqolv	1	35	3	\N	5	4	1	1	t	7	8	0	1	1	1	2	2	9	0	0	1	0	2
601	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-200		lkxcdr	1	21	2	\N	1	3	2	1	f	5	6	3	0	3	1	1	9	9	1	0	9	9	2
602	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-201		qhlgfs	2	20	0	\N	3	2	2	1	t	10	7	1	9	1	3	3	1	9	9	0	9	0	8
603	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-202		klwyrb	1	35	1	\N	6	4	1	1	t	0	7	9	2	0	2	1	1	0	0	1	0	0	1
604	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-203		kdlwsv	1	43	0	\N	0	2	1	2	f	10	1	9	1	0	2	3	1	9	9	0	9	0	8
605	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-204		nzxtjs	1	19	0	\N	2	4	1	1	t	3	9	3	9	9	1	2	0	1	0	1	9	1	2
606	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-205		poiexs	1	61	2	\N	4	2	0	1	t	8	0	0	3	3	2	0	0	9	0	0	9	9	1
607	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-206		lrutoi	2	63	2	\N	1	2	1	1	f	8	0	1	3	0	2	1	0	9	9	1	1	1	3
608	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-207		ozsjdh	2	16	4	\N	0	1	0	2	t	11	3	3	9	3	3	1	2	2	0	9	9	1	8
609	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-208		hedikg	2	21	1	\N	5	2	1	2	f	5	6	4	0	0	9	1	2	0	0	1	9	9	3
610	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-209		knqdti	1	31	0	\N	3	3	2	2	t	0	1	9	2	1	1	3	2	1	9	9	0	1	8
611	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-210		ilzjnw	1	43	1	\N	0	2	1	3	t	1	6	3	9	2	9	1	1	9	1	0	0	9	4
612	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-211		fylrcx	2	34	0	\N	4	3	2	3	t	2	10	1	2	2	9	1	9	9	0	1	9	9	3
613	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-212		ahopvg	2	51	4	\N	4	1	0	1	t	7	12	9	1	1	1	0	9	2	9	1	9	0	2
614	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-213		dlhpva	1	31	1	\N	1	4	2	1	t	7	6	3	0	0	2	0	1	9	9	0	9	0	8
615	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-214		lgeoqz	1	35	1	\N	1	1	1	3	f	5	4	3	9	0	9	3	1	2	9	9	1	1	8
616	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-215		lpncsh	1	32	2	\N	4	4	1	3	t	9	8	0	3	2	2	2	0	0	0	9	9	9	3
617	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-216		caugrk	1	61	1	\N	1	3	1	2	f	8	7	0	3	3	9	3	2	1	9	9	9	1	3
618	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-217		gelqti	1	53	2	\N	2	3	0	1	f	9	5	9	1	3	2	3	1	0	9	0	0	0	2
619	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-218		ifsjan	2	35	2	\N	3	2	1	1	f	5	10	4	1	3	9	3	2	2	0	0	1	1	1
620	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-219		nltcgw	1	54	2	\N	2	1	0	2	t	9	10	9	2	0	9	0	0	2	1	1	1	0	8
621	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-220		hmpkco	2	38	1	\N	5	2	2	2	t	11	10	4	3	3	3	3	9	2	0	9	1	1	2
622	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-221		wvehdt	1	19	2	\N	3	4	2	1	f	11	9	4	3	3	1	1	1	9	0	9	1	1	2
623	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-222		udaejk	2	52	0	\N	2	2	0	3	f	6	12	3	0	1	1	2	2	2	1	0	9	1	2
624	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-223		brhqoz	2	31	0	\N	3	4	0	3	t	3	3	0	9	0	1	0	0	1	9	9	1	9	1
625	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-224		lzunvo	2	44	2	\N	4	1	0	2	f	4	12	2	9	9	3	3	1	2	9	9	1	0	1
626	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-225		dtmahu	1	28	1	\N	1	1	2	3	f	12	11	0	3	9	2	0	2	0	9	1	1	9	3
627	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-226		kwpmeh	1	46	1	\N	1	3	1	1	f	10	8	9	2	9	1	0	2	9	1	0	1	0	8
628	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-227		vykmui	2	59	3	\N	1	4	0	1	t	11	2	4	3	1	9	0	9	0	0	1	1	9	4
629	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-228		rjqhbm	1	16	4	\N	5	4	2	3	t	1	0	3	1	1	1	3	1	1	9	1	0	1	3
630	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-229		cxlozd	2	40	2	\N	3	4	2	2	f	11	8	3	1	3	3	0	9	1	1	0	0	0	4
631	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-230		bwimpq	2	57	1	\N	6	2	0	3	f	1	11	2	0	9	1	1	9	1	1	9	9	0	8
632	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-231		phisrv	1	26	3	\N	6	1	0	2	f	8	0	2	3	2	2	2	0	1	9	0	1	1	3
633	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-232		lmpkun	1	61	0	\N	3	2	2	1	f	5	11	0	9	3	1	0	9	1	1	0	1	9	2
634	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-233		iurqew	1	29	3	\N	0	1	0	2	t	9	1	3	9	3	3	2	0	9	1	1	1	9	3
635	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-234		oefahn	1	40	1	\N	3	3	2	1	t	6	2	4	1	1	2	2	9	9	1	0	1	9	3
636	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-235		qeilmb	1	49	3	\N	3	2	0	2	t	3	9	0	2	0	1	2	2	9	0	1	0	1	8
637	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-236		xnlpob	1	41	4	\N	5	3	2	2	t	7	8	3	2	2	9	0	1	2	9	0	0	9	2
638	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-237		pkblvu	1	18	1	\N	1	4	2	1	f	11	11	2	1	0	3	2	2	0	1	1	1	0	8
639	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-238		artpxu	2	23	3	\N	5	4	2	2	f	12	7	4	2	0	9	0	0	1	9	0	1	0	2
640	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-239		ngpckb	1	22	1	\N	0	1	0	3	f	2	2	3	9	2	1	0	9	0	0	0	0	1	4
641	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-240		tghozu	1	54	2	\N	4	4	2	2	f	7	12	1	4	9	3	2	9	1	0	0	1	1	1
642	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-241		acemwu	1	58	0	\N	4	2	2	1	f	0	12	9	1	3	2	2	1	0	9	0	0	0	8
643	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-242		mzjvpu	1	34	2	\N	3	3	0	1	t	1	6	3	0	9	9	2	9	1	0	9	0	0	2
644	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-243		dspmji	2	31	2	\N	5	3	2	2	t	3	4	4	2	2	3	0	2	1	9	1	1	0	1
645	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-244		jylxwz	1	46	1	\N	0	3	2	1	t	11	9	4	2	3	2	2	0	2	1	0	9	1	8
646	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-245		irexkp	1	23	1	\N	5	1	2	1	t	8	0	2	4	2	2	1	0	0	0	9	9	0	1
647	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-246		azipdo	2	33	0	\N	2	1	1	2	f	10	2	3	0	2	9	2	2	0	0	1	0	0	3
648	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-247		lhqnct	2	21	2	\N	3	2	1	1	t	2	10	1	2	1	3	1	9	1	9	0	0	1	8
649	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-248		uzsdnv	2	24	0	\N	0	3	2	3	t	8	1	2	3	1	3	0	9	9	1	1	9	1	1
650	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-249		lmkogv	1	48	1	\N	2	1	0	1	f	9	5	4	3	0	1	3	1	9	1	9	0	0	1
651	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-250		ehiyvo	2	62	4	\N	3	3	0	2	t	12	11	9	0	1	1	0	2	0	1	1	1	1	3
652	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-251		afeqbm	2	27	4	\N	3	4	0	2	f	4	10	9	2	9	1	1	2	1	1	9	9	0	8
653	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-252		afuiyl	2	29	0	\N	1	4	1	1	f	4	9	9	4	9	3	3	1	0	0	9	0	9	1
654	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-253		ylwndh	2	61	4	\N	0	4	1	3	t	10	1	0	1	9	1	3	2	0	9	1	1	1	3
655	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-254		uqgzda	1	37	0	\N	6	2	0	3	f	1	3	0	9	1	9	2	0	2	0	9	9	0	3
656	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-255		ewfvyi	1	53	4	\N	5	4	2	1	t	9	0	0	2	1	1	2	2	9	0	9	0	0	4
657	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-256		wyiufc	2	39	0	\N	0	1	0	2	f	9	8	0	2	3	1	2	2	0	0	9	9	9	8
658	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-257		tcnfie	1	18	4	\N	6	3	2	3	t	3	11	3	1	9	1	2	0	9	0	1	9	1	8
659	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-258		tyxubs	1	18	2	\N	1	1	1	3	f	5	0	0	3	1	1	1	0	9	1	0	0	0	3
660	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-259		usflze	2	55	0	\N	5	4	1	2	t	2	8	1	2	3	9	1	9	1	0	1	0	0	8
661	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-260		odrltc	2	23	0	\N	1	2	0	2	f	11	3	2	9	0	1	2	9	0	9	1	9	0	4
662	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-261		yxtmzl	2	36	4	\N	3	1	2	2	t	8	12	9	2	2	2	0	1	1	0	1	1	1	1
663	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-262		dnpfwz	1	50	1	\N	4	3	0	1	f	7	10	3	1	9	1	1	2	9	9	1	9	0	1
664	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-263		wburyz	2	58	2	\N	3	1	1	2	f	11	8	9	3	0	1	3	9	9	1	9	1	1	8
665	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-264		uykfqh	2	45	3	\N	2	3	2	1	t	12	4	2	3	1	1	0	0	2	0	9	1	0	4
666	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-265		ljyeto	1	45	4	\N	5	4	1	2	f	5	0	0	9	9	1	2	0	1	0	9	1	9	3
667	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-266		auseqr	1	34	3	\N	0	3	2	1	f	6	7	4	2	3	9	0	0	0	9	0	9	9	1
668	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-267		glofqa	2	23	3	\N	2	3	1	2	f	1	3	2	9	2	3	1	9	9	0	9	0	1	4
669	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-268		zcoytj	1	33	4	\N	3	3	2	2	t	1	9	4	3	3	1	1	1	2	1	0	1	1	4
670	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-269		azshtr	1	48	3	\N	3	1	0	2	t	3	12	9	4	2	9	1	9	2	1	0	1	0	3
671	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-270		hlamxy	1	40	4	\N	6	1	1	2	t	7	9	3	0	2	9	2	2	9	1	9	9	1	3
672	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-271		tzxrbh	1	34	3	\N	4	1	2	2	t	4	1	9	1	3	3	0	9	2	1	1	0	0	2
673	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-272		lixogq	1	38	2	\N	6	3	0	1	t	8	2	2	3	3	9	3	9	9	0	9	0	9	2
674	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-273		xmayuh	2	37	4	\N	6	4	2	2	f	1	5	4	1	1	2	1	2	0	1	9	1	0	4
675	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-274		obkqij	1	45	4	\N	6	1	0	1	f	4	9	4	3	1	3	2	9	0	0	1	1	1	4
676	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-275		ubwrxt	2	50	2	\N	2	4	2	1	f	3	8	4	0	2	3	1	2	1	9	0	1	1	3
677	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-276		zdsngl	1	48	1	\N	1	1	2	3	f	6	6	4	0	9	3	1	1	0	1	1	1	0	4
678	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-277		qacuyf	1	37	3	\N	4	4	0	2	f	8	5	9	2	1	1	2	9	2	1	0	1	1	3
679	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-278		pwbkre	2	44	2	\N	6	3	2	3	t	11	11	4	9	9	1	3	0	1	0	1	0	1	2
680	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-279		zovxpd	2	64	1	\N	3	2	1	1	t	9	9	2	1	3	1	3	2	2	1	1	0	1	8
681	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-280		ejzcmi	1	55	0	\N	0	2	1	3	f	7	12	4	3	2	9	0	1	1	1	9	1	1	1
682	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-281		mdasyn	1	50	0	\N	2	1	0	3	t	12	11	1	9	9	3	3	0	0	1	1	0	1	3
683	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-282		jetnuz	2	51	4	\N	2	3	0	3	f	11	6	4	0	0	3	2	9	9	1	9	0	1	2
684	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-283		dxsvfj	2	21	2	\N	4	2	1	3	f	11	1	1	0	1	1	2	2	1	0	9	9	1	2
685	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-284		fyhcdm	2	28	3	\N	5	4	2	1	t	7	0	2	4	3	1	3	9	9	1	9	0	9	2
686	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-285		dambiq	2	57	3	\N	3	1	1	2	t	9	3	4	2	1	1	2	2	0	0	1	0	9	4
687	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-286		psfant	2	47	0	\N	0	2	1	3	t	11	7	0	4	1	2	2	9	9	1	9	9	9	4
688	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-287		jonmzx	2	47	3	\N	4	3	1	2	t	3	3	2	1	1	3	1	0	2	1	1	1	0	2
689	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-288		qtbgzh	2	34	4	\N	6	2	1	3	f	10	8	0	1	1	1	3	0	1	9	0	0	9	4
690	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-289		eytijl	1	35	0	\N	1	1	2	1	t	4	11	9	1	2	9	0	9	0	0	0	0	1	1
691	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-290		ktpjei	2	48	0	\N	2	1	2	1	f	7	7	4	0	1	9	2	1	2	0	9	9	0	4
692	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-291		nceuqv	2	61	1	\N	2	3	2	1	t	12	10	2	9	1	9	2	0	0	9	1	1	9	3
693	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-292		vgrabp	1	62	0	\N	0	1	2	1	t	8	4	9	0	9	1	0	9	9	1	9	0	9	3
694	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-293		fqwaod	2	29	0	\N	5	1	0	3	f	7	2	1	3	3	1	2	1	9	1	1	0	0	1
695	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-294		tyuvpk	2	36	0	\N	3	3	1	2	f	8	3	2	3	2	3	2	9	9	9	9	0	9	3
696	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-295		phrfed	1	29	3	\N	5	2	2	1	f	6	3	2	3	3	1	1	1	1	1	0	1	1	2
697	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-296		eqzgmk	2	40	0	\N	3	4	2	2	t	4	5	9	0	3	9	0	0	2	9	0	0	1	1
698	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-297		kmxntd	2	42	0	\N	2	2	1	1	f	2	0	0	3	0	9	0	0	1	1	1	1	9	3
699	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-298		plofcd	1	32	0	\N	3	3	2	2	f	0	7	1	3	2	1	1	1	2	9	9	0	0	4
700	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-299		umdxwa	2	32	3	\N	5	4	2	3	f	4	7	2	1	2	1	0	1	0	9	0	9	1	3
701	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-300		eobrth	1	35	3	\N	6	2	2	2	f	5	3	3	9	1	2	2	0	0	9	9	1	1	8
702	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-301		kuhqyb	2	45	2	\N	3	3	1	1	f	1	3	4	0	0	9	0	0	1	1	9	0	9	2
703	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-302		iypnfu	1	53	0	\N	6	3	1	2	t	7	5	4	9	3	1	0	0	1	0	9	1	0	3
704	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-303		xvnrji	1	48	3	\N	6	1	1	2	t	9	4	1	9	9	1	0	9	0	0	9	1	1	1
705	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-304		sjhyoq	1	42	2	\N	6	3	2	1	f	5	5	1	0	1	9	1	1	1	9	0	9	0	4
706	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-305		uskypx	1	34	4	\N	6	4	0	1	f	4	9	9	3	1	2	2	9	9	1	0	1	1	1
707	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-306		txiypz	2	53	3	\N	6	2	1	2	t	1	6	1	9	3	9	1	0	2	9	1	1	1	1
708	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-307		dkipto	1	29	3	\N	3	1	1	3	t	3	6	4	9	0	2	1	1	1	9	0	1	0	2
709	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-308		gryits	2	27	3	\N	2	1	2	1	f	7	4	9	1	2	2	0	9	9	9	1	9	1	4
710	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-309		xwomdj	2	59	4	\N	6	4	0	1	f	9	1	4	1	9	9	0	9	0	9	1	0	1	3
711	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-310		lkhrxz	2	41	1	\N	5	4	0	2	t	12	1	3	9	0	1	2	1	1	9	0	9	0	2
712	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-311		qnxiyv	2	62	1	\N	1	1	2	3	t	2	0	9	4	0	1	3	9	2	9	0	1	1	2
713	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-312		ksiefd	1	20	4	\N	2	1	1	3	f	8	9	9	2	1	3	2	2	9	1	9	9	1	1
714	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-313		tnlzpg	1	54	2	\N	6	4	0	3	f	5	7	0	2	0	2	0	1	1	1	0	1	9	4
715	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-314		azeucw	1	65	0	\N	1	4	2	2	f	9	5	1	4	1	3	2	2	2	1	1	0	1	1
716	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-315		qrtpfw	1	47	2	\N	6	4	1	3	t	2	10	3	4	2	3	3	9	0	1	9	1	1	3
717	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-316		ycqlud	2	17	3	\N	6	4	1	2	f	7	1	4	0	2	1	0	1	9	9	1	9	0	4
718	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-317		zlocup	1	28	4	\N	4	1	1	3	f	8	11	4	2	0	9	1	2	1	0	1	9	0	3
719	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-318		ypglvu	2	40	1	\N	4	1	1	3	f	11	9	1	0	3	1	0	9	1	9	1	9	0	1
720	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-319		cfsdom	1	22	0	\N	5	4	2	1	t	7	5	4	0	3	1	3	0	2	9	0	9	9	8
721	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-320		bxfnlh	2	63	0	\N	0	4	0	1	f	2	12	9	3	1	2	3	2	9	0	0	9	1	8
722	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-321		pjksqh	1	45	1	\N	4	3	0	2	f	11	1	9	4	3	2	1	0	9	9	1	9	0	1
723	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-322		rjdpit	1	43	1	\N	2	3	2	3	f	6	10	4	1	9	9	0	9	2	0	1	0	0	1
724	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-323		yxtriv	2	23	4	\N	1	1	0	2	f	1	8	3	2	3	9	3	9	9	1	1	9	1	3
725	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-324		yudhmv	1	22	3	\N	1	4	1	1	t	6	3	2	4	2	1	2	2	2	1	9	0	1	3
726	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-325		hrlcyz	1	35	2	\N	5	2	2	2	t	8	2	1	3	3	3	1	1	9	0	0	9	9	3
727	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-326		tvkwco	1	22	4	\N	6	4	0	3	f	4	8	4	1	9	3	0	2	0	0	9	9	9	8
728	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-327		xizvkm	2	50	1	\N	0	3	2	2	f	1	0	4	1	2	1	3	9	2	9	0	1	1	4
729	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-328		lfncwg	1	55	2	\N	2	2	0	3	f	5	7	9	0	0	9	0	1	9	1	1	9	9	1
730	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-329		lumrzb	2	64	0	\N	6	1	2	1	f	11	1	2	9	9	3	1	9	9	9	1	1	0	2
731	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-330		tmwvcd	1	28	2	\N	1	4	0	1	t	3	0	4	9	3	2	3	0	9	9	1	9	0	3
732	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-331		vfjkyl	1	33	1	\N	1	4	2	1	f	7	0	3	4	1	1	0	1	1	1	9	0	0	4
733	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-332		brvlhd	2	30	3	\N	4	2	2	3	f	5	6	0	9	3	2	2	0	9	0	0	1	1	2
734	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-333		tezavy	2	18	1	\N	2	1	1	2	f	10	2	0	1	9	1	1	2	2	1	9	1	1	2
735	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-334		ogjfbn	2	46	1	\N	4	4	2	2	f	6	12	3	9	0	1	0	0	1	1	0	0	1	4
736	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-335		zeqawb	1	49	4	\N	1	1	2	2	t	8	0	1	4	9	1	0	1	2	0	9	9	9	8
737	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-336		tndpgf	1	40	3	\N	1	4	1	3	f	0	1	9	3	0	2	1	2	0	1	9	9	1	2
738	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-337		kohger	1	50	2	\N	3	3	1	2	f	5	0	1	2	9	1	3	9	1	0	1	9	1	1
739	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-338		wsmgdv	1	29	0	\N	0	1	0	2	f	10	12	0	9	3	3	3	0	2	9	9	0	1	3
740	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-339		rtcpbv	1	41	0	\N	3	1	1	2	t	10	11	0	9	1	1	0	1	2	9	1	9	9	2
741	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-340		sjgvoc	1	21	4	\N	6	3	2	1	t	12	8	9	4	3	2	0	0	1	0	9	1	1	3
742	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-341		ltsznp	2	54	0	\N	3	1	0	3	t	9	11	4	3	2	3	0	2	1	1	0	1	0	8
743	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-342		qpfkre	1	36	1	\N	6	3	2	3	t	2	10	1	9	1	3	0	1	9	0	9	0	9	3
744	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-343		bkpjqi	1	58	0	\N	1	2	2	1	f	5	9	9	3	0	9	2	1	9	1	9	0	0	3
745	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-344		pisatd	1	61	4	\N	0	1	2	1	f	11	3	9	2	9	3	3	2	1	9	9	9	1	8
746	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-345		wkyqbf	2	42	3	\N	5	4	0	3	t	8	11	0	3	3	1	3	1	0	1	0	1	9	3
747	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-346		cqtwej	2	21	3	\N	4	2	1	1	t	0	3	1	3	3	1	3	0	9	9	1	0	0	4
748	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-347		bihfad	2	55	3	\N	2	4	0	1	f	12	8	0	1	1	3	1	1	1	9	9	9	9	1
749	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-348		wtunoe	2	36	4	\N	1	3	0	1	f	6	1	2	1	9	9	0	2	2	9	0	1	0	4
750	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-349		ejniqg	1	35	0	\N	5	2	2	2	t	6	2	9	3	1	9	1	9	2	0	9	9	1	8
751	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-350		rzsgiw	1	59	1	\N	1	1	0	1	f	10	11	3	0	2	3	3	9	2	0	0	0	0	8
752	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-351		udjaik	2	42	0	\N	4	2	2	1	t	2	1	9	1	3	1	3	1	2	0	1	0	1	3
753	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-352		prnywo	1	35	2	\N	4	4	0	2	f	5	9	4	0	3	9	0	1	0	0	9	1	1	2
754	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-353		gthvdm	1	55	2	\N	2	2	2	2	f	12	5	3	9	3	3	0	0	9	0	0	9	1	1
755	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-354		quezcw	2	40	2	\N	0	4	2	2	t	10	2	0	2	2	3	2	1	9	9	9	0	0	8
756	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-355		ocilqw	2	38	1	\N	4	1	2	3	f	11	10	9	3	0	3	1	0	2	1	0	0	9	2
757	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-356		vagmzh	2	24	1	\N	5	3	2	1	f	12	6	1	4	1	9	0	0	0	9	0	1	9	3
758	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-357		fisghq	1	40	2	\N	5	3	2	3	t	1	1	9	1	3	3	1	1	9	1	0	1	1	4
759	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-358		oyujbp	2	49	0	\N	0	2	1	1	t	5	4	2	0	1	9	0	9	1	1	0	0	0	8
760	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-359		hgsuif	1	16	1	\N	2	3	1	3	f	9	12	1	0	9	3	3	1	1	0	0	1	1	8
761	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-360		zxwyae	1	32	1	\N	6	4	1	3	t	0	11	1	2	3	2	1	2	0	1	1	1	9	3
762	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-361		jfnxep	1	24	2	\N	3	3	1	2	t	12	7	9	4	1	9	3	9	2	1	9	1	0	2
763	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-362		bgxvyw	1	53	2	\N	3	3	1	2	f	8	0	2	3	0	9	0	2	9	1	1	9	1	3
764	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-363		lbokic	2	26	1	\N	3	3	0	2	t	2	6	0	3	2	3	1	9	9	0	9	1	9	1
765	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-364		oezgnx	1	19	1	\N	5	3	2	2	t	9	7	1	4	9	2	1	1	1	1	0	1	9	1
766	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-365		mptbkl	1	60	4	\N	6	3	1	1	f	6	12	9	2	3	3	2	0	0	9	1	9	0	4
767	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-366		mdzpso	1	23	0	\N	3	2	2	2	f	4	7	2	0	2	9	0	2	0	9	1	1	0	2
768	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-367		pkaldo	1	26	1	\N	1	1	1	2	f	3	5	9	2	9	1	3	0	0	1	0	0	0	3
769	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-368		dhfeoc	1	35	1	\N	5	2	1	1	t	12	2	1	0	3	1	2	1	1	9	0	1	1	3
770	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-369		qxjpdb	1	50	4	\N	5	3	1	3	t	10	0	1	9	2	3	2	2	9	1	0	9	1	4
771	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-370		kbgdzu	2	47	0	\N	1	2	1	2	t	12	9	2	4	0	2	0	0	2	1	0	1	0	8
772	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-371		rmzuqb	2	18	3	\N	4	3	2	1	t	5	5	4	1	2	9	2	1	9	1	9	1	1	3
773	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-372		ubqxfn	1	53	4	\N	0	1	0	3	f	8	7	4	9	9	1	2	9	9	0	9	9	9	1
774	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-373		togisk	1	24	4	\N	2	4	1	1	t	5	7	3	4	0	2	3	0	9	9	9	1	1	8
775	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-374		ceboxq	2	52	0	\N	2	3	0	3	t	2	1	2	1	1	2	1	1	0	0	1	1	1	2
776	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-375		azjwxm	2	53	2	\N	4	2	1	2	t	3	0	9	2	0	1	3	2	1	9	1	0	0	3
777	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-376		nrtgbd	2	33	2	\N	4	1	2	1	f	10	8	0	4	2	9	2	0	2	0	0	9	0	3
778	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-377		jozdqi	1	53	2	\N	5	1	2	3	f	4	10	9	4	9	3	0	2	0	0	1	0	1	8
779	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-378		nivfqt	2	61	1	\N	2	4	2	1	t	4	5	3	1	2	2	0	9	9	0	0	9	1	4
780	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-379		twqrug	1	26	4	\N	2	3	0	2	f	9	8	9	4	1	9	1	0	0	0	0	0	0	3
781	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-380		jvcyks	2	65	1	\N	0	4	1	2	f	3	10	4	2	3	9	3	9	0	0	1	9	9	4
782	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-381		uwcqoi	2	30	1	\N	0	4	1	3	f	7	3	0	9	9	9	1	2	1	9	1	0	1	8
783	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-382		blavtg	2	24	4	\N	3	3	1	2	f	10	3	4	0	0	3	2	1	1	1	9	9	1	4
784	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-383		mapgkj	1	49	3	\N	3	4	1	2	t	8	1	2	9	0	3	3	2	2	0	1	1	0	1
785	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-384		wjkdmy	2	49	1	\N	0	1	1	2	t	6	6	0	1	1	9	1	9	0	0	9	0	9	8
786	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-385		rqlbzw	2	50	0	\N	1	1	1	1	f	10	2	3	1	0	2	0	9	1	0	1	0	9	3
787	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-386		eqixas	1	42	3	\N	3	4	0	3	f	5	12	2	4	1	1	3	0	2	0	9	1	0	3
788	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-387		tcwsog	2	16	1	\N	1	2	2	1	f	2	12	0	1	1	2	2	1	2	0	1	1	9	2
789	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-388		joiwnf	2	46	3	\N	2	3	0	2	f	11	6	2	0	1	3	2	2	0	0	1	9	0	8
790	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-389		xdchkm	2	29	3	\N	2	1	0	3	t	3	2	2	9	1	1	2	2	2	9	1	0	1	3
791	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-390		ebguhj	2	35	2	\N	3	2	2	2	t	8	2	4	0	0	9	2	2	2	9	0	1	1	1
792	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-391		qujlkv	2	56	3	\N	6	3	2	3	t	2	7	2	3	1	2	0	1	2	0	1	9	9	4
793	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-392		yrvxzu	2	51	4	\N	0	1	1	1	t	1	5	0	1	3	9	0	1	9	1	1	1	0	3
794	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-393		fmtbxr	2	48	0	\N	0	3	1	2	f	2	4	3	1	9	2	3	9	2	0	1	0	0	8
795	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-394		qkfjwg	2	54	2	\N	3	2	0	1	f	7	9	1	2	3	1	2	2	2	0	9	0	1	2
796	2010-07-13 00:00:00	B05120	B05120C11	f	t	B05120-395		kjrxpt	2	47	2	\N	5	4	1	1	t	10	3	1	9	0	2	2	2	0	1	9	1	0	3
797	2010-07-13 00:00:00	B05120	B05120C11	f	f	B05120-396		mfdoth	2	18	2	\N	4	3	2	1	f	10	10	4	9	3	3	3	0	9	1	1	9	0	2
798	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-397		kcedzi	2	21	1	\N	4	4	0	3	f	1	8	4	1	0	9	0	0	0	1	0	9	9	8
799	2010-07-13 00:00:00	B05120	B05120C11	t	t	B05120-398		fymkiu	1	33	3	\N	1	1	2	3	t	11	12	3	0	2	1	0	0	9	0	0	1	1	4
800	2010-07-13 00:00:00	B05120	B05120C11	t	f	B05120-399		qfbiey	2	52	2	\N	3	1	1	2	t	8	10	1	4	0	1	1	0	9	9	9	9	9	8
801	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-0		oczeur	1	31	4	\N	3	4	1	2	f	3	7	3	4	2	9	0	0	2	0	1	9	1	8
802	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-1		odinlb	2	33	4	\N	2	3	1	2	t	12	0	3	2	9	2	2	0	9	9	9	0	9	8
803	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-2		uibyxg	1	41	1	\N	4	2	0	1	t	6	0	2	3	1	3	1	1	9	0	9	1	9	4
804	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-3		qxfilt	1	28	4	\N	1	2	0	3	f	5	7	3	0	3	2	0	1	9	9	9	0	1	1
805	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-4		gtfuay	1	56	4	\N	0	3	1	3	f	12	6	2	0	9	2	3	1	0	0	9	0	1	8
806	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-5		crafmy	1	55	1	\N	4	4	2	3	f	8	2	4	0	9	9	3	2	1	1	1	0	1	3
807	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-6		trxjco	2	64	0	\N	0	3	2	2	f	5	7	1	0	9	3	1	0	2	0	0	9	0	8
808	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-7		wzifsq	2	35	0	\N	3	2	2	1	t	9	4	9	0	1	2	0	0	2	0	9	1	1	8
809	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-8		hbdgir	2	24	4	\N	2	1	1	2	f	10	1	0	4	2	1	1	1	9	0	9	9	0	3
810	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-9		ofbqka	1	64	2	\N	6	4	2	3	f	12	7	2	4	9	9	1	1	2	0	0	0	9	8
811	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-10		uybnxt	1	62	1	\N	1	4	0	3	t	4	11	3	1	9	2	2	0	0	1	1	1	1	3
812	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-11		fydjoa	2	62	1	\N	3	2	0	1	t	2	0	4	1	1	1	3	2	1	1	0	0	1	3
813	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-12		irekbp	1	31	2	\N	1	1	1	2	f	7	10	0	9	0	2	1	1	0	1	9	0	9	2
814	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-13		einpzo	1	40	3	\N	6	1	2	1	t	4	0	2	1	0	3	0	1	0	0	1	0	0	1
815	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-14		rilvbd	1	24	2	\N	2	1	2	3	t	10	10	0	2	1	9	2	2	2	9	0	0	1	8
816	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-15		gymcex	1	48	3	\N	1	4	1	2	f	6	11	0	9	0	9	1	2	2	0	9	0	9	3
817	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-16		xdpqbh	2	26	4	\N	0	2	1	2	t	5	0	3	2	0	1	2	2	2	0	9	1	9	4
818	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-17		hcotkn	2	59	1	\N	5	3	0	2	t	10	2	4	1	3	9	1	0	9	0	9	9	0	4
819	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-18		glkzfs	2	17	0	\N	5	1	1	3	f	10	4	4	9	2	9	0	0	2	9	1	0	9	8
820	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-19		iqeyuh	2	50	4	\N	2	3	2	1	t	5	4	3	1	0	1	2	2	0	9	9	1	0	1
821	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-20		kbojam	1	65	4	\N	1	2	1	3	t	3	9	4	9	2	2	1	1	0	1	0	1	9	2
822	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-21		jrdbhz	1	31	3	\N	4	1	0	1	t	12	10	0	4	1	3	1	0	0	0	0	1	9	2
823	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-22		nvlzih	2	18	1	\N	0	4	0	1	f	12	7	4	9	2	1	1	1	1	0	1	9	0	8
824	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-23		quwace	2	59	2	\N	6	4	0	1	t	12	9	0	3	1	1	0	9	0	9	0	0	9	4
825	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-24		ojwzvd	2	57	3	\N	3	4	2	1	t	3	7	9	3	0	9	0	0	0	0	1	9	0	1
826	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-25		aiecxn	1	59	3	\N	0	1	1	3	f	5	1	2	3	1	3	1	9	9	1	1	0	0	3
827	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-26		bjuxia	1	42	2	\N	1	3	2	1	t	1	8	4	9	3	3	1	1	0	0	0	0	1	2
828	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-27		rmzefb	2	58	2	\N	6	3	0	2	f	4	7	0	1	2	2	3	1	1	9	9	9	9	3
829	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-28		gilqwf	1	27	2	\N	2	3	0	1	f	12	4	9	1	0	3	3	9	2	1	9	0	1	2
830	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-29		jrlspi	1	53	1	\N	1	3	2	2	t	12	12	1	2	1	1	3	1	0	9	0	9	9	1
831	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-30		uyrjat	1	24	4	\N	6	3	1	3	f	11	11	9	3	1	2	2	9	9	0	9	1	1	4
832	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-31		rutwbq	2	46	4	\N	4	4	2	1	f	12	6	1	2	1	3	0	0	0	0	1	1	9	3
833	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-32		mzfhva	2	44	1	\N	3	2	2	2	t	3	7	1	0	9	2	2	0	9	0	0	9	0	4
834	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-33		mtvysh	2	24	2	\N	3	1	0	2	f	7	10	3	0	0	1	2	2	2	9	1	9	1	2
835	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-34		fvdhix	1	18	3	\N	0	4	0	2	f	7	4	2	3	1	2	2	2	9	9	1	9	9	8
836	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-35		bqtesv	2	35	2	\N	1	2	1	1	t	11	12	3	0	2	2	3	9	1	9	0	0	1	1
837	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-36		rzdxtk	1	24	0	\N	1	1	2	2	f	10	1	9	0	0	2	3	0	9	9	0	1	9	3
838	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-37		vjazls	1	65	0	\N	2	2	0	1	f	4	12	2	1	9	2	3	1	1	0	1	0	1	8
839	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-38		ibskea	1	62	0	\N	5	4	1	3	t	12	4	0	2	1	9	3	0	1	9	0	1	1	4
840	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-39		dlaepz	1	53	3	\N	0	3	0	3	t	8	7	2	4	2	1	0	2	1	1	1	9	1	1
841	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-40		mfpsvc	1	64	1	\N	3	2	1	2	f	9	8	9	0	3	9	0	0	2	0	9	0	1	2
842	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-41		bqdxws	1	41	0	\N	4	1	1	2	t	3	10	3	0	0	1	2	1	0	9	0	0	1	1
843	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-42		xuawye	2	15	0	\N	1	4	0	3	f	5	12	4	3	2	2	2	9	2	9	0	9	0	4
844	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-43		oithjb	2	35	0	\N	3	1	2	1	f	4	2	4	9	0	2	3	9	9	0	9	1	9	2
845	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-44		qtsxoh	1	33	4	\N	2	4	2	3	t	4	11	3	1	0	2	0	0	0	0	9	9	0	4
846	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-45		fpcjhu	1	20	0	\N	0	2	0	2	t	5	6	2	4	3	2	3	1	9	0	9	9	0	1
847	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-46		xrzdhm	2	17	3	\N	2	4	0	1	f	10	0	4	9	2	9	1	0	9	0	1	1	1	2
848	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-47		kguyqi	2	58	4	\N	4	4	2	1	t	2	3	2	3	9	1	0	9	9	0	0	9	9	4
849	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-48		dvpeab	1	52	0	\N	1	2	1	3	t	5	4	1	3	9	1	2	0	2	1	0	9	9	8
850	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-49		eskhnd	1	43	1	\N	1	1	2	1	f	4	12	2	0	2	9	2	1	2	0	1	9	9	1
851	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-50		oudatv	1	42	2	\N	5	2	2	2	f	1	0	4	1	1	9	3	2	1	9	0	0	0	8
852	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-51		nqbhpg	1	42	2	\N	5	3	1	2	t	4	1	2	4	9	9	3	0	1	0	9	0	9	2
853	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-52		tlfiec	2	34	0	\N	2	1	2	1	t	8	12	4	3	2	9	1	0	0	0	0	9	9	8
854	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-53		puswbm	2	26	1	\N	4	1	2	3	t	9	11	2	1	9	1	0	2	1	0	0	1	1	1
855	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-54		nlfwhq	2	61	3	\N	3	3	1	3	f	8	3	2	9	3	2	2	1	2	1	9	0	9	1
856	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-55		mizqos	1	63	2	\N	3	1	2	2	t	5	4	4	3	9	3	1	9	1	9	0	1	1	3
857	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-56		wsuxcj	1	24	0	\N	4	2	0	3	t	9	8	2	4	1	9	1	0	0	0	1	1	9	2
858	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-57		ndejcf	2	60	3	\N	5	3	0	3	f	9	3	0	4	1	1	1	9	9	0	0	0	1	3
859	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-58		jxhmts	1	37	2	\N	2	2	0	1	t	9	4	9	4	0	1	1	2	9	9	0	0	1	8
860	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-59		bmyedq	1	33	1	\N	2	1	0	3	f	12	3	0	1	0	3	1	2	2	9	0	1	9	4
861	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-60		cupbyo	1	17	1	\N	2	1	2	1	f	2	6	3	4	2	2	1	9	2	0	0	1	9	3
862	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-61		thnjpu	2	36	3	\N	2	2	2	2	f	11	10	9	1	2	9	2	2	1	0	0	1	9	8
863	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-62		ladbku	1	37	4	\N	4	2	2	3	f	3	4	2	9	3	3	2	0	0	0	9	9	9	4
864	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-63		isfetc	1	29	4	\N	3	4	2	2	f	3	1	9	3	9	1	0	2	0	1	0	9	0	1
865	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-64		mavxbf	2	26	2	\N	5	4	1	2	t	10	2	2	3	3	9	3	2	1	9	9	9	0	2
866	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-65		caejls	1	48	2	\N	6	1	0	3	f	0	6	3	2	0	3	2	1	1	1	9	1	9	3
867	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-66		qadehl	2	47	1	\N	6	4	1	2	f	5	2	4	0	3	3	1	9	0	1	0	0	0	2
868	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-67		mglzwt	2	18	2	\N	5	1	0	1	f	1	0	3	9	3	9	2	1	1	9	0	1	0	2
869	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-68		tpzhsv	2	34	3	\N	3	3	0	1	t	6	10	9	2	1	2	3	1	1	1	1	0	1	8
870	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-69		xyjedb	1	56	1	\N	3	2	1	3	f	12	6	2	9	9	9	2	1	2	9	1	9	0	3
871	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-70		jewuyk	1	30	3	\N	6	3	1	2	t	1	1	3	0	0	3	2	9	2	1	1	0	0	8
872	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-71		kyeocm	2	28	3	\N	6	1	2	3	t	5	10	3	0	0	3	0	0	9	9	9	1	1	1
873	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-72		vumipd	2	21	1	\N	6	4	0	2	f	9	7	0	3	9	9	2	2	1	0	0	1	0	2
874	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-73		sqtzvu	2	31	3	\N	3	3	1	2	f	2	1	9	0	0	1	1	1	0	9	1	0	1	1
875	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-74		uifsjb	1	47	4	\N	1	3	0	1	t	3	0	9	3	2	3	1	9	2	0	9	9	9	3
876	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-75		njzoep	2	34	1	\N	0	2	0	1	f	9	1	2	4	1	1	2	9	2	1	0	1	9	4
877	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-76		zrujgf	2	62	1	\N	0	4	2	1	f	11	1	0	2	3	2	0	2	1	1	9	1	0	8
878	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-77		qhfuwx	2	35	3	\N	3	4	0	1	t	5	6	2	1	9	9	1	0	9	0	1	0	1	4
879	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-78		mpuodq	1	58	1	\N	3	4	0	3	t	0	4	2	0	2	3	3	9	9	0	1	0	0	8
880	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-79		fyjruk	1	65	4	\N	1	3	2	1	t	2	4	2	4	9	9	3	9	0	1	0	9	9	3
881	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-80		matsrg	2	22	3	\N	1	1	2	2	t	12	0	3	2	9	9	0	2	0	0	1	0	0	8
882	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-81		plndmb	1	57	1	\N	2	3	2	2	t	5	10	1	2	0	3	2	1	2	0	9	0	0	8
883	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-82		dzfiln	2	56	2	\N	2	4	2	1	f	1	12	1	0	0	2	0	1	2	0	0	0	9	8
884	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-83		kmhfcr	1	45	2	\N	0	1	1	3	f	4	8	3	2	2	1	0	9	2	0	9	9	9	3
885	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-84		zkljcq	1	50	0	\N	6	1	0	2	t	9	11	4	0	3	1	2	9	1	9	0	1	0	2
886	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-85		rabpvs	1	40	4	\N	0	2	2	2	f	10	9	2	1	2	1	3	1	1	9	0	0	9	4
887	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-86		rdxoku	2	36	0	\N	6	4	0	3	f	8	6	1	9	1	2	0	9	1	1	0	9	9	3
888	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-87		dbgyea	1	29	1	\N	1	4	1	1	f	8	3	1	0	1	1	3	9	9	1	9	1	0	3
889	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-88		hraouz	2	22	1	\N	6	2	2	1	f	8	3	2	0	9	2	3	2	0	1	9	9	0	8
890	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-89		omhgxi	2	46	0	\N	6	4	1	2	f	11	7	1	4	9	1	3	0	2	0	9	0	0	1
891	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-90		sokqph	2	47	3	\N	5	3	2	2	f	8	7	9	0	2	1	3	0	1	1	0	9	9	4
892	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-91		hgmrpi	1	35	1	\N	2	1	0	2	f	5	4	4	0	0	9	3	1	2	1	1	0	1	2
893	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-92		npwhdz	1	20	0	\N	5	4	1	2	t	1	10	0	1	2	3	2	9	9	9	0	1	0	3
894	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-93		pjbmrl	2	62	1	\N	0	3	2	2	t	9	6	9	0	0	2	0	2	2	0	9	9	9	2
895	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-94		gvliqt	2	41	1	\N	6	4	2	3	t	1	6	0	1	1	3	1	1	9	0	0	0	0	1
896	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-95		hkfvcq	2	18	1	\N	6	3	2	2	t	0	2	4	3	9	1	0	2	2	0	9	1	0	2
897	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-96		ahbwxj	1	48	2	\N	1	3	1	2	t	8	0	4	2	2	9	2	0	2	0	1	9	1	4
898	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-97		dfcogr	1	60	1	\N	4	4	0	2	f	3	1	2	1	1	9	1	0	0	0	9	0	1	4
899	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-98		lvfzat	2	35	2	\N	1	2	0	3	f	5	5	2	3	0	9	1	2	2	1	9	1	1	8
900	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-99		tahonp	2	42	0	\N	0	1	0	2	t	5	1	0	2	3	3	2	9	1	9	9	0	0	1
901	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-100		hgrbac	2	17	4	\N	0	4	2	2	t	4	8	9	1	2	1	1	2	1	9	1	9	9	1
902	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-101		hlucik	2	37	4	\N	3	2	1	1	f	3	11	9	1	3	3	2	2	2	0	9	0	1	1
903	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-102		bantrh	1	61	2	\N	4	1	0	3	t	9	11	2	4	0	1	1	9	1	1	1	0	9	4
904	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-103		pwoked	2	53	1	\N	4	1	2	3	t	1	12	0	2	9	2	3	9	0	0	9	9	1	4
905	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-104		tonijy	2	47	2	\N	4	1	0	3	f	11	8	1	0	1	1	1	2	0	0	0	9	1	8
906	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-105		vlxumt	2	51	3	\N	1	1	2	2	f	11	2	4	2	9	3	3	0	9	0	0	9	1	4
907	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-106		spoumk	1	65	1	\N	0	4	0	3	f	3	7	4	9	0	1	1	1	2	9	0	0	0	8
908	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-107		cbvzfu	1	54	4	\N	0	3	1	1	f	4	12	1	9	3	1	2	9	0	0	9	9	1	4
909	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-108		vpdwio	1	23	4	\N	0	1	0	1	f	6	3	0	9	2	9	1	0	9	1	1	9	1	3
910	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-109		bkgsaz	1	28	0	\N	0	1	0	3	f	9	9	3	2	2	9	2	1	2	0	9	9	9	1
911	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-110		fqzgyh	2	43	2	\N	6	2	2	2	t	4	4	9	2	2	9	1	9	1	1	9	9	9	8
912	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-111		ruykpn	1	23	0	\N	4	4	2	3	t	5	1	2	4	2	1	2	1	2	0	9	0	0	2
913	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-112		vsfhcx	2	36	0	\N	5	4	0	3	t	6	7	9	1	2	2	0	2	2	9	1	9	9	2
914	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-113		kbrczp	1	22	2	\N	0	3	0	1	f	3	5	2	3	3	2	1	9	0	9	1	9	9	4
915	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-114		exhsla	2	53	0	\N	2	2	0	1	f	12	6	1	9	3	9	1	0	9	9	9	9	0	8
916	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-115		ofpvqw	2	18	3	\N	5	2	1	1	f	11	6	1	9	3	2	3	2	2	9	9	0	0	2
917	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-116		ykubcv	2	23	2	\N	3	3	0	2	t	10	2	0	9	3	3	1	2	1	1	1	9	0	2
918	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-117		aplzbh	2	48	4	\N	1	4	0	2	f	12	5	2	9	9	3	1	0	9	1	1	1	0	2
919	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-118		fqobgh	2	47	4	\N	2	3	0	3	f	8	0	4	1	9	1	3	1	2	0	9	9	9	3
920	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-119		qxylwo	2	33	2	\N	0	2	0	1	t	2	12	4	0	3	3	1	2	2	0	1	0	0	1
921	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-120		ayuhrp	1	34	3	\N	4	1	0	3	t	4	4	0	3	2	9	3	1	1	9	9	9	9	8
922	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-121		ilmush	2	64	0	\N	2	1	1	3	t	0	1	2	1	2	9	2	2	2	9	9	0	1	8
923	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-122		ckgytr	1	45	2	\N	3	3	1	1	t	4	10	3	0	0	3	0	9	1	1	1	9	9	4
924	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-123		uqkoir	2	42	4	\N	6	3	1	2	t	1	8	2	3	2	2	3	1	9	0	0	1	9	4
925	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-124		ivsqzn	2	49	3	\N	3	3	2	3	f	2	10	4	1	1	3	1	9	2	9	9	9	1	4
926	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-125		atydvx	2	16	1	\N	5	1	1	2	t	4	5	2	0	2	2	1	2	2	1	1	0	9	8
927	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-126		bxsyul	2	55	0	\N	5	4	2	2	f	1	2	0	4	1	3	0	1	9	0	0	0	9	2
928	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-127		jzvyqf	2	53	4	\N	6	3	1	3	f	5	6	4	3	2	9	0	1	1	1	1	9	1	2
929	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-128		vjnwzl	2	58	4	\N	5	2	2	2	t	8	9	1	4	1	1	3	1	9	0	9	9	1	4
930	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-129		lujogc	1	31	2	\N	5	3	0	3	t	3	1	2	9	1	3	0	0	1	0	0	0	0	2
931	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-130		etvgmh	1	36	0	\N	1	2	0	2	t	10	6	1	4	9	2	1	1	0	9	0	0	0	8
932	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-131		erstfi	2	29	4	\N	5	1	0	3	t	8	10	3	9	3	2	3	0	9	1	0	1	9	1
933	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-132		yvzdjr	2	65	0	\N	0	1	0	1	f	5	8	2	9	0	2	2	0	2	1	0	1	1	2
934	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-133		gulebm	1	40	1	\N	2	2	1	2	t	5	12	4	2	1	1	0	2	2	1	0	9	0	4
935	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-134		crdmfo	1	65	2	\N	1	3	2	3	f	2	12	2	3	9	3	3	2	1	9	9	0	9	1
936	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-135		ckhfpm	1	54	0	\N	5	1	0	3	f	10	2	0	9	2	9	3	9	1	0	1	1	9	1
937	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-136		ogbjtx	2	43	0	\N	1	3	2	3	t	1	5	4	0	9	3	0	1	0	0	1	0	0	3
938	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-137		ikvhme	2	61	4	\N	5	4	2	1	t	9	6	9	1	3	3	3	1	0	1	1	1	0	8
939	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-138		tsupge	2	24	3	\N	0	2	0	2	t	12	12	2	4	2	2	2	2	0	0	0	0	1	2
940	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-139		fkeczh	1	22	2	\N	1	1	0	2	t	0	12	3	4	0	9	2	0	2	9	1	9	9	4
941	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-140		ptsgfw	2	58	1	\N	4	2	1	3	t	9	11	3	4	9	3	0	1	2	1	0	9	0	3
942	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-141		vzlsgi	1	46	3	\N	2	2	1	1	t	10	4	4	1	1	3	2	1	0	9	1	9	9	2
943	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-142		qvgxpw	2	65	2	\N	1	4	0	2	f	10	4	2	4	9	2	1	9	2	1	0	0	0	8
944	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-143		kwqneu	1	54	3	\N	0	2	2	3	f	7	10	9	3	1	3	2	9	2	9	1	0	1	1
945	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-144		krzcoj	1	23	2	\N	0	4	2	3	f	9	10	4	1	2	1	2	2	2	9	1	1	9	3
946	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-145		iwzahl	1	59	0	\N	3	2	2	3	f	8	5	2	4	1	2	3	1	9	9	0	0	9	1
947	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-146		xrikaq	1	39	3	\N	2	2	0	3	f	12	10	3	2	0	9	0	1	0	9	0	1	0	2
948	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-147		ocmrpd	1	57	4	\N	1	1	2	2	t	12	7	1	3	1	9	3	1	9	9	1	9	0	2
949	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-148		toeywp	2	55	1	\N	3	3	1	1	t	8	2	4	0	2	1	0	0	1	9	0	9	9	1
950	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-149		qowctm	2	20	2	\N	4	2	2	1	t	6	8	9	1	3	2	1	1	0	0	0	9	0	2
951	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-150		apjgnk	1	45	3	\N	0	2	0	1	f	12	8	4	0	9	1	2	0	2	0	1	0	9	8
952	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-151		mykunc	2	19	4	\N	2	2	2	1	f	7	0	2	1	3	9	0	9	9	9	0	9	9	1
953	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-152		rmaylt	2	52	4	\N	3	2	0	1	f	2	10	0	1	2	9	0	9	1	1	9	9	0	1
954	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-153		adgmkf	1	43	4	\N	4	4	2	1	t	0	8	3	9	9	2	1	0	2	9	9	0	0	2
955	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-154		axzqbi	2	43	3	\N	5	1	0	2	t	7	11	3	4	2	1	2	2	1	0	9	0	0	8
956	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-155		omsjyt	1	50	0	\N	1	2	2	3	f	3	12	0	2	1	2	0	9	1	1	0	1	9	4
957	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-156		zfqvds	2	16	3	\N	3	4	0	1	f	7	3	1	4	3	3	3	1	9	1	9	1	1	8
958	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-157		sdvpgm	2	16	2	\N	6	3	0	2	t	2	0	2	3	1	1	1	2	9	1	9	1	1	3
959	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-158		zcnkig	2	34	3	\N	1	4	2	3	f	12	8	2	0	9	1	2	1	9	1	0	9	9	8
960	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-159		prhbyx	1	22	1	\N	3	2	1	3	f	10	9	2	4	1	2	0	9	2	1	9	1	1	2
961	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-160		sxakub	1	37	3	\N	0	1	0	1	f	5	3	9	0	1	9	2	0	1	9	9	9	0	3
962	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-161		reqdzm	1	52	4	\N	0	3	2	1	f	8	8	3	4	0	3	0	9	0	9	1	9	0	2
963	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-162		ukdycs	1	43	2	\N	0	3	0	1	f	9	1	3	2	1	2	2	0	9	9	9	9	0	3
964	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-163		bchova	2	22	4	\N	2	2	2	1	f	0	0	1	9	3	3	1	2	2	1	1	9	0	3
965	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-164		lirghf	1	40	3	\N	2	1	2	1	t	6	12	3	4	2	3	2	2	2	9	9	9	1	2
966	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-165		oqyafg	2	54	1	\N	3	4	1	3	f	6	6	3	2	0	1	0	1	0	0	0	0	9	8
967	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-166		njscve	2	25	4	\N	4	1	2	1	t	12	4	2	4	3	2	1	0	0	1	0	9	9	4
968	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-167		mvljdc	1	29	2	\N	2	2	0	2	f	12	8	0	1	9	2	2	9	2	0	9	9	9	4
969	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-168		qhwkrz	2	26	0	\N	6	3	0	3	t	5	5	1	4	9	1	0	2	0	0	9	0	0	1
970	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-169		odwczt	2	54	2	\N	1	2	1	1	f	10	3	3	0	0	9	1	2	0	1	9	0	1	2
971	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-170		ivdrbn	1	30	4	\N	6	2	0	1	t	11	4	0	9	0	1	0	1	0	0	1	9	0	4
972	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-171		jbltew	1	26	1	\N	0	1	1	3	f	5	7	1	0	3	2	2	0	9	1	1	0	0	2
973	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-172		gtbzdj	2	57	0	\N	4	4	0	2	f	10	0	9	0	1	9	3	0	1	0	1	9	1	3
974	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-173		vcbjia	1	24	0	\N	0	1	1	3	t	0	10	1	3	9	1	3	0	1	1	9	1	0	1
975	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-174		plfyvb	2	31	1	\N	2	2	0	2	f	1	8	4	3	3	1	0	1	9	9	9	0	1	1
976	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-175		ugtkaw	2	60	2	\N	5	1	2	1	f	10	0	3	2	1	2	0	1	1	9	9	0	0	2
977	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-176		gbxjpw	2	34	3	\N	4	4	1	3	t	8	4	4	2	9	3	2	9	2	9	0	0	9	8
978	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-177		mczsri	1	45	1	\N	5	3	1	2	f	3	0	9	2	0	9	0	9	2	9	1	1	0	1
979	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-178		phowcz	1	35	2	\N	6	2	0	3	t	8	12	0	9	2	2	2	1	9	9	9	9	0	8
980	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-179		hfdcjr	1	64	2	\N	1	4	0	2	t	10	10	2	1	0	3	3	9	9	0	9	0	9	8
981	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-180		sfnzbq	2	53	2	\N	4	1	0	3	f	3	3	3	0	2	1	3	9	0	1	9	9	0	3
982	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-181		jpctnm	2	38	1	\N	1	4	2	2	f	8	0	1	2	2	9	0	0	1	9	0	0	1	3
983	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-182		lndivp	2	33	0	\N	3	1	2	1	f	5	4	0	1	2	3	3	9	0	1	9	1	9	3
984	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-183		ezianb	1	22	1	\N	3	1	1	3	f	3	9	0	9	0	3	0	2	1	1	9	1	0	2
985	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-184		rkgowd	2	19	1	\N	0	4	0	2	f	6	12	3	0	9	3	2	0	1	9	9	9	0	8
986	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-185		xhkvwl	2	52	3	\N	1	2	2	2	t	9	11	2	1	3	9	2	1	9	1	0	1	1	3
987	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-186		hnlibu	2	34	0	\N	1	1	1	1	t	11	11	4	1	1	9	2	9	2	9	9	1	1	2
988	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-187		ghtqfe	1	41	0	\N	2	4	1	1	f	2	3	2	4	9	9	0	1	9	9	0	1	9	3
989	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-188		pxvqjh	2	21	3	\N	6	2	1	3	f	2	12	9	2	0	2	1	9	1	0	0	1	1	1
990	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-189		btgfqu	2	47	3	\N	0	1	2	3	f	11	1	9	1	2	2	1	1	1	9	0	9	0	2
991	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-190		bxmizp	1	42	4	\N	2	3	0	2	f	10	9	9	1	3	3	0	2	0	9	0	1	0	3
992	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-191		gminpj	2	27	2	\N	1	3	0	1	t	12	12	0	3	2	1	1	2	9	0	9	1	0	1
993	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-192		fwavqo	2	18	4	\N	4	2	0	3	f	5	9	9	0	1	3	3	2	1	1	1	0	1	3
994	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-193		henoxy	2	51	1	\N	2	2	1	1	f	12	11	0	1	9	3	2	9	1	1	0	9	0	1
995	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-194		cilwnm	2	47	2	\N	6	1	0	2	f	6	3	3	2	3	2	1	2	0	9	0	0	0	3
996	2010-07-12 00:00:00	C10320	C10320C3	t	f	C10320-195		cmyfvg	2	58	0	\N	2	1	1	2	f	7	8	0	4	2	9	2	0	2	1	1	0	9	8
997	2010-07-12 00:00:00	C10320	C10320C3	t	t	C10320-196		zmtpvj	2	28	1	\N	4	1	0	1	t	7	3	1	2	9	9	2	0	1	9	9	0	1	8
998	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-197		pcjdwu	1	43	0	\N	5	2	1	1	t	8	4	4	3	2	1	0	9	9	9	1	9	0	2
999	2010-07-12 00:00:00	C10320	C10320C3	f	f	C10320-198		ytpgwq	1	24	1	\N	1	1	1	1	f	1	8	1	9	9	1	2	9	1	9	9	0	9	2
1000	2010-07-12 00:00:00	C10320	C10320C3	f	t	C10320-199		avkdft	1	45	3	\N	2	1	0	2	t	2	1	3	0	2	2	0	9	2	9	0	0	1	1
1001	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-200		fqzjwg	1	62	4	\N	4	4	1	2	f	10	8	4	2	9	3	1	9	2	1	0	1	1	2
1002	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-201		agqyph	2	49	1	\N	3	4	1	1	t	9	2	9	0	3	3	2	2	2	1	0	9	0	1
1003	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-202		pbgniv	1	41	4	\N	5	1	0	3	f	12	8	9	1	9	1	2	9	0	9	9	1	1	8
1004	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-203		gtlqzo	1	43	3	\N	2	4	1	1	f	5	0	9	1	3	9	0	2	9	1	1	0	0	3
1005	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-204		dfqzjo	2	27	0	\N	3	4	2	1	t	4	9	9	1	9	1	0	0	0	9	1	0	9	2
1006	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-205		tvgnlf	2	41	3	\N	0	4	0	2	f	1	6	1	0	1	2	0	1	9	9	1	1	1	3
1007	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-206		kezdva	2	26	1	\N	3	3	2	3	f	8	6	3	4	0	2	2	9	9	1	9	9	1	2
1008	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-207		jwezgp	1	54	3	\N	3	3	1	2	f	7	3	2	9	2	1	2	9	1	1	1	1	1	3
1009	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-208		epictm	2	46	3	\N	1	3	1	1	t	5	5	3	4	0	1	1	2	1	9	1	1	9	4
1010	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-209		xbspaq	2	35	3	\N	4	4	2	1	f	10	6	1	3	9	9	2	2	1	9	1	9	1	8
1011	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-210		mvakoq	2	26	0	\N	6	2	1	2	f	12	6	4	9	3	9	0	1	9	0	9	1	0	4
1012	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-211		aimvkz	1	18	1	\N	6	2	0	2	f	11	6	0	1	9	2	2	1	1	0	0	1	0	2
1013	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-212		grjads	1	16	2	\N	0	4	2	1	f	3	1	4	0	2	9	3	1	9	9	0	9	0	8
1014	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-213		mkcsoy	1	56	0	\N	3	4	1	3	f	2	9	0	4	3	9	1	2	0	9	1	9	0	3
1015	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-214		zdwbip	1	26	4	\N	3	3	2	2	f	12	12	1	4	9	9	3	2	9	1	1	0	1	2
1016	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-215		zpuhlf	1	51	1	\N	4	3	1	3	f	0	0	1	0	2	9	0	0	9	0	1	0	1	4
1017	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-216		jpyhex	1	20	0	\N	2	1	0	1	t	0	4	3	9	0	2	1	0	9	0	9	1	0	3
1018	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-217		jwbqym	1	61	2	\N	6	2	0	2	f	4	10	1	4	2	3	3	1	9	9	1	1	9	2
1019	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-218		jgktor	2	27	3	\N	0	4	0	2	f	10	2	0	9	1	1	1	2	9	0	0	0	1	8
1020	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-219		nsafjc	1	50	2	\N	2	4	2	1	t	10	7	0	9	0	1	2	2	2	0	9	0	1	2
1021	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-220		igtkdf	2	49	1	\N	1	3	0	2	t	4	10	2	4	0	1	2	0	0	9	0	1	1	2
1022	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-221		fhjtdw	2	15	4	\N	0	1	1	1	f	8	7	9	2	0	9	2	0	2	1	0	1	0	2
1023	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-222		gruywm	2	16	0	\N	1	2	0	1	f	3	1	3	0	2	1	2	0	0	1	0	9	9	2
1024	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-223		rysfbd	1	58	1	\N	3	3	0	3	f	7	6	9	2	0	3	2	2	0	9	1	0	0	8
1025	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-224		evqwdn	1	39	2	\N	4	2	1	3	t	1	1	9	0	9	2	1	0	2	1	1	9	0	4
1026	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-225		sfjgvd	1	58	3	\N	2	2	1	2	t	2	10	0	1	1	1	3	1	2	9	0	9	0	1
1027	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-226		agnwqk	1	27	4	\N	2	4	0	2	f	1	3	2	3	9	9	2	9	0	0	1	9	1	3
1028	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-227		goyqsx	1	32	2	\N	6	3	1	3	f	3	8	2	9	3	1	1	0	2	0	1	0	1	8
1029	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-228		bwsfjd	1	16	0	\N	5	1	1	2	t	10	7	0	3	1	1	1	0	9	9	9	0	1	8
1030	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-229		icpobm	2	20	4	\N	3	3	2	2	f	9	3	9	2	0	9	0	1	2	9	1	9	9	3
1031	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-230		bzwlrk	1	15	0	\N	2	2	0	2	t	6	9	9	0	0	2	3	2	0	0	0	9	9	1
1032	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-231		ymtnbu	1	36	2	\N	4	1	0	2	f	1	4	0	9	9	1	1	2	0	9	0	9	9	2
1033	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-232		ghoaqr	1	46	2	\N	6	4	1	3	f	5	4	2	1	3	1	0	2	1	0	0	0	9	2
1034	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-233		dozqgp	2	46	0	\N	4	1	0	2	f	6	8	9	4	2	9	2	2	1	9	0	0	1	8
1035	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-234		xeitfn	1	58	2	\N	6	1	2	2	t	6	2	9	0	1	2	0	9	0	9	9	0	0	2
1036	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-235		jswtqh	2	61	2	\N	3	3	0	2	t	4	2	4	2	2	1	2	1	0	1	9	0	0	4
1037	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-236		hmcsbg	2	53	1	\N	3	1	0	1	t	2	4	2	1	1	2	3	2	9	1	9	0	0	8
1038	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-237		taezko	1	24	3	\N	5	3	1	3	t	7	7	1	3	0	3	2	0	9	1	0	1	1	4
1039	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-238		vxnybc	2	48	1	\N	5	2	0	3	t	11	8	3	2	9	9	1	0	2	0	9	1	1	3
1040	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-239		irozek	1	53	0	\N	0	2	1	2	f	11	10	2	1	3	2	3	1	2	0	9	1	1	1
1041	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-240		rqzipe	2	47	3	\N	1	3	2	2	f	2	2	3	1	2	3	2	1	1	9	9	0	0	4
1042	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-241		bhludo	1	55	2	\N	6	2	0	1	t	10	0	3	4	2	9	3	2	0	1	1	1	9	1
1043	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-242		zpsdly	2	31	2	\N	3	2	2	3	t	10	4	4	2	0	2	2	1	1	9	0	0	1	1
1044	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-243		hzgcwa	1	18	4	\N	5	4	1	1	t	9	11	9	2	1	9	0	9	9	0	1	1	1	8
1045	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-244		adypre	2	38	4	\N	5	4	0	2	t	9	12	2	0	9	2	2	9	9	0	9	1	0	2
1046	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-245		ismwlu	2	53	1	\N	6	1	2	2	f	0	10	2	4	2	2	2	9	1	1	9	0	9	1
1047	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-246		sbqazx	2	31	4	\N	1	4	0	1	f	12	4	2	0	9	9	0	1	2	9	1	1	1	8
1048	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-247		xwfqrd	1	45	1	\N	1	4	0	2	t	10	7	0	9	3	1	2	2	2	1	9	1	0	3
1049	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-248		hfkgys	1	39	4	\N	4	4	2	2	f	11	5	9	3	2	1	0	9	0	1	9	9	9	8
1050	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-249		frwipt	1	53	4	\N	4	3	0	1	f	10	7	9	4	0	3	0	2	1	0	9	1	0	4
1051	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-250		ijnfsr	2	45	3	\N	6	3	0	3	t	8	5	1	4	2	1	3	9	0	1	9	0	1	3
1052	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-251		tmrzql	1	63	3	\N	0	1	0	2	t	8	4	4	2	3	1	3	9	1	1	9	1	9	1
1053	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-252		wcuqft	2	65	1	\N	6	1	2	3	f	7	2	9	0	9	9	1	1	9	9	1	1	0	1
1054	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-253		jwquvi	2	41	4	\N	1	4	2	1	t	5	11	2	4	2	2	2	9	1	0	0	1	1	3
1055	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-254		jxkvcw	1	41	3	\N	4	1	0	3	t	4	5	0	4	0	3	3	9	9	0	9	0	9	4
1056	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-255		tkyowj	1	25	1	\N	6	4	0	2	t	9	11	2	3	2	3	0	1	9	1	9	0	1	2
1057	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-256		dseztm	1	55	4	\N	5	2	1	2	f	1	10	4	2	9	3	1	0	0	0	1	0	9	3
1058	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-257		qscbeh	2	46	1	\N	3	4	0	1	t	9	10	0	9	9	3	1	9	9	0	1	0	0	1
1059	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-258		xpgdms	1	30	3	\N	2	2	0	3	t	9	2	3	2	1	1	3	0	0	9	9	0	9	3
1060	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-259		slrqge	1	40	2	\N	5	1	0	1	t	8	6	2	3	3	2	0	9	0	0	1	9	0	3
1061	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-260		zngaer	2	60	1	\N	5	3	1	3	f	7	10	0	9	3	3	1	1	9	9	1	9	0	1
1062	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-261		epxsda	2	22	2	\N	1	2	1	3	f	8	6	0	4	1	2	0	9	2	0	1	9	9	1
1063	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-262		obzwpn	1	43	4	\N	5	3	0	1	f	10	6	9	4	9	9	0	2	9	9	9	0	9	1
1064	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-263		vhsyib	2	16	4	\N	4	1	2	1	t	3	2	4	2	3	9	0	2	9	0	9	1	0	8
1065	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-264		pirjmh	2	57	4	\N	1	1	2	1	f	6	2	3	2	3	1	2	1	9	9	0	1	1	8
1066	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-265		ikuhwp	2	43	3	\N	1	4	0	3	f	12	9	9	3	3	2	0	0	1	9	9	1	0	3
1067	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-266		yzcevf	2	27	3	\N	0	1	1	3	f	3	2	0	3	1	1	2	2	9	1	0	9	9	3
1068	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-267		vkycxt	2	52	1	\N	1	4	1	2	f	11	7	9	4	9	2	0	0	9	9	9	1	0	2
1069	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-268		jrasil	2	52	3	\N	0	3	2	3	t	9	8	3	4	9	3	0	0	2	1	0	1	0	2
1070	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-269		hbeaiu	2	36	0	\N	4	3	2	1	t	12	0	1	4	9	2	3	2	0	0	1	1	1	1
1071	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-270		bsykoz	1	33	0	\N	6	1	2	3	f	2	10	3	0	9	2	2	0	0	1	0	0	1	3
1072	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-271		gqdahf	1	31	2	\N	3	1	1	1	t	11	10	9	4	1	1	0	0	2	0	9	0	9	3
1073	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-272		pvcilk	1	21	2	\N	4	4	2	2	f	1	5	4	1	9	1	0	1	2	0	9	0	9	3
1074	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-273		xicgwy	1	33	1	\N	5	1	1	2	f	3	9	0	1	0	9	2	1	1	9	1	0	1	2
1075	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-274		rjmatk	2	46	2	\N	3	2	1	1	t	2	10	3	9	3	9	3	2	9	0	1	0	1	3
1076	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-275		urykwa	1	45	4	\N	6	2	1	2	f	4	0	4	2	1	3	2	0	2	0	0	0	1	1
1077	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-276		qytbgw	1	27	2	\N	5	2	2	3	t	4	9	4	0	3	9	3	1	0	9	9	1	0	2
1078	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-277		iuhefn	1	43	4	\N	5	3	2	3	f	2	3	3	0	3	3	1	1	0	0	9	0	0	8
1079	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-278		bywrcz	1	37	1	\N	1	1	0	1	f	1	8	1	4	1	9	1	9	2	0	9	9	0	8
1080	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-279		zitjmb	1	15	1	\N	2	1	2	2	t	12	6	4	3	0	2	0	0	2	1	0	0	1	8
1081	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-280		rabegs	1	32	0	\N	3	3	1	1	t	10	0	4	9	0	3	3	2	1	1	0	9	1	4
1082	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-281		ykaiqj	1	64	1	\N	3	1	0	2	f	5	1	9	3	3	9	1	1	2	0	1	1	1	4
1083	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-282		xoiksl	2	20	1	\N	4	1	1	3	f	3	10	1	3	9	2	0	9	0	0	0	1	9	2
1084	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-283		kachxg	1	56	4	\N	1	3	2	3	t	10	11	3	1	3	1	3	0	2	0	0	9	1	8
1085	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-284		qlybip	1	48	1	\N	2	3	0	2	t	6	9	2	3	2	1	3	1	1	0	9	0	1	2
1086	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-285		gnboha	2	50	3	\N	0	2	2	1	t	5	1	3	1	9	1	1	1	1	1	0	1	0	4
1087	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-286		xoafhs	2	58	0	\N	2	1	0	3	t	1	7	2	0	2	9	3	2	2	0	9	0	1	3
1088	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-287		gnskpi	1	27	3	\N	3	4	0	1	f	5	8	1	0	9	9	0	9	1	1	1	1	1	8
1089	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-288		lsizdh	1	29	3	\N	6	2	1	2	t	9	3	1	2	1	3	2	0	0	9	1	0	0	8
1090	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-289		rmsztv	2	25	1	\N	2	2	1	1	f	0	10	0	1	0	3	3	2	1	1	0	0	9	1
1091	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-290		hwqiyl	1	38	3	\N	1	3	2	3	f	6	3	2	3	0	2	3	1	1	1	1	1	0	2
1092	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-291		xbiaqo	2	23	1	\N	1	3	0	3	t	2	9	1	4	3	2	2	0	0	1	1	0	0	1
1093	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-292		fkgebr	1	44	1	\N	3	3	2	1	f	12	5	3	9	2	1	1	2	0	9	0	9	0	8
1094	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-293		jzwoxf	1	57	3	\N	0	2	2	2	f	10	6	9	0	3	9	3	9	1	9	1	1	9	4
1095	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-294		oqkgfv	2	52	0	\N	0	1	1	1	f	2	3	0	3	3	9	2	2	2	9	0	1	9	1
1096	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-295		ylciqm	2	54	3	\N	3	2	0	3	f	5	2	0	1	3	1	1	1	1	9	1	1	9	3
1097	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-296		vhlupq	1	41	1	\N	4	4	2	2	f	6	12	3	4	9	1	3	2	0	0	0	1	1	8
1098	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-297		cijalo	2	47	0	\N	6	1	0	3	f	5	6	9	3	3	9	1	1	9	9	9	9	1	2
1099	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-298		frxtav	1	32	4	\N	5	4	2	1	t	8	12	0	9	1	3	1	0	0	0	0	1	0	4
1100	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-299		xjkmot	1	51	2	\N	5	4	1	2	t	9	0	4	3	9	9	3	2	9	1	1	9	1	8
1101	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-300		ypisbd	1	41	4	\N	6	3	1	3	t	6	4	3	4	9	9	3	9	0	1	0	1	9	8
1102	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-301		zqwmrd	1	40	1	\N	3	4	1	2	f	7	3	3	9	9	9	2	2	9	0	1	9	9	8
1103	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-302		vtdcur	2	30	3	\N	3	1	0	3	f	0	0	4	0	1	1	3	2	1	1	9	9	1	2
1104	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-303		swejyv	1	28	1	\N	5	3	0	3	f	12	11	1	2	3	3	3	9	2	9	0	1	9	3
1105	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-304		fdnayj	1	53	4	\N	2	4	0	1	f	12	7	9	1	9	9	3	1	0	1	9	9	1	8
1106	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-305		tudfcp	1	54	0	\N	1	3	1	1	t	10	7	0	4	2	1	2	2	1	9	1	1	9	1
1107	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-306		fmhngj	1	37	3	\N	5	2	1	3	f	0	7	4	1	0	3	0	1	9	1	1	0	9	8
1108	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-307		okhesi	1	64	1	\N	4	4	1	3	f	4	12	9	0	1	9	0	9	0	0	0	9	9	8
1109	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-308		fleqto	2	53	3	\N	6	4	1	1	t	11	7	0	3	1	9	2	0	9	9	0	1	0	1
1110	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-309		bgiwdm	2	35	3	\N	0	2	0	1	t	7	7	9	2	3	3	0	2	9	9	9	1	0	4
1111	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-310		vmijwr	1	36	4	\N	3	1	2	3	t	0	0	2	0	0	2	1	1	2	1	1	0	0	2
1112	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-311		awqitp	1	62	4	\N	2	1	2	3	t	6	7	3	2	1	2	3	0	1	0	0	9	1	2
1113	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-312		yusvet	1	21	1	\N	3	1	0	2	t	8	4	3	4	2	1	0	1	9	9	9	9	0	3
1114	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-313		okcrnt	2	36	2	\N	3	2	1	3	f	0	3	1	3	1	3	3	0	1	9	1	0	9	3
1115	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-314		namvxu	1	58	3	\N	6	3	0	3	t	12	12	1	9	3	1	0	9	9	1	0	0	9	2
1116	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-315		kifztv	2	18	2	\N	1	2	2	3	f	8	3	2	9	9	1	0	9	9	9	9	9	0	8
1117	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-316		gqvney	1	24	4	\N	5	2	0	2	t	6	4	4	0	1	3	0	9	9	0	1	0	0	2
1118	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-317		xtpoed	2	40	1	\N	2	4	2	3	f	0	7	4	1	3	9	2	2	1	9	0	9	0	2
1119	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-318		vdewtb	2	48	2	\N	4	4	2	1	f	12	10	9	4	2	2	2	1	1	1	1	1	9	8
1120	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-319		tugwex	1	15	0	\N	5	1	0	1	t	10	12	4	9	1	1	2	9	1	9	9	1	0	4
1121	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-320		embyca	1	47	2	\N	0	2	1	3	t	4	3	1	3	3	1	2	0	1	1	0	9	9	8
1122	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-321		bxuzve	1	32	1	\N	5	2	2	3	t	12	7	2	4	0	2	3	2	1	9	9	9	0	3
1123	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-322		hzwvfc	1	59	1	\N	1	1	1	2	t	0	11	4	3	2	3	0	9	2	9	9	9	0	3
1124	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-323		qbamuj	1	15	0	\N	5	4	2	1	t	8	4	0	1	0	9	2	1	0	1	1	1	1	1
1125	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-324		nvozks	1	33	3	\N	2	3	1	3	f	3	11	0	9	1	9	0	0	9	9	9	0	0	1
1126	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-325		alxkip	1	21	4	\N	3	2	2	3	t	6	4	9	2	1	2	0	0	2	9	9	9	1	1
1127	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-326		cbfkoa	1	36	4	\N	2	1	0	1	t	10	11	2	9	0	2	3	2	1	0	9	1	9	8
1128	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-327		lchpqf	1	30	1	\N	6	3	2	2	f	4	2	0	4	9	9	3	1	2	0	1	1	9	8
1129	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-328		gapbjq	2	48	4	\N	2	1	1	3	t	10	10	1	3	2	1	3	0	0	1	1	9	1	1
1130	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-329		pxknod	2	27	0	\N	2	2	2	2	f	3	11	2	1	3	3	1	9	2	9	0	0	9	1
1131	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-330		sbvnit	1	32	1	\N	3	4	0	1	f	8	3	4	2	9	3	1	0	1	1	0	9	1	1
1132	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-331		swprln	1	42	2	\N	2	1	2	1	t	4	12	4	1	2	9	0	9	9	9	1	1	9	1
1133	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-332		uisora	2	49	4	\N	6	2	0	3	f	10	4	2	9	2	9	2	9	2	1	9	9	9	3
1134	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-333		nolyth	2	49	4	\N	1	2	1	1	t	6	5	2	1	0	9	1	0	2	0	1	9	1	2
1135	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-334		nvmbqe	2	31	4	\N	2	1	2	1	t	5	4	9	3	0	1	3	2	0	0	9	9	1	3
1136	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-335		exsvwy	2	55	2	\N	3	3	2	3	f	3	12	2	9	3	3	0	9	2	0	0	9	1	8
1137	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-336		satxdm	2	39	3	\N	5	3	1	1	t	12	6	4	9	3	9	2	1	2	1	1	9	0	1
1138	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-337		wjksfl	1	22	0	\N	2	4	1	3	f	4	10	1	9	1	9	2	2	1	1	0	0	1	1
1139	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-338		xfaeoi	1	63	0	\N	3	4	2	2	t	11	11	3	0	1	9	0	2	1	9	0	1	9	4
1140	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-339		ktgzcy	1	16	1	\N	1	4	0	2	f	2	4	9	3	3	2	1	2	0	0	1	9	9	3
1141	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-340		eftrhk	1	46	4	\N	5	2	0	1	t	1	10	1	2	1	9	3	2	9	9	9	0	1	4
1142	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-341		xbrcdf	2	33	3	\N	2	4	1	3	f	4	1	4	3	3	2	0	9	9	1	9	9	0	3
1143	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-342		tmaqzr	1	64	0	\N	6	2	0	3	t	2	3	0	2	1	1	0	0	0	0	1	9	1	8
1144	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-343		vsrcub	2	53	2	\N	6	1	0	1	t	3	1	3	1	0	3	1	1	1	1	0	0	9	8
1145	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-344		niabuw	1	24	0	\N	1	4	1	1	f	9	5	9	1	1	3	0	9	1	1	9	0	0	2
1146	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-345		qckxml	2	55	2	\N	2	2	2	1	f	4	3	9	1	2	3	0	9	1	9	0	9	9	1
1147	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-346		pyuivf	1	51	2	\N	0	2	0	2	f	7	10	0	9	2	9	3	1	0	1	1	9	9	1
1148	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-347		ctfrlw	1	26	4	\N	6	4	0	1	f	5	11	2	1	9	1	0	0	2	9	0	0	0	2
1149	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-348		ybrvip	1	53	3	\N	0	4	1	3	f	4	12	3	0	0	3	1	9	1	9	9	9	0	3
1150	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-349		riwpem	2	48	0	\N	2	4	2	1	f	9	4	9	1	9	3	1	0	1	0	1	1	0	8
1151	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-350		rdtebx	2	39	4	\N	2	2	0	1	t	0	9	3	4	9	1	2	9	9	9	1	1	9	2
1152	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-351		hkapuq	2	46	1	\N	1	1	2	2	t	1	6	4	1	2	1	1	1	9	0	1	1	1	1
1153	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-352		tgxbvh	1	43	4	\N	5	4	0	1	t	5	0	3	0	0	1	3	0	2	9	9	9	0	4
1154	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-353		qpjkwm	1	54	0	\N	0	4	1	1	t	1	1	0	1	2	9	0	0	2	0	1	0	1	3
1155	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-354		loiwpe	1	44	2	\N	5	2	0	2	t	12	8	2	0	1	1	3	0	9	9	0	1	9	8
1156	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-355		bjiqdt	2	58	4	\N	5	4	2	1	t	12	0	4	2	9	9	3	9	0	0	0	1	0	3
1157	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-356		vcpnfo	1	16	2	\N	0	1	1	3	t	12	9	3	2	3	1	3	1	0	9	1	0	1	8
1158	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-357		hxmadv	2	33	4	\N	4	4	2	2	f	11	8	2	9	9	2	0	2	0	0	1	1	1	8
1159	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-358		kxdgvp	2	33	2	\N	0	4	2	3	t	9	9	4	1	1	9	2	0	9	0	9	9	9	1
1160	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-359		tqiuja	1	16	4	\N	1	4	1	1	t	1	4	2	1	3	9	1	0	2	9	9	0	9	8
1161	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-360		vpmjky	2	50	2	\N	4	3	2	3	t	12	12	1	3	2	9	2	1	2	1	1	9	0	4
1162	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-361		wizfat	2	22	3	\N	3	3	2	1	f	12	3	4	3	9	1	0	0	1	9	9	9	0	8
1163	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-362		quryal	1	20	3	\N	6	1	1	1	t	4	5	3	4	1	1	0	1	1	9	0	0	0	3
1164	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-363		twnayx	2	18	1	\N	5	2	2	3	t	1	10	9	0	1	3	3	1	0	9	0	9	0	1
1165	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-364		icnhog	1	55	2	\N	4	2	1	1	t	8	8	4	0	3	2	0	9	1	0	9	9	9	4
1166	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-365		ivmxpj	2	62	3	\N	0	3	2	3	t	11	11	9	3	2	2	0	9	2	9	0	9	9	8
1167	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-366		ctafek	1	51	2	\N	0	2	0	2	f	8	1	0	4	3	1	1	1	2	0	9	0	0	2
1168	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-367		tyxgda	2	34	3	\N	3	4	0	2	t	5	12	0	3	9	2	1	2	9	0	0	1	9	4
1169	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-368		jzybvx	2	35	4	\N	1	4	0	1	t	3	8	2	3	2	3	0	0	2	9	1	0	9	4
1170	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-369		qsytim	2	42	2	\N	6	2	0	2	f	6	4	2	9	3	1	2	0	1	9	1	1	1	3
1171	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-370		ixaqmr	1	32	2	\N	2	2	2	2	f	10	10	2	0	3	9	0	9	2	9	1	1	0	8
1172	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-371		xfqtwe	1	58	4	\N	6	1	0	2	f	3	11	9	2	3	9	1	0	9	9	0	0	0	8
1173	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-372		owzrtu	2	32	1	\N	3	3	0	1	t	3	11	1	2	3	3	1	1	0	1	9	1	1	4
1174	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-373		tkmazo	2	30	4	\N	3	2	0	2	t	8	5	3	0	3	1	1	0	2	0	1	1	9	2
1175	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-374		bznudh	2	35	1	\N	0	3	2	3	f	0	5	0	3	2	2	1	1	1	0	0	0	1	2
1176	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-375		wdhyvs	1	43	0	\N	5	1	0	2	f	6	12	2	4	1	2	3	2	9	0	0	1	0	2
1177	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-376		bxudcs	1	37	2	\N	4	3	2	2	f	6	11	0	2	1	2	2	2	9	9	1	9	1	4
1178	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-377		oshuec	2	53	2	\N	1	2	1	1	t	11	3	0	9	9	2	3	1	1	9	9	1	0	4
1179	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-378		clzrxb	1	40	0	\N	3	1	1	1	f	7	7	9	4	9	3	3	1	2	9	1	9	0	4
1180	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-379		avtenz	2	35	1	\N	1	1	2	3	f	8	11	4	1	1	3	3	9	2	1	9	9	1	3
1181	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-380		xbscyi	1	32	0	\N	4	3	2	1	t	9	11	4	0	9	2	3	2	0	1	0	0	0	4
1182	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-381		hcdiwb	1	58	0	\N	3	2	1	2	f	12	8	3	9	1	2	3	1	9	0	9	0	1	2
1183	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-382		jgidwm	2	29	0	\N	4	2	0	3	t	6	10	4	0	1	9	1	9	2	0	1	9	9	3
1184	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-383		mlknoz	2	26	0	\N	4	3	0	3	f	6	7	0	4	9	3	1	1	9	1	1	0	1	2
1185	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-384		psikqt	2	26	0	\N	1	2	0	3	f	0	11	4	0	1	2	0	1	9	0	1	0	1	3
1186	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-385		vjbfhy	1	40	4	\N	2	3	1	2	t	3	2	0	3	3	1	2	1	0	9	0	9	1	8
1187	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-386		zjxysw	1	28	4	\N	3	4	1	2	f	4	4	3	2	0	3	2	9	0	0	0	9	9	1
1188	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-387		sxhvro	1	34	0	\N	3	3	0	2	t	3	7	2	4	9	2	2	2	9	9	0	0	1	1
1189	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-388		yfczmo	1	27	0	\N	0	3	1	2	f	6	6	0	1	1	3	1	1	0	9	0	1	0	8
1190	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-389		lpadqb	2	46	3	\N	5	4	0	1	t	4	7	0	3	2	1	0	1	2	9	0	9	9	3
1191	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-390		bxgwqa	2	57	1	\N	5	4	1	2	f	7	6	3	0	1	9	1	9	0	0	9	0	9	4
1192	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-391		elrdos	2	26	3	\N	4	3	0	1	t	3	3	2	9	0	9	2	9	0	0	9	1	9	2
1193	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-392		teawly	2	45	0	\N	3	3	1	3	t	8	5	9	4	3	2	1	9	1	1	9	1	9	8
1194	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-393		vkrwls	2	46	3	\N	5	3	2	1	t	10	9	1	2	0	9	2	2	9	1	1	1	1	2
1195	2010-07-13 00:00:00	C10320	C10320C3	t	t	C10320-394		ihjtry	2	24	3	\N	2	4	2	3	t	8	9	3	2	9	2	1	0	2	0	9	1	1	4
1196	2010-07-13 00:00:00	C10320	C10320C3	t	f	C10320-395		pvqeah	2	15	2	\N	3	1	0	1	f	2	4	1	0	9	1	2	0	0	0	9	9	0	2
1197	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-396		nwptui	1	49	4	\N	2	3	1	2	f	3	5	4	3	2	1	1	1	0	1	1	9	0	2
1198	2010-07-13 00:00:00	C10320	C10320C3	f	f	C10320-397		qokpez	2	45	4	\N	2	3	2	2	f	8	0	9	1	2	1	0	1	1	0	0	0	9	1
1199	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-398		vxodep	1	19	1	\N	1	2	0	2	f	12	8	0	4	0	2	3	0	0	1	0	1	9	3
1200	2010-07-13 00:00:00	C10320	C10320C3	f	t	C10320-399		gzfwqc	2	25	3	\N	3	2	2	1	t	12	12	4	2	9	2	3	2	0	9	1	1	9	1
1201	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-0		psxiwo	2	17	3	\N	0	2	1	2	t	2	0	3	0	0	9	1	1	1	1	0	1	0	3
1202	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-1		rtakwo	1	36	1	\N	6	2	2	2	t	10	7	0	2	2	1	0	1	2	1	0	1	0	1
1203	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-2		oiveqw	2	18	1	\N	3	3	2	3	t	10	10	2	0	9	3	0	2	0	1	1	0	0	8
1204	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-3		desxja	1	38	4	\N	1	3	0	2	f	7	4	9	3	9	3	0	0	1	0	9	1	0	4
1205	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-4		glofrc	2	58	3	\N	0	3	1	1	t	10	2	3	4	2	1	3	1	0	1	9	0	9	4
1206	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-5		zhyvmf	2	38	3	\N	1	2	2	1	f	0	4	9	2	2	3	2	1	0	1	9	9	1	2
1207	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-6		tuymqw	1	57	4	\N	2	2	2	3	t	9	8	0	2	0	3	1	9	1	9	9	1	1	4
1208	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-7		tixhug	1	33	3	\N	1	2	0	1	t	7	0	9	4	2	1	0	2	9	1	0	0	9	4
1209	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-8		etzdvb	1	65	4	\N	5	3	1	2	t	8	12	1	2	2	3	0	0	9	9	1	1	9	2
1210	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-9		ndgclk	2	48	2	\N	2	3	2	2	f	0	11	4	0	2	3	1	0	0	1	9	1	1	1
1211	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-10		vtncrz	2	65	3	\N	5	4	0	3	f	4	2	2	3	1	9	3	0	1	0	1	9	1	2
1212	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-11		bwfexh	2	55	3	\N	1	2	1	3	t	10	3	9	4	0	3	2	9	2	9	1	0	0	4
1213	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-12		vgzxrs	1	26	2	\N	0	1	0	2	f	8	11	1	4	1	1	2	9	1	9	0	9	0	2
1214	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-13		wqanlm	2	44	0	\N	4	2	2	2	t	1	1	4	9	0	3	0	2	9	9	9	0	1	3
1215	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-14		romgxs	1	46	3	\N	1	1	0	1	f	11	11	3	9	2	3	2	1	9	0	1	0	0	1
1216	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-15		kdelcq	2	63	0	\N	6	2	1	2	t	3	2	2	4	1	1	2	9	2	0	9	1	0	1
1217	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-16		hvgfcm	1	50	2	\N	1	1	0	1	f	3	5	0	1	9	1	1	2	1	9	9	1	1	1
1218	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-17		pcktfu	2	55	0	\N	3	4	2	2	f	5	8	9	1	2	1	3	9	2	9	0	9	9	2
1219	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-18		dsycte	1	32	0	\N	2	2	1	2	f	0	9	9	1	0	1	3	9	2	9	1	1	1	8
1220	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-19		ftiajo	2	44	2	\N	1	2	2	2	t	6	2	4	9	3	1	3	1	2	0	1	0	0	1
1221	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-20		srevcu	1	65	0	\N	3	1	2	2	f	6	4	2	3	0	2	0	2	9	0	9	9	9	2
1222	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-21		vbrmfy	2	64	4	\N	4	3	1	3	t	8	5	2	3	1	3	0	0	0	9	0	9	9	4
1223	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-22		dalbhx	1	32	2	\N	4	1	2	2	t	7	0	3	4	3	2	3	1	1	9	1	0	1	4
1224	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-23		tjfwaz	2	61	1	\N	0	2	0	3	t	2	11	9	1	1	3	0	1	9	1	9	1	9	3
1225	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-24		shzkam	1	53	4	\N	6	2	2	2	f	7	0	0	3	1	1	0	9	2	0	0	9	0	4
1226	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-25		sdftxu	1	27	4	\N	1	1	1	3	t	2	0	2	3	2	1	1	1	9	0	1	9	1	2
1227	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-26		coyzgp	1	19	1	\N	1	3	0	3	t	2	11	3	1	3	2	0	0	9	9	0	9	0	1
1228	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-27		fdelvu	2	34	4	\N	4	1	1	1	t	1	3	2	3	1	1	1	0	9	9	0	0	0	1
1229	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-28		lbugon	1	55	1	\N	5	4	0	1	f	2	10	3	0	2	9	2	0	1	9	9	1	1	2
1230	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-29		boinvu	1	20	2	\N	6	2	0	1	f	8	0	2	4	1	9	0	2	1	0	1	0	1	1
1231	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-30		inhjkb	1	52	2	\N	0	3	0	2	f	4	9	3	0	0	3	2	0	9	0	0	0	0	4
1232	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-31		uzhgks	1	57	0	\N	6	2	1	2	t	9	10	2	3	0	2	2	1	0	9	1	9	0	3
1233	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-32		pghnwk	2	38	4	\N	1	1	1	2	t	9	8	1	4	9	9	2	1	1	0	0	1	0	2
1234	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-33		iunzbg	2	53	4	\N	1	4	2	2	t	5	4	3	9	3	2	1	1	9	9	9	0	0	4
1235	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-34		hmgano	1	23	0	\N	5	1	0	3	t	10	12	9	3	3	2	1	0	2	0	9	1	1	4
1236	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-35		vtdjow	1	51	2	\N	2	2	2	2	t	8	12	9	3	3	3	1	9	2	1	0	0	9	2
1237	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-36		vjrpmh	2	34	0	\N	2	4	0	1	f	0	12	1	9	2	3	0	2	2	1	1	1	1	4
1238	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-37		hitcaw	2	21	0	\N	0	1	1	3	t	1	5	1	9	1	9	3	0	9	1	1	1	1	4
1239	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-38		ophskc	2	36	1	\N	3	3	2	2	f	8	3	1	3	1	2	3	0	2	9	9	1	0	4
1240	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-39		hapndq	2	52	0	\N	0	2	0	1	f	8	11	2	3	1	9	3	9	2	9	9	1	9	2
1241	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-40		jizwdk	2	64	4	\N	5	2	1	1	t	9	0	9	4	1	2	2	9	1	0	9	9	1	4
1242	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-41		udemio	2	56	1	\N	4	1	2	2	f	12	10	0	1	3	1	2	9	2	0	9	1	9	1
1243	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-42		iafdwh	2	25	0	\N	5	2	1	3	t	12	4	4	1	0	2	3	1	0	1	0	1	9	4
1244	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-43		aiedsp	1	62	3	\N	1	3	1	3	f	0	12	3	1	2	3	0	9	0	0	0	0	1	1
1245	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-44		uxqtpl	2	50	4	\N	1	2	2	3	f	11	7	0	3	3	9	0	2	2	0	1	0	0	2
1246	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-45		szvhtq	2	38	1	\N	2	4	2	2	t	10	7	1	9	1	2	3	1	2	0	0	1	9	8
1247	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-46		xiymou	1	18	4	\N	0	1	0	2	t	0	12	3	2	0	9	2	1	1	0	9	0	9	8
1248	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-47		gmnpbt	1	31	3	\N	5	4	0	1	f	7	11	9	4	1	9	1	9	2	9	0	0	0	4
1249	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-48		vyjpws	2	44	3	\N	2	1	0	1	f	1	3	9	0	9	9	1	2	0	1	0	0	9	4
1250	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-49		izmuck	1	61	2	\N	3	1	1	1	f	0	3	1	4	9	9	0	2	0	1	9	9	1	1
1251	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-50		dkpuqs	2	47	1	\N	4	3	0	1	t	0	8	0	3	1	3	2	2	0	1	9	0	1	4
1252	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-51		kltiqd	1	52	2	\N	2	1	2	1	t	9	6	9	2	3	2	3	2	9	9	0	9	0	3
1253	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-52		uezwlv	2	35	3	\N	3	2	0	2	f	7	12	3	2	0	3	2	0	0	9	9	9	0	8
1254	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-53		swxfno	1	58	3	\N	1	1	2	3	f	1	3	0	3	3	2	0	9	2	0	9	1	0	1
1255	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-54		ebtxdp	1	62	4	\N	1	3	1	3	f	11	6	3	9	3	2	1	2	2	1	9	0	0	8
1256	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-55		vqfdkj	1	61	2	\N	6	4	2	2	t	6	11	3	0	9	9	2	2	0	9	9	1	9	8
1257	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-56		epubgt	1	50	1	\N	3	2	1	1	t	11	11	4	9	0	1	1	0	1	1	9	9	0	3
1258	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-57		cogwal	2	58	4	\N	6	2	2	1	t	8	1	1	2	1	2	0	9	2	9	0	0	9	3
1259	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-58		dzsloj	2	18	0	\N	5	1	2	2	t	10	6	4	2	2	1	0	2	9	9	9	9	9	2
1260	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-59		ijnfsu	2	60	0	\N	1	1	2	1	t	1	2	9	0	1	3	1	2	0	1	1	1	1	2
1261	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-60		lhitrv	1	17	2	\N	4	2	2	1	f	5	0	3	1	0	9	2	9	0	0	1	0	9	1
1262	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-61		xjouvd	1	43	4	\N	4	1	2	2	f	2	7	1	4	2	3	3	9	0	1	0	0	0	8
1263	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-62		fbzlqc	1	53	4	\N	3	1	1	1	t	3	12	9	4	9	9	0	0	0	1	1	9	0	1
1264	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-63		kxeqwt	2	25	2	\N	2	2	2	3	t	6	6	1	4	9	3	0	0	1	0	9	1	1	1
1265	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-64		xgqstv	2	22	1	\N	0	4	2	2	t	4	12	9	1	0	1	2	1	1	0	9	9	9	1
1266	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-65		yxzowa	1	22	0	\N	2	4	0	2	f	2	1	0	4	1	9	3	0	0	9	9	9	9	3
1267	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-66		ytixeq	2	25	1	\N	4	3	0	3	f	7	4	3	9	3	9	0	9	2	9	0	1	9	4
1268	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-67		kftcqz	1	46	0	\N	0	1	0	1	f	9	9	9	2	9	9	1	2	9	9	0	9	1	8
1269	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-68		mjrpxv	1	63	0	\N	1	2	0	2	t	0	2	1	9	2	1	1	0	2	1	1	1	9	8
1270	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-69		musokn	2	37	4	\N	3	3	1	1	t	12	5	1	3	9	3	3	2	1	1	9	9	1	8
1271	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-70		gonfuv	2	60	1	\N	5	1	1	1	t	11	3	0	9	9	9	3	2	1	0	0	9	1	2
1272	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-71		yewdtb	2	43	1	\N	5	4	2	3	t	3	6	3	9	0	9	0	9	9	1	9	0	1	2
1273	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-72		dzonfq	1	65	3	\N	5	4	2	3	t	3	2	1	0	0	3	1	2	9	1	1	0	0	2
1274	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-73		lewcqy	1	39	0	\N	2	2	0	3	f	10	9	0	1	3	9	1	0	9	1	9	0	0	1
1275	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-74		pxqlgz	2	53	3	\N	2	1	1	3	t	7	1	0	9	0	3	1	1	2	9	9	0	1	4
1276	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-75		azvjfo	1	52	1	\N	6	2	1	3	f	1	12	1	4	1	9	3	2	2	9	9	0	1	8
1277	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-76		shugof	1	57	2	\N	2	3	0	3	f	8	3	1	3	0	3	1	0	9	1	9	1	0	1
1278	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-77		urlptx	2	24	3	\N	2	2	1	1	f	3	8	3	4	1	3	2	9	2	0	9	9	1	4
1279	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-78		uykxpt	1	25	3	\N	5	3	0	2	f	3	10	4	2	9	1	2	1	1	9	0	0	0	4
1280	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-79		mnbogj	2	40	3	\N	3	2	1	3	t	8	5	9	2	3	3	1	1	2	0	0	1	1	8
1281	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-80		vaoqsw	2	15	1	\N	3	4	0	2	f	12	1	9	1	1	2	0	9	2	9	9	0	9	4
1282	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-81		lwcsyh	1	16	3	\N	4	3	0	1	t	2	4	2	0	9	2	1	0	9	0	9	9	1	4
1283	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-82		qogwlx	2	49	4	\N	0	2	2	2	f	10	11	4	1	0	1	2	1	1	9	9	0	9	1
1284	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-83		umrhoj	2	54	4	\N	3	4	1	1	f	6	7	0	9	3	3	3	0	0	0	9	0	0	2
1285	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-84		qaymsp	2	60	2	\N	3	1	2	3	f	0	8	1	4	2	9	2	2	0	9	1	9	9	2
1286	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-85		uhdwzr	2	16	3	\N	2	1	1	3	f	2	7	1	3	0	2	2	2	2	9	0	9	0	8
1287	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-86		dgklis	1	53	3	\N	6	1	2	3	f	11	0	1	0	9	2	0	9	0	0	1	0	1	3
1288	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-87		vhrkma	1	55	3	\N	1	3	0	3	t	6	6	1	0	2	2	0	9	0	0	9	0	0	3
1289	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-88		cpxiow	2	59	0	\N	4	3	2	1	t	11	4	0	4	1	1	3	1	9	9	9	0	1	3
1290	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-89		hslkpc	2	27	4	\N	5	1	1	1	f	12	3	9	1	2	3	2	0	1	1	9	1	1	1
1291	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-90		xzlicv	2	23	4	\N	0	2	1	3	f	1	7	1	4	0	3	3	0	0	0	9	9	1	1
1292	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-91		kzwegv	1	55	4	\N	6	2	0	3	f	0	5	9	3	9	1	0	2	0	9	1	0	0	2
1293	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-92		uyzpeb	2	39	2	\N	0	1	0	2	f	4	12	4	9	3	3	0	1	1	1	0	0	9	3
1294	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-93		gqrjzc	1	54	4	\N	0	1	0	3	f	4	8	2	4	2	1	0	9	9	1	9	9	9	8
1295	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-94		zycsxm	1	60	4	\N	1	2	2	1	t	11	3	4	9	2	2	0	1	9	9	9	9	0	4
1296	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-95		cblyrj	2	17	2	\N	3	1	1	2	f	12	2	9	4	1	9	3	2	0	0	9	0	9	2
1297	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-96		gfbhtl	1	40	4	\N	6	2	1	3	f	3	12	3	4	1	1	0	0	1	0	1	0	1	4
1298	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-97		fucyaz	1	53	0	\N	2	4	0	2	t	7	8	4	3	3	9	0	0	0	0	1	0	0	8
1299	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-98		hidwqv	1	37	3	\N	1	3	2	2	t	1	9	1	3	9	1	2	1	9	9	0	0	0	4
1300	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-99		dhipow	1	28	2	\N	0	4	2	1	f	11	0	2	9	1	2	0	9	1	0	0	0	9	8
1301	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-100		ztxacr	2	48	4	\N	6	1	2	3	t	9	0	4	2	2	2	1	9	9	9	9	1	1	1
1302	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-101		udasom	2	52	4	\N	4	4	1	2	f	4	0	4	1	2	9	3	0	1	1	1	1	0	2
1303	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-102		pkvjxz	2	50	3	\N	0	1	2	2	t	2	0	2	1	1	1	2	0	2	9	9	9	0	3
1304	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-103		wcfdbi	2	24	1	\N	4	3	1	3	f	7	11	1	2	3	1	2	0	1	0	1	1	1	2
1305	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-104		qfmzry	2	30	1	\N	2	4	0	1	f	8	2	3	9	3	3	2	1	0	9	0	9	1	8
1306	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-105		srvzcb	2	30	0	\N	6	2	0	2	f	3	9	3	1	9	2	3	1	1	1	0	9	1	1
1307	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-106		slpoak	2	53	0	\N	6	4	2	3	f	7	4	3	0	9	1	0	9	9	0	9	9	9	1
1308	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-107		tkpwmh	2	53	0	\N	2	1	1	3	t	12	6	4	1	1	9	1	0	2	9	1	9	9	1
1309	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-108		vqsehf	1	38	2	\N	3	4	0	1	f	10	11	4	0	1	3	2	9	1	1	9	0	0	2
1310	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-109		jlqhto	2	35	2	\N	3	2	2	1	f	1	5	1	0	2	3	0	2	9	1	0	9	0	2
1311	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-110		hpgasb	2	16	4	\N	2	4	1	3	f	6	2	3	0	9	9	3	1	1	1	9	1	0	3
1312	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-111		zwlfob	1	57	3	\N	6	1	1	3	f	0	5	2	4	2	3	0	9	2	1	0	9	0	2
1313	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-112		oqfbla	1	37	0	\N	2	1	0	2	f	11	10	9	2	0	2	3	9	1	0	9	9	0	4
1314	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-113		zhqbya	2	15	0	\N	4	1	2	1	t	2	2	2	4	1	2	2	1	0	0	9	9	9	2
1315	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-114		hfzrvs	1	46	3	\N	2	3	2	3	f	12	10	1	0	0	2	3	9	0	0	0	9	0	3
1316	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-115		kwpoqv	2	54	2	\N	5	2	1	3	f	6	11	3	0	3	2	0	0	9	1	1	1	1	4
1317	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-116		lhpnso	2	61	3	\N	3	3	2	2	t	1	7	9	4	2	2	1	0	9	0	0	1	0	3
1318	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-117		xognlf	1	40	2	\N	6	4	0	2	f	11	5	4	9	9	2	0	1	2	0	1	0	1	3
1319	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-118		cbyweh	2	31	0	\N	4	2	0	2	t	1	7	1	3	9	9	2	0	0	0	0	9	9	3
1320	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-119		ragtze	1	58	1	\N	3	2	0	3	f	3	0	4	1	0	2	0	1	0	0	0	0	0	1
1321	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-120		kprmwb	2	24	0	\N	5	4	2	3	f	10	4	9	0	1	9	2	1	2	9	9	1	0	4
1322	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-121		saiuob	2	43	4	\N	0	3	1	2	f	9	0	0	3	1	1	3	2	9	1	1	0	9	2
1323	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-122		rfshun	1	17	2	\N	5	1	2	3	t	5	11	0	2	2	1	2	0	2	0	1	0	1	4
1324	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-123		yqkcxt	1	58	4	\N	1	4	1	1	f	0	5	2	9	0	1	0	0	2	9	0	9	1	1
1325	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-124		zqjwuc	2	29	0	\N	0	2	0	1	f	11	6	3	2	9	1	1	0	1	0	1	1	9	8
1326	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-125		xotdqb	2	47	4	\N	0	4	1	1	t	6	5	0	3	3	2	2	1	1	0	0	9	1	1
1327	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-126		btasnh	1	29	3	\N	5	3	0	1	f	7	5	9	4	1	3	0	2	2	9	9	9	0	2
1328	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-127		mhwugc	2	53	2	\N	4	1	2	2	f	5	6	0	4	2	9	1	1	1	9	9	1	1	3
1329	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-128		jovuzb	2	42	1	\N	2	2	1	2	f	4	7	1	2	9	1	0	2	2	1	9	9	1	1
1330	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-129		gmeukh	2	45	2	\N	3	3	2	1	t	6	12	0	9	0	9	1	2	1	1	0	1	1	8
1331	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-130		wibgla	1	43	4	\N	6	3	1	1	f	11	7	9	3	9	1	1	0	0	1	0	0	9	1
1332	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-131		dpcfhm	2	16	2	\N	4	3	0	3	t	7	11	9	0	1	3	3	9	2	1	1	9	1	1
1333	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-132		ikgbtj	2	30	4	\N	2	2	0	2	t	8	10	9	3	3	1	3	2	2	0	1	9	9	1
1334	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-133		lytzpi	2	48	2	\N	6	3	1	1	t	10	10	1	3	3	3	3	2	1	0	0	9	1	4
1335	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-134		gfraov	1	17	0	\N	1	2	2	3	t	0	10	9	1	2	9	2	0	1	1	0	9	9	1
1336	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-135		xucqbw	1	41	0	\N	4	3	0	1	f	7	5	4	3	0	3	1	9	9	1	0	9	1	4
1337	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-136		wdniao	1	37	3	\N	6	4	1	2	f	11	10	2	1	3	2	2	2	0	0	1	1	9	2
1338	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-137		vkugpz	2	30	3	\N	1	3	2	2	t	2	7	0	1	9	3	3	9	0	9	0	1	1	8
1339	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-138		tneksd	2	60	2	\N	1	3	2	2	f	3	9	4	3	9	9	1	9	2	1	9	9	9	2
1340	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-139		lteiyu	2	19	2	\N	5	1	2	3	t	10	12	4	0	3	1	1	2	2	1	9	9	0	8
1341	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-140		hskqmz	1	24	4	\N	6	4	2	2	f	4	2	4	9	1	3	0	1	9	9	9	1	1	1
1342	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-141		mdqzjr	1	24	3	\N	4	3	0	1	f	11	8	4	3	9	9	1	1	2	1	1	0	1	1
1343	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-142		igthfe	2	18	4	\N	4	2	0	3	f	4	0	3	0	2	9	3	0	9	0	9	9	1	4
1344	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-143		gvdwzx	1	28	2	\N	2	1	2	2	f	3	4	1	4	0	3	3	1	0	0	1	0	0	8
1345	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-144		wqbjxy	1	62	1	\N	3	3	1	2	t	5	1	4	2	2	1	3	9	0	9	0	0	9	2
1346	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-145		cxgqmf	2	38	4	\N	6	1	1	3	t	8	3	3	1	0	9	0	1	1	9	9	9	1	1
1347	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-146		newzgb	1	21	4	\N	6	2	2	2	t	0	3	9	0	9	1	2	0	0	9	9	1	0	1
1348	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-147		dbalum	2	54	3	\N	2	3	2	2	t	12	1	4	0	9	1	2	1	0	9	1	1	9	4
1349	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-148		btumgf	2	33	1	\N	4	4	0	2	f	8	11	1	9	0	9	1	2	1	0	9	1	9	4
1350	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-149		qiouls	1	37	4	\N	4	2	1	1	t	12	4	0	1	2	2	0	2	9	0	0	1	1	3
1351	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-150		irwnad	2	44	0	\N	5	3	2	2	f	10	2	0	3	3	3	0	2	1	1	0	9	9	8
1352	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-151		uzygsp	2	16	2	\N	6	4	1	3	f	12	0	2	0	0	2	1	9	2	0	0	1	1	8
1353	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-152		gdarpu	1	65	1	\N	3	3	0	3	f	6	0	3	0	2	1	1	1	2	0	1	1	0	1
1354	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-153		flwybm	2	46	4	\N	6	3	1	2	f	9	4	3	2	2	9	0	2	0	9	9	1	0	2
1355	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-154		fmshqt	2	33	1	\N	6	2	0	3	t	2	9	0	1	9	2	1	9	0	0	0	1	9	4
1356	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-155		sgdrmf	2	52	4	\N	0	1	2	3	f	12	7	1	9	3	9	0	0	0	1	9	9	9	4
1357	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-156		tjuevf	1	16	2	\N	3	2	1	2	t	4	5	9	2	0	2	1	0	0	9	1	1	0	2
1358	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-157		oayjbq	1	31	0	\N	5	2	0	1	t	1	7	4	9	1	2	2	0	2	0	9	1	9	1
1359	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-158		kteozp	1	22	2	\N	1	2	1	2	f	0	2	1	9	0	2	2	1	2	0	1	1	9	4
1360	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-159		nqsgul	1	50	0	\N	2	2	2	2	t	1	8	2	4	0	3	3	0	1	1	1	1	0	4
1361	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-160		wfaxmb	1	18	1	\N	5	2	0	2	t	3	7	1	0	9	9	3	0	9	1	9	0	1	2
1362	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-161		surybx	2	39	3	\N	2	4	2	1	t	9	8	1	3	1	2	0	9	9	9	1	1	9	1
1363	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-162		tkudxc	2	45	1	\N	3	1	2	2	t	3	6	1	4	0	2	1	0	1	0	9	1	0	8
1364	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-163		kxzqmu	1	45	4	\N	5	4	1	1	f	1	5	9	3	2	1	2	1	9	1	0	0	0	2
1365	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-164		vqmidt	1	57	3	\N	1	3	0	2	f	3	11	0	4	2	3	1	9	0	9	0	9	1	2
1366	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-165		lnmpcz	2	47	2	\N	6	3	2	2	t	0	2	1	2	9	9	1	9	2	1	9	1	9	1
1367	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-166		fzltae	1	27	3	\N	4	3	0	3	t	11	5	1	9	0	3	3	2	1	1	1	1	0	1
1368	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-167		yokmln	1	35	2	\N	1	1	2	1	t	2	7	4	0	3	9	2	2	0	1	0	9	9	4
1369	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-168		oezkhg	2	24	1	\N	6	2	0	1	f	8	4	2	9	0	9	3	2	9	9	1	0	1	1
1370	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-169		udmjrq	2	31	3	\N	3	1	0	3	t	8	0	1	2	3	3	3	9	1	1	9	0	9	2
1371	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-170		gvkypz	2	52	2	\N	0	2	1	2	f	1	7	0	9	9	3	2	1	0	0	1	1	0	2
1372	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-171		ntglcj	2	42	0	\N	2	4	2	1	f	0	11	2	1	3	9	0	0	0	9	9	1	9	4
1373	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-172		ihslkf	2	20	4	\N	4	4	1	2	t	11	4	2	3	2	2	3	2	0	9	1	9	9	3
1374	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-173		qikacm	1	24	2	\N	2	1	1	2	t	3	3	4	9	2	2	2	2	2	0	1	1	9	8
1375	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-174		vkfngu	1	55	4	\N	3	3	0	3	f	12	2	1	9	9	3	1	0	0	0	9	1	0	8
1376	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-175		nygrqk	1	41	3	\N	1	4	0	1	t	11	2	2	9	2	2	1	1	0	9	1	9	0	8
1377	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-176		byjigd	1	21	2	\N	5	1	0	1	f	12	7	1	0	1	3	3	0	2	9	0	9	0	2
1378	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-177		lbgafx	2	21	4	\N	0	1	1	2	f	5	9	3	2	9	1	2	2	1	0	1	9	1	8
1379	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-178		hznbcj	1	23	2	\N	1	1	0	3	t	12	2	0	1	0	9	3	9	0	0	0	9	9	4
1380	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-179		zehpyu	1	29	3	\N	1	3	2	3	f	0	8	4	9	0	1	1	9	2	1	0	0	1	4
1381	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-180		tmxfjq	2	64	3	\N	6	2	2	1	f	12	10	1	0	0	2	0	9	2	9	9	0	0	8
1382	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-181		rwxaob	1	56	4	\N	0	2	0	2	f	8	3	0	3	2	2	2	2	9	0	0	9	1	4
1383	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-182		iyrqgv	1	55	2	\N	0	2	2	2	f	6	11	3	0	3	2	3	1	9	0	9	9	9	1
1384	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-183		htowqf	1	55	2	\N	5	1	2	1	f	0	4	0	9	3	3	3	2	0	9	1	9	9	2
1385	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-184		drmisw	1	28	0	\N	4	1	1	1	t	2	8	9	0	0	1	1	1	1	9	0	9	9	2
1386	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-185		jzlxmb	2	49	0	\N	0	1	1	2	t	1	12	0	9	0	1	2	9	2	0	9	1	9	2
1387	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-186		zmdrsh	2	22	0	\N	3	2	0	1	f	12	9	0	4	0	9	1	2	1	1	1	9	0	3
1388	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-187		vpfamc	2	22	3	\N	2	1	0	3	t	8	12	9	3	1	9	0	1	9	0	1	0	0	4
1389	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-188		dheoaw	2	55	1	\N	4	4	2	1	f	3	3	2	3	2	2	2	0	2	0	9	9	9	1
1390	2010-07-12 00:00:00	D17589	D17589C4	t	t	D17589-189		xewdmv	2	64	2	\N	2	3	0	2	t	2	5	0	4	3	3	1	0	2	0	1	0	1	1
1391	2010-07-12 00:00:00	D17589	D17589C4	t	f	D17589-190		xbdefu	1	34	0	\N	6	2	1	1	f	0	9	9	2	1	2	0	0	0	0	9	1	0	8
1392	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-191		fsbgvm	1	22	2	\N	0	4	1	2	f	9	7	1	9	1	2	1	0	2	1	0	0	9	8
1393	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-192		qmenbu	2	38	1	\N	0	2	0	1	t	0	7	1	3	0	1	3	2	2	0	0	1	0	1
1394	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-193		fhzprs	1	46	1	\N	5	1	1	1	t	5	12	9	0	0	2	2	1	0	0	9	0	1	8
1395	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-194		radmic	1	40	4	\N	5	1	0	1	f	9	10	9	4	1	1	0	2	0	9	9	0	0	3
1396	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-195		qkgtmu	1	40	3	\N	1	4	2	1	t	0	2	9	3	3	1	2	2	1	0	0	9	1	2
1397	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-196		klnxmp	1	57	1	\N	3	4	0	3	t	3	8	2	9	1	3	2	2	9	1	9	0	9	1
1398	2010-07-12 00:00:00	D17589	D17589C4	f	f	D17589-197		lncojg	2	46	4	\N	0	2	2	3	f	4	0	1	4	3	1	2	2	2	1	9	0	9	8
1399	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-198		drpefg	2	46	2	\N	6	3	0	1	t	4	11	1	4	9	1	3	9	2	0	0	9	0	8
1400	2010-07-12 00:00:00	D17589	D17589C4	f	t	D17589-199		ckmtnz	1	63	3	\N	3	1	0	2	f	11	6	2	9	9	1	3	1	9	1	0	9	0	3
1401	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-200		bnkqvm	1	15	2	\N	6	2	2	3	f	5	5	0	1	0	2	0	1	2	9	9	0	0	4
1402	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-201		vtwobq	1	39	2	\N	3	4	2	3	t	3	6	9	3	9	9	0	0	2	9	1	1	0	3
1403	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-202		grbykw	1	47	1	\N	2	1	1	1	t	1	2	2	4	1	3	1	2	0	9	9	0	0	1
1404	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-203		poqtwr	1	16	2	\N	4	1	0	1	t	11	5	9	4	2	3	3	0	2	0	1	9	1	1
1405	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-204		qwtefi	1	63	0	\N	2	3	1	1	f	2	4	4	2	9	2	1	9	9	0	1	9	1	2
1406	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-205		yjqapd	2	34	2	\N	4	2	0	1	f	7	9	9	1	2	9	0	9	9	9	0	1	9	1
1407	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-206		vnkase	1	58	1	\N	3	3	1	3	f	1	3	4	2	9	2	2	2	1	0	9	9	9	4
1408	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-207		dqbfcg	2	41	3	\N	6	2	0	3	t	10	6	9	1	9	1	2	1	0	9	1	9	0	1
1409	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-208		vamqwx	2	27	3	\N	4	2	2	1	t	1	7	3	1	3	1	3	1	1	0	0	0	9	4
1410	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-209		htkejg	1	61	0	\N	1	3	0	3	t	3	3	4	2	3	2	3	9	0	9	9	1	9	8
1411	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-210		gyiqdk	1	29	0	\N	6	1	1	3	f	3	9	1	4	1	1	1	2	9	0	1	1	9	4
1412	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-211		zjlbco	1	34	3	\N	5	1	2	3	t	8	1	9	4	9	9	0	0	0	0	1	0	1	4
1413	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-212		nbivsa	2	37	4	\N	3	2	2	1	t	9	1	4	2	2	3	2	9	9	0	0	0	0	8
1414	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-213		txhedz	2	26	2	\N	4	3	0	1	f	2	3	0	9	3	2	2	0	0	1	1	0	0	2
1415	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-214		ptsbmd	1	39	0	\N	0	1	1	2	f	4	3	0	3	0	2	3	2	0	0	0	0	9	2
1416	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-215		fxervj	2	29	4	\N	2	2	1	1	f	11	3	0	4	1	3	3	9	0	9	1	9	1	2
1417	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-216		mvwcfh	2	16	1	\N	6	2	1	2	t	2	9	4	2	1	1	3	0	1	9	9	9	9	8
1418	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-217		cpsljm	1	65	0	\N	0	3	0	2	t	3	6	3	0	2	2	0	2	0	9	1	9	9	3
1419	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-218		xpvfml	2	21	2	\N	4	4	0	3	t	6	3	1	9	9	3	3	9	0	1	9	9	1	4
1420	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-219		rukbem	1	38	1	\N	6	1	2	3	f	9	5	0	9	1	3	0	9	0	1	0	9	1	1
1421	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-220		swyfbi	1	59	1	\N	1	3	2	1	t	9	1	0	9	3	1	1	0	1	0	1	9	1	2
1422	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-221		zpqgis	2	43	2	\N	5	4	2	3	t	1	3	4	9	1	3	2	0	2	1	0	0	0	1
1423	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-222		upkcjs	2	39	3	\N	5	3	0	1	f	9	11	4	9	9	1	0	1	0	9	9	1	0	8
1424	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-223		ltcwyk	2	40	3	\N	4	4	1	3	t	7	0	1	2	3	9	2	2	0	9	1	1	0	3
1425	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-224		fqtxpi	1	49	1	\N	0	3	2	2	f	11	4	1	4	2	9	1	1	0	0	9	0	1	3
1426	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-225		hmdrwl	1	49	0	\N	1	4	0	1	t	1	5	9	4	9	2	0	9	2	1	9	0	0	8
1427	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-226		vykmpd	1	41	3	\N	5	4	1	3	f	3	1	2	3	2	3	1	0	1	1	9	1	1	4
1428	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-227		vjglct	2	21	3	\N	0	3	0	3	f	9	3	2	3	0	3	2	1	1	9	1	9	1	1
1429	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-228		szgpio	2	25	0	\N	4	3	2	2	f	11	9	3	2	1	9	0	2	0	0	9	9	9	4
1430	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-229		fmrlvs	2	36	3	\N	5	3	1	3	t	0	10	2	3	2	2	1	9	1	0	9	9	9	4
1431	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-230		egbzpc	1	17	3	\N	4	4	1	1	f	0	4	3	9	9	2	3	2	9	9	1	0	9	1
1432	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-231		xpbutf	1	18	4	\N	6	2	2	3	t	5	3	4	2	2	3	3	1	9	1	9	1	9	1
1433	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-232		mxraey	2	40	1	\N	3	4	2	1	f	8	0	0	9	2	1	0	0	0	1	0	1	1	1
1434	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-233		lgqmbt	2	23	4	\N	4	2	1	3	t	11	5	0	9	9	9	1	2	0	1	0	1	0	8
1435	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-234		rfoadt	1	44	3	\N	2	1	1	2	t	7	7	1	2	0	1	0	2	1	9	0	9	0	4
1436	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-235		tbgwrj	1	23	2	\N	5	1	1	3	t	8	12	9	1	2	3	0	1	0	9	9	0	9	2
1437	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-236		pfdbia	2	47	2	\N	2	1	1	2	f	8	5	1	3	9	3	1	2	9	0	9	9	9	3
1438	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-237		jxbhls	1	39	2	\N	5	4	2	3	f	12	12	3	0	2	1	3	2	9	1	1	0	0	2
1439	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-238		nhcpsv	2	20	2	\N	2	1	0	3	t	5	5	4	9	1	2	2	2	0	1	1	0	0	4
1440	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-239		zlstcy	2	20	1	\N	4	3	1	3	t	3	7	4	1	3	2	1	9	0	1	1	9	1	8
1441	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-240		kazmfp	1	31	4	\N	3	2	2	2	f	10	5	3	4	3	1	2	2	1	0	1	9	1	8
1442	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-241		theuaj	2	23	1	\N	4	1	2	1	t	12	6	0	4	3	3	1	1	9	9	1	9	9	2
1443	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-242		xozbhm	2	65	0	\N	0	3	1	1	t	9	4	2	3	1	1	3	0	0	9	9	1	0	8
1444	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-243		epzgbc	2	44	3	\N	3	2	0	1	f	9	8	1	4	1	1	1	1	1	9	1	1	9	2
1445	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-244		bonsig	2	60	4	\N	1	1	0	1	f	12	3	1	2	3	1	0	0	1	1	1	0	0	4
1446	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-245		xwgqsc	2	65	4	\N	6	4	1	2	t	5	10	3	4	9	2	2	0	9	9	0	1	0	4
1447	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-246		eumqdi	1	44	3	\N	6	4	2	1	t	0	9	3	4	1	9	2	9	1	1	0	9	9	3
1448	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-247		ailytj	1	40	3	\N	5	4	0	3	f	12	2	9	3	1	9	0	0	2	9	1	0	0	3
1449	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-248		txplar	1	51	0	\N	3	4	1	3	t	8	9	4	9	0	2	3	9	2	1	1	1	1	4
1450	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-249		qstaok	2	48	1	\N	3	1	1	3	f	12	0	3	1	9	2	0	9	9	0	9	9	1	8
1451	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-250		uxkhbt	1	56	3	\N	3	1	1	1	f	10	7	1	3	0	2	2	1	0	9	1	0	0	2
1452	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-251		cnepjb	1	36	2	\N	2	2	0	2	t	11	2	9	1	2	9	2	9	9	9	1	0	9	3
1453	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-252		kfhcej	2	20	3	\N	1	2	2	3	f	12	7	1	3	9	3	3	9	9	0	1	9	9	8
1454	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-253		lmftwg	2	53	4	\N	0	3	1	1	t	12	6	9	0	2	9	3	1	0	1	1	0	1	2
1455	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-254		dcijxt	1	33	4	\N	5	4	2	3	f	4	7	2	0	2	2	3	0	2	9	0	9	0	4
1456	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-255		kumewt	2	62	4	\N	3	4	1	1	f	1	10	3	1	2	9	1	2	2	9	1	0	9	2
1457	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-256		ampjic	2	62	3	\N	1	4	2	3	f	7	0	2	3	9	2	2	1	9	1	0	1	0	1
1458	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-257		eytxkm	1	15	0	\N	6	1	1	2	t	8	10	2	4	3	3	0	9	1	0	0	9	0	2
1459	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-258		frukhp	1	48	2	\N	0	3	1	2	f	2	4	4	3	3	2	2	9	2	9	9	0	9	4
1460	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-259		qowbdp	2	35	4	\N	3	2	0	1	t	1	9	2	3	0	3	0	9	2	9	1	9	1	1
1461	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-260		adyxjr	2	53	1	\N	2	1	1	1	f	6	11	9	4	0	1	1	1	9	9	9	9	9	4
1462	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-261		monabx	2	51	0	\N	0	3	2	1	t	4	11	0	3	0	2	1	0	2	9	9	0	0	1
1463	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-262		fvpscd	1	16	1	\N	6	3	2	1	f	3	6	2	1	2	1	3	1	0	1	9	1	0	2
1464	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-263		eyrtwo	1	16	1	\N	4	4	1	1	t	8	6	3	2	0	1	3	2	1	1	1	1	9	2
1465	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-264		flztpc	1	17	4	\N	5	4	2	1	t	8	5	3	9	9	3	2	0	0	0	9	0	9	3
1466	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-265		vadhpu	2	16	1	\N	4	4	1	3	f	8	10	2	9	9	2	1	0	9	9	9	1	9	1
1467	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-266		culrvb	1	47	3	\N	1	1	1	3	t	4	9	0	3	0	3	1	9	0	0	0	0	9	3
1468	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-267		phtxlf	2	32	3	\N	5	1	2	2	f	2	0	1	4	1	3	3	9	1	1	0	1	1	3
1469	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-268		dyoqwi	2	32	1	\N	3	3	0	1	f	9	12	9	3	0	3	1	0	0	1	0	0	0	4
1470	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-269		orgztd	2	49	2	\N	6	2	0	2	f	1	3	0	1	9	1	1	0	9	9	1	0	1	3
1471	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-270		agqolm	2	49	2	\N	5	3	2	2	f	9	6	0	1	2	3	2	1	0	9	9	1	9	2
1472	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-271		jflcwt	1	51	4	\N	4	2	2	3	f	9	3	3	2	2	2	2	1	1	1	9	1	1	4
1473	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-272		wicsfr	2	33	4	\N	1	3	2	3	f	6	2	2	0	0	9	3	2	9	9	9	1	1	1
1474	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-273		ityrfv	2	19	0	\N	0	3	0	3	t	6	7	4	0	0	3	2	9	2	9	0	0	1	1
1475	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-274		rklsjf	1	19	0	\N	1	1	2	3	f	2	3	4	0	3	1	0	1	9	9	1	0	0	2
1476	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-275		louajh	2	60	1	\N	5	4	1	1	f	2	3	2	1	1	9	3	2	1	1	1	9	0	2
1477	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-276		vpwudf	1	26	4	\N	3	4	0	2	f	1	11	4	1	9	2	3	2	2	1	9	1	1	8
1478	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-277		iczxgq	2	31	3	\N	1	2	2	3	f	10	0	1	4	2	1	0	0	9	1	0	9	0	3
1479	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-278		nqxwsi	2	31	0	\N	2	2	0	3	f	1	6	9	3	0	3	1	2	1	9	1	1	9	4
1480	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-279		rlxhdc	1	42	3	\N	4	2	1	3	f	12	11	2	9	0	1	0	0	9	1	1	9	9	1
1481	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-280		zitovg	1	22	2	\N	5	2	0	2	t	1	0	2	1	2	2	1	9	9	9	0	1	9	4
1482	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-281		lexvwf	2	36	0	\N	0	2	0	1	f	7	0	4	9	3	2	0	1	1	9	9	1	0	8
1483	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-282		opczkw	1	55	2	\N	6	4	2	1	t	2	8	0	4	3	9	3	1	1	9	1	9	0	8
1484	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-283		tisuoz	2	45	4	\N	6	4	0	1	t	8	0	0	1	0	3	2	2	0	9	1	1	9	4
1485	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-284		nwlcmi	1	57	1	\N	5	4	0	2	t	10	8	3	1	1	1	3	2	9	1	1	1	0	4
1486	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-285		agtrpb	1	25	1	\N	4	2	2	3	t	6	1	9	1	0	2	1	1	9	1	9	9	9	8
1487	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-286		bdomlu	1	50	3	\N	5	1	0	3	t	12	5	4	1	1	9	0	2	0	9	1	1	0	8
1488	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-287		sdzhcj	2	52	4	\N	1	1	0	3	f	5	7	0	9	1	3	2	9	1	0	1	1	0	4
1489	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-288		ocqsvu	2	30	1	\N	2	4	2	1	t	3	6	2	4	9	9	0	2	1	9	9	0	1	2
1490	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-289		ikzulw	2	55	3	\N	2	3	2	1	f	0	3	4	9	3	2	3	9	0	1	0	1	1	1
1491	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-290		tcingj	1	57	3	\N	1	3	1	2	f	1	0	9	3	0	9	3	1	9	9	0	1	0	1
1492	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-291		jnlxqy	2	34	4	\N	2	1	2	2	f	5	10	1	2	0	3	0	2	0	0	9	0	0	4
1493	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-292		gorbca	1	35	1	\N	3	3	0	1	t	11	11	2	0	2	1	3	2	0	1	1	0	9	4
1494	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-293		qadbyv	2	40	0	\N	4	3	2	1	t	12	3	4	0	3	1	0	0	2	0	9	9	1	3
1495	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-294		czxwat	2	58	1	\N	1	3	0	1	t	4	5	9	0	0	2	2	0	1	9	1	1	9	8
1496	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-295		aduhcx	2	41	2	\N	5	4	2	1	t	9	10	1	4	3	1	1	1	2	1	0	1	1	4
1497	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-296		hqdejt	2	37	1	\N	4	1	1	1	t	11	10	0	3	2	1	0	1	1	0	0	1	1	8
1498	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-297		mxszdg	1	28	4	\N	5	1	2	3	f	10	2	1	0	1	9	0	2	1	1	9	1	0	1
1499	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-298		grokna	1	58	4	\N	3	3	2	2	t	3	1	2	4	1	9	1	9	9	1	9	0	9	1
1500	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-299		rnqwfe	1	62	2	\N	3	1	2	1	f	1	8	9	0	2	9	0	1	9	1	1	0	0	8
1501	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-300		tcgwka	2	64	1	\N	0	1	1	3	f	2	7	0	4	9	9	1	0	1	1	1	1	0	4
1502	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-301		jraxki	1	29	2	\N	1	2	0	2	f	6	9	3	0	3	9	1	0	0	9	9	9	0	4
1503	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-302		oehpld	2	23	4	\N	6	1	2	3	t	12	11	0	1	3	2	3	9	1	9	0	9	1	4
1504	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-303		gahkus	1	60	3	\N	6	4	0	3	f	5	11	1	4	3	1	0	2	1	9	9	1	0	8
1505	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-304		cdumgq	1	34	1	\N	3	2	0	3	t	11	3	3	2	0	2	0	0	0	0	9	0	0	8
1506	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-305		vtfnqa	1	50	1	\N	4	4	0	2	f	10	3	2	1	1	9	3	2	9	9	0	0	0	1
1507	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-306		fgkyvi	1	31	4	\N	0	3	2	1	t	12	6	3	1	9	9	0	0	9	1	9	0	1	3
1508	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-307		ohuftd	1	40	2	\N	6	2	0	2	f	2	3	1	9	1	9	0	1	0	1	0	0	1	2
1509	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-308		cwybud	1	39	3	\N	4	2	1	2	f	1	10	0	2	1	3	0	1	2	1	1	9	1	2
1510	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-309		avjcsl	1	50	0	\N	5	2	1	3	t	10	6	3	9	1	3	3	9	9	9	0	1	1	2
1511	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-310		abdymv	1	59	2	\N	1	2	1	1	f	9	9	2	3	1	1	0	9	9	0	9	0	1	8
1512	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-311		cxuqdf	2	44	2	\N	1	2	0	2	t	9	5	2	4	2	2	2	9	1	0	1	0	0	1
1513	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-312		xvtkhy	1	39	0	\N	3	4	2	3	t	11	3	2	3	1	9	0	0	0	1	9	1	0	8
1514	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-313		kpsuyh	1	17	2	\N	5	1	0	3	t	7	7	4	9	9	2	2	9	0	9	9	1	0	2
1515	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-314		tiumep	2	58	1	\N	3	2	1	3	t	11	2	4	2	2	9	3	2	2	0	0	1	1	2
1516	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-315		dnkoab	1	35	4	\N	2	1	2	3	t	7	7	2	1	2	9	2	1	0	0	9	0	1	3
1517	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-316		fczgpe	2	24	4	\N	6	4	2	1	t	12	11	3	4	2	3	0	9	2	1	9	9	0	1
1518	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-317		elnsqy	1	54	2	\N	2	1	2	1	t	3	1	3	9	0	2	1	2	9	1	9	9	0	4
1519	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-318		ubcmgr	1	53	0	\N	6	3	0	1	f	5	0	0	9	1	2	0	1	2	0	9	1	1	3
1520	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-319		gucwjy	1	51	2	\N	5	1	1	1	t	1	9	4	3	0	3	1	0	0	9	9	1	9	8
1521	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-320		hgplmo	2	45	4	\N	2	1	1	1	t	6	10	0	4	1	3	2	1	9	9	9	9	0	8
1522	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-321		bgasep	2	33	1	\N	2	4	1	2	t	5	9	4	0	2	2	1	2	2	0	1	9	0	2
1523	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-322		oumrjk	1	60	1	\N	5	1	0	1	f	8	12	3	1	3	2	3	1	2	1	9	1	0	1
1524	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-323		hazpjd	2	16	4	\N	3	2	2	3	f	3	6	1	3	9	9	1	1	9	1	0	1	1	1
1525	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-324		gsudzh	2	45	1	\N	3	3	0	3	f	11	6	1	9	9	2	2	9	9	0	1	9	1	4
1526	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-325		dlaqno	1	63	3	\N	4	2	0	3	f	0	4	1	2	3	1	0	1	2	1	9	0	1	1
1527	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-326		eizjpu	2	44	2	\N	3	4	0	2	f	10	2	0	4	0	2	2	2	2	0	0	9	0	3
1528	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-327		zwqray	2	32	1	\N	6	2	0	1	t	6	12	0	4	0	1	1	2	9	9	9	0	0	4
1529	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-328		manpgu	1	52	3	\N	4	1	0	3	f	7	6	4	3	0	1	0	2	0	9	9	1	1	8
1530	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-329		ayxkle	2	20	2	\N	2	1	2	2	t	7	0	4	1	0	2	2	9	9	9	9	0	0	3
1531	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-330		oqfcbt	2	46	3	\N	2	1	1	3	f	3	5	1	2	3	3	3	1	0	1	1	9	9	4
1532	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-331		queaiz	1	43	1	\N	4	2	0	1	t	8	3	4	9	2	9	3	2	0	1	1	9	0	3
1533	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-332		vraofd	1	31	4	\N	2	2	0	3	t	7	9	4	9	1	3	3	0	0	1	9	0	9	3
1534	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-333		beikws	1	57	2	\N	4	4	2	3	t	3	1	2	1	2	1	1	1	0	0	9	0	1	3
1535	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-334		ynbugz	1	52	0	\N	0	4	2	2	f	5	1	9	3	0	3	1	1	9	0	0	1	9	3
1536	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-335		pkrism	2	59	0	\N	4	4	2	2	t	10	12	0	4	9	1	0	0	9	1	1	9	0	4
1537	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-336		zafpwe	1	22	0	\N	5	2	2	3	t	0	1	1	3	1	3	0	2	1	0	0	0	9	4
1538	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-337		dokzcp	1	50	1	\N	2	2	0	1	t	8	5	3	2	1	3	2	1	2	1	9	9	0	4
1539	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-338		exzidn	1	19	3	\N	4	1	0	2	t	7	2	4	0	1	9	1	1	9	9	1	0	0	3
1540	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-339		xmyori	1	60	2	\N	5	1	1	3	t	12	6	9	3	2	3	1	0	0	0	0	1	9	3
1541	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-340		jvlwer	1	50	3	\N	1	4	2	3	f	4	12	3	2	9	1	3	0	2	9	9	0	1	4
1542	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-341		yqrdao	2	42	4	\N	2	4	2	2	t	1	1	9	2	9	2	3	9	1	9	1	9	9	4
1543	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-342		sbcewo	1	23	1	\N	2	3	1	2	f	6	10	2	4	3	1	0	1	2	0	9	9	9	3
1544	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-343		mydaql	2	15	2	\N	6	1	1	1	t	1	11	9	2	2	2	3	9	2	0	0	0	1	2
1545	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-344		yxwucq	2	29	4	\N	5	1	1	1	f	4	11	1	9	1	3	3	0	0	9	0	0	9	8
1546	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-345		vctmdg	2	45	4	\N	4	2	2	2	t	2	3	3	0	0	2	3	0	1	0	0	1	0	8
1547	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-346		oxhpbj	2	51	4	\N	4	4	2	2	f	1	5	4	1	1	1	2	9	1	0	9	9	1	1
1548	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-347		xvzsmt	1	64	4	\N	2	4	1	3	t	5	5	2	3	2	3	3	2	2	0	1	0	0	3
1549	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-348		bqfpdn	2	29	0	\N	2	2	0	3	t	10	0	2	4	9	3	2	9	2	0	0	0	1	4
1550	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-349		cvhamt	2	39	0	\N	0	2	0	3	t	2	3	3	2	1	9	3	0	0	9	1	9	1	4
1551	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-350		nolpsj	1	65	3	\N	6	2	0	3	f	1	0	0	1	0	1	3	9	9	1	0	9	9	3
1552	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-351		erayux	2	37	1	\N	1	1	2	2	f	3	3	2	4	2	9	0	9	0	9	0	1	9	4
1553	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-352		iynrfv	1	26	4	\N	2	3	1	3	f	4	1	3	9	0	1	3	0	1	0	0	9	1	3
1554	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-353		rwlijm	1	63	4	\N	0	2	1	3	f	2	1	3	4	3	1	1	9	0	0	9	0	1	2
1555	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-354		igoyvs	1	33	2	\N	3	3	2	3	t	12	12	9	3	3	1	1	1	9	9	1	9	1	8
1556	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-355		lxprgd	1	50	2	\N	1	4	2	2	f	11	4	9	3	2	2	3	0	2	1	1	1	9	3
1557	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-356		zfmryb	1	36	1	\N	4	2	1	2	f	12	12	1	3	2	1	3	1	2	0	9	0	9	8
1558	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-357		gnwxkc	1	19	2	\N	2	4	1	2	f	0	2	1	2	1	9	3	2	9	1	9	9	1	2
1559	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-358		owesqr	2	26	3	\N	2	3	0	1	f	10	6	4	0	9	3	0	0	1	9	9	9	0	1
1560	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-359		gcnfhl	1	44	1	\N	0	4	2	3	t	9	7	2	0	2	1	3	0	0	9	0	0	9	1
1561	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-360		mxrgzc	1	49	1	\N	0	3	0	1	f	12	11	4	2	0	2	1	2	2	0	0	9	9	4
1562	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-361		csgwaj	2	31	3	\N	0	3	1	2	t	2	5	1	9	9	2	1	0	9	0	9	1	0	1
1563	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-362		fhxzrs	1	50	3	\N	3	4	1	2	f	2	0	4	9	9	3	2	9	2	9	1	9	9	2
1564	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-363		zmayvo	2	60	0	\N	6	3	2	2	f	8	0	9	2	0	2	0	1	0	0	9	1	0	1
1565	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-364		wqines	2	20	0	\N	3	1	2	3	f	6	2	2	9	9	2	1	9	1	9	1	0	1	4
1566	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-365		nejubf	1	42	1	\N	4	4	0	1	f	2	11	3	0	9	9	0	0	9	0	9	0	0	8
1567	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-366		rwtdgy	2	25	2	\N	6	1	2	2	f	1	6	2	4	0	1	1	9	1	0	1	9	1	2
1568	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-367		etgbla	1	32	3	\N	4	3	2	1	f	10	3	3	9	1	3	3	1	9	9	1	0	9	8
1569	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-368		yogalq	2	20	4	\N	3	4	1	1	t	10	8	9	4	3	9	0	2	9	9	1	9	0	2
1570	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-369		ziwxbt	2	35	2	\N	6	4	2	1	t	2	11	4	2	1	2	2	2	0	9	0	1	9	2
1571	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-370		bfkoed	2	63	3	\N	4	3	0	1	f	0	7	2	3	1	2	3	2	2	0	1	0	9	4
1572	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-371		tadyjq	1	43	2	\N	0	1	2	3	t	3	11	9	1	3	9	0	1	1	9	9	0	9	8
1573	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-372		lioyak	1	56	2	\N	2	2	0	1	t	7	12	1	9	9	3	0	9	0	9	0	9	0	2
1574	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-373		wlopab	1	30	4	\N	4	1	1	2	t	1	3	2	4	3	2	3	0	2	1	1	1	1	3
1575	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-374		ojciwk	2	46	4	\N	4	4	2	2	t	10	7	9	2	1	1	0	2	2	0	9	1	9	2
1576	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-375		dlsimv	1	32	4	\N	0	4	2	1	f	10	8	3	9	2	9	2	2	0	1	1	1	0	4
1577	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-376		ibqape	2	51	0	\N	0	3	0	2	f	8	9	4	2	9	2	2	9	9	0	0	0	1	2
1578	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-377		pmlnot	1	18	0	\N	1	2	1	2	t	9	3	1	2	2	9	1	1	0	0	0	9	9	1
1579	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-378		xuistv	2	37	3	\N	0	2	1	3	t	6	6	4	0	1	3	3	2	1	0	1	0	0	2
1580	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-379		lwcost	2	61	3	\N	0	4	2	1	t	12	5	2	4	9	1	1	2	0	9	0	0	1	2
1581	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-380		amkrts	1	59	1	\N	5	1	1	1	t	9	0	9	2	0	2	3	0	2	9	1	9	1	1
1582	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-381		jaeuzt	1	64	4	\N	4	2	2	2	f	1	12	2	3	2	3	2	1	2	1	1	1	0	3
1583	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-382		tyxezv	2	61	2	\N	1	4	0	2	t	3	11	9	0	2	3	0	2	1	0	1	1	9	4
1584	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-383		cyvqjf	1	43	0	\N	6	2	1	1	f	10	10	9	0	3	9	0	0	0	0	1	9	9	3
1585	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-384		hiodyk	2	27	3	\N	2	4	2	2	f	2	4	2	1	2	3	3	2	2	0	9	0	9	1
1586	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-385		wniumg	2	15	1	\N	3	2	1	1	t	8	1	4	1	9	1	0	0	2	9	1	9	1	4
1587	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-386		edngxv	2	22	4	\N	6	1	1	3	t	10	10	2	4	2	1	0	2	9	0	1	9	0	2
1588	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-387		myvpjr	2	61	2	\N	2	3	2	3	f	9	11	3	0	9	1	3	1	9	9	0	0	9	3
1589	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-388		tihqlj	2	30	4	\N	3	2	1	2	t	4	9	4	0	2	3	1	9	2	0	9	9	1	8
1590	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-389		bixdqt	2	65	3	\N	4	1	0	1	f	8	5	0	1	3	9	3	2	1	1	0	1	9	1
1591	2010-07-13 00:00:00	D17589	D17589C4	t	t	D17589-390		pbvsnz	1	23	4	\N	6	1	2	1	f	4	2	9	1	9	1	0	1	1	9	9	1	9	8
1592	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-391		rbefhc	2	49	0	\N	1	3	1	2	f	9	1	1	2	2	3	3	1	1	0	0	1	0	4
1593	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-392		hmkxtq	1	56	1	\N	4	4	0	3	f	6	4	2	4	2	3	2	1	2	9	9	1	0	4
1594	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-393		pqdjsn	2	64	1	\N	4	1	0	2	f	1	12	4	1	3	9	0	1	1	1	1	0	1	8
1595	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-394		bwkvce	1	55	1	\N	2	3	1	3	f	5	7	9	4	3	1	3	0	1	0	0	9	1	2
1596	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-395		unperl	1	20	2	\N	3	3	1	1	f	0	7	1	2	9	3	3	9	1	0	1	1	0	2
1597	2010-07-13 00:00:00	D17589	D17589C4	f	f	D17589-396		vhtzao	2	26	1	\N	3	4	2	3	f	10	7	1	0	3	2	3	9	1	9	1	0	9	8
1598	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-397		yxrned	2	54	3	\N	0	2	1	2	t	11	5	4	9	0	1	0	2	0	9	1	9	0	8
1599	2010-07-13 00:00:00	D17589	D17589C4	f	t	D17589-398		vdkinq	2	31	3	\N	2	3	1	2	t	5	5	1	4	9	2	0	9	2	0	0	9	1	2
1600	2010-07-13 00:00:00	D17589	D17589C4	t	f	D17589-399		brdfji	1	60	2	\N	1	1	2	2	f	6	7	0	9	3	1	1	1	2	1	0	1	9	8
\.


--
-- Data for Name: email; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email (id, mail_number, date, subject, from_address) FROM stdin;
1	2	2010-08-01 13:56:34	Big test	=?ISO-8859-1?Q?Gunnar_R=F8?= <gunnarroe@gmail.com>
\.


--
-- Data for Name: imported; Type: TABLE DATA; Schema: public; Owner: -
--

COPY imported (id, test_site_id, province, district, date, number, created) FROM stdin;
\.


--
-- Data for Name: information; Type: TABLE DATA; Schema: public; Owner: -
--

COPY information (id, client_id, information_id) FROM stdin;
1	1	3
2	1	12
3	2	8
4	2	7
5	2	11
6	2	11
7	3	11
8	3	1
9	4	4
10	4	10
11	4	5
12	4	4
13	5	12
14	6	10
15	6	4
16	6	10
17	6	6
18	6	9
19	7	11
20	7	7
21	7	4
22	7	7
23	7	11
24	9	5
25	9	1
26	9	11
27	9	8
28	9	6
29	10	11
30	10	9
31	10	7
32	11	0
33	11	0
34	11	11
35	12	4
36	12	0
37	12	9
38	13	9
39	13	7
40	13	6
41	13	7
42	14	2
43	14	1
44	15	0
45	15	9
46	15	11
47	15	0
48	16	10
49	18	8
50	18	11
51	18	6
52	18	1
53	18	10
54	19	6
55	19	10
56	20	12
57	20	1
58	21	11
59	21	12
60	21	8
61	21	9
62	21	8
63	23	5
64	23	6
65	23	11
66	23	7
67	24	7
68	25	2
69	25	4
70	25	9
71	25	9
72	26	12
73	26	3
74	27	12
75	27	2
76	27	11
77	27	11
78	28	9
79	28	5
80	28	1
81	28	11
82	29	4
83	29	1
84	29	5
85	29	8
86	30	5
87	30	2
88	30	12
89	30	0
90	31	11
91	31	12
92	31	6
93	32	0
94	32	6
95	32	7
96	32	10
97	33	12
98	33	11
99	33	10
100	33	8
101	33	9
102	35	3
103	35	1
104	35	12
105	35	0
106	35	5
107	37	7
108	37	0
109	37	11
110	37	0
111	40	3
112	41	7
113	42	4
114	42	7
115	42	10
116	42	0
117	43	12
118	43	11
119	43	10
120	43	1
121	43	10
122	44	9
123	44	5
124	44	0
125	44	1
126	45	4
127	45	9
128	45	9
129	47	4
130	47	2
131	47	9
132	47	0
133	47	11
134	48	9
135	48	4
136	48	2
137	49	0
138	49	2
139	49	9
140	49	11
141	49	6
142	50	0
143	50	7
144	50	12
145	51	9
146	51	11
147	51	4
148	51	10
149	51	4
150	52	0
151	52	0
152	53	5
153	53	10
154	53	6
155	53	3
156	53	1
157	54	6
158	54	8
159	54	4
160	54	4
161	54	3
162	55	6
163	55	0
164	57	12
165	57	0
166	57	6
167	57	0
168	58	9
169	58	3
170	58	6
171	59	6
172	59	5
173	59	11
174	59	0
175	59	4
176	60	6
177	60	2
178	60	4
179	60	0
180	61	0
181	61	11
182	63	9
183	64	9
184	64	8
185	64	9
186	64	4
187	64	9
188	65	6
189	65	10
190	67	1
191	67	4
192	67	7
193	68	5
194	68	3
195	68	4
196	69	11
197	70	9
198	70	2
199	70	1
200	70	11
201	71	3
202	72	9
203	73	5
204	73	1
205	73	1
206	73	5
207	73	0
208	74	5
209	74	6
210	74	9
211	75	11
212	75	7
213	75	11
214	75	7
215	76	0
216	77	8
217	77	4
218	77	3
219	77	6
220	77	11
221	78	7
222	78	9
223	78	12
224	78	1
225	79	2
226	80	9
227	82	12
228	82	3
229	82	11
230	83	12
231	83	5
232	83	11
233	84	12
234	84	7
235	84	1
236	84	12
237	84	4
238	85	8
239	87	12
240	87	8
241	88	7
242	88	0
243	88	6
244	89	2
245	89	8
246	89	7
247	89	8
248	90	11
249	90	1
250	90	9
251	90	6
252	91	1
253	91	12
254	91	0
255	92	3
256	92	9
257	92	6
258	93	4
259	93	3
260	93	9
261	94	5
262	94	7
263	95	7
264	95	12
265	96	11
266	96	12
267	96	7
268	96	3
269	96	4
270	97	7
271	97	0
272	97	9
273	98	8
274	98	6
275	98	5
276	99	6
277	99	5
278	99	6
279	99	10
280	99	8
281	100	10
282	100	11
283	100	12
284	100	2
285	100	10
286	102	7
287	102	1
288	102	5
289	103	0
290	103	7
291	103	7
292	103	7
293	103	0
294	104	7
295	104	9
296	105	0
297	105	7
298	105	7
299	105	1
300	106	12
301	106	1
302	106	10
303	106	7
304	107	11
305	107	10
306	108	2
307	108	7
308	108	2
309	108	5
310	109	4
311	109	9
312	109	9
313	109	1
314	110	3
315	110	2
316	110	7
317	110	12
318	111	7
319	111	6
320	111	0
321	111	4
322	112	12
323	112	6
324	112	0
325	112	1
326	113	5
327	113	5
328	114	3
329	114	5
330	115	8
331	116	7
332	116	0
333	116	6
334	116	6
335	116	5
336	117	4
337	118	4
338	118	2
339	119	10
340	119	9
341	119	10
342	120	11
343	120	10
344	120	4
345	120	4
346	122	12
347	123	0
348	123	4
349	123	8
350	123	0
351	123	0
352	124	2
353	124	5
354	124	7
355	124	6
356	124	12
357	125	4
358	125	12
359	126	9
360	126	12
361	126	8
362	126	8
363	128	1
364	128	3
365	128	5
366	128	6
367	129	5
368	129	0
369	131	9
370	131	2
371	132	8
372	132	7
373	132	11
374	133	12
375	133	12
376	133	6
377	134	7
378	134	10
379	134	9
380	135	10
381	135	1
382	135	0
383	135	10
384	136	9
385	136	1
386	136	1
387	137	9
388	137	4
389	138	5
390	138	8
391	138	5
392	138	5
393	140	4
394	140	6
395	140	4
396	141	3
397	141	0
398	141	5
399	142	2
400	142	8
401	142	9
402	142	2
403	142	10
404	143	8
405	143	1
406	143	10
407	144	9
408	145	9
409	145	4
410	146	0
411	147	4
412	147	6
413	147	8
414	148	7
415	150	6
416	150	5
417	151	6
418	151	2
419	152	6
420	152	8
421	153	4
422	153	10
423	153	5
424	153	3
425	153	0
426	154	8
427	155	6
428	155	7
429	156	8
430	158	2
431	159	1
432	159	5
433	159	10
434	159	11
435	159	10
436	160	8
437	160	0
438	161	3
439	161	10
440	161	4
441	162	6
442	162	11
443	163	1
444	163	12
445	163	11
446	164	4
447	164	5
448	164	10
449	165	8
450	165	7
451	167	1
452	167	7
453	168	11
454	168	1
455	168	1
456	168	10
457	169	7
458	169	6
459	169	10
460	169	1
461	169	5
462	170	6
463	170	0
464	170	4
465	170	8
466	171	8
467	171	5
468	171	5
469	172	8
470	172	10
471	172	8
472	172	7
473	172	9
474	174	12
475	175	11
476	175	3
477	176	10
478	177	2
479	177	0
480	177	10
481	177	3
482	177	7
483	178	4
484	178	10
485	178	3
486	180	9
487	180	9
488	180	7
489	180	3
490	180	11
491	181	12
492	181	1
493	181	7
494	182	8
495	182	7
496	184	8
497	184	7
498	184	1
499	184	2
500	185	7
501	185	0
502	185	9
503	185	12
504	185	4
505	186	11
506	187	0
507	187	5
508	187	12
509	187	6
510	188	11
511	188	3
512	188	11
513	188	0
514	188	0
515	189	12
516	189	8
517	190	8
518	190	12
519	190	0
520	191	11
521	192	1
522	192	10
523	192	4
524	193	4
525	193	11
526	193	2
527	194	3
528	194	4
529	194	9
530	194	2
531	195	4
532	195	4
533	195	1
534	195	4
535	195	1
536	196	11
537	196	9
538	196	10
539	196	9
540	196	3
541	197	10
542	197	3
543	197	4
544	197	1
545	197	4
546	198	4
547	198	10
548	198	0
549	198	8
550	199	1
551	199	4
552	199	1
553	199	5
554	201	9
555	201	9
556	201	6
557	202	4
558	202	4
559	202	11
560	203	5
561	203	11
562	205	8
563	206	9
564	206	5
565	207	0
566	207	0
567	209	3
568	209	12
569	209	8
570	209	2
571	210	3
572	210	9
573	210	2
574	211	11
575	211	5
576	211	6
577	212	2
578	212	5
579	212	9
580	212	7
581	212	3
582	213	9
583	213	6
584	213	5
585	213	4
586	215	2
587	215	5
588	215	8
589	215	4
590	216	11
591	216	4
592	217	11
593	217	2
594	217	0
595	217	12
596	217	2
597	218	2
598	218	8
599	218	1
600	218	0
601	220	4
602	220	12
603	220	2
604	221	4
605	221	0
606	221	2
607	221	3
608	222	5
609	223	4
610	224	12
611	224	6
612	224	12
613	224	9
614	225	8
615	225	8
616	225	1
617	225	7
618	225	8
619	226	10
620	227	12
621	227	5
622	227	11
623	227	5
624	227	5
625	228	12
626	228	6
627	228	5
628	228	8
629	228	10
630	229	8
631	230	3
632	230	5
633	231	0
634	231	9
635	232	8
636	233	2
637	233	7
638	233	9
639	233	12
640	234	3
641	234	5
642	234	8
643	235	9
644	235	2
645	235	11
646	236	12
647	236	1
648	236	9
649	238	9
650	238	2
651	238	0
652	238	8
653	238	0
654	239	4
655	240	7
656	240	12
657	240	10
658	241	0
659	242	12
660	242	6
661	242	10
662	242	1
663	242	8
664	243	11
665	244	8
666	244	3
667	244	9
668	244	9
669	244	3
670	245	7
671	245	8
672	245	4
673	246	0
674	246	3
675	248	10
676	248	10
677	249	2
678	249	5
679	249	4
680	249	6
681	249	6
682	250	2
683	250	1
684	250	1
685	250	7
686	250	10
687	251	11
688	251	0
689	251	2
690	252	8
691	252	4
692	253	8
693	253	2
694	254	8
695	254	2
696	254	2
697	254	4
698	255	6
699	255	11
700	255	10
701	255	4
702	255	4
703	256	4
704	256	7
705	256	11
706	256	7
707	257	7
708	257	11
709	257	6
710	258	8
711	258	1
712	258	0
713	259	6
714	259	7
715	259	2
716	259	12
717	260	12
718	261	6
719	261	2
720	261	4
721	261	7
722	261	9
723	262	8
724	262	10
725	263	8
726	263	6
727	263	6
728	264	10
729	264	8
730	265	9
731	265	4
732	265	9
733	266	10
734	267	10
735	267	0
736	268	2
737	268	11
738	268	4
739	268	4
740	268	4
741	269	10
742	269	8
743	269	7
744	269	3
745	269	0
746	270	3
747	270	3
748	270	9
749	271	10
750	271	8
751	271	8
752	271	4
753	272	6
754	272	12
755	273	6
756	273	8
757	273	7
758	273	2
759	273	3
760	274	7
761	274	4
762	274	9
763	274	0
764	274	7
765	275	12
766	275	6
767	275	8
768	275	2
769	275	10
770	277	7
771	277	7
772	277	6
773	277	0
774	277	4
775	278	5
776	278	0
777	278	10
778	278	10
779	278	2
780	279	11
781	280	7
782	280	5
783	280	0
784	280	6
785	282	2
786	282	2
787	282	1
788	282	4
789	283	0
790	283	8
791	283	7
792	283	11
793	284	12
794	284	6
795	284	0
796	284	7
797	284	9
798	285	0
799	287	7
800	287	1
801	287	8
802	287	8
803	288	1
804	288	12
805	288	9
806	289	9
807	290	6
808	290	11
809	291	2
810	291	6
811	291	8
812	291	5
813	292	1
814	293	9
815	293	3
816	293	4
817	293	2
818	293	11
819	296	5
820	296	9
821	296	3
822	296	3
823	297	2
824	297	7
825	297	4
826	297	5
827	298	5
828	298	8
829	298	11
830	298	8
831	298	12
832	299	5
833	299	8
834	299	4
835	299	9
836	300	4
837	301	2
838	302	4
839	302	10
840	302	6
841	302	4
842	303	12
843	303	6
844	303	9
845	303	11
846	303	5
847	304	6
848	304	8
849	304	6
850	304	11
851	305	4
852	305	0
853	306	6
854	306	2
855	306	12
856	306	9
857	306	11
858	307	1
859	307	12
860	308	8
861	309	1
862	309	11
863	310	10
864	312	9
865	312	7
866	312	5
867	313	2
868	313	8
869	313	10
870	313	11
871	314	6
872	314	7
873	314	8
874	314	6
875	315	10
876	315	8
877	315	10
878	315	7
879	315	5
880	316	11
881	316	1
882	317	2
883	317	3
884	317	12
885	318	9
886	318	8
887	321	5
888	322	1
889	323	7
890	323	7
891	324	2
892	324	8
893	325	0
894	325	10
895	326	4
896	327	8
897	327	8
898	327	12
899	329	2
900	329	8
901	329	11
902	330	1
903	330	7
904	331	0
905	331	3
906	331	0
907	331	3
908	331	4
909	333	4
910	333	10
911	333	9
912	333	11
913	334	7
914	334	10
915	334	2
916	334	3
917	335	8
918	335	6
919	335	6
920	337	2
921	337	8
922	337	3
923	338	8
924	339	1
925	339	10
926	339	4
927	339	6
928	339	5
929	340	4
930	340	10
931	340	5
932	341	3
933	341	12
934	341	12
935	341	4
936	341	1
937	342	0
938	342	4
939	342	3
940	345	0
941	345	9
942	345	0
943	345	5
944	345	8
945	346	3
946	346	7
947	346	3
948	347	8
949	349	6
950	349	6
951	350	2
952	350	0
953	350	4
954	351	8
955	351	10
956	351	2
957	351	6
958	351	7
959	352	10
960	353	11
961	353	0
962	353	2
963	353	6
964	354	12
965	354	7
966	354	0
967	354	7
968	354	4
969	356	7
970	356	12
971	356	11
972	356	1
973	357	7
974	357	4
975	358	11
976	358	5
977	358	2
978	359	4
979	359	12
980	359	1
981	359	4
982	359	8
983	360	3
984	360	6
985	360	1
986	361	12
987	361	0
988	361	4
989	361	9
990	361	0
991	362	8
992	363	0
993	363	6
994	363	0
995	363	10
996	364	8
997	364	3
998	364	2
999	364	5
1000	365	7
1001	365	11
1002	365	0
1003	365	11
1004	366	0
1005	366	7
1006	366	9
1007	367	6
1008	367	2
1009	367	9
1010	367	8
1011	369	11
1012	369	9
1013	369	0
1014	369	10
1015	370	5
1016	371	0
1017	371	0
1018	372	12
1019	372	9
1020	372	5
1021	373	8
1022	374	0
1023	375	0
1024	376	0
1025	376	8
1026	376	3
1027	376	10
1028	377	8
1029	377	3
1030	377	12
1031	377	8
1032	377	3
1033	378	6
1034	378	8
1035	378	1
1036	378	8
1037	379	3
1038	379	7
1039	379	12
1040	379	3
1041	379	5
1042	381	6
1043	381	12
1044	381	0
1045	381	7
1046	382	0
1047	382	5
1048	382	8
1049	382	12
1050	382	0
1051	383	5
1052	384	11
1053	384	5
1054	385	0
1055	385	4
1056	385	1
1057	386	1
1058	386	2
1059	387	7
1060	389	2
1061	389	7
1062	389	10
1063	389	8
1064	389	2
1065	390	3
1066	390	5
1067	391	1
1068	393	11
1069	393	11
1070	393	4
1071	394	8
1072	394	12
1073	394	4
1074	395	1
1075	396	12
1076	396	12
1077	398	9
1078	398	3
1079	398	11
1080	398	8
1081	399	1
1082	399	12
1083	399	6
1084	399	4
1085	400	0
1086	400	8
1087	401	10
1088	401	1
1089	401	4
1090	401	4
1091	402	0
1092	402	6
1093	402	12
1094	402	12
1095	402	4
1096	403	6
1097	403	9
1098	404	8
1099	404	1
1100	404	11
1101	404	12
1102	405	2
1103	405	11
1104	405	0
1105	406	7
1106	406	12
1107	406	1
1108	407	8
1109	408	9
1110	408	1
1111	408	5
1112	408	11
1113	408	6
1114	409	2
1115	409	9
1116	409	9
1117	409	9
1118	410	6
1119	410	11
1120	410	3
1121	410	6
1122	411	0
1123	411	3
1124	411	10
1125	412	7
1126	412	7
1127	412	8
1128	412	5
1129	413	9
1130	413	3
1131	413	0
1132	414	10
1133	414	3
1134	414	1
1135	415	4
1136	415	7
1137	416	4
1138	416	12
1139	416	8
1140	417	9
1141	417	7
1142	417	4
1143	417	11
1144	419	0
1145	419	6
1146	420	1
1147	420	12
1148	420	9
1149	420	12
1150	420	8
1151	423	9
1152	423	2
1153	423	3
1154	424	12
1155	424	1
1156	424	9
1157	424	2
1158	426	0
1159	426	8
1160	427	7
1161	427	12
1162	428	12
1163	428	5
1164	428	3
1165	428	12
1166	429	9
1167	429	6
1168	429	8
1169	429	11
1170	429	6
1171	431	9
1172	431	7
1173	433	12
1174	433	0
1175	434	0
1176	434	0
1177	434	6
1178	434	9
1179	434	11
1180	435	2
1181	436	4
1182	436	7
1183	437	2
1184	437	11
1185	437	4
1186	439	11
1187	439	2
1188	439	8
1189	439	4
1190	439	8
1191	440	4
1192	440	9
1193	441	6
1194	441	2
1195	441	5
1196	441	7
1197	441	12
1198	442	12
1199	442	4
1200	442	3
1201	445	11
1202	445	6
1203	445	9
1204	445	2
1205	446	0
1206	446	5
1207	447	6
1208	447	0
1209	447	11
1210	447	8
1211	447	10
1212	448	12
1213	448	7
1214	449	7
1215	449	6
1216	449	5
1217	449	2
1218	449	0
1219	451	3
1220	451	11
1221	451	7
1222	452	0
1223	452	12
1224	452	2
1225	454	2
1226	454	12
1227	455	1
1228	455	7
1229	455	7
1230	456	5
1231	456	1
1232	456	10
1233	458	9
1234	458	4
1235	458	1
1236	458	5
1237	459	9
1238	459	1
1239	459	11
1240	459	11
1241	459	5
1242	460	2
1243	460	11
1244	460	4
1245	460	8
1246	460	8
1247	461	2
1248	461	3
1249	462	3
1250	462	3
1251	463	3
1252	463	10
1253	463	7
1254	463	10
1255	463	12
1256	464	9
1257	464	6
1258	464	5
1259	464	12
1260	466	2
1261	466	3
1262	466	7
1263	467	11
1264	467	3
1265	467	8
1266	468	3
1267	468	6
1268	468	1
1269	469	9
1270	471	2
1271	471	8
1272	472	1
1273	472	6
1274	473	9
1275	473	9
1276	473	10
1277	473	10
1278	473	7
1279	475	7
1280	475	6
1281	476	9
1282	476	7
1283	476	11
1284	476	4
1285	477	9
1286	477	7
1287	477	7
1288	477	6
1289	478	4
1290	480	3
1291	480	3
1292	480	3
1293	480	11
1294	481	10
1295	481	12
1296	481	12
1297	481	5
1298	482	7
1299	482	11
1300	483	2
1301	483	8
1302	483	5
1303	483	5
1304	484	0
1305	484	5
1306	484	12
1307	485	6
1308	485	1
1309	485	5
1310	485	3
1311	485	8
1312	487	10
1313	487	4
1314	488	3
1315	488	10
1316	488	8
1317	488	2
1318	491	7
1319	491	1
1320	492	6
1321	492	5
1322	492	6
1323	494	10
1324	494	6
1325	494	8
1326	494	2
1327	495	0
1328	495	11
1329	495	4
1330	495	1
1331	495	7
1332	496	12
1333	496	8
1334	496	8
1335	497	3
1336	497	7
1337	497	3
1338	497	11
1339	497	0
1340	498	12
1341	499	4
1342	499	5
1343	500	4
1344	500	6
1345	500	1
1346	501	12
1347	501	10
1348	501	2
1349	501	4
1350	502	2
1351	502	12
1352	502	6
1353	502	1
1354	504	0
1355	504	8
1356	504	4
1357	504	11
1358	504	2
1359	505	1
1360	505	12
1361	505	1
1362	506	12
1363	506	9
1364	506	8
1365	506	6
1366	507	9
1367	507	12
1368	507	6
1369	508	8
1370	508	10
1371	508	4
1372	508	10
1373	509	6
1374	509	7
1375	509	1
1376	509	3
1377	510	9
1378	510	10
1379	510	11
1380	510	8
1381	511	2
1382	511	1
1383	512	7
1384	512	8
1385	512	7
1386	512	7
1387	512	1
1388	513	7
1389	513	5
1390	513	10
1391	515	9
1392	515	4
1393	515	9
1394	515	3
1395	515	5
1396	516	8
1397	516	3
1398	516	9
1399	516	12
1400	517	7
1401	517	3
1402	517	0
1403	517	3
1404	517	7
1405	518	4
1406	518	4
1407	519	3
1408	519	4
1409	520	9
1410	520	11
1411	520	4
1412	520	7
1413	520	0
1414	521	12
1415	521	8
1416	521	2
1417	521	6
1418	521	8
1419	523	10
1420	523	10
1421	523	2
1422	523	0
1423	523	1
1424	524	9
1425	524	12
1426	524	7
1427	524	9
1428	524	6
1429	526	11
1430	526	4
1431	526	3
1432	526	10
1433	527	4
1434	527	0
1435	527	7
1436	528	5
1437	528	8
1438	529	12
1439	529	0
1440	529	6
1441	530	11
1442	530	6
1443	530	3
1444	530	4
1445	531	3
1446	532	7
1447	532	7
1448	533	7
1449	533	12
1450	533	6
1451	534	5
1452	534	6
1453	534	7
1454	534	6
1455	534	4
1456	535	11
1457	536	4
1458	536	4
1459	537	3
1460	537	12
1461	538	3
1462	538	8
1463	539	8
1464	539	9
1465	540	8
1466	540	0
1467	540	1
1468	541	7
1469	541	12
1470	541	6
1471	541	7
1472	542	1
1473	542	1
1474	543	8
1475	543	0
1476	543	6
1477	544	0
1478	544	12
1479	544	9
1480	545	7
1481	545	8
1482	545	6
1483	545	1
1484	546	5
1485	546	4
1486	546	1
1487	546	12
1488	548	1
1489	548	3
1490	548	2
1491	548	2
1492	549	11
1493	549	3
1494	549	10
1495	549	10
1496	549	0
1497	550	0
1498	553	0
1499	553	11
1500	553	11
1501	554	0
1502	556	9
1503	556	7
1504	557	0
1505	557	3
1506	558	8
1507	558	11
1508	558	9
1509	558	12
1510	559	1
1511	559	5
1512	560	2
1513	560	3
1514	560	6
1515	560	0
1516	560	12
1517	561	9
1518	562	2
1519	562	7
1520	562	10
1521	562	5
1522	562	1
1523	563	9
1524	563	1
1525	563	6
1526	563	12
1527	564	4
1528	564	5
1529	565	7
1530	566	3
1531	567	7
1532	567	1
1533	567	5
1534	567	3
1535	567	0
1536	568	5
1537	568	0
1538	568	8
1539	569	8
1540	569	6
1541	569	10
1542	570	7
1543	572	12
1544	573	6
1545	573	1
1546	574	11
1547	574	3
1548	574	12
1549	574	1
1550	574	10
1551	575	8
1552	575	2
1553	575	8
1554	575	2
1555	575	6
1556	576	2
1557	576	12
1558	577	12
1559	578	1
1560	578	4
1561	578	2
1562	578	6
1563	578	6
1564	579	10
1565	580	5
1566	580	11
1567	580	5
1568	581	7
1569	581	5
1570	581	2
1571	584	9
1572	584	3
1573	584	10
1574	584	12
1575	584	12
1576	586	2
1577	586	10
1578	588	10
1579	588	3
1580	588	11
1581	588	4
1582	589	9
1583	589	0
1584	589	9
1585	590	5
1586	591	7
1587	591	12
1588	592	9
1589	592	2
1590	593	7
1591	594	6
1592	595	10
1593	595	0
1594	595	6
1595	596	8
1596	596	5
1597	596	10
1598	596	8
1599	596	10
1600	598	0
1601	598	11
1602	598	5
1603	598	7
1604	598	0
1605	599	6
1606	599	8
1607	599	12
1608	599	0
1609	599	2
1610	600	3
1611	601	6
1612	601	2
1613	602	3
1614	602	12
1615	602	11
1616	602	7
1617	603	6
1618	605	5
1619	605	4
1620	606	0
1621	606	4
1622	608	6
1623	608	9
1624	608	12
1625	608	8
1626	608	3
1627	609	1
1628	609	3
1629	609	5
1630	609	5
1631	610	2
1632	610	10
1633	611	6
1634	611	0
1635	611	0
1636	611	7
1637	611	2
1638	612	12
1639	612	10
1640	612	3
1641	612	5
1642	613	8
1643	613	11
1644	613	1
1645	613	10
1646	615	6
1647	615	9
1648	617	6
1649	617	1
1650	617	12
1651	617	12
1652	617	4
1653	618	4
1654	619	4
1655	620	5
1656	621	3
1657	622	5
1658	622	4
1659	623	3
1660	623	8
1661	624	10
1662	624	0
1663	624	4
1664	624	4
1665	625	7
1666	626	1
1667	627	12
1668	627	6
1669	627	11
1670	627	9
1671	628	10
1672	629	4
1673	630	2
1674	630	6
1675	630	12
1676	630	8
1677	630	3
1678	631	0
1679	631	5
1680	631	3
1681	631	9
1682	632	1
1683	632	6
1684	633	9
1685	633	7
1686	635	5
1687	636	10
1688	636	9
1689	637	3
1690	638	2
1691	638	5
1692	638	1
1693	638	3
1694	638	4
1695	639	9
1696	639	0
1697	639	6
1698	639	7
1699	640	2
1700	640	0
1701	640	0
1702	641	4
1703	641	2
1704	641	6
1705	641	2
1706	642	11
1707	642	12
1708	643	12
1709	643	10
1710	643	1
1711	643	3
1712	643	2
1713	644	3
1714	644	10
1715	644	12
1716	644	2
1717	644	10
1718	646	12
1719	646	4
1720	647	9
1721	647	0
1722	647	4
1723	647	9
1724	648	2
1725	648	0
1726	648	11
1727	648	4
1728	649	6
1729	649	12
1730	649	10
1731	649	0
1732	650	7
1733	650	2
1734	650	3
1735	650	0
1736	650	1
1737	652	11
1738	652	6
1739	652	10
1740	653	8
1741	653	6
1742	653	9
1743	654	0
1744	654	0
1745	654	12
1746	656	0
1747	657	1
1748	658	12
1749	658	7
1750	658	6
1751	658	5
1752	659	9
1753	659	12
1754	660	0
1755	661	11
1756	661	3
1757	661	9
1758	661	3
1759	661	3
1760	662	7
1761	662	11
1762	662	10
1763	663	5
1764	663	2
1765	663	3
1766	663	10
1767	664	9
1768	664	11
1769	664	6
1770	664	2
1771	666	8
1772	666	8
1773	666	12
1774	667	6
1775	668	1
1776	668	2
1777	670	5
1778	670	11
1779	670	1
1780	671	4
1781	671	3
1782	671	6
1783	672	5
1784	672	4
1785	672	7
1786	672	6
1787	673	2
1788	673	1
1789	673	8
1790	673	6
1791	674	7
1792	674	12
1793	675	8
1794	675	8
1795	676	9
1796	676	2
1797	676	1
1798	676	9
1799	676	9
1800	677	0
1801	678	7
1802	678	4
1803	679	11
1804	680	5
1805	681	12
1806	681	2
1807	681	1
1808	682	1
1809	682	6
1810	682	12
1811	682	7
1812	682	6
1813	683	9
1814	683	7
1815	683	1
1816	684	8
1817	684	0
1818	685	0
1819	685	5
1820	686	9
1821	686	10
1822	686	7
1823	686	5
1824	686	4
1825	687	7
1826	687	2
1827	689	2
1828	691	3
1829	691	12
1830	691	6
1831	695	2
1832	695	5
1833	695	4
1834	696	0
1835	696	11
1836	697	3
1837	697	4
1838	697	0
1839	697	10
1840	698	12
1841	698	8
1842	698	12
1843	698	11
1844	700	11
1845	700	1
1846	700	5
1847	701	11
1848	701	9
1849	701	6
1850	701	8
1851	702	7
1852	702	6
1853	702	3
1854	703	12
1855	703	6
1856	705	11
1857	705	9
1858	706	4
1859	706	3
1860	706	6
1861	706	5
1862	707	12
1863	707	9
1864	707	11
1865	707	11
1866	709	6
1867	709	7
1868	709	12
1869	710	11
1870	710	1
1871	711	3
1872	711	8
1873	712	12
1874	712	2
1875	712	12
1876	714	9
1877	714	1
1878	715	7
1879	716	0
1880	716	4
1881	719	3
1882	719	10
1883	721	4
1884	721	0
1885	721	9
1886	723	6
1887	723	7
1888	723	7
1889	723	11
1890	724	4
1891	724	7
1892	725	2
1893	725	12
1894	725	0
1895	725	11
1896	725	8
1897	726	2
1898	726	5
1899	726	3
1900	727	2
1901	727	1
1902	729	11
1903	731	5
1904	731	1
1905	731	2
1906	731	10
1907	731	0
1908	732	5
1909	732	8
1910	732	7
1911	733	1
1912	733	4
1913	733	6
1914	733	4
1915	734	4
1916	734	12
1917	734	8
1918	734	3
1919	735	8
1920	736	10
1921	736	1
1922	737	5
1923	737	0
1924	737	5
1925	739	2
1926	739	10
1927	739	2
1928	739	8
1929	740	11
1930	740	9
1931	740	9
1932	741	4
1933	741	0
1934	741	12
1935	741	6
1936	741	1
1937	742	6
1938	742	10
1939	742	3
1940	742	2
1941	744	11
1942	744	9
1943	744	12
1944	744	3
1945	745	0
1946	745	6
1947	745	11
1948	745	0
1949	747	3
1950	748	0
1951	748	6
1952	748	4
1953	748	2
1954	748	4
1955	750	8
1956	750	1
1957	751	3
1958	752	1
1959	753	6
1960	753	2
1961	753	9
1962	755	3
1963	755	4
1964	755	9
1965	756	4
1966	756	7
1967	756	5
1968	756	10
1969	756	9
1970	757	4
1971	757	3
1972	759	2
1973	760	8
1974	761	12
1975	761	1
1976	762	10
1977	762	3
1978	763	12
1979	763	5
1980	763	11
1981	764	5
1982	764	4
1983	764	11
1984	767	4
1985	767	9
1986	767	3
1987	767	1
1988	769	10
1989	769	4
1990	769	2
1991	769	12
1992	769	10
1993	770	11
1994	770	11
1995	770	11
1996	770	10
1997	770	3
1998	772	2
1999	773	8
2000	774	5
2001	774	6
2002	774	5
2003	774	7
2004	776	9
2005	778	6
2006	778	8
2007	778	9
2008	778	4
2009	778	2
2010	779	0
2011	779	2
2012	780	6
2013	780	7
2014	780	10
2015	782	3
2016	782	12
2017	782	0
2018	782	3
2019	783	5
2020	783	9
2021	783	0
2022	783	4
2023	783	4
2024	786	7
2025	786	9
2026	786	11
2027	786	9
2028	786	1
2029	787	7
2030	787	4
2031	787	11
2032	787	1
2033	789	8
2034	790	7
2035	790	9
2036	791	2
2037	791	9
2038	791	4
2039	791	5
2040	791	9
2041	792	8
2042	793	4
2043	793	5
2044	794	6
2045	794	9
2046	794	11
2047	796	0
2048	796	2
2049	796	0
2050	796	9
2051	796	3
2052	797	12
2053	797	6
2054	797	5
2055	798	5
2056	798	0
2057	798	4
2058	798	10
2059	798	7
2060	799	10
2061	799	5
2062	799	12
2063	799	5
2064	800	1
2065	800	0
2066	800	2
2067	800	0
2068	801	11
2069	801	9
2070	801	12
2071	801	11
2072	801	2
2073	802	10
2074	803	12
2075	803	10
2076	803	10
2077	803	12
2078	803	4
2079	805	10
2080	805	12
2081	805	1
2082	806	6
2083	806	12
2084	807	9
2085	807	7
2086	807	5
2087	807	0
2088	807	8
2089	808	12
2090	809	7
2091	809	2
2092	809	10
2093	811	1
2094	811	8
2095	811	2
2096	811	6
2097	811	9
2098	812	12
2099	812	8
2100	813	3
2101	813	2
2102	813	9
2103	813	4
2104	813	4
2105	814	9
2106	814	4
2107	814	3
2108	814	7
2109	815	7
2110	816	4
2111	816	0
2112	816	8
2113	817	0
2114	817	8
2115	817	2
2116	817	9
2117	817	8
2118	818	1
2119	818	6
2120	819	0
2121	820	8
2122	821	0
2123	821	3
2124	822	10
2125	822	7
2126	822	2
2127	822	8
2128	822	10
2129	823	3
2130	823	0
2131	823	3
2132	823	8
2133	823	11
2134	824	1
2135	824	9
2136	824	5
2137	824	7
2138	825	6
2139	825	4
2140	825	12
2141	825	7
2142	825	1
2143	826	10
2144	826	8
2145	826	11
2146	826	3
2147	827	3
2148	827	7
2149	827	0
2150	827	6
2151	828	1
2152	828	10
2153	830	9
2154	830	1
2155	832	11
2156	832	10
2157	833	10
2158	833	8
2159	833	6
2160	833	2
2161	834	1
2162	834	0
2163	834	2
2164	834	1
2165	835	4
2166	835	10
2167	837	1
2168	837	6
2169	838	7
2170	838	2
2171	838	11
2172	838	1
2173	838	1
2174	839	1
2175	839	2
2176	839	4
2177	839	12
2178	839	4
2179	840	3
2180	843	4
2181	843	9
2182	843	10
2183	843	10
2184	843	1
2185	844	6
2186	845	1
2187	845	3
2188	845	2
2189	845	5
2190	846	1
2191	846	11
2192	846	1
2193	847	10
2194	847	6
2195	848	6
2196	848	4
2197	848	12
2198	848	4
2199	848	0
2200	849	10
2201	849	9
2202	850	4
2203	850	1
2204	850	2
2205	850	8
2206	850	5
2207	851	9
2208	851	0
2209	852	6
2210	853	5
2211	854	10
2212	854	4
2213	854	12
2214	855	1
2215	855	1
2216	855	8
2217	855	12
2218	856	3
2219	856	1
2220	857	4
2221	858	10
2222	858	0
2223	858	8
2224	858	7
2225	860	10
2226	861	10
2227	861	12
2228	862	1
2229	863	7
2230	863	11
2231	863	2
2232	864	10
2233	864	1
2234	864	2
2235	866	7
2236	866	8
2237	866	4
2238	866	1
2239	866	3
2240	867	11
2241	867	5
2242	867	12
2243	868	1
2244	869	0
2245	869	3
2246	869	12
2247	870	7
2248	870	1
2249	871	1
2250	872	6
2251	872	8
2252	872	5
2253	873	10
2254	874	0
2255	874	7
2256	874	11
2257	874	2
2258	874	1
2259	875	10
2260	875	5
2261	875	0
2262	875	7
2263	875	9
2264	876	12
2265	877	2
2266	877	1
2267	877	0
2268	877	0
2269	877	10
2270	878	2
2271	878	8
2272	878	6
2273	878	10
2274	879	7
2275	879	6
2276	881	0
2277	882	8
2278	882	1
2279	882	9
2280	882	12
2281	882	2
2282	883	4
2283	884	10
2284	884	0
2285	885	9
2286	885	12
2287	885	0
2288	886	8
2289	886	6
2290	886	9
2291	886	10
2292	888	7
2293	888	7
2294	889	8
2295	889	0
2296	889	5
2297	889	4
2298	889	4
2299	890	10
2300	891	10
2301	891	0
2302	892	11
2303	892	2
2304	892	11
2305	893	10
2306	893	4
2307	894	0
2308	894	4
2309	895	8
2310	895	8
2311	895	11
2312	895	0
2313	896	8
2314	896	5
2315	896	10
2316	897	4
2317	897	12
2318	898	10
2319	900	0
2320	900	2
2321	900	3
2322	900	6
2323	900	10
2324	901	10
2325	902	8
2326	902	3
2327	902	4
2328	902	1
2329	902	7
2330	905	9
2331	905	6
2332	905	12
2333	905	9
2334	906	10
2335	906	4
2336	906	11
2337	906	3
2338	906	7
2339	907	7
2340	907	0
2341	907	6
2342	907	1
2343	907	5
2344	908	10
2345	908	5
2346	908	8
2347	908	6
2348	908	8
2349	909	1
2350	909	0
2351	909	0
2352	910	12
2353	910	8
2354	911	11
2355	911	5
2356	911	11
2357	911	10
2358	912	9
2359	912	11
2360	912	4
2361	912	10
2362	913	5
2363	913	7
2364	913	1
2365	913	8
2366	913	6
2367	914	12
2368	914	7
2369	916	3
2370	916	5
2371	916	3
2372	916	0
2373	917	2
2374	917	5
2375	917	1
2376	917	2
2377	918	3
2378	918	5
2379	918	0
2380	918	12
2381	918	2
2382	919	6
2383	920	4
2384	920	11
2385	920	2
2386	920	5
2387	920	11
2388	921	9
2389	922	1
2390	922	12
2391	922	5
2392	922	4
2393	922	8
2394	923	0
2395	923	1
2396	925	10
2397	925	9
2398	925	7
2399	926	5
2400	927	7
2401	927	6
2402	928	0
2403	928	3
2404	928	5
2405	929	12
2406	929	11
2407	929	7
2408	929	8
2409	929	9
2410	930	9
2411	932	1
2412	934	2
2413	934	3
2414	934	9
2415	934	5
2416	935	9
2417	935	11
2418	936	8
2419	937	1
2420	938	11
2421	939	2
2422	939	3
2423	939	5
2424	939	11
2425	939	4
2426	940	9
2427	940	11
2428	940	10
2429	940	12
2430	940	9
2431	941	9
2432	941	9
2433	941	6
2434	941	8
2435	941	4
2436	942	5
2437	943	6
2438	944	6
2439	944	9
2440	944	1
2441	944	11
2442	944	9
2443	945	7
2444	945	9
2445	947	7
2446	947	7
2447	947	4
2448	947	2
2449	948	2
2450	948	0
2451	948	10
2452	948	0
2453	949	9
2454	951	12
2455	951	8
2456	951	12
2457	954	11
2458	954	5
2459	954	12
2460	954	4
2461	954	11
2462	955	8
2463	955	10
2464	955	9
2465	955	8
2466	955	9
2467	956	10
2468	956	2
2469	956	0
2470	957	3
2471	957	5
2472	957	3
2473	958	7
2474	958	11
2475	958	0
2476	958	8
2477	958	5
2478	959	8
2479	959	0
2480	959	2
2481	959	1
2482	959	7
2483	960	1
2484	960	6
2485	960	7
2486	961	5
2487	961	7
2488	961	12
2489	961	12
2490	962	0
2491	962	5
2492	962	7
2493	962	8
2494	962	8
2495	963	3
2496	963	4
2497	963	6
2498	965	7
2499	966	11
2500	967	8
2501	967	11
2502	967	2
2503	968	4
2504	969	6
2505	969	9
2506	970	4
2507	970	5
2508	970	4
2509	971	4
2510	971	0
2511	971	6
2512	971	2
2513	971	9
2514	972	7
2515	972	0
2516	972	5
2517	972	8
2518	972	6
2519	973	10
2520	973	6
2521	973	2
2522	973	6
2523	974	3
2524	974	5
2525	974	10
2526	976	5
2527	976	4
2528	976	5
2529	976	6
2530	978	1
2531	978	11
2532	978	7
2533	978	10
2534	979	3
2535	979	8
2536	979	8
2537	979	12
2538	981	2
2539	981	7
2540	982	7
2541	982	6
2542	982	12
2543	984	8
2544	984	4
2545	984	0
2546	984	2
2547	984	9
2548	985	12
2549	985	12
2550	986	2
2551	986	12
2552	986	1
2553	987	11
2554	987	8
2555	987	9
2556	988	0
2557	988	2
2558	988	0
2559	988	8
2560	988	4
2561	989	6
2562	989	11
2563	989	12
2564	990	10
2565	990	8
2566	990	9
2567	991	1
2568	991	5
2569	991	1
2570	991	8
2571	992	3
2572	992	12
2573	992	5
2574	992	8
2575	994	7
2576	994	12
2577	996	5
2578	996	6
2579	997	2
2580	997	5
2581	997	0
2582	997	4
2583	998	7
2584	998	9
2585	999	5
2586	999	2
2587	999	8
2588	999	5
2589	999	2
2590	1000	5
2591	1000	3
2592	1001	4
2593	1003	3
2594	1003	3
2595	1003	10
2596	1004	6
2597	1004	3
2598	1004	12
2599	1004	0
2600	1006	11
2601	1006	8
2602	1006	2
2603	1006	9
2604	1008	3
2605	1010	7
2606	1012	12
2607	1012	12
2608	1012	10
2609	1013	8
2610	1014	1
2611	1014	9
2612	1014	2
2613	1015	9
2614	1015	0
2615	1016	6
2616	1016	5
2617	1016	9
2618	1016	8
2619	1016	0
2620	1017	8
2621	1017	10
2622	1017	0
2623	1017	2
2624	1017	0
2625	1018	1
2626	1019	9
2627	1019	11
2628	1020	0
2629	1021	1
2630	1022	12
2631	1022	1
2632	1022	9
2633	1022	11
2634	1023	0
2635	1023	1
2636	1023	1
2637	1023	6
2638	1024	8
2639	1024	11
2640	1024	1
2641	1025	7
2642	1026	7
2643	1027	12
2644	1027	10
2645	1027	0
2646	1027	5
2647	1027	12
2648	1028	10
2649	1028	4
2650	1028	6
2651	1028	10
2652	1029	6
2653	1030	8
2654	1030	2
2655	1031	10
2656	1031	7
2657	1031	0
2658	1031	2
2659	1031	0
2660	1034	2
2661	1034	1
2662	1034	3
2663	1034	5
2664	1035	3
2665	1035	12
2666	1035	11
2667	1036	6
2668	1036	6
2669	1036	6
2670	1036	12
2671	1037	8
2672	1037	2
2673	1037	10
2674	1037	6
2675	1038	2
2676	1038	12
2677	1039	0
2678	1039	6
2679	1039	2
2680	1041	8
2681	1041	1
2682	1042	11
2683	1042	7
2684	1042	10
2685	1042	12
2686	1043	6
2687	1043	12
2688	1043	2
2689	1043	11
2690	1044	6
2691	1044	4
2692	1044	9
2693	1045	3
2694	1045	8
2695	1045	9
2696	1046	1
2697	1046	6
2698	1046	10
2699	1047	8
2700	1047	8
2701	1048	6
2702	1048	2
2703	1048	6
2704	1048	8
2705	1049	2
2706	1049	7
2707	1049	12
2708	1050	3
2709	1050	2
2710	1050	1
2711	1050	10
2712	1050	11
2713	1051	4
2714	1053	2
2715	1053	0
2716	1053	5
2717	1055	0
2718	1055	0
2719	1055	11
2720	1056	5
2721	1056	9
2722	1056	2
2723	1056	4
2724	1057	0
2725	1057	6
2726	1058	0
2727	1058	10
2728	1058	6
2729	1058	11
2730	1059	8
2731	1059	12
2732	1059	0
2733	1060	7
2734	1061	7
2735	1061	6
2736	1061	12
2737	1061	9
2738	1061	8
2739	1062	8
2740	1062	1
2741	1062	3
2742	1062	12
2743	1063	10
2744	1063	6
2745	1063	5
2746	1064	0
2747	1064	0
2748	1064	0
2749	1065	12
2750	1065	1
2751	1065	7
2752	1066	11
2753	1066	4
2754	1066	2
2755	1066	7
2756	1067	12
2757	1068	3
2758	1068	8
2759	1068	11
2760	1068	5
2761	1069	2
2762	1069	1
2763	1069	3
2764	1069	8
2765	1070	0
2766	1071	11
2767	1072	2
2768	1073	2
2769	1073	1
2770	1073	12
2771	1074	11
2772	1074	3
2773	1074	6
2774	1074	5
2775	1074	4
2776	1075	11
2777	1075	2
2778	1078	12
2779	1078	4
2780	1078	7
2781	1078	4
2782	1078	11
2783	1079	11
2784	1079	9
2785	1079	8
2786	1080	0
2787	1080	2
2788	1080	9
2789	1080	9
2790	1081	8
2791	1081	9
2792	1081	9
2793	1081	8
2794	1082	1
2795	1084	5
2796	1084	7
2797	1084	7
2798	1085	9
2799	1085	4
2800	1085	1
2801	1086	9
2802	1086	7
2803	1087	6
2804	1087	2
2805	1088	5
2806	1088	5
2807	1088	10
2808	1088	11
2809	1089	11
2810	1089	0
2811	1089	4
2812	1090	0
2813	1091	3
2814	1091	10
2815	1091	2
2816	1091	5
2817	1092	4
2818	1092	10
2819	1092	3
2820	1092	8
2821	1093	1
2822	1093	11
2823	1093	10
2824	1093	4
2825	1093	8
2826	1094	10
2827	1094	2
2828	1094	12
2829	1094	11
2830	1094	9
2831	1095	1
2832	1095	9
2833	1096	6
2834	1096	8
2835	1096	3
2836	1096	4
2837	1097	9
2838	1097	7
2839	1097	11
2840	1097	12
2841	1097	2
2842	1098	11
2843	1098	2
2844	1099	9
2845	1099	12
2846	1099	1
2847	1099	8
2848	1100	9
2849	1100	10
2850	1100	0
2851	1100	3
2852	1100	1
2853	1101	6
2854	1101	8
2855	1102	8
2856	1104	9
2857	1104	8
2858	1104	2
2859	1106	7
2860	1106	10
2861	1106	3
2862	1108	12
2863	1109	7
2864	1109	2
2865	1109	3
2866	1110	9
2867	1110	10
2868	1110	4
2869	1110	4
2870	1110	6
2871	1111	10
2872	1111	6
2873	1111	1
2874	1112	11
2875	1112	2
2876	1112	12
2877	1112	6
2878	1113	4
2879	1114	2
2880	1114	10
2881	1114	1
2882	1114	1
2883	1115	8
2884	1115	3
2885	1115	3
2886	1115	1
2887	1116	12
2888	1116	7
2889	1116	8
2890	1117	0
2891	1117	7
2892	1117	4
2893	1117	2
2894	1118	9
2895	1118	5
2896	1118	8
2897	1118	10
2898	1118	7
2899	1119	1
2900	1120	9
2901	1121	10
2902	1122	9
2903	1122	2
2904	1122	5
2905	1122	8
2906	1122	7
2907	1124	12
2908	1124	8
2909	1125	7
2910	1125	9
2911	1125	9
2912	1125	9
2913	1126	7
2914	1126	7
2915	1126	6
2916	1126	10
2917	1127	8
2918	1127	1
2919	1127	11
2920	1128	12
2921	1128	11
2922	1128	10
2923	1128	2
2924	1130	4
2925	1130	3
2926	1130	3
2927	1131	4
2928	1131	4
2929	1131	12
2930	1131	2
2931	1131	10
2932	1132	0
2933	1132	0
2934	1132	2
2935	1132	8
2936	1132	12
2937	1133	7
2938	1133	0
2939	1133	5
2940	1133	8
2941	1135	8
2942	1135	0
2943	1135	8
2944	1135	4
2945	1136	8
2946	1136	0
2947	1136	0
2948	1136	11
2949	1136	8
2950	1137	11
2951	1137	12
2952	1137	9
2953	1137	4
2954	1137	1
2955	1138	12
2956	1138	6
2957	1138	6
2958	1139	1
2959	1139	11
2960	1140	12
2961	1141	5
2962	1142	6
2963	1143	4
2964	1144	11
2965	1144	4
2966	1144	7
2967	1144	2
2968	1145	4
2969	1146	0
2970	1146	10
2971	1146	3
2972	1146	4
2973	1146	5
2974	1147	6
2975	1147	4
2976	1147	6
2977	1148	1
2978	1148	0
2979	1148	3
2980	1148	9
2981	1149	10
2982	1149	6
2983	1149	9
2984	1150	1
2985	1150	12
2986	1150	3
2987	1150	1
2988	1150	8
2989	1151	6
2990	1152	12
2991	1152	1
2992	1152	0
2993	1152	11
2994	1153	0
2995	1153	0
2996	1153	10
2997	1153	7
2998	1155	12
2999	1155	0
3000	1155	12
3001	1155	8
3002	1155	1
3003	1156	0
3004	1156	9
3005	1156	0
3006	1156	2
3007	1156	4
3008	1157	5
3009	1157	11
3010	1157	3
3011	1157	2
3012	1158	11
3013	1158	11
3014	1158	10
3015	1158	0
3016	1158	5
3017	1159	0
3018	1160	3
3019	1160	0
3020	1160	2
3021	1161	11
3022	1161	5
3023	1161	0
3024	1161	9
3025	1162	3
3026	1163	12
3027	1163	5
3028	1164	6
3029	1164	1
3030	1164	12
3031	1164	8
3032	1164	6
3033	1165	4
3034	1165	6
3035	1165	4
3036	1165	8
3037	1166	10
3038	1166	6
3039	1166	5
3040	1168	9
3041	1169	6
3042	1169	7
3043	1169	0
3044	1171	3
3045	1171	6
3046	1171	6
3047	1172	8
3048	1172	4
3049	1173	8
3050	1174	6
3051	1174	7
3052	1175	4
3053	1175	4
3054	1175	12
3055	1175	3
3056	1176	11
3057	1176	7
3058	1176	9
3059	1176	10
3060	1176	5
3061	1177	0
3062	1177	12
3063	1177	11
3064	1177	3
3065	1177	0
3066	1179	2
3067	1179	7
3068	1179	5
3069	1179	8
3070	1179	9
3071	1180	11
3072	1181	8
3073	1181	12
3074	1181	9
3075	1182	12
3076	1182	9
3077	1184	6
3078	1184	3
3079	1184	1
3080	1184	0
3081	1184	10
3082	1185	1
3083	1185	3
3084	1185	0
3085	1185	5
3086	1185	12
3087	1187	1
3088	1187	9
3089	1187	0
3090	1187	7
3091	1187	9
3092	1188	1
3093	1188	9
3094	1188	7
3095	1189	4
3096	1189	11
3097	1189	0
3098	1189	6
3099	1191	10
3100	1191	10
3101	1191	11
3102	1191	2
3103	1191	11
3104	1192	2
3105	1192	7
3106	1192	11
3107	1192	8
3108	1193	1
3109	1194	3
3110	1194	1
3111	1194	1
3112	1194	1
3113	1195	5
3114	1195	11
3115	1195	0
3116	1196	1
3117	1197	0
3118	1197	4
3119	1198	6
3120	1199	4
3121	1199	11
3122	1199	1
3123	1200	7
3124	1202	6
3125	1202	7
3126	1202	6
3127	1202	12
3128	1202	3
3129	1204	12
3130	1205	9
3131	1205	2
3132	1205	2
3133	1205	6
3134	1206	12
3135	1206	10
3136	1206	7
3137	1208	6
3138	1208	10
3139	1208	0
3140	1210	8
3141	1210	6
3142	1210	12
3143	1210	3
3144	1212	4
3145	1212	9
3146	1212	3
3147	1212	5
3148	1214	9
3149	1214	6
3150	1215	10
3151	1215	7
3152	1215	4
3153	1216	7
3154	1216	8
3155	1217	0
3156	1217	8
3157	1217	4
3158	1217	3
3159	1217	8
3160	1218	4
3161	1218	7
3162	1218	4
3163	1218	2
3164	1219	4
3165	1219	9
3166	1219	2
3167	1223	10
3168	1223	0
3169	1223	10
3170	1223	4
3171	1225	2
3172	1225	4
3173	1225	8
3174	1225	10
3175	1225	12
3176	1226	5
3177	1226	3
3178	1226	5
3179	1228	3
3180	1229	7
3181	1229	7
3182	1229	7
3183	1229	8
3184	1231	5
3185	1231	6
3186	1231	6
3187	1232	6
3188	1232	8
3189	1233	6
3190	1233	2
3191	1233	9
3192	1234	3
3193	1234	11
3194	1234	9
3195	1234	10
3196	1234	10
3197	1235	4
3198	1235	7
3199	1235	7
3200	1235	5
3201	1235	11
3202	1236	1
3203	1237	5
3204	1237	7
3205	1237	9
3206	1237	3
3207	1238	10
3208	1238	10
3209	1238	4
3210	1238	0
3211	1239	12
3212	1241	0
3213	1241	6
3214	1241	10
3215	1241	8
3216	1241	6
3217	1242	9
3218	1242	6
3219	1242	2
3220	1243	3
3221	1243	5
3222	1243	5
3223	1243	3
3224	1244	1
3225	1244	7
3226	1244	2
3227	1244	11
3228	1245	3
3229	1246	5
3230	1246	8
3231	1246	10
3232	1246	10
3233	1247	11
3234	1247	0
3235	1247	5
3236	1247	7
3237	1247	9
3238	1248	6
3239	1250	12
3240	1251	4
3241	1251	5
3242	1252	12
3243	1253	2
3244	1253	12
3245	1253	9
3246	1254	11
3247	1254	3
3248	1254	1
3249	1255	3
3250	1257	11
3251	1257	8
3252	1257	8
3253	1257	8
3254	1257	11
3255	1260	4
3256	1260	4
3257	1260	5
3258	1261	11
3259	1261	9
3260	1261	7
3261	1261	11
3262	1261	12
3263	1262	8
3264	1263	0
3265	1263	4
3266	1263	12
3267	1264	12
3268	1264	5
3269	1265	9
3270	1266	11
3271	1266	6
3272	1266	12
3273	1266	1
3274	1267	3
3275	1268	1
3276	1269	3
3277	1269	6
3278	1269	4
3279	1270	7
3280	1270	3
3281	1270	8
3282	1270	6
3283	1271	9
3284	1271	3
3285	1271	5
3286	1272	12
3287	1272	1
3288	1272	0
3289	1272	11
3290	1273	3
3291	1273	6
3292	1273	7
3293	1273	0
3294	1274	6
3295	1274	11
3296	1274	12
3297	1275	1
3298	1275	7
3299	1276	3
3300	1276	12
3301	1277	4
3302	1277	10
3303	1278	3
3304	1278	11
3305	1278	2
3306	1278	4
3307	1280	5
3308	1280	10
3309	1280	10
3310	1280	7
3311	1280	10
3312	1281	8
3313	1281	6
3314	1281	7
3315	1281	5
3316	1282	3
3317	1282	5
3318	1282	4
3319	1282	1
3320	1284	3
3321	1284	0
3322	1284	6
3323	1284	5
3324	1285	3
3325	1285	0
3326	1285	7
3327	1285	0
3328	1286	7
3329	1286	10
3330	1286	3
3331	1286	3
3332	1286	7
3333	1287	12
3334	1287	8
3335	1287	6
3336	1288	5
3337	1288	4
3338	1288	4
3339	1288	3
3340	1288	0
3341	1289	11
3342	1289	3
3343	1289	2
3344	1289	3
3345	1289	3
3346	1290	3
3347	1291	1
3348	1292	9
3349	1292	11
3350	1292	8
3351	1292	6
3352	1292	6
3353	1293	8
3354	1293	11
3355	1294	7
3356	1294	10
3357	1294	4
3358	1294	3
3359	1295	10
3360	1295	11
3361	1296	3
3362	1296	11
3363	1296	3
3364	1297	8
3365	1297	8
3366	1297	2
3367	1298	2
3368	1298	5
3369	1299	9
3370	1300	7
3371	1300	7
3372	1300	1
3373	1300	4
3374	1300	10
3375	1301	3
3376	1301	4
3377	1301	10
3378	1301	10
3379	1301	0
3380	1302	2
3381	1303	3
3382	1303	11
3383	1303	4
3384	1305	11
3385	1305	1
3386	1305	2
3387	1307	1
3388	1308	12
3389	1308	0
3390	1309	0
3391	1309	9
3392	1309	6
3393	1309	9
3394	1309	2
3395	1310	2
3396	1310	2
3397	1310	0
3398	1311	8
3399	1311	0
3400	1313	3
3401	1313	3
3402	1314	10
3403	1316	7
3404	1317	4
3405	1317	8
3406	1317	5
3407	1317	9
3408	1318	7
3409	1318	3
3410	1318	4
3411	1318	2
3412	1318	0
3413	1319	0
3414	1320	6
3415	1320	10
3416	1320	12
3417	1320	2
3418	1321	6
3419	1321	8
3420	1321	12
3421	1322	12
3422	1322	4
3423	1322	0
3424	1322	3
3425	1324	3
3426	1324	6
3427	1324	11
3428	1325	7
3429	1325	0
3430	1326	1
3431	1326	4
3432	1326	11
3433	1328	8
3434	1328	10
3435	1328	3
3436	1328	1
3437	1328	1
3438	1329	2
3439	1329	9
3440	1329	9
3441	1329	5
3442	1329	8
3443	1330	8
3444	1330	8
3445	1330	11
3446	1330	5
3447	1330	12
3448	1331	5
3449	1331	4
3450	1331	2
3451	1331	0
3452	1333	8
3453	1333	7
3454	1333	3
3455	1333	6
3456	1333	7
3457	1334	7
3458	1334	12
3459	1334	4
3460	1334	6
3461	1334	2
3462	1335	7
3463	1335	8
3464	1335	8
3465	1335	8
3466	1336	4
3467	1336	2
3468	1337	8
3469	1337	4
3470	1338	8
3471	1338	9
3472	1338	10
3473	1339	7
3474	1339	9
3475	1339	2
3476	1339	0
3477	1339	6
3478	1340	1
3479	1340	6
3480	1340	8
3481	1340	9
3482	1341	12
3483	1341	4
3484	1341	11
3485	1341	3
3486	1341	12
3487	1342	5
3488	1342	5
3489	1343	0
3490	1343	5
3491	1344	8
3492	1344	10
3493	1345	2
3494	1346	0
3495	1346	4
3496	1346	1
3497	1347	5
3498	1347	11
3499	1347	4
3500	1347	11
3501	1347	12
3502	1348	4
3503	1348	6
3504	1349	1
3505	1349	9
3506	1349	11
3507	1349	2
3508	1349	0
3509	1350	0
3510	1350	6
3511	1350	5
3512	1350	7
3513	1351	3
3514	1351	9
3515	1351	7
3516	1351	11
3517	1351	1
3518	1352	7
3519	1352	12
3520	1352	5
3521	1352	12
3522	1352	3
3523	1353	6
3524	1354	4
3525	1354	5
3526	1354	6
3527	1354	8
3528	1355	4
3529	1355	2
3530	1355	5
3531	1355	9
3532	1356	5
3533	1357	10
3534	1357	10
3535	1358	8
3536	1358	8
3537	1358	6
3538	1358	10
3539	1358	2
3540	1359	4
3541	1359	0
3542	1359	8
3543	1359	3
3544	1360	7
3545	1360	2
3546	1360	5
3547	1360	10
3548	1360	4
3549	1361	10
3550	1361	9
3551	1361	4
3552	1362	3
3553	1362	11
3554	1363	3
3555	1363	3
3556	1363	9
3557	1365	11
3558	1365	10
3559	1365	3
3560	1366	12
3561	1366	3
3562	1366	8
3563	1367	8
3564	1367	12
3565	1367	7
3566	1367	8
3567	1367	9
3568	1368	5
3569	1368	4
3570	1368	6
3571	1368	9
3572	1370	1
3573	1370	0
3574	1370	4
3575	1371	8
3576	1372	1
3577	1372	1
3578	1372	5
3579	1372	9
3580	1372	8
3581	1373	6
3582	1373	1
3583	1374	10
3584	1374	11
3585	1374	10
3586	1375	7
3587	1375	0
3588	1375	8
3589	1375	8
3590	1376	8
3591	1376	2
3592	1376	7
3593	1376	11
3594	1377	6
3595	1377	2
3596	1377	6
3597	1377	3
3598	1378	2
3599	1378	3
3600	1378	7
3601	1379	0
3602	1379	1
3603	1379	4
3604	1380	11
3605	1381	4
3606	1381	2
3607	1381	12
3608	1381	5
3609	1384	6
3610	1384	8
3611	1384	10
3612	1384	12
3613	1385	0
3614	1385	5
3615	1385	0
3616	1385	11
3617	1386	11
3618	1386	6
3619	1386	11
3620	1386	7
3621	1387	4
3622	1387	12
3623	1387	11
3624	1387	12
3625	1387	11
3626	1389	6
3627	1389	0
3628	1389	1
3629	1389	10
3630	1390	9
3631	1391	8
3632	1391	1
3633	1392	8
3634	1392	7
3635	1392	10
3636	1392	0
3637	1392	8
3638	1393	6
3639	1393	5
3640	1393	5
3641	1393	3
3642	1394	10
3643	1394	4
3644	1395	11
3645	1395	1
3646	1396	10
3647	1396	4
3648	1396	7
3649	1396	3
3650	1397	2
3651	1398	6
3652	1398	0
3653	1398	6
3654	1398	2
3655	1398	0
3656	1399	2
3657	1399	1
3658	1399	7
3659	1399	3
3660	1400	10
3661	1400	5
3662	1401	9
3663	1402	4
3664	1402	6
3665	1403	10
3666	1403	7
3667	1403	1
3668	1403	10
3669	1404	7
3670	1404	5
3671	1404	2
3672	1404	5
3673	1405	4
3674	1405	7
3675	1405	11
3676	1405	1
3677	1406	10
3678	1406	0
3679	1406	12
3680	1407	12
3681	1408	11
3682	1409	7
3683	1409	12
3684	1409	8
3685	1409	9
3686	1409	1
3687	1411	6
3688	1411	3
3689	1411	11
3690	1411	1
3691	1411	9
3692	1412	12
3693	1412	6
3694	1412	2
3695	1412	2
3696	1413	7
3697	1413	5
3698	1413	7
3699	1414	10
3700	1414	12
3701	1414	11
3702	1414	1
3703	1414	1
3704	1415	4
3705	1415	4
3706	1416	7
3707	1416	0
3708	1416	9
3709	1416	6
3710	1416	1
3711	1417	9
3712	1417	10
3713	1417	8
3714	1417	2
3715	1418	9
3716	1419	9
3717	1419	5
3718	1419	11
3719	1419	5
3720	1419	2
3721	1420	10
3722	1421	1
3723	1422	8
3724	1423	3
3725	1423	10
3726	1423	9
3727	1425	3
3728	1426	9
3729	1429	1
3730	1431	0
3731	1431	9
3732	1432	5
3733	1432	6
3734	1433	0
3735	1434	3
3736	1434	10
3737	1434	11
3738	1434	1
3739	1434	6
3740	1436	8
3741	1437	1
3742	1437	4
3743	1438	9
3744	1439	5
3745	1439	6
3746	1439	10
3747	1440	3
3748	1440	6
3749	1440	7
3750	1441	10
3751	1442	2
3752	1442	9
3753	1442	1
3754	1442	9
3755	1443	12
3756	1443	9
3757	1443	8
3758	1445	10
3759	1446	3
3760	1446	6
3761	1446	9
3762	1447	12
3763	1447	10
3764	1447	9
3765	1448	5
3766	1448	11
3767	1448	5
3768	1448	2
3769	1449	8
3770	1449	3
3771	1449	8
3772	1449	3
3773	1449	4
3774	1450	10
3775	1450	4
3776	1450	0
3777	1450	5
3778	1450	9
3779	1451	8
3780	1451	6
3781	1451	1
3782	1451	5
3783	1451	7
3784	1452	7
3785	1452	6
3786	1452	7
3787	1452	1
3788	1453	9
3789	1453	8
3790	1453	12
3791	1453	11
3792	1455	4
3793	1455	10
3794	1455	0
3795	1456	3
3796	1456	1
3797	1456	5
3798	1457	1
3799	1458	4
3800	1458	7
3801	1458	9
3802	1460	8
3803	1460	10
3804	1460	0
3805	1460	4
3806	1460	12
3807	1461	3
3808	1461	10
3809	1461	12
3810	1461	0
3811	1462	4
3812	1462	4
3813	1463	2
3814	1463	12
3815	1463	8
3816	1464	12
3817	1464	9
3818	1464	2
3819	1464	7
3820	1464	6
3821	1466	8
3822	1471	12
3823	1471	3
3824	1471	12
3825	1471	1
3826	1471	11
3827	1472	3
3828	1472	12
3829	1472	2
3830	1472	0
3831	1473	6
3832	1473	2
3833	1474	11
3834	1474	5
3835	1474	0
3836	1477	4
3837	1477	6
3838	1477	11
3839	1477	5
3840	1479	1
3841	1479	4
3842	1479	10
3843	1480	6
3844	1480	7
3845	1480	0
3846	1481	8
3847	1481	11
3848	1481	6
3849	1482	2
3850	1482	4
3851	1483	8
3852	1483	4
3853	1483	9
3854	1483	6
3855	1483	10
3856	1484	5
3857	1486	0
3858	1486	10
3859	1486	10
3860	1486	0
3861	1486	7
3862	1487	4
3863	1488	5
3864	1488	2
3865	1488	5
3866	1490	4
3867	1490	3
3868	1490	5
3869	1491	7
3870	1491	8
3871	1491	6
3872	1491	5
3873	1491	1
3874	1492	9
3875	1492	3
3876	1492	10
3877	1494	6
3878	1494	5
3879	1494	1
3880	1496	8
3881	1496	10
3882	1496	0
3883	1499	3
3884	1499	12
3885	1499	7
3886	1499	1
3887	1500	11
3888	1500	10
3889	1500	2
3890	1500	4
3891	1501	4
3892	1501	2
3893	1501	12
3894	1501	5
3895	1501	8
3896	1503	2
3897	1503	1
3898	1503	11
3899	1504	3
3900	1504	12
3901	1504	2
3902	1505	11
3903	1505	7
3904	1505	7
3905	1505	8
3906	1506	0
3907	1506	4
3908	1506	7
3909	1507	0
3910	1507	9
3911	1508	11
3912	1508	10
3913	1509	12
3914	1509	11
3915	1511	4
3916	1511	12
3917	1511	6
3918	1511	12
3919	1512	1
3920	1512	11
3921	1512	2
3922	1512	0
3923	1512	0
3924	1513	3
3925	1513	5
3926	1513	3
3927	1514	5
3928	1515	9
3929	1515	1
3930	1515	5
3931	1515	12
3932	1516	7
3933	1516	5
3934	1516	6
3935	1516	3
3936	1517	10
3937	1517	5
3938	1518	9
3939	1518	7
3940	1518	2
3941	1519	1
3942	1519	1
3943	1519	2
3944	1519	5
3945	1519	0
3946	1520	5
3947	1520	1
3948	1520	0
3949	1521	6
3950	1521	4
3951	1521	3
3952	1521	9
3953	1522	0
3954	1522	0
3955	1522	8
3956	1522	7
3957	1522	12
3958	1526	11
3959	1526	7
3960	1527	11
3961	1527	7
3962	1527	0
3963	1528	12
3964	1528	0
3965	1528	5
3966	1528	7
3967	1528	8
3968	1529	2
3969	1529	7
3970	1529	10
3971	1529	2
3972	1529	1
3973	1530	9
3974	1531	5
3975	1531	10
3976	1531	2
3977	1532	2
3978	1532	5
3979	1532	10
3980	1532	4
3981	1532	12
3982	1533	9
3983	1533	3
3984	1533	4
3985	1534	0
3986	1534	5
3987	1536	1
3988	1536	11
3989	1536	4
3990	1537	0
3991	1538	6
3992	1540	9
3993	1540	10
3994	1540	0
3995	1541	2
3996	1541	10
3997	1541	10
3998	1543	3
3999	1547	10
4000	1548	4
4001	1549	12
4002	1549	9
4003	1549	6
4004	1549	6
4005	1550	1
4006	1550	10
4007	1551	5
4008	1551	7
4009	1551	9
4010	1551	11
4011	1551	7
4012	1552	9
4013	1552	6
4014	1553	9
4015	1553	5
4016	1553	8
4017	1554	4
4018	1554	2
4019	1555	11
4020	1556	3
4021	1556	6
4022	1557	0
4023	1557	8
4024	1557	2
4025	1558	10
4026	1558	0
4027	1558	8
4028	1558	9
4029	1558	10
4030	1559	12
4031	1559	0
4032	1559	3
4033	1560	5
4034	1560	3
4035	1561	12
4036	1561	2
4037	1562	12
4038	1563	6
4039	1564	7
4040	1564	8
4041	1564	6
4042	1564	10
4043	1564	11
4044	1565	0
4045	1566	9
4046	1566	9
4047	1566	2
4048	1567	2
4049	1567	1
4050	1568	7
4051	1568	5
4052	1568	1
4053	1569	0
4054	1569	12
4055	1569	2
4056	1569	3
4057	1570	3
4058	1570	8
4059	1572	5
4060	1572	12
4061	1573	6
4062	1573	2
4063	1574	9
4064	1574	7
4065	1574	1
4066	1574	2
4067	1575	2
4068	1575	3
4069	1576	4
4070	1576	2
4071	1576	7
4072	1576	10
4073	1576	10
4074	1577	2
4075	1577	2
4076	1577	4
4077	1577	8
4078	1578	5
4079	1578	12
4080	1578	2
4081	1579	9
4082	1579	9
4083	1581	10
4084	1581	5
4085	1581	2
4086	1581	5
4087	1581	2
4088	1582	10
4089	1582	12
4090	1584	11
4091	1584	11
4092	1584	8
4093	1586	10
4094	1586	12
4095	1586	2
4096	1587	11
4097	1587	11
4098	1587	0
4099	1587	8
4100	1588	6
4101	1588	5
4102	1590	6
4103	1590	6
4104	1591	12
4105	1591	5
4106	1591	12
4107	1591	9
4108	1591	10
4109	1592	4
4110	1592	6
4111	1593	1
4112	1594	10
4113	1595	11
4114	1595	0
4115	1595	0
4116	1595	0
4117	1597	10
4118	1597	2
4119	1598	1
4120	1598	2
4121	1598	6
4122	1598	3
4123	1600	2
\.


--
-- Data for Name: logistics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY logistics (id, site_id, date, care_packs, hiv_tests) FROM stdin;
1	A01001	2010-07-12 00:00:00	9	9
2	A01001	2010-07-13 00:00:00	2	9
3	B05120	2010-07-12 00:00:00	0	6
4	B05120	2010-07-13 00:00:00	8	4
5	C10320	2010-07-12 00:00:00	2	1
6	C10320	2010-07-13 00:00:00	8	3
7	D17589	2010-07-12 00:00:00	2	9
8	D17589	2010-07-13 00:00:00	7	0
\.


--
-- Data for Name: medical_informations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY medical_informations (pid, patient_source_id, funding_id, hiv_positive_date, hiv_positive_test_location_id, hiv_positive_clinic_start_date, hiv_positive_who_stage, art_naive, art_service_type_id, art_first_start_date, art_eligibility_date, art_indication_id, transfer_in_date, transfer_in_district_id, transfer_in_facility, transfer_out_date, transfer_out_event, date_pep_start, pep_reason_id, art_eligible_who_stage, art_eligible_cd4, art_start_weight, art_start_height, art_start_who_stage, art_second_start_date, art_second_line_reason_id, drug_allergies, user_id, created, modified) FROM stdin;
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: -
--

COPY patients (pid, upn, old_upn, arvid, vfcc, surname, forenames, date_of_birth, year_of_birth, sex, mother, occupation_id, education_id, marital_status_id, telephone_number, location_id, village, home, nearest_church, nearest_school, nearest_health_centre, nearest_major_landmark, vf_testing_site, status, inactive_reason_id, status_timestamp, treatment_supporter_name, treatment_supporter_relationship, treatment_supporter_address, treatment_supporter_telephone_number, user_id, created, modified) FROM stdin;
\.


--
-- Data for Name: reason; Type: TABLE DATA; Schema: public; Owner: -
--

COPY reason (id, client_id, reason_id) FROM stdin;
1	1	6
2	2	12
3	2	1
4	2	16
5	2	19
6	2	9
7	3	12
8	3	17
9	4	7
10	4	15
11	5	8
12	5	21
13	5	21
14	7	1
15	7	19
16	7	14
17	8	3
18	8	21
19	8	15
20	9	8
21	11	14
22	11	10
23	11	18
24	11	12
25	11	7
26	12	8
27	12	21
28	13	15
29	14	4
30	15	12
31	15	13
32	15	2
33	16	1
34	16	7
35	18	1
36	18	14
37	18	20
38	18	14
39	18	15
40	19	5
41	19	16
42	19	3
43	19	14
44	19	17
45	20	18
46	20	16
47	21	14
48	21	20
49	22	11
50	22	0
51	22	7
52	23	3
53	23	14
54	23	15
55	23	20
56	25	4
57	25	10
58	25	17
59	26	12
60	26	14
61	26	17
62	27	1
63	27	10
64	27	9
65	27	17
66	28	20
67	28	16
68	28	1
69	28	6
70	29	11
71	29	9
72	29	17
73	29	16
74	29	21
75	30	15
76	30	3
77	31	1
78	32	1
79	33	16
80	33	6
81	33	7
82	33	6
83	33	17
84	34	8
85	34	7
86	34	0
87	35	15
88	36	13
89	36	13
90	36	11
91	36	7
92	37	8
93	37	17
94	37	15
95	38	16
96	39	10
97	39	1
98	39	18
99	39	14
100	39	6
101	40	21
102	40	14
103	40	16
104	40	18
105	41	4
106	41	18
107	41	17
108	41	15
109	41	11
110	43	14
111	43	19
112	43	5
113	45	12
114	45	9
115	48	8
116	48	8
117	53	16
118	53	6
119	53	10
120	53	7
121	53	0
122	55	7
123	55	3
124	55	13
125	55	1
126	55	8
127	57	19
128	57	11
129	57	18
130	58	3
131	59	13
132	59	8
133	59	16
134	60	9
135	60	5
136	60	9
137	60	18
138	61	2
139	61	0
140	61	16
141	61	6
142	63	21
143	63	18
144	63	20
145	64	9
146	65	21
147	65	14
148	66	14
149	66	1
150	66	15
151	67	13
152	67	5
153	68	8
154	68	10
155	68	17
156	69	13
157	69	3
158	69	20
159	70	12
160	70	17
161	70	1
162	70	12
163	71	0
164	72	11
165	72	2
166	72	17
167	73	6
168	73	13
169	73	19
170	75	20
171	76	1
172	76	9
173	76	8
174	77	17
175	77	8
176	79	20
177	79	4
178	79	0
179	79	13
180	81	18
181	81	12
182	82	16
183	82	20
184	83	8
185	83	14
186	83	0
187	83	12
188	83	14
189	84	11
190	84	8
191	84	15
192	84	10
193	85	9
194	85	21
195	86	0
196	86	14
197	87	20
198	87	8
199	87	6
200	87	17
201	87	3
202	88	8
203	88	2
204	89	12
205	89	5
206	89	9
207	90	15
208	90	10
209	90	20
210	90	20
211	90	0
212	92	20
213	92	20
214	92	19
215	92	11
216	92	21
217	94	0
218	94	9
219	94	3
220	96	1
221	96	0
222	97	21
223	97	0
224	97	11
225	97	10
226	98	4
227	101	16
228	101	17
229	101	16
230	101	6
231	101	21
232	102	6
233	102	4
234	103	9
235	103	11
236	103	14
237	103	1
238	104	7
239	104	18
240	104	20
241	104	8
242	104	15
243	105	7
244	105	12
245	105	8
246	105	1
247	106	17
248	106	7
249	107	12
250	107	9
251	107	2
252	108	13
253	108	18
254	109	21
255	109	4
256	109	2
257	109	16
258	109	20
259	110	8
260	110	11
261	110	7
262	111	8
263	111	11
264	112	13
265	112	15
266	112	2
267	112	21
268	112	5
269	113	8
270	113	5
271	113	2
272	113	7
273	113	7
274	115	15
275	115	11
276	115	17
277	115	18
278	116	14
279	116	17
280	117	2
281	117	5
282	117	1
283	117	13
284	117	4
285	118	9
286	118	21
287	119	15
288	119	9
289	119	16
290	119	5
291	119	18
292	120	6
293	121	0
294	121	3
295	122	17
296	122	0
297	122	8
298	122	15
299	122	6
300	123	1
301	123	16
302	124	21
303	124	6
304	125	1
305	125	21
306	125	1
307	125	20
308	125	21
309	126	2
310	126	12
311	126	1
312	126	14
313	127	15
314	127	21
315	127	17
316	127	2
317	128	0
318	128	9
319	129	14
320	129	3
321	130	10
322	130	15
323	130	21
324	130	4
325	130	21
326	132	10
327	132	11
328	132	3
329	132	14
330	133	20
331	133	21
332	133	0
333	133	2
334	134	9
335	134	15
336	134	1
337	134	19
338	135	6
339	135	19
340	136	17
341	136	14
342	136	18
343	136	12
344	136	7
345	137	14
346	137	21
347	137	8
348	138	14
349	138	12
350	138	14
351	138	11
352	138	16
353	139	21
354	139	19
355	139	1
356	140	15
357	140	6
358	140	12
359	140	7
360	144	11
361	144	21
362	144	13
363	144	10
364	144	7
365	145	21
366	145	10
367	145	9
368	148	4
369	148	11
370	149	17
371	149	15
372	151	17
373	151	6
374	151	1
375	151	16
376	152	20
377	152	1
378	152	7
379	153	4
380	153	17
381	153	15
382	153	6
383	154	20
384	154	0
385	154	8
386	154	21
387	155	3
388	155	17
389	155	21
390	155	2
391	155	1
392	156	1
393	158	2
394	158	4
395	158	8
396	160	10
397	160	7
398	160	14
399	162	14
400	163	21
401	163	18
402	163	9
403	163	14
404	164	15
405	165	19
406	165	3
407	166	4
408	166	3
409	166	20
410	167	1
411	168	17
412	169	15
413	169	19
414	169	11
415	171	4
416	172	6
417	172	13
418	172	21
419	172	9
420	173	5
421	175	21
422	175	7
423	175	7
424	175	10
425	175	21
426	177	8
427	177	1
428	177	0
429	177	9
430	178	2
431	178	15
432	178	12
433	178	5
434	178	18
435	179	18
436	181	3
437	181	16
438	181	15
439	182	6
440	183	9
441	183	12
442	183	8
443	183	19
444	183	12
445	184	12
446	185	18
447	185	5
448	185	2
449	185	16
450	185	1
451	186	9
452	186	0
453	187	21
454	187	19
455	187	0
456	187	13
457	189	13
458	189	18
459	189	17
460	190	13
461	190	16
462	190	6
463	191	18
464	192	21
465	192	0
466	193	12
467	194	6
468	194	10
469	196	10
470	196	7
471	196	15
472	196	10
473	197	15
474	197	10
475	197	2
476	197	16
477	197	21
478	198	21
479	198	14
480	198	18
481	198	11
482	198	19
483	199	6
484	200	21
485	200	6
486	200	3
487	200	3
488	200	12
489	201	9
490	201	11
491	202	12
492	202	19
493	202	20
494	202	20
495	203	20
496	203	0
497	204	13
498	204	16
499	204	8
500	204	9
501	204	18
502	205	6
503	205	17
504	205	17
505	206	10
506	206	8
507	206	20
508	206	11
509	207	4
510	207	5
511	207	2
512	207	21
513	208	10
514	208	4
515	208	7
516	208	11
517	209	9
518	209	21
519	209	6
520	209	4
521	209	14
522	211	17
523	211	9
524	211	19
525	213	15
526	214	6
527	215	7
528	216	21
529	216	5
530	216	7
531	216	21
532	216	15
533	218	5
534	219	8
535	219	19
536	219	9
537	219	19
538	221	4
539	222	17
540	222	5
541	222	11
542	222	18
543	222	6
544	223	0
545	223	19
546	224	10
547	224	14
548	224	18
549	224	11
550	224	8
551	225	21
552	225	5
553	225	19
554	225	5
555	225	3
556	226	19
557	226	0
558	226	2
559	227	16
560	228	13
561	228	7
562	228	6
563	228	0
564	230	5
565	230	20
566	230	17
567	230	0
568	230	16
569	231	20
570	231	8
571	231	20
572	231	20
573	231	18
574	234	10
575	234	5
576	234	5
577	234	7
578	235	16
579	235	6
580	235	13
581	235	6
582	236	16
583	236	4
584	236	19
585	237	8
586	237	20
587	237	11
588	237	0
589	238	5
590	238	17
591	238	9
592	238	7
593	239	12
594	239	11
595	239	7
596	241	3
597	241	0
598	241	14
599	241	7
600	242	20
601	242	3
602	242	8
603	242	1
604	243	17
605	243	20
606	243	9
607	243	4
608	244	16
609	244	18
610	244	16
611	245	21
612	245	21
613	246	19
614	247	15
615	247	19
616	247	17
617	247	17
618	248	18
619	248	1
620	249	3
621	249	12
622	251	2
623	251	1
624	251	5
625	251	1
626	251	12
627	252	21
628	252	9
629	252	2
630	252	0
631	252	20
632	253	18
633	253	10
634	253	16
635	253	4
636	253	2
637	254	7
638	254	10
639	254	9
640	255	20
641	255	20
642	255	3
643	255	9
644	255	14
645	256	14
646	257	20
647	257	6
648	257	14
649	257	13
650	258	0
651	258	6
652	258	21
653	259	18
654	260	8
655	260	5
656	260	18
657	260	19
658	261	20
659	262	16
660	263	21
661	263	9
662	263	2
663	263	19
664	263	8
665	264	0
666	265	8
667	265	17
668	265	6
669	265	18
670	266	10
671	266	17
672	266	21
673	267	0
674	269	13
675	269	18
676	270	17
677	270	16
678	270	19
679	270	3
680	270	3
681	271	12
682	271	4
683	271	21
684	273	4
685	275	16
686	275	16
687	275	12
688	275	21
689	276	5
690	276	13
691	276	5
692	276	17
693	277	9
694	277	14
695	277	20
696	277	4
697	277	4
698	278	21
699	278	21
700	279	21
701	279	14
702	279	12
703	280	9
704	281	4
705	281	1
706	281	13
707	281	3
708	281	14
709	282	13
710	282	21
711	282	10
712	282	18
713	285	0
714	285	13
715	285	16
716	286	7
717	286	8
718	287	4
719	287	9
720	287	2
721	287	8
722	288	0
723	288	6
724	289	5
725	289	18
726	289	0
727	289	9
728	291	13
729	291	7
730	291	13
731	291	7
732	291	14
733	292	5
734	292	21
735	293	8
736	294	6
737	294	2
738	294	19
739	294	1
740	294	20
741	296	10
742	296	8
743	296	16
744	297	4
745	297	4
746	298	15
747	298	13
748	298	21
749	298	1
750	298	3
751	299	6
752	299	10
753	299	6
754	299	17
755	301	21
756	301	19
757	301	1
758	301	19
759	301	8
760	302	11
761	302	1
762	303	9
763	304	17
764	307	16
765	308	17
766	308	19
767	308	19
768	308	10
769	308	15
770	309	3
771	309	15
772	309	8
773	309	15
774	310	10
775	312	2
776	312	16
777	312	3
778	313	6
779	313	1
780	313	16
781	313	11
782	313	18
783	314	12
784	314	15
785	314	2
786	314	3
787	315	3
788	317	6
789	317	16
790	317	12
791	319	7
792	319	2
793	320	2
794	320	9
795	320	21
796	320	9
797	320	1
798	322	6
799	322	4
800	322	21
801	323	16
802	325	21
803	325	6
804	325	4
805	325	8
806	325	15
807	326	17
808	326	6
809	326	15
810	327	15
811	327	3
812	328	20
813	328	12
814	328	11
815	328	15
816	329	5
817	329	20
818	329	1
819	330	0
820	330	20
821	330	17
822	330	21
823	331	3
824	331	20
825	332	2
826	333	21
827	333	3
828	333	8
829	333	12
830	334	0
831	334	9
832	334	12
833	334	15
834	335	4
835	335	15
836	335	2
837	335	9
838	335	13
839	336	11
840	337	4
841	337	19
842	337	0
843	338	15
844	338	6
845	338	6
846	339	3
847	339	9
848	339	1
849	339	4
850	340	19
851	340	2
852	340	21
853	340	2
854	342	20
855	343	10
856	343	18
857	343	17
858	343	8
859	343	2
860	344	6
861	344	2
862	344	16
863	344	15
864	344	6
865	345	15
866	345	11
867	345	10
868	346	7
869	346	2
870	346	3
871	347	6
872	347	20
873	348	4
874	348	1
875	348	14
876	348	13
877	351	8
878	351	7
879	352	13
880	352	2
881	352	0
882	354	3
883	355	10
884	355	9
885	355	11
886	355	4
887	356	1
888	356	4
889	356	15
890	356	8
891	356	21
892	357	1
893	358	7
894	358	12
895	358	5
896	359	16
897	360	8
898	360	15
899	360	9
900	360	14
901	360	21
902	361	1
903	362	3
904	363	5
905	363	3
906	363	0
907	364	15
908	364	3
909	365	2
910	365	3
911	367	17
912	368	1
913	368	1
914	368	20
915	368	18
916	369	2
917	369	13
918	369	16
919	369	21
920	370	20
921	370	14
922	370	20
923	371	13
924	371	7
925	371	10
926	371	7
927	373	20
928	373	9
929	373	21
930	373	19
931	374	5
932	374	20
933	374	1
934	376	1
935	376	0
936	376	16
937	376	18
938	377	15
939	377	8
940	377	9
941	377	9
942	377	3
943	378	19
944	378	18
945	378	14
946	378	15
947	378	16
948	379	19
949	379	21
950	379	20
951	379	1
952	379	21
953	380	11
954	380	16
955	381	16
956	381	21
957	381	18
958	383	21
959	385	4
960	385	3
961	385	16
962	385	13
963	385	4
964	386	19
965	386	3
966	387	19
967	387	0
968	387	6
969	390	20
970	390	0
971	390	2
972	391	6
973	391	16
974	391	16
975	391	10
976	391	6
977	392	11
978	392	12
979	392	12
980	392	21
981	393	11
982	393	3
983	394	17
984	394	11
985	394	0
986	395	3
987	395	18
988	396	5
989	396	20
990	396	13
991	396	21
992	396	14
993	397	9
994	397	17
995	397	7
996	398	10
997	398	12
998	399	11
999	401	0
1000	401	21
1001	401	20
1002	401	13
1003	401	5
1004	402	13
1005	402	3
1006	402	16
1007	402	0
1008	402	11
1009	404	15
1010	404	7
1011	405	20
1012	405	13
1013	406	9
1014	406	21
1015	406	9
1016	407	11
1017	407	4
1018	408	3
1019	408	7
1020	409	14
1021	410	6
1022	410	0
1023	410	13
1024	410	13
1025	410	14
1026	412	17
1027	412	3
1028	412	13
1029	412	16
1030	413	11
1031	414	15
1032	414	9
1033	414	0
1034	414	19
1035	415	0
1036	415	15
1037	415	10
1038	415	15
1039	416	4
1040	416	5
1041	416	14
1042	417	4
1043	417	10
1044	417	0
1045	417	11
1046	418	3
1047	419	20
1048	419	6
1049	419	15
1050	419	19
1051	420	10
1052	420	8
1053	420	12
1054	420	0
1055	421	12
1056	421	10
1057	421	11
1058	421	8
1059	421	0
1060	422	13
1061	422	17
1062	422	10
1063	422	16
1064	424	14
1065	424	15
1066	426	8
1067	426	2
1068	426	2
1069	426	5
1070	427	16
1071	427	17
1072	427	19
1073	427	8
1074	427	21
1075	428	15
1076	428	0
1077	428	19
1078	428	4
1079	429	2
1080	429	10
1081	430	0
1082	431	3
1083	432	13
1084	432	13
1085	432	15
1086	433	18
1087	433	17
1088	433	4
1089	433	2
1090	434	6
1091	434	7
1092	434	1
1093	434	7
1094	434	17
1095	436	18
1096	436	19
1097	436	15
1098	436	17
1099	437	6
1100	437	7
1101	437	17
1102	437	14
1103	438	9
1104	438	17
1105	438	8
1106	438	6
1107	439	20
1108	439	16
1109	440	0
1110	440	15
1111	440	16
1112	440	2
1113	440	4
1114	441	20
1115	442	4
1116	442	20
1117	442	21
1118	443	5
1119	443	5
1120	443	0
1121	444	11
1122	445	11
1123	445	7
1124	446	10
1125	446	8
1126	446	10
1127	447	8
1128	447	21
1129	447	18
1130	447	19
1131	448	0
1132	449	4
1133	449	1
1134	449	14
1135	449	18
1136	451	3
1137	451	11
1138	451	14
1139	453	4
1140	453	16
1141	453	4
1142	454	5
1143	454	2
1144	454	3
1145	454	5
1146	455	0
1147	456	8
1148	456	6
1149	457	20
1150	457	17
1151	457	4
1152	457	18
1153	457	12
1154	458	9
1155	459	17
1156	459	4
1157	459	6
1158	460	19
1159	461	20
1160	461	1
1161	461	20
1162	461	14
1163	461	20
1164	462	2
1165	462	12
1166	462	15
1167	462	8
1168	463	17
1169	463	3
1170	463	14
1171	463	3
1172	463	8
1173	464	13
1174	464	15
1175	464	4
1176	464	2
1177	464	13
1178	465	17
1179	465	14
1180	466	9
1181	466	0
1182	466	1
1183	466	14
1184	467	1
1185	467	7
1186	467	3
1187	468	2
1188	468	5
1189	468	15
1190	469	10
1191	469	2
1192	469	12
1193	469	21
1194	469	8
1195	470	9
1196	471	5
1197	472	7
1198	473	15
1199	473	5
1200	474	8
1201	474	21
1202	474	10
1203	474	5
1204	475	1
1205	475	6
1206	475	15
1207	476	18
1208	476	19
1209	476	20
1210	476	8
1211	477	20
1212	477	19
1213	477	19
1214	477	0
1215	479	11
1216	479	13
1217	479	10
1218	479	20
1219	481	21
1220	481	1
1221	482	12
1222	482	1
1223	482	15
1224	483	19
1225	483	0
1226	485	17
1227	485	2
1228	485	20
1229	485	8
1230	487	1
1231	487	12
1232	487	20
1233	487	3
1234	488	9
1235	488	11
1236	488	6
1237	488	6
1238	489	17
1239	489	20
1240	489	1
1241	490	20
1242	490	1
1243	490	16
1244	491	16
1245	491	4
1246	491	1
1247	491	0
1248	492	13
1249	492	11
1250	492	1
1251	492	6
1252	493	8
1253	494	17
1254	495	5
1255	495	17
1256	496	0
1257	496	5
1258	496	18
1259	497	13
1260	497	9
1261	497	10
1262	497	19
1263	498	9
1264	498	11
1265	498	5
1266	498	19
1267	498	5
1268	499	15
1269	499	19
1270	499	4
1271	499	21
1272	500	4
1273	500	9
1274	500	8
1275	500	2
1276	500	20
1277	501	17
1278	502	18
1279	502	18
1280	503	2
1281	503	10
1282	503	8
1283	503	17
1284	504	20
1285	504	2
1286	504	21
1287	505	12
1288	505	12
1289	506	11
1290	506	10
1291	507	21
1292	507	12
1293	510	3
1294	510	10
1295	510	17
1296	510	18
1297	511	5
1298	511	10
1299	511	10
1300	511	14
1301	512	18
1302	512	18
1303	513	20
1304	513	9
1305	513	19
1306	513	8
1307	514	18
1308	515	18
1309	515	12
1310	515	6
1311	515	21
1312	515	0
1313	516	3
1314	516	13
1315	516	18
1316	517	8
1317	517	0
1318	518	10
1319	519	3
1320	519	7
1321	519	6
1322	520	8
1323	520	6
1324	520	16
1325	520	6
1326	520	4
1327	521	7
1328	521	19
1329	521	2
1330	522	12
1331	523	10
1332	523	13
1333	523	12
1334	523	16
1335	523	13
1336	524	9
1337	524	3
1338	524	4
1339	525	5
1340	525	10
1341	526	8
1342	526	6
1343	526	10
1344	526	20
1345	526	6
1346	527	16
1347	527	17
1348	527	2
1349	527	17
1350	529	21
1351	530	17
1352	530	4
1353	530	6
1354	530	0
1355	531	1
1356	531	3
1357	531	12
1358	531	8
1359	531	15
1360	532	18
1361	532	7
1362	532	20
1363	532	4
1364	532	11
1365	533	5
1366	533	20
1367	533	19
1368	533	5
1369	533	4
1370	534	20
1371	534	4
1372	534	4
1373	534	21
1374	535	11
1375	535	2
1376	535	19
1377	536	1
1378	538	15
1379	538	6
1380	538	2
1381	540	21
1382	540	14
1383	540	17
1384	540	7
1385	542	11
1386	543	18
1387	543	14
1388	543	17
1389	544	10
1390	544	18
1391	544	11
1392	544	2
1393	545	5
1394	545	9
1395	545	18
1396	545	13
1397	545	2
1398	546	13
1399	546	13
1400	546	12
1401	546	16
1402	547	5
1403	548	14
1404	549	9
1405	549	8
1406	549	21
1407	551	5
1408	551	7
1409	551	17
1410	552	5
1411	552	0
1412	552	3
1413	553	0
1414	553	14
1415	553	9
1416	554	7
1417	554	16
1418	554	3
1419	554	18
1420	555	14
1421	555	21
1422	555	11
1423	557	16
1424	557	5
1425	557	8
1426	557	1
1427	558	12
1428	558	8
1429	558	11
1430	559	1
1431	560	2
1432	560	0
1433	560	15
1434	560	10
1435	561	17
1436	561	16
1437	561	13
1438	561	12
1439	562	19
1440	562	19
1441	562	4
1442	562	5
1443	562	15
1444	563	9
1445	564	5
1446	564	0
1447	564	6
1448	564	6
1449	565	13
1450	565	19
1451	565	20
1452	565	9
1453	565	6
1454	566	4
1455	566	14
1456	567	18
1457	567	8
1458	567	1
1459	567	13
1460	567	12
1461	568	4
1462	568	15
1463	570	1
1464	570	20
1465	570	8
1466	572	11
1467	572	10
1468	573	9
1469	573	4
1470	573	15
1471	573	11
1472	573	16
1473	574	17
1474	574	12
1475	574	17
1476	574	17
1477	574	9
1478	575	13
1479	575	9
1480	576	12
1481	577	14
1482	577	19
1483	577	17
1484	577	0
1485	579	21
1486	579	21
1487	579	7
1488	579	0
1489	580	7
1490	580	0
1491	580	10
1492	580	16
1493	581	20
1494	581	5
1495	583	0
1496	583	20
1497	585	11
1498	585	20
1499	585	15
1500	585	3
1501	585	16
1502	586	9
1503	586	14
1504	587	16
1505	587	11
1506	589	1
1507	589	11
1508	589	19
1509	589	20
1510	589	13
1511	590	17
1512	590	11
1513	590	1
1514	590	15
1515	592	16
1516	592	6
1517	592	8
1518	592	11
1519	592	21
1520	593	15
1521	593	13
1522	593	2
1523	594	2
1524	594	17
1525	594	3
1526	594	4
1527	594	14
1528	595	9
1529	595	14
1530	595	2
1531	596	5
1532	597	6
1533	597	1
1534	597	7
1535	598	13
1536	598	17
1537	600	19
1538	600	3
1539	601	12
1540	601	18
1541	601	15
1542	602	17
1543	603	11
1544	603	7
1545	603	9
1546	603	4
1547	603	14
1548	604	12
1549	604	7
1550	604	19
1551	604	5
1552	605	1
1553	605	12
1554	605	7
1555	605	9
1556	605	2
1557	607	15
1558	607	15
1559	607	0
1560	607	11
1561	607	6
1562	608	0
1563	609	2
1564	609	21
1565	610	2
1566	611	18
1567	611	0
1568	611	6
1569	611	13
1570	613	11
1571	613	3
1572	613	11
1573	613	2
1574	614	2
1575	614	17
1576	614	7
1577	614	21
1578	614	12
1579	615	13
1580	615	10
1581	615	3
1582	615	14
1583	615	2
1584	616	4
1585	616	11
1586	616	19
1587	616	14
1588	618	8
1589	619	3
1590	619	5
1591	619	11
1592	620	1
1593	621	2
1594	621	3
1595	622	19
1596	622	11
1597	623	17
1598	623	1
1599	623	16
1600	624	16
1601	624	9
1602	624	18
1603	625	10
1604	625	15
1605	625	20
1606	625	8
1607	625	7
1608	626	2
1609	626	0
1610	626	12
1611	627	5
1612	628	10
1613	628	13
1614	628	11
1615	629	1
1616	629	12
1617	629	11
1618	629	18
1619	630	7
1620	630	15
1621	630	21
1622	630	13
1623	630	18
1624	631	10
1625	632	9
1626	632	2
1627	632	3
1628	632	5
1629	634	14
1630	634	18
1631	634	17
1632	635	6
1633	635	20
1634	635	20
1635	635	21
1636	635	2
1637	636	18
1638	636	5
1639	636	2
1640	636	19
1641	637	18
1642	637	0
1643	638	9
1644	638	20
1645	638	20
1646	640	16
1647	641	0
1648	641	1
1649	641	1
1650	641	8
1651	642	3
1652	642	12
1653	642	14
1654	642	1
1655	642	4
1656	644	21
1657	644	14
1658	644	9
1659	644	3
1660	644	15
1661	645	19
1662	645	1
1663	645	4
1664	645	14
1665	645	13
1666	646	13
1667	646	20
1668	646	21
1669	646	4
1670	646	11
1671	647	2
1672	647	16
1673	648	7
1674	648	21
1675	648	4
1676	648	3
1677	650	12
1678	650	17
1679	650	9
1680	652	5
1681	652	15
1682	652	0
1683	653	8
1684	653	17
1685	653	13
1686	653	11
1687	653	4
1688	654	20
1689	655	13
1690	655	15
1691	656	1
1692	656	13
1693	656	14
1694	657	3
1695	657	15
1696	657	1
1697	657	18
1698	657	9
1699	658	12
1700	659	5
1701	659	20
1702	659	1
1703	659	20
1704	660	15
1705	660	5
1706	660	14
1707	661	11
1708	661	19
1709	661	20
1710	661	11
1711	661	0
1712	662	12
1713	663	6
1714	663	16
1715	663	9
1716	664	18
1717	664	10
1718	664	7
1719	666	2
1720	666	13
1721	666	0
1722	666	3
1723	667	0
1724	667	17
1725	667	19
1726	668	8
1727	668	16
1728	669	7
1729	669	0
1730	669	20
1731	670	21
1732	670	4
1733	670	0
1734	671	4
1735	671	8
1736	671	19
1737	672	7
1738	672	5
1739	672	3
1740	672	0
1741	673	20
1742	673	21
1743	673	7
1744	673	14
1745	675	7
1746	675	4
1747	675	18
1748	675	0
1749	675	21
1750	676	17
1751	676	5
1752	676	13
1753	676	14
1754	676	6
1755	677	0
1756	677	8
1757	678	11
1758	678	11
1759	678	18
1760	679	2
1761	679	3
1762	679	21
1763	680	16
1764	680	21
1765	680	12
1766	680	13
1767	681	10
1768	681	18
1769	682	3
1770	683	3
1771	683	4
1772	683	3
1773	683	9
1774	683	8
1775	684	21
1776	684	19
1777	684	0
1778	684	7
1779	685	13
1780	685	13
1781	685	21
1782	685	16
1783	686	17
1784	687	20
1785	688	12
1786	688	13
1787	688	6
1788	689	4
1789	689	5
1790	690	10
1791	691	5
1792	691	7
1793	691	3
1794	691	12
1795	692	2
1796	692	11
1797	693	10
1798	693	9
1799	693	1
1800	693	0
1801	694	20
1802	694	7
1803	694	14
1804	696	8
1805	696	10
1806	697	4
1807	698	1
1808	698	11
1809	698	1
1810	698	17
1811	698	8
1812	699	0
1813	699	16
1814	699	9
1815	700	16
1816	700	2
1817	700	3
1818	701	14
1819	701	7
1820	702	5
1821	704	19
1822	704	20
1823	704	14
1824	705	12
1825	705	14
1826	706	0
1827	707	6
1828	709	14
1829	709	11
1830	709	20
1831	711	18
1832	711	2
1833	711	14
1834	713	17
1835	713	17
1836	713	15
1837	713	21
1838	713	9
1839	714	4
1840	714	13
1841	715	17
1842	715	14
1843	715	8
1844	715	1
1845	715	6
1846	716	3
1847	716	4
1848	719	3
1849	719	12
1850	719	4
1851	719	18
1852	719	21
1853	721	9
1854	721	7
1855	722	3
1856	723	16
1857	723	13
1858	723	13
1859	724	19
1860	724	19
1861	725	13
1862	725	14
1863	725	14
1864	725	6
1865	726	5
1866	727	4
1867	727	18
1868	727	20
1869	727	21
1870	728	21
1871	728	0
1872	730	18
1873	730	10
1874	730	17
1875	730	17
1876	730	7
1877	731	9
1878	731	18
1879	732	14
1880	732	19
1881	732	12
1882	735	9
1883	735	6
1884	735	0
1885	735	5
1886	736	11
1887	736	19
1888	737	10
1889	737	8
1890	737	1
1891	737	18
1892	737	10
1893	738	20
1894	738	11
1895	738	20
1896	738	4
1897	738	9
1898	739	4
1899	739	6
1900	739	19
1901	740	13
1902	740	1
1903	741	8
1904	741	20
1905	741	6
1906	741	16
1907	741	6
1908	742	2
1909	742	5
1910	742	3
1911	743	13
1912	743	1
1913	743	16
1914	743	15
1915	744	3
1916	744	13
1917	744	19
1918	744	18
1919	745	0
1920	746	12
1921	746	2
1922	746	12
1923	746	5
1924	747	9
1925	747	16
1926	747	8
1927	747	18
1928	747	12
1929	749	13
1930	749	11
1931	749	20
1932	751	0
1933	751	12
1934	752	15
1935	753	16
1936	753	21
1937	754	5
1938	755	9
1939	755	8
1940	755	10
1941	755	14
1942	757	17
1943	757	17
1944	757	0
1945	758	19
1946	759	12
1947	759	12
1948	759	2
1949	761	8
1950	762	20
1951	762	17
1952	763	8
1953	764	12
1954	765	14
1955	765	3
1956	766	9
1957	766	13
1958	766	11
1959	767	2
1960	767	13
1961	768	0
1962	769	0
1963	769	16
1964	770	10
1965	770	9
1966	770	11
1967	770	3
1968	770	15
1969	771	11
1970	771	17
1971	771	0
1972	771	21
1973	772	2
1974	773	20
1975	773	6
1976	774	17
1977	774	0
1978	774	10
1979	774	3
1980	774	14
1981	775	12
1982	775	3
1983	775	16
1984	775	8
1985	775	9
1986	776	17
1987	776	18
1988	776	2
1989	776	18
1990	776	17
1991	777	4
1992	777	16
1993	778	21
1994	778	14
1995	780	12
1996	780	12
1997	780	3
1998	780	14
1999	781	18
2000	781	21
2001	781	2
2002	781	12
2003	781	12
2004	782	12
2005	783	5
2006	783	1
2007	784	11
2008	784	6
2009	784	13
2010	784	3
2011	784	5
2012	785	17
2013	785	11
2014	786	3
2015	786	13
2016	786	14
2017	786	11
2018	787	5
2019	787	7
2020	787	5
2021	787	1
2022	787	18
2023	789	3
2024	789	14
2025	789	9
2026	789	7
2027	790	11
2028	790	9
2029	790	16
2030	790	20
2031	791	6
2032	791	4
2033	791	6
2034	792	17
2035	792	0
2036	792	16
2037	792	19
2038	793	0
2039	795	6
2040	795	5
2041	795	7
2042	795	12
2043	797	15
2044	798	20
2045	798	13
2046	798	17
2047	799	15
2048	802	14
2049	802	13
2050	802	9
2051	802	13
2052	803	16
2053	803	2
2054	804	9
2055	804	1
2056	805	15
2057	805	1
2058	805	13
2059	807	18
2060	807	14
2061	807	21
2062	808	18
2063	808	10
2064	808	1
2065	808	19
2066	808	12
2067	809	0
2068	809	12
2069	809	13
2070	810	12
2071	811	16
2072	813	1
2073	813	17
2074	814	11
2075	815	18
2076	816	0
2077	816	9
2078	816	3
2079	817	14
2080	817	2
2081	817	2
2082	818	0
2083	818	19
2084	818	19
2085	818	15
2086	820	12
2087	821	9
2088	821	20
2089	821	15
2090	822	17
2091	822	13
2092	822	8
2093	822	21
2094	823	20
2095	824	16
2096	824	7
2097	824	16
2098	826	11
2099	826	19
2100	826	4
2101	826	18
2102	826	2
2103	827	7
2104	827	10
2105	827	17
2106	827	5
2107	828	8
2108	828	0
2109	829	2
2110	829	18
2111	829	1
2112	829	6
2113	829	16
2114	832	15
2115	832	19
2116	832	14
2117	832	13
2118	832	18
2119	834	20
2120	834	18
2121	834	16
2122	834	3
2123	835	19
2124	835	1
2125	835	4
2126	836	11
2127	836	16
2128	836	13
2129	837	2
2130	837	8
2131	837	5
2132	837	7
2133	838	14
2134	839	8
2135	839	1
2136	839	11
2137	839	6
2138	840	17
2139	840	5
2140	840	3
2141	841	18
2142	841	2
2143	843	4
2144	845	21
2145	845	1
2146	846	7
2147	846	7
2148	846	9
2149	846	17
2150	847	20
2151	847	5
2152	847	7
2153	847	3
2154	848	5
2155	848	0
2156	849	13
2157	849	4
2158	849	16
2159	850	18
2160	850	10
2161	850	12
2162	851	0
2163	852	19
2164	852	17
2165	852	3
2166	852	7
2167	852	8
2168	853	3
2169	853	19
2170	853	3
2171	854	4
2172	855	4
2173	855	9
2174	855	2
2175	855	8
2176	856	13
2177	856	10
2178	857	0
2179	857	9
2180	857	1
2181	857	21
2182	859	6
2183	859	8
2184	859	4
2185	860	8
2186	860	0
2187	860	9
2188	860	18
2189	860	20
2190	861	0
2191	861	21
2192	861	5
2193	861	0
2194	861	19
2195	863	6
2196	863	9
2197	863	6
2198	863	11
2199	864	15
2200	864	11
2201	864	3
2202	865	20
2203	865	16
2204	865	0
2205	866	9
2206	866	16
2207	866	21
2208	866	0
2209	867	3
2210	867	14
2211	867	16
2212	867	5
2213	868	0
2214	868	18
2215	868	8
2216	868	14
2217	868	20
2218	869	11
2219	869	6
2220	869	3
2221	869	16
2222	869	12
2223	870	3
2224	870	0
2225	872	21
2226	872	10
2227	873	6
2228	873	6
2229	873	4
2230	873	0
2231	873	10
2232	874	2
2233	874	18
2234	874	20
2235	874	11
2236	875	18
2237	875	7
2238	875	18
2239	875	19
2240	876	11
2241	876	5
2242	876	10
2243	877	12
2244	877	13
2245	877	15
2246	877	11
2247	878	3
2248	878	12
2249	878	7
2250	878	16
2251	879	9
2252	879	3
2253	879	0
2254	879	5
2255	879	14
2256	880	12
2257	880	3
2258	880	17
2259	880	19
2260	880	8
2261	881	9
2262	881	14
2263	882	15
2264	882	19
2265	882	11
2266	885	0
2267	885	14
2268	885	11
2269	885	15
2270	885	17
2271	886	14
2272	886	7
2273	886	13
2274	886	18
2275	886	9
2276	887	8
2277	888	7
2278	888	13
2279	888	16
2280	888	1
2281	889	6
2282	889	11
2283	889	13
2284	890	15
2285	891	1
2286	892	9
2287	892	4
2288	892	13
2289	892	9
2290	892	5
2291	893	6
2292	893	1
2293	893	15
2294	893	1
2295	894	6
2296	894	15
2297	894	15
2298	895	15
2299	895	2
2300	895	19
2301	895	9
2302	895	13
2303	898	0
2304	898	3
2305	898	12
2306	898	2
2307	898	20
2308	899	12
2309	899	14
2310	900	11
2311	900	10
2312	900	5
2313	900	11
2314	900	6
2315	901	8
2316	901	21
2317	905	6
2318	906	19
2319	908	11
2320	908	4
2321	909	19
2322	909	12
2323	909	4
2324	910	3
2325	910	17
2326	910	7
2327	911	20
2328	911	14
2329	911	6
2330	911	3
2331	912	5
2332	912	3
2333	913	11
2334	913	1
2335	913	16
2336	913	6
2337	914	20
2338	914	18
2339	914	18
2340	914	1
2341	914	12
2342	915	10
2343	915	10
2344	915	19
2345	916	9
2346	916	4
2347	916	1
2348	917	16
2349	917	17
2350	917	4
2351	918	18
2352	919	21
2353	919	15
2354	920	13
2355	920	4
2356	920	2
2357	921	0
2358	921	2
2359	921	11
2360	921	19
2361	922	9
2362	922	13
2363	922	11
2364	922	4
2365	923	1
2366	925	19
2367	925	20
2368	926	5
2369	926	14
2370	926	13
2371	926	13
2372	926	16
2373	927	16
2374	927	19
2375	928	19
2376	928	9
2377	928	0
2378	929	12
2379	929	9
2380	929	18
2381	930	1
2382	930	11
2383	930	7
2384	930	12
2385	931	15
2386	933	21
2387	933	0
2388	933	5
2389	934	5
2390	935	12
2391	935	9
2392	935	9
2393	935	11
2394	936	8
2395	936	10
2396	936	7
2397	937	14
2398	937	20
2399	939	11
2400	939	2
2401	939	1
2402	939	3
2403	939	17
2404	941	5
2405	941	15
2406	941	3
2407	941	16
2408	942	1
2409	942	20
2410	942	12
2411	942	12
2412	943	12
2413	944	10
2414	946	20
2415	946	12
2416	947	1
2417	947	1
2418	947	5
2419	948	6
2420	948	7
2421	949	15
2422	949	14
2423	949	11
2424	949	3
2425	949	17
2426	950	18
2427	951	21
2428	951	2
2429	953	21
2430	953	7
2431	953	2
2432	953	9
2433	953	17
2434	954	14
2435	954	10
2436	955	1
2437	955	4
2438	955	20
2439	955	2
2440	955	9
2441	956	14
2442	956	16
2443	956	12
2444	956	21
2445	959	12
2446	960	10
2447	961	9
2448	961	14
2449	961	13
2450	961	20
2451	961	2
2452	962	7
2453	963	21
2454	964	2
2455	965	12
2456	965	0
2457	965	13
2458	965	20
2459	966	6
2460	966	5
2461	966	4
2462	970	7
2463	971	20
2464	971	5
2465	972	20
2466	973	19
2467	973	0
2468	974	17
2469	974	0
2470	974	14
2471	974	2
2472	974	18
2473	975	8
2474	975	2
2475	975	12
2476	976	5
2477	976	7
2478	976	10
2479	976	13
2480	976	6
2481	977	3
2482	977	14
2483	977	20
2484	978	17
2485	978	4
2486	978	16
2487	980	7
2488	981	18
2489	981	21
2490	982	5
2491	983	7
2492	983	16
2493	983	17
2494	983	8
2495	983	10
2496	984	3
2497	984	20
2498	986	2
2499	986	8
2500	987	21
2501	987	11
2502	988	16
2503	988	7
2504	988	10
2505	989	6
2506	990	1
2507	991	3
2508	992	11
2509	992	1
2510	992	13
2511	993	6
2512	993	7
2513	993	17
2514	993	20
2515	993	14
2516	995	17
2517	995	17
2518	995	15
2519	995	8
2520	996	18
2521	996	16
2522	996	1
2523	996	12
2524	998	14
2525	998	0
2526	998	19
2527	999	19
2528	999	4
2529	1000	1
2530	1000	14
2531	1000	1
2532	1000	5
2533	1001	7
2534	1001	3
2535	1001	1
2536	1001	20
2537	1002	0
2538	1002	9
2539	1002	11
2540	1002	18
2541	1002	9
2542	1004	14
2543	1004	8
2544	1004	11
2545	1004	2
2546	1005	16
2547	1006	9
2548	1006	3
2549	1006	9
2550	1006	17
2551	1007	18
2552	1007	21
2553	1007	13
2554	1009	13
2555	1009	0
2556	1009	8
2557	1009	4
2558	1010	5
2559	1010	2
2560	1010	19
2561	1012	1
2562	1013	1
2563	1013	13
2564	1014	14
2565	1014	20
2566	1014	15
2567	1014	10
2568	1016	14
2569	1016	18
2570	1016	9
2571	1016	18
2572	1016	21
2573	1017	20
2574	1017	6
2575	1017	20
2576	1017	1
2577	1018	4
2578	1019	3
2579	1019	10
2580	1019	13
2581	1019	21
2582	1020	17
2583	1020	11
2584	1020	3
2585	1020	19
2586	1021	12
2587	1021	4
2588	1021	14
2589	1021	21
2590	1021	16
2591	1022	19
2592	1022	8
2593	1022	14
2594	1023	13
2595	1023	6
2596	1023	2
2597	1024	18
2598	1024	1
2599	1025	4
2600	1025	14
2601	1025	14
2602	1025	20
2603	1025	5
2604	1027	1
2605	1028	5
2606	1028	17
2607	1028	15
2608	1028	8
2609	1029	21
2610	1029	21
2611	1029	3
2612	1030	11
2613	1030	16
2614	1031	1
2615	1031	12
2616	1032	19
2617	1032	6
2618	1032	9
2619	1033	3
2620	1034	0
2621	1034	3
2622	1035	18
2623	1035	11
2624	1036	21
2625	1036	15
2626	1037	8
2627	1038	19
2628	1039	3
2629	1039	4
2630	1039	15
2631	1040	7
2632	1041	19
2633	1041	3
2634	1042	13
2635	1042	18
2636	1044	21
2637	1047	7
2638	1049	16
2639	1049	11
2640	1049	18
2641	1051	20
2642	1051	21
2643	1051	4
2644	1051	17
2645	1052	6
2646	1052	2
2647	1054	0
2648	1054	18
2649	1055	11
2650	1055	4
2651	1057	15
2652	1057	3
2653	1057	15
2654	1057	12
2655	1058	18
2656	1059	10
2657	1059	9
2658	1059	2
2659	1059	16
2660	1060	7
2661	1061	18
2662	1061	13
2663	1061	3
2664	1061	5
2665	1062	12
2666	1064	3
2667	1065	21
2668	1065	5
2669	1065	16
2670	1065	16
2671	1066	21
2672	1066	6
2673	1066	19
2674	1066	11
2675	1066	17
2676	1067	20
2677	1067	11
2678	1067	14
2679	1067	10
2680	1067	2
2681	1068	4
2682	1068	12
2683	1068	15
2684	1068	20
2685	1070	19
2686	1071	9
2687	1071	21
2688	1071	15
2689	1071	15
2690	1071	21
2691	1072	19
2692	1073	19
2693	1073	4
2694	1073	4
2695	1074	0
2696	1074	18
2697	1074	2
2698	1074	10
2699	1075	13
2700	1075	21
2701	1076	19
2702	1076	20
2703	1076	19
2704	1077	19
2705	1077	21
2706	1077	19
2707	1077	3
2708	1078	1
2709	1078	20
2710	1078	19
2711	1079	7
2712	1079	12
2713	1079	9
2714	1079	10
2715	1079	20
2716	1080	21
2717	1080	2
2718	1081	2
2719	1081	8
2720	1081	0
2721	1082	18
2722	1082	19
2723	1082	11
2724	1082	14
2725	1083	17
2726	1083	0
2727	1083	13
2728	1083	18
2729	1084	8
2730	1084	4
2731	1084	20
2732	1084	12
2733	1084	17
2734	1085	11
2735	1086	16
2736	1087	14
2737	1087	7
2738	1088	1
2739	1088	15
2740	1088	11
2741	1088	3
2742	1088	11
2743	1089	13
2744	1089	21
2745	1089	6
2746	1089	6
2747	1089	10
2748	1090	17
2749	1090	11
2750	1091	6
2751	1091	16
2752	1091	18
2753	1091	17
2754	1091	14
2755	1092	14
2756	1092	17
2757	1092	16
2758	1093	0
2759	1094	8
2760	1094	10
2761	1094	6
2762	1094	10
2763	1095	14
2764	1095	19
2765	1096	3
2766	1096	15
2767	1096	14
2768	1096	12
2769	1097	14
2770	1097	15
2771	1097	12
2772	1097	4
2773	1097	20
2774	1098	0
2775	1098	11
2776	1098	11
2777	1098	10
2778	1099	17
2779	1099	20
2780	1099	8
2781	1099	3
2782	1101	8
2783	1101	5
2784	1101	5
2785	1101	12
2786	1101	19
2787	1102	17
2788	1102	2
2789	1102	5
2790	1104	14
2791	1104	15
2792	1106	8
2793	1106	7
2794	1106	15
2795	1107	4
2796	1108	20
2797	1108	21
2798	1108	6
2799	1109	9
2800	1109	1
2801	1109	16
2802	1109	3
2803	1109	18
2804	1110	6
2805	1110	21
2806	1110	14
2807	1111	2
2808	1111	7
2809	1111	19
2810	1111	19
2811	1112	10
2812	1112	7
2813	1112	3
2814	1112	18
2815	1113	6
2816	1113	4
2817	1116	9
2818	1116	5
2819	1116	7
2820	1117	14
2821	1117	6
2822	1117	15
2823	1118	4
2824	1118	15
2825	1120	13
2826	1120	14
2827	1120	9
2828	1120	18
2829	1120	2
2830	1121	2
2831	1121	20
2832	1121	20
2833	1122	16
2834	1123	13
2835	1123	1
2836	1123	21
2837	1123	9
2838	1125	9
2839	1125	7
2840	1125	7
2841	1125	10
2842	1125	13
2843	1126	4
2844	1126	16
2845	1126	8
2846	1126	12
2847	1126	9
2848	1128	2
2849	1129	12
2850	1129	4
2851	1129	18
2852	1129	17
2853	1129	11
2854	1130	0
2855	1130	9
2856	1131	16
2857	1131	1
2858	1131	19
2859	1131	19
2860	1131	8
2861	1132	20
2862	1132	7
2863	1132	0
2864	1132	18
2865	1132	16
2866	1133	13
2867	1133	17
2868	1133	14
2869	1134	17
2870	1134	17
2871	1135	0
2872	1135	1
2873	1135	5
2874	1135	21
2875	1135	8
2876	1136	0
2877	1137	11
2878	1137	8
2879	1138	20
2880	1139	6
2881	1139	15
2882	1139	8
2883	1139	12
2884	1140	14
2885	1140	10
2886	1140	8
2887	1140	4
2888	1140	13
2889	1141	18
2890	1142	9
2891	1142	17
2892	1143	5
2893	1144	13
2894	1145	19
2895	1145	15
2896	1146	21
2897	1146	16
2898	1147	1
2899	1147	1
2900	1148	15
2901	1148	11
2902	1148	20
2903	1149	2
2904	1149	10
2905	1149	11
2906	1149	2
2907	1149	3
2908	1150	11
2909	1150	2
2910	1150	5
2911	1151	16
2912	1151	18
2913	1151	16
2914	1151	2
2915	1152	13
2916	1152	15
2917	1153	9
2918	1153	5
2919	1154	13
2920	1155	12
2921	1157	18
2922	1157	0
2923	1157	3
2924	1157	17
2925	1157	17
2926	1158	7
2927	1158	11
2928	1158	5
2929	1159	21
2930	1160	1
2931	1161	16
2932	1161	14
2933	1163	18
2934	1163	17
2935	1163	5
2936	1164	10
2937	1164	7
2938	1165	11
2939	1165	12
2940	1165	17
2941	1165	20
2942	1165	10
2943	1166	17
2944	1166	5
2945	1166	2
2946	1167	5
2947	1168	13
2948	1168	5
2949	1169	5
2950	1170	21
2951	1170	7
2952	1170	17
2953	1171	21
2954	1171	0
2955	1171	9
2956	1172	2
2957	1172	12
2958	1173	14
2959	1173	11
2960	1173	4
2961	1173	19
2962	1173	8
2963	1174	21
2964	1175	6
2965	1175	17
2966	1175	13
2967	1176	2
2968	1176	10
2969	1176	3
2970	1176	16
2971	1176	15
2972	1178	11
2973	1178	9
2974	1178	20
2975	1178	8
2976	1179	17
2977	1180	3
2978	1180	7
2979	1180	21
2980	1181	12
2981	1181	13
2982	1181	16
2983	1182	7
2984	1182	11
2985	1182	20
2986	1183	18
2987	1183	16
2988	1184	3
2989	1184	3
2990	1185	4
2991	1185	17
2992	1185	7
2993	1186	1
2994	1186	0
2995	1186	3
2996	1186	9
2997	1188	19
2998	1188	0
2999	1188	19
3000	1188	3
3001	1188	4
3002	1189	18
3003	1189	14
3004	1189	5
3005	1189	13
3006	1190	12
3007	1190	14
3008	1190	19
3009	1190	3
3010	1191	3
3011	1191	4
3012	1191	18
3013	1191	7
3014	1191	9
3015	1194	6
3016	1194	16
3017	1194	19
3018	1194	12
3019	1194	14
3020	1195	20
3021	1195	16
3022	1195	10
3023	1195	1
3024	1196	17
3025	1196	20
3026	1196	2
3027	1196	13
3028	1197	12
3029	1197	0
3030	1197	20
3031	1197	20
3032	1197	2
3033	1199	8
3034	1200	21
3035	1203	9
3036	1203	13
3037	1203	13
3038	1203	17
3039	1203	16
3040	1204	10
3041	1204	13
3042	1206	10
3043	1206	7
3044	1206	21
3045	1206	10
3046	1206	13
3047	1207	5
3048	1207	15
3049	1207	8
3050	1207	18
3051	1207	12
3052	1208	5
3053	1209	7
3054	1209	4
3055	1209	6
3056	1209	0
3057	1210	18
3058	1210	3
3059	1211	15
3060	1211	20
3061	1211	17
3062	1211	1
3063	1211	15
3064	1212	21
3065	1212	12
3066	1212	11
3067	1212	6
3068	1214	9
3069	1214	16
3070	1214	19
3071	1215	3
3072	1215	16
3073	1215	5
3074	1215	0
3075	1215	17
3076	1216	7
3077	1216	0
3078	1216	7
3079	1216	9
3080	1218	10
3081	1218	2
3082	1218	18
3083	1219	4
3084	1219	16
3085	1219	12
3086	1219	12
3087	1219	19
3088	1220	1
3089	1220	16
3090	1220	12
3091	1220	5
3092	1221	6
3093	1222	18
3094	1222	15
3095	1222	9
3096	1222	1
3097	1223	6
3098	1225	11
3099	1225	3
3100	1225	14
3101	1225	14
3102	1226	15
3103	1227	13
3104	1229	15
3105	1229	14
3106	1229	14
3107	1230	12
3108	1230	10
3109	1231	18
3110	1231	5
3111	1231	3
3112	1232	13
3113	1232	1
3114	1232	11
3115	1233	4
3116	1233	10
3117	1233	6
3118	1233	7
3119	1233	19
3120	1234	20
3121	1235	9
3122	1235	2
3123	1236	0
3124	1236	1
3125	1237	4
3126	1237	6
3127	1238	15
3128	1238	2
3129	1238	8
3130	1239	15
3131	1239	16
3132	1240	10
3133	1240	7
3134	1241	12
3135	1241	19
3136	1241	0
3137	1241	4
3138	1242	12
3139	1242	19
3140	1242	9
3141	1242	10
3142	1243	3
3143	1243	1
3144	1243	1
3145	1243	12
3146	1243	2
3147	1244	7
3148	1244	4
3149	1244	12
3150	1244	4
3151	1244	6
3152	1245	20
3153	1246	5
3154	1248	16
3155	1248	4
3156	1248	3
3157	1249	4
3158	1249	1
3159	1250	18
3160	1251	8
3161	1251	6
3162	1251	7
3163	1251	4
3164	1252	3
3165	1252	9
3166	1252	13
3167	1252	20
3168	1253	16
3169	1254	14
3170	1254	11
3171	1255	8
3172	1255	12
3173	1255	12
3174	1256	18
3175	1256	1
3176	1257	1
3177	1257	0
3178	1257	20
3179	1259	13
3180	1259	11
3181	1261	4
3182	1262	17
3183	1262	2
3184	1262	5
3185	1262	20
3186	1263	18
3187	1263	19
3188	1264	1
3189	1264	5
3190	1264	9
3191	1264	2
3192	1264	5
3193	1265	9
3194	1266	1
3195	1266	10
3196	1266	7
3197	1267	12
3198	1267	5
3199	1267	2
3200	1269	16
3201	1270	1
3202	1270	13
3203	1272	1
3204	1272	19
3205	1273	13
3206	1273	0
3207	1273	10
3208	1273	15
3209	1273	1
3210	1274	20
3211	1274	5
3212	1276	3
3213	1277	8
3214	1277	19
3215	1277	20
3216	1278	0
3217	1278	8
3218	1278	10
3219	1278	14
3220	1278	7
3221	1279	6
3222	1279	3
3223	1279	0
3224	1280	17
3225	1280	16
3226	1280	13
3227	1281	6
3228	1281	18
3229	1282	6
3230	1282	16
3231	1282	14
3232	1283	4
3233	1283	19
3234	1283	14
3235	1284	12
3236	1284	13
3237	1285	6
3238	1285	1
3239	1285	3
3240	1286	17
3241	1286	2
3242	1287	21
3243	1287	21
3244	1287	3
3245	1287	7
3246	1288	6
3247	1289	2
3248	1289	17
3249	1289	15
3250	1289	2
3251	1289	19
3252	1290	17
3253	1290	18
3254	1290	17
3255	1290	15
3256	1290	18
3257	1291	3
3258	1291	12
3259	1291	21
3260	1291	6
3261	1294	0
3262	1294	14
3263	1294	8
3264	1296	5
3265	1297	6
3266	1297	3
3267	1297	3
3268	1299	17
3269	1299	8
3270	1300	7
3271	1300	14
3272	1301	16
3273	1301	13
3274	1301	1
3275	1301	2
3276	1301	15
3277	1303	11
3278	1304	17
3279	1304	13
3280	1304	13
3281	1304	21
3282	1304	20
3283	1305	4
3284	1305	14
3285	1305	18
3286	1305	0
3287	1305	16
3288	1306	20
3289	1306	2
3290	1306	12
3291	1306	17
3292	1306	10
3293	1307	20
3294	1307	12
3295	1307	3
3296	1307	0
3297	1309	10
3298	1309	12
3299	1309	6
3300	1310	5
3301	1310	0
3302	1310	12
3303	1310	8
3304	1311	19
3305	1311	5
3306	1311	19
3307	1311	15
3308	1312	13
3309	1313	20
3310	1313	0
3311	1313	5
3312	1314	15
3313	1314	4
3314	1314	0
3315	1314	8
3316	1314	11
3317	1316	14
3318	1319	18
3319	1319	20
3320	1320	20
3321	1320	20
3322	1320	4
3323	1320	20
3324	1320	17
3325	1321	5
3326	1321	19
3327	1321	10
3328	1321	21
3329	1321	16
3330	1322	13
3331	1323	7
3332	1323	3
3333	1323	8
3334	1324	5
3335	1324	13
3336	1324	19
3337	1325	17
3338	1325	0
3339	1325	0
3340	1325	16
3341	1326	2
3342	1326	8
3343	1326	18
3344	1327	21
3345	1327	1
3346	1327	7
3347	1327	0
3348	1329	16
3349	1329	12
3350	1329	8
3351	1329	11
3352	1329	3
3353	1331	14
3354	1331	21
3355	1331	10
3356	1331	8
3357	1333	6
3358	1334	21
3359	1334	8
3360	1334	0
3361	1335	20
3362	1335	21
3363	1335	18
3364	1335	17
3365	1335	14
3366	1336	7
3367	1336	7
3368	1337	4
3369	1337	4
3370	1337	17
3371	1337	10
3372	1338	6
3373	1339	2
3374	1340	0
3375	1340	8
3376	1340	2
3377	1340	14
3378	1341	11
3379	1341	10
3380	1342	15
3381	1342	15
3382	1342	9
3383	1342	0
3384	1343	17
3385	1343	0
3386	1343	11
3387	1343	16
3388	1343	19
3389	1345	18
3390	1346	7
3391	1346	20
3392	1347	16
3393	1347	4
3394	1347	3
3395	1348	19
3396	1348	17
3397	1348	18
3398	1350	15
3399	1351	15
3400	1351	3
3401	1351	6
3402	1351	8
3403	1351	17
3404	1352	4
3405	1354	18
3406	1354	9
3407	1354	10
3408	1354	17
3409	1355	2
3410	1356	15
3411	1356	1
3412	1357	3
3413	1357	8
3414	1357	13
3415	1357	15
3416	1357	1
3417	1359	21
3418	1361	11
3419	1361	14
3420	1362	20
3421	1362	17
3422	1363	5
3423	1363	4
3424	1363	0
3425	1363	13
3426	1363	3
3427	1365	21
3428	1367	14
3429	1367	0
3430	1368	21
3431	1369	18
3432	1369	2
3433	1370	19
3434	1370	8
3435	1370	11
3436	1371	12
3437	1371	11
3438	1371	13
3439	1371	12
3440	1373	4
3441	1373	15
3442	1374	8
3443	1375	11
3444	1376	14
3445	1376	2
3446	1376	11
3447	1377	16
3448	1377	12
3449	1378	14
3450	1379	20
3451	1379	21
3452	1379	5
3453	1379	0
3454	1380	6
3455	1380	4
3456	1380	5
3457	1380	21
3458	1381	4
3459	1382	13
3460	1382	10
3461	1383	19
3462	1383	5
3463	1383	15
3464	1383	12
3465	1383	12
3466	1385	17
3467	1385	12
3468	1385	4
3469	1385	2
3470	1385	14
3471	1387	15
3472	1387	8
3473	1387	14
3474	1388	1
3475	1388	2
3476	1388	5
3477	1388	5
3478	1389	6
3479	1389	15
3480	1389	0
3481	1389	18
3482	1389	8
3483	1390	17
3484	1390	19
3485	1390	19
3486	1390	0
3487	1390	6
3488	1391	2
3489	1393	10
3490	1393	9
3491	1394	6
3492	1396	5
3493	1397	20
3494	1398	9
3495	1398	14
3496	1398	6
3497	1398	7
3498	1398	0
3499	1399	20
3500	1400	7
3501	1401	3
3502	1401	13
3503	1402	14
3504	1403	5
3505	1403	19
3506	1403	8
3507	1403	10
3508	1404	10
3509	1405	20
3510	1405	10
3511	1405	4
3512	1406	11
3513	1406	0
3514	1406	5
3515	1407	10
3516	1408	5
3517	1408	21
3518	1408	16
3519	1409	3
3520	1410	19
3521	1410	9
3522	1412	10
3523	1412	12
3524	1413	21
3525	1413	1
3526	1414	16
3527	1415	12
3528	1416	21
3529	1416	12
3530	1416	5
3531	1417	9
3532	1417	3
3533	1417	8
3534	1417	19
3535	1417	8
3536	1418	17
3537	1418	6
3538	1419	15
3539	1419	6
3540	1419	11
3541	1419	9
3542	1419	7
3543	1420	15
3544	1420	13
3545	1421	7
3546	1422	7
3547	1422	2
3548	1422	10
3549	1422	2
3550	1422	11
3551	1423	3
3552	1423	16
3553	1423	14
3554	1424	5
3555	1428	19
3556	1428	12
3557	1428	2
3558	1430	1
3559	1430	18
3560	1430	17
3561	1432	1
3562	1432	18
3563	1433	8
3564	1433	7
3565	1433	1
3566	1434	4
3567	1434	18
3568	1434	14
3569	1434	21
3570	1435	9
3571	1437	1
3572	1439	15
3573	1440	3
3574	1440	0
3575	1440	2
3576	1440	6
3577	1441	10
3578	1441	6
3579	1441	17
3580	1441	15
3581	1441	10
3582	1442	16
3583	1442	10
3584	1442	4
3585	1444	17
3586	1444	12
3587	1444	20
3588	1444	21
3589	1445	3
3590	1445	0
3591	1445	13
3592	1446	14
3593	1446	0
3594	1446	14
3595	1446	7
3596	1446	14
3597	1447	12
3598	1447	17
3599	1447	15
3600	1448	8
3601	1448	10
3602	1448	2
3603	1449	10
3604	1450	6
3605	1451	9
3606	1451	19
3607	1451	3
3608	1452	7
3609	1453	4
3610	1453	15
3611	1453	15
3612	1453	13
3613	1456	16
3614	1456	11
3615	1456	8
3616	1457	12
3617	1457	9
3618	1457	2
3619	1457	17
3620	1457	14
3621	1458	15
3622	1458	16
3623	1460	2
3624	1461	19
3625	1461	0
3626	1461	3
3627	1461	8
3628	1462	9
3629	1462	5
3630	1463	13
3631	1463	6
3632	1463	16
3633	1463	15
3634	1463	6
3635	1464	21
3636	1464	12
3637	1464	1
3638	1464	1
3639	1465	6
3640	1466	4
3641	1466	8
3642	1466	7
3643	1466	2
3644	1467	6
3645	1467	4
3646	1467	19
3647	1467	21
3648	1468	11
3649	1468	3
3650	1469	14
3651	1469	6
3652	1469	11
3653	1469	0
3654	1471	8
3655	1472	4
3656	1472	6
3657	1472	21
3658	1472	10
3659	1473	3
3660	1473	20
3661	1473	15
3662	1473	14
3663	1475	6
3664	1475	12
3665	1477	21
3666	1477	18
3667	1478	1
3668	1478	8
3669	1479	13
3670	1479	2
3671	1479	19
3672	1480	14
3673	1480	5
3674	1480	6
3675	1482	3
3676	1482	8
3677	1482	20
3678	1482	19
3679	1483	12
3680	1483	8
3681	1483	4
3682	1483	11
3683	1483	10
3684	1484	7
3685	1484	1
3686	1485	21
3687	1485	2
3688	1485	6
3689	1485	3
3690	1485	12
3691	1486	19
3692	1486	20
3693	1486	10
3694	1486	18
3695	1486	15
3696	1487	17
3697	1487	16
3698	1487	6
3699	1487	18
3700	1488	13
3701	1488	14
3702	1490	15
3703	1490	11
3704	1490	3
3705	1490	6
3706	1491	14
3707	1491	21
3708	1492	0
3709	1492	18
3710	1493	10
3711	1494	21
3712	1494	0
3713	1494	8
3714	1494	16
3715	1495	9
3716	1495	17
3717	1495	16
3718	1495	3
3719	1496	5
3720	1496	16
3721	1497	19
3722	1497	21
3723	1497	1
3724	1497	12
3725	1497	9
3726	1499	15
3727	1499	1
3728	1500	14
3729	1500	13
3730	1500	9
3731	1500	10
3732	1500	11
3733	1501	19
3734	1501	4
3735	1501	20
3736	1501	19
3737	1501	4
3738	1502	19
3739	1502	9
3740	1502	5
3741	1502	14
3742	1502	16
3743	1503	2
3744	1503	16
3745	1504	21
3746	1505	15
3747	1505	21
3748	1505	7
3749	1505	6
3750	1505	0
3751	1506	6
3752	1506	17
3753	1506	16
3754	1506	2
3755	1506	7
3756	1507	8
3757	1507	21
3758	1508	13
3759	1508	21
3760	1508	1
3761	1508	21
3762	1508	16
3763	1509	12
3764	1510	19
3765	1511	8
3766	1511	11
3767	1512	4
3768	1513	2
3769	1513	21
3770	1514	11
3771	1514	2
3772	1514	4
3773	1514	14
3774	1514	5
3775	1515	4
3776	1515	3
3777	1516	20
3778	1516	11
3779	1516	19
3780	1516	10
3781	1516	11
3782	1517	9
3783	1518	13
3784	1519	1
3785	1519	12
3786	1519	21
3787	1519	20
3788	1520	13
3789	1521	16
3790	1523	0
3791	1524	9
3792	1524	18
3793	1524	9
3794	1524	4
3795	1525	3
3796	1525	3
3797	1525	10
3798	1525	11
3799	1526	2
3800	1526	13
3801	1526	14
3802	1527	16
3803	1527	2
3804	1527	5
3805	1527	19
3806	1528	13
3807	1528	20
3808	1531	7
3809	1531	7
3810	1531	1
3811	1532	1
3812	1533	15
3813	1533	17
3814	1533	4
3815	1534	4
3816	1536	20
3817	1536	9
3818	1536	9
3819	1536	11
3820	1537	19
3821	1537	20
3822	1537	17
3823	1538	12
3824	1539	4
3825	1539	18
3826	1539	11
3827	1539	8
3828	1540	11
3829	1540	10
3830	1540	20
3831	1541	2
3832	1541	17
3833	1543	9
3834	1543	3
3835	1543	8
3836	1543	18
3837	1544	13
3838	1544	8
3839	1544	10
3840	1544	15
3841	1545	4
3842	1546	14
3843	1546	14
3844	1547	5
3845	1547	19
3846	1547	2
3847	1548	16
3848	1548	17
3849	1548	11
3850	1548	20
3851	1548	8
3852	1549	13
3853	1549	9
3854	1549	21
3855	1549	13
3856	1550	10
3857	1550	0
3858	1550	11
3859	1551	19
3860	1551	17
3861	1551	19
3862	1551	5
3863	1552	6
3864	1553	20
3865	1553	13
3866	1553	17
3867	1553	14
3868	1553	10
3869	1554	18
3870	1555	16
3871	1555	5
3872	1556	12
3873	1556	8
3874	1556	5
3875	1556	18
3876	1557	5
3877	1557	4
3878	1557	18
3879	1557	4
3880	1558	1
3881	1558	4
3882	1558	18
3883	1558	1
3884	1559	19
3885	1560	5
3886	1561	0
3887	1561	0
3888	1561	8
3889	1561	7
3890	1561	17
3891	1563	7
3892	1563	7
3893	1564	0
3894	1564	8
3895	1565	21
3896	1565	1
3897	1567	15
3898	1567	11
3899	1567	13
3900	1567	9
3901	1567	14
3902	1569	19
3903	1569	3
3904	1571	3
3905	1571	12
3906	1571	6
3907	1572	8
3908	1572	0
3909	1572	12
3910	1572	4
3911	1573	8
3912	1573	14
3913	1573	12
3914	1573	20
3915	1573	17
3916	1574	8
3917	1574	20
3918	1574	1
3919	1575	11
3920	1576	16
3921	1577	17
3922	1577	6
3923	1577	16
3924	1577	15
3925	1577	1
3926	1578	7
3927	1578	20
3928	1579	15
3929	1579	15
3930	1579	21
3931	1580	15
3932	1580	3
3933	1580	15
3934	1581	20
3935	1582	14
3936	1582	2
3937	1582	1
3938	1582	19
3939	1583	4
3940	1584	15
3941	1584	8
3942	1584	7
3943	1584	9
3944	1586	10
3945	1586	18
3946	1588	12
3947	1588	8
3948	1588	3
3949	1588	12
3950	1588	15
3951	1589	0
3952	1589	12
3953	1589	21
3954	1589	5
3955	1590	11
3956	1590	11
3957	1590	11
3958	1590	3
3959	1591	6
3960	1591	0
3961	1591	12
3962	1591	11
3963	1591	10
3964	1593	9
3965	1593	10
3966	1593	0
3967	1593	16
3968	1593	13
3969	1594	10
3970	1594	19
3971	1594	9
3972	1594	15
3973	1595	15
3974	1595	12
3975	1596	12
3976	1596	4
3977	1596	4
3978	1596	8
3979	1597	4
3980	1597	9
3981	1597	20
3982	1598	19
3983	1598	2
3984	1598	17
3985	1598	0
3986	1599	1
3987	1599	11
3988	1600	12
\.


--
-- Data for Name: referal; Type: TABLE DATA; Schema: public; Owner: -
--

COPY referal (id, client_id, referal_id) FROM stdin;
1	1	2
2	1	3
3	1	3
4	1	12
5	2	6
6	2	8
7	2	3
8	2	0
9	3	3
10	3	4
11	3	8
12	3	3
13	4	10
14	4	4
15	5	5
16	5	4
17	6	10
18	7	7
19	8	11
20	10	7
21	10	0
22	10	8
23	11	1
24	12	3
25	12	7
26	12	7
27	12	10
28	12	1
29	13	11
30	13	10
31	13	9
32	14	11
33	14	0
34	14	3
35	14	10
36	14	8
37	15	2
38	15	11
39	15	7
40	15	2
41	15	2
42	16	12
43	16	3
44	17	1
45	17	1
46	17	10
47	17	8
48	18	7
49	18	12
50	18	3
51	18	7
52	19	8
53	20	4
54	20	3
55	20	8
56	20	9
57	20	12
58	21	0
59	21	10
60	21	6
61	21	8
62	22	9
63	22	4
64	22	10
65	23	6
66	23	9
67	24	4
68	24	12
69	24	2
70	24	12
71	25	0
72	25	4
73	25	10
74	25	8
75	25	10
76	26	5
77	26	4
78	26	0
79	26	10
80	28	1
81	28	5
82	28	9
83	29	8
84	29	2
85	29	8
86	29	11
87	29	7
88	30	1
89	30	5
90	30	4
91	31	8
92	32	10
93	32	0
94	33	2
95	33	11
96	34	11
97	34	1
98	34	1
99	34	10
100	35	10
101	35	10
102	36	2
103	36	11
104	36	6
105	36	8
106	36	9
107	37	12
108	37	4
109	38	11
110	38	9
111	38	12
112	38	8
113	38	0
114	39	10
115	39	11
116	39	8
117	39	3
118	40	3
119	41	6
120	42	12
121	42	3
122	42	2
123	42	7
124	43	10
125	43	0
126	43	3
127	43	12
128	43	3
129	44	5
130	44	8
131	44	7
132	44	1
133	45	3
134	45	10
135	45	1
136	47	10
137	47	11
138	47	7
139	47	9
140	50	6
141	50	1
142	51	2
143	51	8
144	51	7
145	51	2
146	51	12
147	52	4
148	52	7
149	52	2
150	53	3
151	54	3
152	55	8
153	55	11
154	56	5
155	58	7
156	58	11
157	58	10
158	58	10
159	58	9
160	59	1
161	59	10
162	59	0
163	60	9
164	60	1
165	61	2
166	61	12
167	61	12
168	61	10
169	62	4
170	62	11
171	63	7
172	63	1
173	63	1
174	63	4
175	63	9
176	65	10
177	65	5
178	65	7
179	67	9
180	68	12
181	69	10
182	69	0
183	69	0
184	69	4
185	70	10
186	70	8
187	70	9
188	70	8
189	71	1
190	71	5
191	72	10
192	72	0
193	72	5
194	72	10
195	72	2
196	73	11
197	73	5
198	73	8
199	73	7
200	73	6
201	74	2
202	74	9
203	74	6
204	74	10
205	74	8
206	75	12
207	75	4
208	75	10
209	75	0
210	75	11
211	76	10
212	76	11
213	77	9
214	77	1
215	77	3
216	77	2
217	78	5
218	78	4
219	78	2
220	79	8
221	79	2
222	79	1
223	79	2
224	80	11
225	81	5
226	81	0
227	81	1
228	81	3
229	81	4
230	82	1
231	84	9
232	84	8
233	84	12
234	85	10
235	85	10
236	86	4
237	86	9
238	86	12
239	86	10
240	86	7
241	87	1
242	88	7
243	88	3
244	88	0
245	89	4
246	91	8
247	91	6
248	91	4
249	91	9
250	92	6
251	92	12
252	93	10
253	93	4
254	95	1
255	95	3
256	95	6
257	95	4
258	95	9
259	97	9
260	98	8
261	99	3
262	99	3
263	99	7
264	99	10
265	100	5
266	100	2
267	100	8
268	101	3
269	101	10
270	101	1
271	101	8
272	102	3
273	102	4
274	102	8
275	103	0
276	103	7
277	104	8
278	104	1
279	104	4
280	104	4
281	104	6
282	105	10
283	105	11
284	105	8
285	105	8
286	106	7
287	107	0
288	107	8
289	108	10
290	109	11
291	109	2
292	110	11
293	110	5
294	110	3
295	110	11
296	110	9
297	111	1
298	112	4
299	113	7
300	113	8
301	113	1
302	113	2
303	113	5
304	114	1
305	114	12
306	114	10
307	114	5
308	114	5
309	115	8
310	115	0
311	115	1
312	115	2
313	116	3
314	116	5
315	116	6
316	116	6
317	120	3
318	120	11
319	120	5
320	120	7
321	120	1
322	121	8
323	121	11
324	122	3
325	122	3
326	123	1
327	123	9
328	127	4
329	128	9
330	128	4
331	128	1
332	128	12
333	128	5
334	129	3
335	129	12
336	129	2
337	129	6
338	129	1
339	130	7
340	130	5
341	130	11
342	130	7
343	130	1
344	133	6
345	133	12
346	133	0
347	133	2
348	133	1
349	134	11
350	135	9
351	135	10
352	135	6
353	136	8
354	136	7
355	137	4
356	138	1
357	138	7
358	141	12
359	141	6
360	141	0
361	142	3
362	142	12
363	142	6
364	143	2
365	143	7
366	144	11
367	144	4
368	144	4
369	144	11
370	144	4
371	146	1
372	146	5
373	146	4
374	147	1
375	147	2
376	149	6
377	149	4
378	150	0
379	150	10
380	150	3
381	151	5
382	151	1
383	152	8
384	152	1
385	153	0
386	153	11
387	154	10
388	154	4
389	154	8
390	154	1
391	154	4
392	155	10
393	155	9
394	155	5
395	155	2
396	156	7
397	156	4
398	156	8
399	157	3
400	158	0
401	158	0
402	158	7
403	158	0
404	159	4
405	159	4
406	160	10
407	160	9
408	160	3
409	161	6
410	161	4
411	161	0
412	161	0
413	162	11
414	162	8
415	162	10
416	163	2
417	163	7
418	163	2
419	163	2
420	164	9
421	165	12
422	165	7
423	165	7
424	166	0
425	166	12
426	166	9
427	166	1
428	166	11
429	167	7
430	167	5
431	168	0
432	169	1
433	169	2
434	170	12
435	170	9
436	171	5
437	171	9
438	171	1
439	171	1
440	172	7
441	172	5
442	172	11
443	172	7
444	172	2
445	173	2
446	173	0
447	173	10
448	173	9
449	173	5
450	174	3
451	174	8
452	174	6
453	174	7
454	175	4
455	175	11
456	175	8
457	175	2
458	176	7
459	176	6
460	176	2
461	176	11
462	178	2
463	179	3
464	179	2
465	179	0
466	180	7
467	181	6
468	181	11
469	181	6
470	181	7
471	183	12
472	183	12
473	183	5
474	183	10
475	183	7
476	184	9
477	184	12
478	186	6
479	186	5
480	188	2
481	189	11
482	189	7
483	189	10
484	189	3
485	189	6
486	190	8
487	193	12
488	193	6
489	193	10
490	193	0
491	194	1
492	194	12
493	194	8
494	194	7
495	195	2
496	195	4
497	197	5
498	197	5
499	197	1
500	198	8
501	198	8
502	198	7
503	198	0
504	199	12
505	200	4
506	200	7
507	200	5
508	200	4
509	202	12
510	202	0
511	202	11
512	204	4
513	204	0
514	206	3
515	206	9
516	207	10
517	208	9
518	208	3
519	208	8
520	208	12
521	209	3
522	209	3
523	209	3
524	210	0
525	210	11
526	210	0
527	210	6
528	210	1
529	211	7
530	211	9
531	211	3
532	212	3
533	213	7
534	213	0
535	213	9
536	213	5
537	213	3
538	214	0
539	214	12
540	214	10
541	215	2
542	215	11
543	216	2
544	217	0
545	218	3
546	218	2
547	219	0
548	219	1
549	219	9
550	219	8
551	219	1
552	221	1
553	223	8
554	223	1
555	224	4
556	224	7
557	224	11
558	224	1
559	224	6
560	225	2
561	225	10
562	225	11
563	225	10
564	225	1
565	226	0
566	226	11
567	226	1
568	227	11
569	227	4
570	227	7
571	228	6
572	230	9
573	230	1
574	230	3
575	231	3
576	232	2
577	232	11
578	232	12
579	233	11
580	233	6
581	234	10
582	234	6
583	234	3
584	234	9
585	234	7
586	235	1
587	236	4
588	236	7
589	236	9
590	237	7
591	237	10
592	239	9
593	239	3
594	240	10
595	240	6
596	240	7
597	241	1
598	241	0
599	241	4
600	241	5
601	242	8
602	242	0
603	242	7
604	242	0
605	242	6
606	243	4
607	243	12
608	243	10
609	244	6
610	245	7
611	245	8
612	245	12
613	245	12
614	245	12
615	246	4
616	247	3
617	249	5
618	250	3
619	251	9
620	252	7
621	252	7
622	252	3
623	254	10
624	257	1
625	257	6
626	257	11
627	258	4
628	258	6
629	258	7
630	259	12
631	259	7
632	259	10
633	259	11
634	260	2
635	260	3
636	261	5
637	261	10
638	262	2
639	262	7
640	262	4
641	263	4
642	263	5
643	263	10
644	263	7
645	264	0
646	264	5
647	264	3
648	265	8
649	265	10
650	265	11
651	265	4
652	265	11
653	267	0
654	267	0
655	267	2
656	267	4
657	267	9
658	268	3
659	268	12
660	268	7
661	270	8
662	271	3
663	272	11
664	273	2
665	273	2
666	273	1
667	274	3
668	275	0
669	277	1
670	277	9
671	278	12
672	279	5
673	279	1
674	279	1
675	279	6
676	279	3
677	280	4
678	281	4
679	281	11
680	281	0
681	282	10
682	282	12
683	282	7
684	282	7
685	283	5
686	283	11
687	284	12
688	284	6
689	284	8
690	285	4
691	286	11
692	286	5
693	286	12
694	286	8
695	287	12
696	287	2
697	287	2
698	287	4
699	287	12
700	288	7
701	289	0
702	289	4
703	289	2
704	290	11
705	290	0
706	290	5
707	290	6
708	290	4
709	291	9
710	291	7
711	291	5
712	292	7
713	292	12
714	292	11
715	292	8
716	293	8
717	293	7
718	293	11
719	293	1
720	293	1
721	294	4
722	294	7
723	294	6
724	294	1
725	294	3
726	295	12
727	295	8
728	295	7
729	295	6
730	295	1
731	296	10
732	296	9
733	296	9
734	296	8
735	296	8
736	297	0
737	297	9
738	298	2
739	299	5
740	299	12
741	300	0
742	300	8
743	300	5
744	300	7
745	301	0
746	303	11
747	303	3
748	303	0
749	304	2
750	304	4
751	304	7
752	305	10
753	305	10
754	306	9
755	306	6
756	306	2
757	307	10
758	307	10
759	307	4
760	307	10
761	307	6
762	308	5
763	309	0
764	309	3
765	309	9
766	310	5
767	310	12
768	312	6
769	312	3
770	313	4
771	315	1
772	316	5
773	316	2
774	316	1
775	317	7
776	317	4
777	317	3
778	317	0
779	319	3
780	319	8
781	319	5
782	319	5
783	319	6
784	320	9
785	320	12
786	320	5
787	320	9
788	321	6
789	321	6
790	322	9
791	322	0
792	323	6
793	323	0
794	323	8
795	323	8
796	323	1
797	324	4
798	324	10
799	325	2
800	325	10
801	325	11
802	325	4
803	326	3
804	326	1
805	326	1
806	327	9
807	327	1
808	327	10
809	329	6
810	330	4
811	330	8
812	331	9
813	331	11
814	331	6
815	333	6
816	333	5
817	334	12
818	334	2
819	334	12
820	335	2
821	335	3
822	335	3
823	337	0
824	337	0
825	338	10
826	338	7
827	338	6
828	338	8
829	338	5
830	339	8
831	339	8
832	339	3
833	339	10
834	341	5
835	341	12
836	341	4
837	341	5
838	341	2
839	342	1
840	342	9
841	342	11
842	342	3
843	342	5
844	343	10
845	343	12
846	343	4
847	343	2
848	344	1
849	344	8
850	344	7
851	345	5
852	346	5
853	346	0
854	347	11
855	347	4
856	347	11
857	347	7
858	348	7
859	349	1
860	349	6
861	349	6
862	349	8
863	349	2
864	350	6
865	350	6
866	351	3
867	351	0
868	351	8
869	351	1
870	354	2
871	354	5
872	354	10
873	354	7
874	355	10
875	355	8
876	356	8
877	356	9
878	356	3
879	358	5
880	358	9
881	358	9
882	360	8
883	360	7
884	360	6
885	362	4
886	362	2
887	363	8
888	363	0
889	363	8
890	364	12
891	364	10
892	364	12
893	365	7
894	366	6
895	367	8
896	367	5
897	368	0
898	368	2
899	368	12
900	368	6
901	369	5
902	369	9
903	369	5
904	370	10
905	370	0
906	370	8
907	371	6
908	371	5
909	371	8
910	372	9
911	372	6
912	372	10
913	373	5
914	373	8
915	373	11
916	373	10
917	373	7
918	374	4
919	374	6
920	374	11
921	374	8
922	374	11
923	375	6
924	376	8
925	377	3
926	377	8
927	377	2
928	378	8
929	379	4
930	379	5
931	379	4
932	379	9
933	380	3
934	380	5
935	380	7
936	381	1
937	382	8
938	383	3
939	383	12
940	384	10
941	385	12
942	385	2
943	385	1
944	386	1
945	386	7
946	386	5
947	386	9
948	387	2
949	387	10
950	387	11
951	387	4
952	388	12
953	388	9
954	388	7
955	388	6
956	388	2
957	389	8
958	389	9
959	389	1
960	389	9
961	389	7
962	391	11
963	393	12
964	395	5
965	395	0
966	395	3
967	396	7
968	396	12
969	396	11
970	396	2
971	397	6
972	397	4
973	398	9
974	398	3
975	399	2
976	399	10
977	399	7
978	400	4
979	400	2
980	400	3
981	401	2
982	401	11
983	401	4
984	402	12
985	405	11
986	405	0
987	405	7
988	405	0
989	407	10
990	407	7
991	407	11
992	407	5
993	407	7
994	409	8
995	409	9
996	409	1
997	409	9
998	410	3
999	410	9
1000	410	5
1001	410	10
1002	410	11
1003	411	5
1004	413	4
1005	413	9
1006	413	4
1007	413	6
1008	414	10
1009	414	6
1010	414	11
1011	414	5
1012	415	6
1013	415	11
1014	415	4
1015	415	9
1016	416	8
1017	416	1
1018	416	8
1019	416	2
1020	416	5
1021	417	7
1022	417	11
1023	417	1
1024	418	8
1025	418	4
1026	418	5
1027	418	3
1028	418	8
1029	419	7
1030	420	9
1031	421	10
1032	421	10
1033	421	3
1034	421	3
1035	421	3
1036	423	11
1037	423	8
1038	423	3
1039	424	0
1040	425	3
1041	426	0
1042	426	7
1043	427	1
1044	427	5
1045	427	0
1046	428	2
1047	428	7
1048	428	0
1049	428	1
1050	428	4
1051	429	10
1052	429	3
1053	429	6
1054	430	4
1055	431	3
1056	432	9
1057	433	6
1058	433	7
1059	434	10
1060	435	12
1061	435	5
1062	437	9
1063	437	11
1064	438	2
1065	438	6
1066	438	5
1067	438	12
1068	439	7
1069	441	8
1070	441	9
1071	441	3
1072	441	11
1073	441	4
1074	442	10
1075	442	3
1076	442	8
1077	442	1
1078	442	0
1079	443	4
1080	443	9
1081	444	2
1082	444	8
1083	444	7
1084	444	9
1085	445	9
1086	445	0
1087	445	7
1088	445	1
1089	445	5
1090	446	7
1091	447	7
1092	447	11
1093	447	10
1094	447	6
1095	447	11
1096	448	1
1097	448	8
1098	448	1
1099	448	8
1100	449	11
1101	449	8
1102	449	4
1103	449	5
1104	450	6
1105	450	7
1106	450	9
1107	451	4
1108	451	7
1109	451	10
1110	451	2
1111	452	12
1112	452	12
1113	452	1
1114	452	11
1115	452	10
1116	453	6
1117	454	1
1118	454	3
1119	454	10
1120	454	1
1121	457	12
1122	457	8
1123	457	7
1124	458	8
1125	459	3
1126	459	10
1127	459	8
1128	459	1
1129	459	8
1130	460	12
1131	460	7
1132	460	12
1133	460	4
1134	460	10
1135	461	6
1136	461	7
1137	463	2
1138	464	8
1139	467	7
1140	467	1
1141	468	1
1142	468	10
1143	468	4
1144	469	3
1145	469	2
1146	469	4
1147	469	8
1148	469	10
1149	471	12
1150	471	11
1151	472	9
1152	473	9
1153	473	4
1154	473	0
1155	474	7
1156	474	3
1157	474	7
1158	474	1
1159	474	0
1160	475	10
1161	475	0
1162	475	12
1163	476	5
1164	477	8
1165	477	12
1166	477	10
1167	477	1
1168	477	5
1169	478	0
1170	478	6
1171	479	5
1172	480	1
1173	482	5
1174	483	1
1175	483	11
1176	483	3
1177	483	5
1178	483	9
1179	484	4
1180	485	11
1181	487	1
1182	487	5
1183	487	8
1184	487	0
1185	488	9
1186	488	7
1187	488	7
1188	488	2
1189	489	2
1190	489	5
1191	490	0
1192	490	7
1193	490	6
1194	490	1
1195	490	5
1196	491	4
1197	492	10
1198	492	12
1199	492	1
1200	492	10
1201	493	5
1202	493	3
1203	494	3
1204	494	11
1205	494	4
1206	495	0
1207	495	9
1208	496	1
1209	496	2
1210	497	5
1211	497	3
1212	498	11
1213	498	7
1214	498	10
1215	499	2
1216	499	6
1217	499	12
1218	499	9
1219	499	8
1220	500	12
1221	500	10
1222	500	1
1223	500	0
1224	503	4
1225	503	7
1226	503	7
1227	503	10
1228	503	12
1229	504	0
1230	505	5
1231	505	8
1232	505	10
1233	505	7
1234	506	3
1235	506	10
1236	506	6
1237	506	1
1238	507	1
1239	509	9
1240	509	0
1241	509	3
1242	509	0
1243	510	12
1244	510	0
1245	510	1
1246	510	0
1247	512	4
1248	512	9
1249	512	1
1250	512	11
1251	513	12
1252	514	11
1253	514	10
1254	515	5
1255	516	10
1256	516	5
1257	516	9
1258	516	5
1259	518	4
1260	518	0
1261	518	8
1262	518	1
1263	518	12
1264	519	6
1265	520	10
1266	520	11
1267	521	12
1268	521	4
1269	521	2
1270	521	5
1271	521	5
1272	522	7
1273	522	2
1274	522	2
1275	522	12
1276	523	3
1277	524	8
1278	524	3
1279	524	4
1280	524	5
1281	524	0
1282	525	2
1283	525	6
1284	525	10
1285	525	8
1286	526	5
1287	527	12
1288	527	3
1289	527	1
1290	527	12
1291	528	7
1292	528	7
1293	530	9
1294	530	8
1295	531	5
1296	531	8
1297	531	1
1298	532	3
1299	532	12
1300	532	9
1301	532	8
1302	532	9
1303	533	11
1304	534	0
1305	534	5
1306	534	4
1307	534	4
1308	535	7
1309	536	9
1310	536	2
1311	537	5
1312	537	8
1313	537	5
1314	537	11
1315	537	7
1316	538	4
1317	538	5
1318	538	2
1319	539	4
1320	539	6
1321	539	0
1322	540	7
1323	540	5
1324	541	2
1325	542	9
1326	542	5
1327	542	2
1328	543	12
1329	543	10
1330	543	0
1331	544	7
1332	544	12
1333	544	7
1334	546	0
1335	546	4
1336	546	1
1337	546	7
1338	548	0
1339	548	8
1340	548	3
1341	548	12
1342	549	8
1343	549	12
1344	549	11
1345	549	5
1346	551	10
1347	551	11
1348	551	0
1349	552	7
1350	552	8
1351	552	4
1352	552	3
1353	553	7
1354	553	12
1355	553	1
1356	553	5
1357	554	12
1358	554	6
1359	554	6
1360	555	3
1361	556	7
1362	556	0
1363	556	1
1364	557	0
1365	557	7
1366	557	4
1367	557	7
1368	558	4
1369	558	4
1370	558	12
1371	559	8
1372	559	9
1373	559	1
1374	559	1
1375	560	5
1376	560	8
1377	560	1
1378	560	10
1379	560	7
1380	562	3
1381	562	11
1382	562	2
1383	562	7
1384	563	4
1385	563	1
1386	564	2
1387	564	10
1388	565	10
1389	565	0
1390	567	4
1391	567	8
1392	567	9
1393	567	10
1394	567	2
1395	568	12
1396	568	9
1397	568	3
1398	570	5
1399	570	8
1400	571	8
1401	571	4
1402	571	4
1403	572	0
1404	572	3
1405	572	10
1406	572	9
1407	572	5
1408	574	6
1409	574	4
1410	574	8
1411	575	11
1412	575	1
1413	575	7
1414	575	0
1415	575	6
1416	577	8
1417	577	11
1418	577	5
1419	577	2
1420	577	10
1421	578	6
1422	578	1
1423	578	9
1424	579	8
1425	579	6
1426	580	6
1427	580	4
1428	580	3
1429	580	3
1430	580	8
1431	581	3
1432	581	9
1433	581	4
1434	581	3
1435	581	7
1436	582	6
1437	583	8
1438	584	6
1439	584	5
1440	584	12
1441	584	11
1442	585	11
1443	586	1
1444	586	0
1445	586	8
1446	586	0
1447	587	6
1448	587	7
1449	587	2
1450	587	9
1451	588	3
1452	589	11
1453	589	2
1454	589	0
1455	590	7
1456	590	1
1457	590	3
1458	590	2
1459	590	9
1460	591	8
1461	591	2
1462	591	2
1463	591	7
1464	592	2
1465	593	5
1466	593	11
1467	593	12
1468	593	2
1469	594	8
1470	595	11
1471	595	1
1472	595	6
1473	595	0
1474	596	10
1475	596	11
1476	596	7
1477	596	2
1478	597	0
1479	597	8
1480	597	9
1481	597	11
1482	597	1
1483	598	6
1484	598	1
1485	598	4
1486	598	9
1487	598	6
1488	599	10
1489	599	2
1490	600	7
1491	600	0
1492	600	1
1493	601	12
1494	601	8
1495	602	1
1496	602	11
1497	602	4
1498	602	9
1499	603	0
1500	603	2
1501	603	9
1502	604	10
1503	604	7
1504	604	2
1505	605	0
1506	605	1
1507	605	10
1508	605	10
1509	605	4
1510	606	2
1511	607	12
1512	607	2
1513	607	9
1514	609	4
1515	609	0
1516	609	9
1517	609	0
1518	609	10
1519	610	11
1520	610	12
1521	610	12
1522	611	0
1523	611	6
1524	611	0
1525	613	8
1526	613	12
1527	613	8
1528	614	8
1529	615	0
1530	616	10
1531	617	9
1532	617	6
1533	617	9
1534	617	12
1535	619	1
1536	619	5
1537	619	10
1538	619	11
1539	619	11
1540	620	10
1541	620	9
1542	621	12
1543	621	3
1544	621	4
1545	621	2
1546	624	0
1547	625	11
1548	625	10
1549	626	7
1550	626	10
1551	627	5
1552	627	8
1553	627	1
1554	628	1
1555	629	12
1556	629	0
1557	629	11
1558	629	8
1559	630	6
1560	630	0
1561	631	7
1562	631	11
1563	631	9
1564	633	0
1565	633	12
1566	634	0
1567	634	2
1568	634	11
1569	634	9
1570	634	11
1571	635	9
1572	635	1
1573	635	8
1574	635	0
1575	636	2
1576	636	6
1577	636	2
1578	636	6
1579	637	12
1580	637	12
1581	637	5
1582	637	10
1583	637	6
1584	638	6
1585	638	11
1586	638	0
1587	638	6
1588	638	12
1589	641	0
1590	641	3
1591	642	0
1592	642	12
1593	642	0
1594	643	11
1595	643	8
1596	643	0
1597	643	9
1598	644	6
1599	645	3
1600	645	4
1601	645	8
1602	646	8
1603	646	6
1604	646	11
1605	646	9
1606	646	11
1607	647	12
1608	647	4
1609	647	2
1610	648	1
1611	648	9
1612	648	4
1613	648	9
1614	648	0
1615	649	0
1616	650	8
1617	651	4
1618	652	7
1619	653	6
1620	653	8
1621	653	9
1622	654	7
1623	656	2
1624	657	2
1625	657	8
1626	657	8
1627	657	2
1628	657	8
1629	658	12
1630	658	9
1631	659	5
1632	659	6
1633	660	8
1634	660	0
1635	660	6
1636	660	1
1637	661	10
1638	661	1
1639	661	8
1640	661	8
1641	662	0
1642	662	0
1643	664	7
1644	665	8
1645	665	0
1646	666	7
1647	666	11
1648	667	6
1649	668	1
1650	668	8
1651	668	4
1652	669	1
1653	670	3
1654	670	12
1655	671	8
1656	672	8
1657	673	12
1658	673	8
1659	673	12
1660	674	4
1661	674	10
1662	674	6
1663	675	12
1664	675	12
1665	675	1
1666	675	9
1667	677	6
1668	678	7
1669	678	7
1670	679	0
1671	679	11
1672	679	11
1673	679	5
1674	679	12
1675	680	12
1676	681	7
1677	681	7
1678	681	10
1679	681	12
1680	682	8
1681	682	9
1682	682	9
1683	683	2
1684	683	1
1685	683	2
1686	683	9
1687	684	11
1688	684	3
1689	685	9
1690	685	7
1691	685	8
1692	685	10
1693	686	4
1694	686	8
1695	686	2
1696	687	8
1697	687	2
1698	689	12
1699	689	3
1700	689	12
1701	689	6
1702	689	11
1703	690	1
1704	690	2
1705	690	3
1706	690	8
1707	690	2
1708	691	8
1709	692	12
1710	692	12
1711	692	0
1712	692	1
1713	692	11
1714	693	0
1715	693	12
1716	693	11
1717	694	1
1718	694	0
1719	694	11
1720	695	1
1721	695	4
1722	695	9
1723	695	2
1724	695	1
1725	696	4
1726	697	6
1727	697	3
1728	697	6
1729	698	5
1730	699	6
1731	699	12
1732	700	8
1733	702	1
1734	702	8
1735	702	7
1736	703	3
1737	704	3
1738	704	6
1739	704	7
1740	704	4
1741	707	6
1742	708	9
1743	710	3
1744	710	9
1745	711	2
1746	712	12
1747	712	3
1748	712	6
1749	713	8
1750	713	3
1751	713	1
1752	713	3
1753	714	0
1754	715	11
1755	715	7
1756	715	9
1757	715	8
1758	715	6
1759	716	5
1760	716	12
1761	716	3
1762	719	11
1763	719	3
1764	720	3
1765	720	1
1766	720	7
1767	720	1
1768	720	3
1769	721	0
1770	723	9
1771	723	12
1772	723	10
1773	724	9
1774	724	1
1775	724	9
1776	724	7
1777	724	10
1778	725	2
1779	726	1
1780	726	11
1781	726	5
1782	727	9
1783	727	4
1784	728	4
1785	729	10
1786	729	3
1787	729	10
1788	730	1
1789	730	3
1790	730	11
1791	730	5
1792	731	12
1793	731	6
1794	732	2
1795	732	0
1796	732	3
1797	732	12
1798	733	0
1799	734	1
1800	734	12
1801	734	12
1802	735	1
1803	736	8
1804	736	1
1805	736	1
1806	736	6
1807	737	11
1808	737	12
1809	737	7
1810	737	5
1811	737	6
1812	738	3
1813	738	6
1814	739	3
1815	739	11
1816	739	0
1817	739	0
1818	740	9
1819	742	0
1820	742	5
1821	743	5
1822	743	5
1823	743	11
1824	744	3
1825	744	8
1826	744	12
1827	745	1
1828	745	7
1829	745	4
1830	745	3
1831	745	5
1832	746	8
1833	746	4
1834	746	7
1835	747	9
1836	747	0
1837	747	2
1838	748	2
1839	748	12
1840	749	11
1841	749	12
1842	751	5
1843	752	2
1844	752	12
1845	752	8
1846	755	10
1847	755	10
1848	755	0
1849	756	8
1850	756	5
1851	758	12
1852	759	1
1853	759	6
1854	759	12
1855	759	3
1856	760	9
1857	762	1
1858	762	12
1859	763	9
1860	763	1
1861	763	3
1862	763	2
1863	763	3
1864	764	4
1865	764	6
1866	764	2
1867	764	6
1868	765	1
1869	765	0
1870	766	12
1871	766	0
1872	766	9
1873	766	11
1874	767	10
1875	768	6
1876	768	4
1877	768	11
1878	768	11
1879	768	1
1880	769	7
1881	770	4
1882	770	7
1883	770	10
1884	771	0
1885	771	11
1886	771	4
1887	771	1
1888	775	10
1889	775	6
1890	775	9
1891	776	12
1892	776	1
1893	776	10
1894	776	4
1895	776	7
1896	777	11
1897	777	10
1898	778	9
1899	778	2
1900	778	0
1901	778	10
1902	779	6
1903	779	9
1904	779	11
1905	779	1
1906	779	12
1907	780	6
1908	780	7
1909	780	6
1910	781	8
1911	781	10
1912	783	1
1913	785	7
1914	785	11
1915	786	4
1916	786	5
1917	786	3
1918	786	5
1919	786	0
1920	787	4
1921	787	1
1922	788	5
1923	788	11
1924	789	12
1925	789	5
1926	790	6
1927	790	2
1928	790	4
1929	791	10
1930	791	3
1931	791	10
1932	791	7
1933	792	8
1934	792	4
1935	793	2
1936	793	1
1937	793	0
1938	793	3
1939	794	10
1940	794	2
1941	794	5
1942	794	7
1943	794	10
1944	795	11
1945	795	11
1946	795	0
1947	796	12
1948	796	12
1949	796	12
1950	796	9
1951	797	3
1952	797	4
1953	798	9
1954	798	0
1955	798	3
1956	799	10
1957	799	2
1958	800	3
1959	800	7
1960	800	7
1961	801	6
1962	801	8
1963	801	1
1964	801	5
1965	801	4
1966	802	8
1967	802	12
1968	802	12
1969	803	12
1970	803	4
1971	803	1
1972	804	1
1973	805	9
1974	805	11
1975	805	9
1976	805	1
1977	806	3
1978	806	10
1979	808	2
1980	808	10
1981	808	9
1982	809	9
1983	809	9
1984	809	10
1985	809	5
1986	809	5
1987	810	0
1988	812	6
1989	812	9
1990	812	1
1991	812	11
1992	813	6
1993	813	5
1994	813	0
1995	813	10
1996	814	12
1997	814	3
1998	814	11
1999	814	3
2000	816	0
2001	817	8
2002	817	6
2003	817	6
2004	818	12
2005	818	12
2006	818	2
2007	819	2
2008	819	1
2009	819	2
2010	820	5
2011	820	8
2012	820	2
2013	820	4
2014	821	11
2015	821	10
2016	821	5
2017	821	2
2018	821	8
2019	822	9
2020	822	12
2021	822	12
2022	822	9
2023	823	9
2024	823	9
2025	823	5
2026	823	5
2027	824	12
2028	824	10
2029	824	8
2030	824	7
2031	826	9
2032	826	1
2033	826	10
2034	826	0
2035	826	0
2036	827	12
2037	827	6
2038	827	1
2039	827	5
2040	827	5
2041	829	4
2042	829	11
2043	829	6
2044	830	3
2045	830	10
2046	831	12
2047	831	10
2048	831	1
2049	831	1
2050	831	2
2051	832	4
2052	832	0
2053	833	0
2054	833	12
2055	833	12
2056	833	1
2057	833	1
2058	835	12
2059	835	0
2060	837	7
2061	837	1
2062	837	0
2063	838	8
2064	838	12
2065	838	1
2066	839	3
2067	839	8
2068	839	9
2069	839	9
2070	839	10
2071	840	0
2072	840	5
2073	840	5
2074	840	9
2075	840	1
2076	841	1
2077	841	1
2078	842	1
2079	842	11
2080	842	4
2081	843	2
2082	843	10
2083	843	6
2084	843	2
2085	844	12
2086	844	11
2087	844	9
2088	845	10
2089	845	8
2090	845	6
2091	845	0
2092	846	9
2093	846	11
2094	848	4
2095	848	12
2096	849	4
2097	850	10
2098	851	2
2099	851	6
2100	851	5
2101	851	6
2102	852	11
2103	853	4
2104	853	4
2105	854	3
2106	854	2
2107	854	6
2108	854	5
2109	854	1
2110	855	7
2111	855	7
2112	855	3
2113	855	9
2114	856	9
2115	856	12
2116	856	12
2117	856	0
2118	857	4
2119	857	11
2120	858	4
2121	858	2
2122	859	5
2123	859	6
2124	859	5
2125	860	4
2126	860	10
2127	860	11
2128	860	12
2129	861	5
2130	861	6
2131	861	9
2132	862	12
2133	862	8
2134	862	4
2135	862	10
2136	863	11
2137	863	0
2138	863	1
2139	863	10
2140	865	12
2141	865	9
2142	865	5
2143	866	1
2144	866	3
2145	866	2
2146	866	5
2147	868	12
2148	868	11
2149	869	1
2150	869	10
2151	869	3
2152	870	8
2153	870	2
2154	870	9
2155	870	11
2156	871	12
2157	872	4
2158	872	11
2159	872	1
2160	873	2
2161	875	1
2162	876	10
2163	877	7
2164	877	10
2165	877	2
2166	878	3
2167	878	0
2168	881	10
2169	881	9
2170	881	8
2171	881	3
2172	882	8
2173	882	10
2174	883	5
2175	884	10
2176	884	6
2177	884	9
2178	884	10
2179	885	12
2180	885	10
2181	886	11
2182	886	5
2183	887	10
2184	887	6
2185	887	9
2186	887	1
2187	888	5
2188	888	3
2189	889	3
2190	890	1
2191	890	1
2192	891	4
2193	892	3
2194	892	6
2195	892	2
2196	892	2
2197	893	1
2198	893	5
2199	893	9
2200	893	12
2201	893	11
2202	894	2
2203	894	7
2204	894	10
2205	894	8
2206	894	1
2207	896	6
2208	897	2
2209	898	4
2210	898	10
2211	898	5
2212	898	3
2213	899	0
2214	899	0
2215	900	0
2216	900	7
2217	900	4
2218	901	2
2219	901	8
2220	901	6
2221	901	4
2222	902	6
2223	902	3
2224	902	5
2225	902	2
2226	902	4
2227	903	2
2228	903	4
2229	903	1
2230	904	11
2231	905	8
2232	905	7
2233	905	8
2234	905	10
2235	906	5
2236	906	12
2237	907	1
2238	907	2
2239	907	4
2240	908	9
2241	908	5
2242	908	5
2243	909	0
2244	909	1
2245	909	3
2246	909	12
2247	909	7
2248	910	3
2249	913	12
2250	913	1
2251	913	1
2252	913	6
2253	914	11
2254	915	8
2255	915	4
2256	915	4
2257	915	7
2258	916	4
2259	916	7
2260	917	4
2261	917	10
2262	919	8
2263	920	3
2264	920	10
2265	921	2
2266	921	4
2267	922	5
2268	922	8
2269	922	1
2270	922	10
2271	923	2
2272	923	10
2273	924	12
2274	924	8
2275	924	9
2276	926	5
2277	927	6
2278	927	12
2279	927	7
2280	927	4
2281	929	2
2282	929	4
2283	929	8
2284	930	4
2285	930	11
2286	930	11
2287	930	11
2288	932	2
2289	933	2
2290	933	0
2291	933	1
2292	933	2
2293	935	10
2294	935	2
2295	935	12
2296	935	0
2297	936	6
2298	936	8
2299	936	12
2300	936	1
2301	937	9
2302	937	3
2303	938	6
2304	938	3
2305	938	1
2306	939	9
2307	940	3
2308	940	11
2309	940	6
2310	941	10
2311	941	6
2312	943	5
2313	943	6
2314	943	2
2315	944	0
2316	944	8
2317	944	5
2318	944	5
2319	944	7
2320	945	3
2321	945	11
2322	947	4
2323	948	10
2324	948	5
2325	948	9
2326	948	1
2327	949	10
2328	949	0
2329	949	6
2330	949	2
2331	949	0
2332	950	2
2333	950	9
2334	950	8
2335	951	9
2336	952	8
2337	952	3
2338	952	9
2339	952	0
2340	952	7
2341	953	10
2342	953	0
2343	953	10
2344	953	12
2345	953	2
2346	955	1
2347	955	9
2348	955	8
2349	956	8
2350	956	11
2351	956	3
2352	957	5
2353	957	8
2354	957	3
2355	957	4
2356	957	4
2357	959	8
2358	959	3
2359	959	4
2360	960	4
2361	960	11
2362	960	11
2363	960	3
2364	960	1
2365	962	3
2366	964	10
2367	964	0
2368	964	10
2369	964	12
2370	965	4
2371	965	8
2372	965	1
2373	965	0
2374	966	9
2375	966	5
2376	970	3
2377	970	11
2378	971	9
2379	971	7
2380	971	0
2381	973	10
2382	973	3
2383	973	5
2384	974	7
2385	974	5
2386	974	9
2387	974	5
2388	974	8
2389	975	1
2390	975	1
2391	976	12
2392	976	2
2393	977	9
2394	977	7
2395	977	12
2396	978	4
2397	979	9
2398	979	3
2399	980	1
2400	980	7
2401	980	11
2402	980	9
2403	981	4
2404	981	1
2405	981	9
2406	981	2
2407	983	11
2408	983	9
2409	983	9
2410	984	9
2411	986	4
2412	987	0
2413	989	5
2414	990	10
2415	991	4
2416	991	10
2417	991	3
2418	992	12
2419	992	5
2420	992	3
2421	992	7
2422	992	8
2423	993	6
2424	993	7
2425	994	3
2426	996	11
2427	996	7
2428	998	2
2429	999	7
2430	999	11
2431	999	1
2432	1000	6
2433	1000	0
2434	1001	2
2435	1001	3
2436	1001	7
2437	1001	11
2438	1002	3
2439	1004	4
2440	1005	4
2441	1005	6
2442	1005	7
2443	1005	8
2444	1006	0
2445	1006	12
2446	1006	6
2447	1008	7
2448	1009	6
2449	1009	6
2450	1010	1
2451	1010	3
2452	1010	8
2453	1012	10
2454	1012	5
2455	1012	10
2456	1012	7
2457	1012	5
2458	1013	0
2459	1013	5
2460	1013	8
2461	1013	0
2462	1014	8
2463	1014	9
2464	1015	6
2465	1016	0
2466	1016	3
2467	1016	6
2468	1017	4
2469	1017	4
2470	1017	4
2471	1017	8
2472	1017	0
2473	1018	10
2474	1019	4
2475	1019	1
2476	1019	0
2477	1019	8
2478	1019	4
2479	1020	8
2480	1020	5
2481	1021	3
2482	1021	3
2483	1021	12
2484	1021	12
2485	1021	3
2486	1022	10
2487	1022	12
2488	1023	1
2489	1023	3
2490	1023	2
2491	1023	9
2492	1024	7
2493	1024	5
2494	1025	0
2495	1026	7
2496	1026	12
2497	1026	2
2498	1028	7
2499	1028	9
2500	1028	12
2501	1028	3
2502	1029	12
2503	1029	10
2504	1030	3
2505	1030	0
2506	1030	1
2507	1031	1
2508	1031	0
2509	1031	9
2510	1031	7
2511	1031	9
2512	1032	1
2513	1032	7
2514	1034	5
2515	1034	5
2516	1034	5
2517	1035	11
2518	1035	10
2519	1035	1
2520	1035	1
2521	1035	9
2522	1036	0
2523	1037	7
2524	1038	0
2525	1038	12
2526	1038	6
2527	1039	10
2528	1039	4
2529	1040	11
2530	1040	9
2531	1040	7
2532	1041	3
2533	1042	8
2534	1044	5
2535	1044	11
2536	1044	2
2537	1045	11
2538	1047	7
2539	1047	8
2540	1047	5
2541	1048	8
2542	1048	3
2543	1050	9
2544	1050	1
2545	1050	12
2546	1051	11
2547	1051	11
2548	1051	0
2549	1052	6
2550	1052	4
2551	1052	6
2552	1052	11
2553	1052	1
2554	1053	9
2555	1053	5
2556	1054	4
2557	1054	12
2558	1055	8
2559	1056	4
2560	1056	11
2561	1056	4
2562	1057	0
2563	1057	3
2564	1057	11
2565	1057	1
2566	1059	4
2567	1059	2
2568	1059	6
2569	1059	4
2570	1060	7
2571	1060	9
2572	1060	7
2573	1061	5
2574	1061	7
2575	1061	1
2576	1061	10
2577	1061	8
2578	1062	8
2579	1062	12
2580	1064	4
2581	1065	12
2582	1065	5
2583	1065	0
2584	1065	0
2585	1065	6
2586	1066	10
2587	1066	10
2588	1066	12
2589	1066	0
2590	1066	3
2591	1067	1
2592	1067	10
2593	1067	0
2594	1067	11
2595	1068	11
2596	1068	2
2597	1069	6
2598	1070	6
2599	1070	9
2600	1070	8
2601	1070	9
2602	1071	0
2603	1071	3
2604	1071	7
2605	1071	4
2606	1071	5
2607	1072	9
2608	1072	0
2609	1072	8
2610	1073	4
2611	1073	12
2612	1073	1
2613	1075	12
2614	1075	1
2615	1075	5
2616	1075	3
2617	1075	7
2618	1076	1
2619	1076	4
2620	1076	2
2621	1076	9
2622	1076	4
2623	1077	9
2624	1077	8
2625	1077	5
2626	1077	12
2627	1078	5
2628	1078	10
2629	1078	4
2630	1078	10
2631	1080	8
2632	1080	9
2633	1082	6
2634	1082	11
2635	1083	11
2636	1083	3
2637	1083	11
2638	1083	12
2639	1084	0
2640	1085	6
2641	1085	10
2642	1085	3
2643	1085	0
2644	1085	10
2645	1086	6
2646	1086	8
2647	1086	9
2648	1086	11
2649	1087	2
2650	1087	11
2651	1088	1
2652	1088	3
2653	1089	8
2654	1089	11
2655	1089	3
2656	1089	7
2657	1089	0
2658	1090	10
2659	1090	0
2660	1090	8
2661	1090	5
2662	1091	10
2663	1092	7
2664	1092	6
2665	1092	7
2666	1092	12
2667	1094	1
2668	1094	12
2669	1096	2
2670	1096	8
2671	1096	2
2672	1096	0
2673	1096	12
2674	1097	6
2675	1098	12
2676	1098	1
2677	1098	5
2678	1099	12
2679	1099	9
2680	1099	3
2681	1099	12
2682	1100	3
2683	1100	2
2684	1101	9
2685	1101	4
2686	1101	11
2687	1101	8
2688	1101	5
2689	1103	4
2690	1103	5
2691	1103	0
2692	1103	0
2693	1105	8
2694	1105	10
2695	1105	4
2696	1106	10
2697	1106	10
2698	1107	2
2699	1107	3
2700	1107	5
2701	1110	4
2702	1111	11
2703	1111	11
2704	1111	12
2705	1111	11
2706	1112	1
2707	1114	12
2708	1114	8
2709	1114	8
2710	1114	2
2711	1114	3
2712	1116	12
2713	1117	2
2714	1117	2
2715	1117	0
2716	1117	9
2717	1119	5
2718	1119	8
2719	1119	8
2720	1120	11
2721	1120	0
2722	1120	1
2723	1121	5
2724	1121	3
2725	1123	1
2726	1124	11
2727	1124	8
2728	1124	6
2729	1125	7
2730	1125	5
2731	1125	12
2732	1125	12
2733	1126	6
2734	1128	4
2735	1128	3
2736	1129	5
2737	1129	2
2738	1129	0
2739	1129	2
2740	1130	9
2741	1130	10
2742	1131	0
2743	1131	2
2744	1131	11
2745	1131	4
2746	1131	7
2747	1132	6
2748	1132	10
2749	1132	10
2750	1132	4
2751	1133	10
2752	1134	8
2753	1134	1
2754	1134	10
2755	1135	6
2756	1135	1
2757	1135	7
2758	1135	1
2759	1136	4
2760	1137	9
2761	1138	2
2762	1138	9
2763	1138	6
2764	1138	11
2765	1139	11
2766	1140	11
2767	1140	12
2768	1140	4
2769	1141	6
2770	1142	9
2771	1142	4
2772	1143	12
2773	1143	6
2774	1144	4
2775	1145	1
2776	1145	10
2777	1145	7
2778	1145	8
2779	1145	6
2780	1146	1
2781	1146	12
2782	1146	9
2783	1147	9
2784	1147	6
2785	1147	2
2786	1148	5
2787	1148	12
2788	1148	0
2789	1148	10
2790	1150	3
2791	1150	6
2792	1150	2
2793	1150	12
2794	1150	5
2795	1151	2
2796	1151	12
2797	1151	2
2798	1152	4
2799	1152	6
2800	1152	11
2801	1152	7
2802	1153	2
2803	1153	0
2804	1154	1
2805	1155	12
2806	1155	4
2807	1155	5
2808	1155	8
2809	1158	8
2810	1158	2
2811	1158	9
2812	1159	5
2813	1159	2
2814	1159	10
2815	1159	5
2816	1160	10
2817	1161	8
2818	1161	5
2819	1161	8
2820	1161	12
2821	1161	3
2822	1162	4
2823	1162	12
2824	1162	3
2825	1162	12
2826	1163	7
2827	1165	12
2828	1165	10
2829	1165	5
2830	1166	4
2831	1166	2
2832	1166	10
2833	1166	11
2834	1166	8
2835	1167	5
2836	1167	1
2837	1167	0
2838	1167	0
2839	1167	11
2840	1168	2
2841	1168	8
2842	1168	7
2843	1168	9
2844	1168	0
2845	1169	0
2846	1169	4
2847	1169	12
2848	1170	10
2849	1172	9
2850	1174	6
2851	1175	10
2852	1175	4
2853	1177	12
2854	1177	6
2855	1177	9
2856	1177	8
2857	1177	0
2858	1178	7
2859	1178	5
2860	1178	4
2861	1178	9
2862	1179	9
2863	1179	1
2864	1180	11
2865	1180	10
2866	1180	3
2867	1180	3
2868	1180	4
2869	1181	0
2870	1181	4
2871	1181	1
2872	1181	9
2873	1181	3
2874	1182	9
2875	1183	5
2876	1183	10
2877	1183	3
2878	1184	10
2879	1185	2
2880	1185	2
2881	1185	6
2882	1185	5
2883	1185	5
2884	1186	4
2885	1186	7
2886	1187	1
2887	1187	1
2888	1188	11
2889	1188	7
2890	1188	4
2891	1188	4
2892	1188	6
2893	1189	6
2894	1189	6
2895	1190	4
2896	1191	4
2897	1192	9
2898	1192	1
2899	1192	2
2900	1192	4
2901	1192	8
2902	1193	12
2903	1193	9
2904	1195	9
2905	1195	6
2906	1196	9
2907	1196	10
2908	1196	1
2909	1196	9
2910	1197	9
2911	1197	4
2912	1198	9
2913	1198	3
2914	1198	2
2915	1200	0
2916	1200	1
2917	1200	7
2918	1201	12
2919	1202	1
2920	1202	5
2921	1202	8
2922	1202	12
2923	1202	5
2924	1203	0
2925	1203	5
2926	1203	9
2927	1203	4
2928	1204	1
2929	1204	3
2930	1204	8
2931	1204	10
2932	1204	11
2933	1205	1
2934	1205	12
2935	1205	0
2936	1207	11
2937	1207	9
2938	1207	7
2939	1207	3
2940	1207	8
2941	1208	8
2942	1208	2
2943	1210	7
2944	1210	5
2945	1210	6
2946	1211	11
2947	1211	7
2948	1211	3
2949	1213	11
2950	1213	1
2951	1213	10
2952	1213	11
2953	1214	1
2954	1214	8
2955	1214	9
2956	1214	5
2957	1215	2
2958	1215	7
2959	1215	9
2960	1215	12
2961	1216	7
2962	1217	11
2963	1217	9
2964	1218	8
2965	1219	3
2966	1219	3
2967	1219	8
2968	1220	11
2969	1220	3
2970	1220	6
2971	1221	1
2972	1221	5
2973	1221	10
2974	1221	2
2975	1221	1
2976	1222	7
2977	1222	2
2978	1223	1
2979	1223	11
2980	1223	7
2981	1223	4
2982	1224	6
2983	1225	10
2984	1225	7
2985	1225	2
2986	1225	5
2987	1225	2
2988	1226	10
2989	1226	4
2990	1227	11
2991	1228	8
2992	1228	1
2993	1228	3
2994	1230	11
2995	1230	0
2996	1231	0
2997	1231	12
2998	1231	10
2999	1233	5
3000	1233	6
3001	1233	12
3002	1233	1
3003	1233	6
3004	1234	8
3005	1234	7
3006	1234	8
3007	1234	11
3008	1234	0
3009	1235	11
3010	1235	0
3011	1235	12
3012	1235	12
3013	1236	7
3014	1236	12
3015	1238	2
3016	1238	5
3017	1238	7
3018	1238	11
3019	1238	2
3020	1239	8
3021	1239	5
3022	1239	4
3023	1239	6
3024	1239	5
3025	1240	7
3026	1240	6
3027	1240	11
3028	1240	8
3029	1240	10
3030	1241	0
3031	1243	11
3032	1243	11
3033	1243	12
3034	1243	7
3035	1243	3
3036	1244	12
3037	1244	2
3038	1244	0
3039	1244	1
3040	1244	10
3041	1245	7
3042	1245	3
3043	1245	3
3044	1246	7
3045	1246	8
3046	1246	3
3047	1247	9
3048	1247	7
3049	1247	12
3050	1247	1
3051	1247	10
3052	1248	4
3053	1248	9
3054	1248	1
3055	1248	0
3056	1248	0
3057	1249	3
3058	1249	10
3059	1249	8
3060	1249	9
3061	1250	0
3062	1252	8
3063	1252	7
3064	1252	0
3065	1252	12
3066	1252	1
3067	1253	2
3068	1253	2
3069	1254	1
3070	1257	2
3071	1258	8
3072	1258	11
3073	1258	5
3074	1258	10
3075	1259	11
3076	1259	11
3077	1259	11
3078	1259	8
3079	1260	11
3080	1261	7
3081	1261	1
3082	1262	4
3083	1262	8
3084	1263	0
3085	1263	10
3086	1263	3
3087	1264	11
3088	1265	1
3089	1265	5
3090	1265	7
3091	1266	4
3092	1266	11
3093	1266	3
3094	1266	7
3095	1267	1
3096	1267	3
3097	1268	11
3098	1268	1
3099	1268	2
3100	1268	11
3101	1269	12
3102	1269	9
3103	1269	10
3104	1270	8
3105	1270	0
3106	1270	8
3107	1270	6
3108	1271	0
3109	1273	6
3110	1274	0
3111	1276	10
3112	1277	0
3113	1277	11
3114	1279	12
3115	1280	1
3116	1281	10
3117	1281	11
3118	1282	11
3119	1282	5
3120	1282	1
3121	1282	2
3122	1282	5
3123	1283	7
3124	1283	10
3125	1284	0
3126	1284	12
3127	1284	11
3128	1285	10
3129	1285	3
3130	1285	7
3131	1287	0
3132	1287	11
3133	1287	0
3134	1288	0
3135	1289	1
3136	1289	6
3137	1289	9
3138	1289	8
3139	1292	4
3140	1292	4
3141	1292	7
3142	1292	2
3143	1294	12
3144	1294	3
3145	1294	10
3146	1295	12
3147	1295	10
3148	1295	1
3149	1295	12
3150	1295	1
3151	1296	2
3152	1297	3
3153	1297	11
3154	1298	7
3155	1298	10
3156	1298	3
3157	1299	1
3158	1299	11
3159	1299	1
3160	1299	6
3161	1299	5
3162	1300	9
3163	1300	11
3164	1301	8
3165	1301	11
3166	1301	0
3167	1302	10
3168	1302	6
3169	1305	7
3170	1305	12
3171	1305	1
3172	1305	9
3173	1307	0
3174	1307	1
3175	1308	0
3176	1308	5
3177	1309	6
3178	1310	5
3179	1310	3
3180	1310	1
3181	1310	1
3182	1310	8
3183	1311	12
3184	1311	3
3185	1311	4
3186	1311	6
3187	1312	9
3188	1312	11
3189	1312	5
3190	1312	0
3191	1313	1
3192	1313	4
3193	1313	10
3194	1313	0
3195	1314	10
3196	1315	2
3197	1316	9
3198	1316	6
3199	1316	6
3200	1317	4
3201	1318	12
3202	1319	6
3203	1319	2
3204	1319	1
3205	1319	0
3206	1320	6
3207	1320	7
3208	1321	0
3209	1321	7
3210	1321	12
3211	1321	2
3212	1321	11
3213	1322	11
3214	1323	12
3215	1323	12
3216	1324	7
3217	1324	4
3218	1325	12
3219	1326	8
3220	1326	12
3221	1326	11
3222	1326	11
3223	1327	10
3224	1328	12
3225	1328	10
3226	1328	10
3227	1328	3
3228	1332	12
3229	1332	3
3230	1332	3
3231	1333	1
3232	1333	2
3233	1333	10
3234	1333	3
3235	1337	2
3236	1337	1
3237	1338	12
3238	1340	11
3239	1341	9
3240	1341	7
3241	1341	0
3242	1341	1
3243	1341	7
3244	1343	4
3245	1343	0
3246	1343	10
3247	1343	0
3248	1343	5
3249	1344	12
3250	1344	4
3251	1344	12
3252	1344	0
3253	1345	8
3254	1345	2
3255	1345	12
3256	1345	6
3257	1345	9
3258	1346	5
3259	1346	7
3260	1346	4
3261	1346	11
3262	1347	3
3263	1347	5
3264	1347	11
3265	1347	5
3266	1347	6
3267	1348	6
3268	1348	11
3269	1348	4
3270	1349	9
3271	1349	4
3272	1350	6
3273	1350	11
3274	1350	10
3275	1350	2
3276	1350	1
3277	1351	6
3278	1351	4
3279	1352	4
3280	1352	10
3281	1352	0
3282	1353	0
3283	1353	11
3284	1353	3
3285	1353	1
3286	1354	5
3287	1355	3
3288	1355	9
3289	1355	5
3290	1356	8
3291	1356	12
3292	1356	8
3293	1356	2
3294	1357	2
3295	1357	5
3296	1358	5
3297	1358	12
3298	1358	12
3299	1358	6
3300	1359	6
3301	1359	0
3302	1359	7
3303	1360	7
3304	1360	9
3305	1361	10
3306	1361	9
3307	1362	7
3308	1362	10
3309	1363	10
3310	1363	0
3311	1363	5
3312	1363	4
3313	1364	11
3314	1365	10
3315	1365	7
3316	1365	2
3317	1367	9
3318	1367	9
3319	1367	6
3320	1367	5
3321	1367	0
3322	1368	5
3323	1368	4
3324	1370	7
3325	1370	11
3326	1370	9
3327	1370	2
3328	1370	10
3329	1372	9
3330	1372	11
3331	1372	4
3332	1374	3
3333	1374	2
3334	1374	2
3335	1374	9
3336	1375	8
3337	1375	1
3338	1375	10
3339	1375	6
3340	1376	6
3341	1376	6
3342	1376	5
3343	1376	0
3344	1376	12
3345	1377	9
3346	1378	2
3347	1378	4
3348	1378	12
3349	1378	6
3350	1379	8
3351	1379	3
3352	1379	6
3353	1379	8
3354	1381	7
3355	1381	11
3356	1381	2
3357	1383	0
3358	1383	2
3359	1385	6
3360	1385	3
3361	1386	2
3362	1386	5
3363	1386	1
3364	1387	2
3365	1387	6
3366	1387	10
3367	1389	1
3368	1390	7
3369	1390	2
3370	1390	10
3371	1392	3
3372	1392	4
3373	1393	3
3374	1393	3
3375	1393	5
3376	1393	0
3377	1394	7
3378	1394	7
3379	1394	8
3380	1395	6
3381	1395	7
3382	1396	0
3383	1396	9
3384	1396	12
3385	1397	2
3386	1397	4
3387	1397	5
3388	1397	10
3389	1399	4
3390	1399	8
3391	1400	5
3392	1400	3
3393	1400	2
3394	1400	6
3395	1401	9
3396	1401	6
3397	1402	2
3398	1402	2
3399	1402	12
3400	1402	12
3401	1403	0
3402	1403	1
3403	1404	7
3404	1404	10
3405	1404	6
3406	1404	7
3407	1404	8
3408	1405	4
3409	1405	4
3410	1405	1
3411	1405	5
3412	1406	3
3413	1406	0
3414	1406	11
3415	1406	10
3416	1407	6
3417	1407	0
3418	1408	10
3419	1408	10
3420	1408	10
3421	1409	1
3422	1410	4
3423	1410	6
3424	1410	2
3425	1410	5
3426	1410	0
3427	1411	11
3428	1412	2
3429	1412	6
3430	1412	5
3431	1412	7
3432	1412	2
3433	1413	6
3434	1414	11
3435	1414	2
3436	1414	2
3437	1414	2
3438	1415	5
3439	1415	2
3440	1415	7
3441	1415	5
3442	1417	4
3443	1417	0
3444	1417	12
3445	1417	5
3446	1418	8
3447	1420	1
3448	1420	0
3449	1420	12
3450	1420	0
3451	1421	8
3452	1421	8
3453	1423	3
3454	1423	12
3455	1424	10
3456	1425	12
3457	1426	5
3458	1426	8
3459	1426	5
3460	1427	4
3461	1427	10
3462	1427	0
3463	1427	6
3464	1431	1
3465	1432	0
3466	1432	5
3467	1432	3
3468	1432	8
3469	1433	7
3470	1433	2
3471	1433	4
3472	1434	0
3473	1434	11
3474	1434	5
3475	1435	9
3476	1436	4
3477	1436	1
3478	1436	1
3479	1436	5
3480	1436	6
3481	1437	10
3482	1438	1
3483	1438	2
3484	1438	12
3485	1438	6
3486	1439	4
3487	1440	11
3488	1440	11
3489	1440	0
3490	1442	1
3491	1442	11
3492	1442	3
3493	1443	8
3494	1444	3
3495	1444	10
3496	1444	11
3497	1445	0
3498	1445	10
3499	1445	2
3500	1445	9
3501	1446	2
3502	1446	6
3503	1446	11
3504	1446	8
3505	1446	10
3506	1447	7
3507	1447	12
3508	1447	3
3509	1448	9
3510	1448	7
3511	1448	4
3512	1448	2
3513	1448	11
3514	1449	1
3515	1449	5
3516	1449	11
3517	1450	0
3518	1450	5
3519	1451	11
3520	1452	6
3521	1453	12
3522	1453	6
3523	1454	6
3524	1454	8
3525	1454	11
3526	1456	3
3527	1456	6
3528	1457	2
3529	1458	8
3530	1458	7
3531	1459	9
3532	1459	11
3533	1459	1
3534	1459	9
3535	1460	10
3536	1460	1
3537	1460	7
3538	1461	4
3539	1462	5
3540	1462	6
3541	1463	1
3542	1465	2
3543	1465	3
3544	1465	8
3545	1465	0
3546	1466	7
3547	1466	7
3548	1466	3
3549	1467	1
3550	1467	12
3551	1467	0
3552	1467	3
3553	1467	0
3554	1468	11
3555	1468	5
3556	1468	3
3557	1468	6
3558	1468	1
3559	1469	1
3560	1469	7
3561	1470	3
3562	1470	3
3563	1470	10
3564	1470	12
3565	1470	2
3566	1471	4
3567	1471	11
3568	1473	6
3569	1473	12
3570	1473	0
3571	1473	0
3572	1473	7
3573	1474	7
3574	1475	4
3575	1475	2
3576	1475	5
3577	1475	0
3578	1476	6
3579	1476	6
3580	1476	2
3581	1477	3
3582	1477	8
3583	1477	3
3584	1478	9
3585	1478	7
3586	1478	7
3587	1479	4
3588	1479	11
3589	1479	6
3590	1479	1
3591	1479	0
3592	1480	0
3593	1480	3
3594	1480	10
3595	1480	6
3596	1481	1
3597	1481	11
3598	1481	11
3599	1483	6
3600	1483	10
3601	1483	12
3602	1484	0
3603	1484	3
3604	1484	4
3605	1484	7
3606	1485	1
3607	1485	9
3608	1485	0
3609	1485	0
3610	1485	3
3611	1486	8
3612	1487	0
3613	1487	9
3614	1487	4
3615	1488	0
3616	1488	0
3617	1488	12
3618	1489	9
3619	1489	5
3620	1489	0
3621	1489	7
3622	1490	10
3623	1490	11
3624	1490	6
3625	1491	3
3626	1491	5
3627	1491	4
3628	1491	8
3629	1492	9
3630	1492	2
3631	1493	7
3632	1493	4
3633	1493	2
3634	1493	7
3635	1495	7
3636	1495	5
3637	1495	3
3638	1495	4
3639	1497	1
3640	1497	1
3641	1497	4
3642	1497	8
3643	1498	10
3644	1498	11
3645	1498	1
3646	1498	0
3647	1498	4
3648	1499	3
3649	1499	0
3650	1500	6
3651	1500	0
3652	1500	9
3653	1500	11
3654	1500	1
3655	1501	11
3656	1502	3
3657	1502	9
3658	1502	3
3659	1502	1
3660	1503	10
3661	1503	9
3662	1503	3
3663	1504	6
3664	1504	7
3665	1504	1
3666	1505	3
3667	1505	3
3668	1505	10
3669	1505	1
3670	1506	11
3671	1507	7
3672	1507	6
3673	1508	1
3674	1508	9
3675	1508	1
3676	1508	12
3677	1509	7
3678	1509	5
3679	1509	4
3680	1509	9
3681	1509	12
3682	1510	11
3683	1510	12
3684	1510	2
3685	1510	3
3686	1510	10
3687	1511	12
3688	1511	3
3689	1511	5
3690	1511	1
3691	1511	0
3692	1512	5
3693	1512	9
3694	1512	10
3695	1512	3
3696	1512	10
3697	1513	11
3698	1514	0
3699	1514	5
3700	1515	3
3701	1515	7
3702	1516	5
3703	1516	11
3704	1518	12
3705	1519	10
3706	1519	8
3707	1521	10
3708	1521	8
3709	1521	7
3710	1521	5
3711	1522	8
3712	1523	3
3713	1523	7
3714	1524	6
3715	1524	5
3716	1524	4
3717	1524	11
3718	1524	8
3719	1525	5
3720	1525	6
3721	1526	3
3722	1526	4
3723	1527	8
3724	1527	12
3725	1529	10
3726	1529	6
3727	1529	12
3728	1529	4
3729	1529	11
3730	1530	1
3731	1530	4
3732	1530	0
3733	1531	2
3734	1532	3
3735	1532	12
3736	1532	1
3737	1533	11
3738	1534	8
3739	1535	0
3740	1535	4
3741	1535	12
3742	1535	4
3743	1535	12
3744	1536	1
3745	1536	11
3746	1537	0
3747	1537	2
3748	1540	9
3749	1540	6
3750	1540	11
3751	1540	11
3752	1540	11
3753	1542	5
3754	1542	12
3755	1542	9
3756	1542	1
3757	1542	2
3758	1543	0
3759	1546	12
3760	1547	6
3761	1547	9
3762	1550	6
3763	1550	4
3764	1551	0
3765	1551	6
3766	1552	11
3767	1552	2
3768	1553	9
3769	1553	12
3770	1553	8
3771	1554	0
3772	1554	8
3773	1554	1
3774	1555	4
3775	1555	6
3776	1555	0
3777	1555	2
3778	1556	8
3779	1556	2
3780	1557	1
3781	1557	7
3782	1557	11
3783	1557	12
3784	1559	11
3785	1559	8
3786	1560	6
3787	1560	12
3788	1561	4
3789	1562	1
3790	1563	10
3791	1563	5
3792	1563	12
3793	1563	11
3794	1564	12
3795	1565	10
3796	1566	4
3797	1566	0
3798	1566	7
3799	1567	8
3800	1568	12
3801	1569	4
3802	1570	11
3803	1570	5
3804	1570	10
3805	1570	12
3806	1571	8
3807	1571	10
3808	1571	6
3809	1571	7
3810	1572	10
3811	1572	5
3812	1572	11
3813	1572	0
3814	1572	11
3815	1573	7
3816	1573	10
3817	1573	3
3818	1573	0
3819	1574	3
3820	1574	8
3821	1574	12
3822	1575	6
3823	1575	3
3824	1575	5
3825	1575	8
3826	1575	0
3827	1576	9
3828	1577	1
3829	1577	11
3830	1577	9
3831	1579	0
3832	1580	7
3833	1580	5
3834	1581	2
3835	1581	11
3836	1582	4
3837	1582	2
3838	1582	5
3839	1584	12
3840	1584	9
3841	1584	1
3842	1584	8
3843	1584	1
3844	1585	0
3845	1585	5
3846	1585	9
3847	1586	3
3848	1586	10
3849	1586	2
3850	1586	2
3851	1588	4
3852	1588	1
3853	1588	3
3854	1588	1
3855	1588	12
3856	1589	11
3857	1589	11
3858	1590	2
3859	1590	6
3860	1590	5
3861	1591	8
3862	1591	8
3863	1592	8
3864	1593	9
3865	1594	5
3866	1594	8
3867	1595	10
3868	1595	0
3869	1595	10
3870	1595	3
3871	1595	0
3872	1596	0
3873	1596	7
3874	1597	2
3875	1597	6
3876	1598	11
3877	1599	1
3878	1599	12
3879	1599	7
3880	1599	11
\.


--
-- Name: camp_locations_location_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY camp_locations
    ADD CONSTRAINT camp_locations_location_id_key UNIQUE (location_id);


--
-- Name: camp_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY camp_locations
    ADD CONSTRAINT camp_locations_pkey PRIMARY KEY (id);


--
-- Name: clients_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: email_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY email
    ADD CONSTRAINT email_pkey PRIMARY KEY (id);


--
-- Name: imported_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY imported
    ADD CONSTRAINT imported_pkey PRIMARY KEY (id);


--
-- Name: information_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY information
    ADD CONSTRAINT information_pkey PRIMARY KEY (id);


--
-- Name: logistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY logistics
    ADD CONSTRAINT logistics_pkey PRIMARY KEY (id);


--
-- Name: patients_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (pid);


--
-- Name: reason_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reason
    ADD CONSTRAINT reason_pkey PRIMARY KEY (id);


--
-- Name: referal_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY referal
    ADD CONSTRAINT referal_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

