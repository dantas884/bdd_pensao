--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-09-15 20:49:16

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
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4822 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16411)
-- Name: hospedes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hospedes (
    hospede_id integer NOT NULL,
    nome character varying(100) NOT NULL,
    data_nascimento date,
    telefone character varying(15),
    cpf character varying(15) NOT NULL
);


ALTER TABLE public.hospedes OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16410)
-- Name: hospedes_hospede_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hospedes_hospede_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hospedes_hospede_id_seq OWNER TO postgres;

--
-- TOC entry 4825 (class 0 OID 0)
-- Dependencies: 215
-- Name: hospedes_hospede_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hospedes_hospede_id_seq OWNED BY public.hospedes.hospede_id;


--
-- TOC entry 222 (class 1259 OID 16496)
-- Name: pagamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pagamentos (
    pagamento_id integer NOT NULL,
    reserva_id integer,
    valor_pago numeric(10,2) NOT NULL,
    data_pagamento date NOT NULL,
    metodo_pagamento character varying(50)
);


ALTER TABLE public.pagamentos OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16495)
-- Name: pagamentos_pagamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pagamentos_pagamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pagamentos_pagamento_id_seq OWNER TO postgres;

--
-- TOC entry 4827 (class 0 OID 0)
-- Dependencies: 221
-- Name: pagamentos_pagamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pagamentos_pagamento_id_seq OWNED BY public.pagamentos.pagamento_id;


--
-- TOC entry 218 (class 1259 OID 16470)
-- Name: quartos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quartos (
    quarto_id integer NOT NULL,
    numero_quarto integer NOT NULL,
    tipo character varying(50) NOT NULL,
    preco_mensal numeric(10,2) NOT NULL,
    status character varying(20) DEFAULT 'Indisponível'::character varying
);


ALTER TABLE public.quartos OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16469)
-- Name: quartos_quarto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quartos_quarto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quartos_quarto_id_seq OWNER TO postgres;

--
-- TOC entry 4829 (class 0 OID 0)
-- Dependencies: 217
-- Name: quartos_quarto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quartos_quarto_id_seq OWNED BY public.quartos.quarto_id;


--
-- TOC entry 220 (class 1259 OID 16478)
-- Name: reservas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservas (
    reserva_id integer NOT NULL,
    hospede_id integer,
    quarto_id integer,
    data_entrada date NOT NULL,
    data_saida date,
    status_reserva character varying(20) DEFAULT 'Ativa'::character varying
);


ALTER TABLE public.reservas OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16477)
-- Name: reservas_reserva_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservas_reserva_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reservas_reserva_id_seq OWNER TO postgres;

--
-- TOC entry 4831 (class 0 OID 0)
-- Dependencies: 219
-- Name: reservas_reserva_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservas_reserva_id_seq OWNED BY public.reservas.reserva_id;


--
-- TOC entry 4649 (class 2604 OID 16414)
-- Name: hospedes hospede_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospedes ALTER COLUMN hospede_id SET DEFAULT nextval('public.hospedes_hospede_id_seq'::regclass);


--
-- TOC entry 4654 (class 2604 OID 16499)
-- Name: pagamentos pagamento_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagamentos ALTER COLUMN pagamento_id SET DEFAULT nextval('public.pagamentos_pagamento_id_seq'::regclass);


--
-- TOC entry 4650 (class 2604 OID 16473)
-- Name: quartos quarto_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quartos ALTER COLUMN quarto_id SET DEFAULT nextval('public.quartos_quarto_id_seq'::regclass);


--
-- TOC entry 4652 (class 2604 OID 16481)
-- Name: reservas reserva_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas ALTER COLUMN reserva_id SET DEFAULT nextval('public.reservas_reserva_id_seq'::regclass);


--
-- TOC entry 4656 (class 2606 OID 16416)
-- Name: hospedes hospedes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospedes
    ADD CONSTRAINT hospedes_pkey PRIMARY KEY (hospede_id);


--
-- TOC entry 4662 (class 2606 OID 16501)
-- Name: pagamentos pagamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagamentos
    ADD CONSTRAINT pagamentos_pkey PRIMARY KEY (pagamento_id);


--
-- TOC entry 4658 (class 2606 OID 16476)
-- Name: quartos quartos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quartos
    ADD CONSTRAINT quartos_pkey PRIMARY KEY (quarto_id);


--
-- TOC entry 4660 (class 2606 OID 16484)
-- Name: reservas reservas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_pkey PRIMARY KEY (reserva_id);


--
-- TOC entry 4665 (class 2606 OID 16502)
-- Name: pagamentos pagamentos_reserva_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagamentos
    ADD CONSTRAINT pagamentos_reserva_id_fkey FOREIGN KEY (reserva_id) REFERENCES public.reservas(reserva_id);


--
-- TOC entry 4663 (class 2606 OID 16485)
-- Name: reservas reservas_hospede_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_hospede_id_fkey FOREIGN KEY (hospede_id) REFERENCES public.hospedes(hospede_id);


--
-- TOC entry 4664 (class 2606 OID 16490)
-- Name: reservas reservas_quarto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_quarto_id_fkey FOREIGN KEY (quarto_id) REFERENCES public.quartos(quarto_id);


--
-- TOC entry 4823 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;


--
-- TOC entry 4824 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE hospedes; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,UPDATE ON TABLE public.hospedes TO pensao_user;


--
-- TOC entry 4826 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE pagamentos; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,UPDATE ON TABLE public.pagamentos TO pensao_user;


--
-- TOC entry 4828 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE quartos; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,UPDATE ON TABLE public.quartos TO pensao_user;


--
-- TOC entry 4830 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE reservas; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,UPDATE ON TABLE public.reservas TO pensao_user;


-- Completed on 2024-09-15 20:49:16

--
-- PostgreSQL database dump complete
--

