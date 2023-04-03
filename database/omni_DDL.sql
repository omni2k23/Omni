-- Database: omniDB

CREATE DATABASE "omniDB"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- SCHEMA: public

-- DROP SCHEMA IF EXISTS public ;

CREATE SCHEMA IF NOT EXISTS public
    AUTHORIZATION pg_database_owner;

COMMENT ON SCHEMA public
    IS 'standard public schema';

GRANT USAGE ON SCHEMA public TO PUBLIC;

GRANT ALL ON SCHEMA public TO pg_database_owner;

-- Table: public.customer

-- DROP TABLE IF EXISTS public.customer;

CREATE TABLE IF NOT EXISTS public.customer
(
    customer_id integer NOT NULL,
    email text COLLATE pg_catalog."default",
    password text COLLATE pg_catalog."default",
    first_name text COLLATE pg_catalog."default",
    last_name text COLLATE pg_catalog."default",
    address_line_one text COLLATE pg_catalog."default",
    city text COLLATE pg_catalog."default",
    state text COLLATE pg_catalog."default",
    zipcode integer,
    card_number integer,
    name_on_card text COLLATE pg_catalog."default",
    expiration_date date,
    CONSTRAINT "Customer_pkey" PRIMARY KEY (customer_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.customer
    OWNER to postgres;

-- Table: public.delivery

-- DROP TABLE IF EXISTS public.delivery;

CREATE TABLE IF NOT EXISTS public.delivery
(
    "deliveryID" integer NOT NULL,
    driver_id integer,
    customer_id integer,
    store_name text COLLATE pg_catalog."default",
    store_address text COLLATE pg_catalog."default",
    status text COLLATE pg_catalog."default",
    CONSTRAINT delivery_pkey PRIMARY KEY ("deliveryID"),
    CONSTRAINT customer_id FOREIGN KEY (customer_id)
        REFERENCES public.customer (customer_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT driver_id FOREIGN KEY (driver_id)
        REFERENCES public.driver (driver_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.delivery
    OWNER to postgres;

-- Table: public.driver

-- DROP TABLE IF EXISTS public.driver;

CREATE TABLE IF NOT EXISTS public.driver
(
    driver_id integer NOT NULL,
    email text COLLATE pg_catalog."default",
    password text COLLATE pg_catalog."default",
    first_name text COLLATE pg_catalog."default",
    last_name text COLLATE pg_catalog."default",
    phone_number text COLLATE pg_catalog."default",
    vehicle_type text COLLATE pg_catalog."default",
    license_number text COLLATE pg_catalog."default",
    year integer,
    make text COLLATE pg_catalog."default",
    model text COLLATE pg_catalog."default",
    CONSTRAINT driver_pkey PRIMARY KEY (driver_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.driver
    OWNER to postgres;

-- Table: public.order

-- DROP TABLE IF EXISTS public."order";

CREATE TABLE IF NOT EXISTS public."order"
(
    order_id integer NOT NULL,
    order_number integer,
    order_datetime timestamp without time zone,
    store_name text COLLATE pg_catalog."default",
    customer_id integer,
    driver_id integer,
    item_name text COLLATE pg_catalog."default",
    item_price numeric,
    "total " numeric,
    status text COLLATE pg_catalog."default",
    CONSTRAINT order_pkey PRIMARY KEY (order_id),
    CONSTRAINT customer_id FOREIGN KEY (customer_id)
        REFERENCES public.customer (customer_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT driver_id FOREIGN KEY (driver_id)
        REFERENCES public.driver (driver_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."order"
    OWNER to postgres;