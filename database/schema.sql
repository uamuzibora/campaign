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
    condoms_given integer
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
-- Name: information; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE information (
    id integer NOT NULL,
    client_id integer NOT NULL,
    information_id integer NOT NULL
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
-- Name: logistics; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE logistics (
    id integer NOT NULL,
    site_id character varying NOT NULL,
    date timestamp without time zone,
    care_packs integer,
    hiv_tests integer
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
-- Name: medical_informations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE medical_informations (
    pid integer NOT NULL,
    patient_source_id integer,
    funding_id integer,
    hiv_positive_date date,
    hiv_positive_test_location_id integer,
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
    vf_testing_site integer,
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
-- Name: reason; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reason (
    id integer NOT NULL,
    client_id integer NOT NULL,
    reason_id integer NOT NULL
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
-- Name: referal; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE referal (
    id integer NOT NULL,
    client_id integer NOT NULL,
    referal_id integer NOT NULL
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

