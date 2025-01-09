--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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
-- Name: account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account (
    "userId" text NOT NULL,
    type text NOT NULL,
    provider text NOT NULL,
    "providerAccountId" text NOT NULL,
    refresh_token text,
    access_token text,
    expires_at integer,
    token_type text,
    scope text,
    id_token text,
    session_state text
);


ALTER TABLE public.account OWNER TO postgres;

--
-- Name: box; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.box (
    id text DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    description text,
    slug text NOT NULL
);


ALTER TABLE public.box OWNER TO postgres;

--
-- Name: question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question (
    id text DEFAULT gen_random_uuid() NOT NULL,
    "boxId" text NOT NULL,
    question text NOT NULL,
    answer text NOT NULL,
    "questionNumber" integer NOT NULL
);


ALTER TABLE public.question OWNER TO postgres;

--
-- Name: question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.question_id_seq OWNER TO postgres;

--
-- Name: question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.question_id_seq OWNED BY public.question.id;


--
-- Name: session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.session (
    "sessionToken" text NOT NULL,
    "userId" text NOT NULL,
    expires timestamp without time zone NOT NULL
);


ALTER TABLE public.session OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id text NOT NULL,
    name text,
    email text NOT NULL,
    "emailVerified" timestamp without time zone,
    image text
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_question (
    "userId" text NOT NULL,
    "questionId" text NOT NULL
);


ALTER TABLE public.user_question OWNER TO postgres;

--
-- Name: user_question_questionId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."user_question_questionId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."user_question_questionId_seq" OWNER TO postgres;

--
-- Name: user_question_questionId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."user_question_questionId_seq" OWNED BY public.user_question."questionId";


--
-- Name: verificationToken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."verificationToken" (
    identifier text NOT NULL,
    token text NOT NULL,
    expires timestamp without time zone NOT NULL
);


ALTER TABLE public."verificationToken" OWNER TO postgres;

--
-- Name: user_question questionId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_question ALTER COLUMN "questionId" SET DEFAULT nextval('public."user_question_questionId_seq"'::regclass);


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account ("userId", type, provider, "providerAccountId", refresh_token, access_token, expires_at, token_type, scope, id_token, session_state) FROM stdin;
\.


--
-- Data for Name: box; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.box (id, name, description, slug) FROM stdin;
2133d676-0d9a-4687-b4c0-4c128ce8bc2e	Deserialization	Hack Fortnite?! WOW! ExTREME 🚒👩🏼‍🚒👩🏼‍🚒🧯🌊🔥🔥	deserialization
9a5373ac-e151-480a-83df-cb555e95a2df	SQL Injection	WTF is SQL-Injection? 🤷🏽‍♀️	squeel-injection
8f9da2a4-c1cc-4b46-81d9-77f1ae15530a	Command injection	Inject some commands! 💉	command-injection
\.


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question (id, "boxId", question, answer, "questionNumber") FROM stdin;
a60baca7-804b-433e-9861-eb0bc1f8d4b1	9a5373ac-e151-480a-83df-cb555e95a2df	What do i need to enter into the username field to have the code above use this exact query?	user@account.com" --	1
65282492-28f2-4bdb-852b-ffec682e761f	9a5373ac-e151-480a-83df-cb555e95a2df	In our current scenario we know that our current teacher is `leo.borek@htlwildwest.at`. What would you need to write into the username field to log in as him?	leo.borek@htlwildwest.at" --	2
8f66d2f6-ddb5-42b7-a210-ac3de25d2680	9a5373ac-e151-480a-83df-cb555e95a2df	What do you need to enter to get the server to use this query?	math" UNION SELECT role,username,password FROM users --	3
ceb85a91-3f3b-47ee-be6b-d690f7c61ff3	9a5373ac-e151-480a-83df-cb555e95a2df	What is the password hash of the user `leo.borek`?	f82a7d02e8f0a728b7c3e958c278745cb224d3d7b2e3b84c0ecafc5511fdbdb7	4
aa764ff1-033e-489c-a738-0211a36cbb45	2133d676-0d9a-4687-b4c0-4c128ce8bc2e	What is the selection for pings in wireshark?	icmp	1
e9d04144-068a-429c-8ca2-37bcfb38e9d2	2133d676-0d9a-4687-b4c0-4c128ce8bc2e	What is the flag?	033cd244c35651353fe69e6e11509786	2
a0d5f981-9f64-4fcb-8c21-f2ad0516b10e	8f9da2a4-c1cc-4b46-81d9-77f1ae15530a	How can we chain two commands together in the bash shell?	&&	1
7c0003f8-f775-4857-83cc-1195df8a65c0	8f9da2a4-c1cc-4b46-81d9-77f1ae15530a	Now that you know how to chain commands together, what do you have to enter into the address field to get the server to execute the command `ping -c 1 htlwienwest.at && echo Hello from the command`? Assume the count is already set to 1.	htlwienwest.at && echo Hello from the command	2
e1ece9bc-b50f-4a60-b4e9-8822e6eadda6	8f9da2a4-c1cc-4b46-81d9-77f1ae15530a	What file seems like it could be interesting?	bitcoin.txt	3
2b8357af-be52-4202-a1af-926e66723717	8f9da2a4-c1cc-4b46-81d9-77f1ae15530a	What is the content of the file?	3d517d09f5ddd2e18fb9124e630b3b65	4
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.session ("sessionToken", "userId", expires) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, name, email, "emailVerified", image) FROM stdin;
0d1145bf-9762-4e18-94ba-03d8e14a69f2	Jan Schäfer	schaefer.j19@htlwienwest.at	\N	https://lh3.googleusercontent.com/a/ACg8ocLZMH_fK15zE8Gb5FNxt6-RO1XSjwopLTzrtgfyTCMDDg=s96-c
b908a7fd-cdae-4d0c-9767-01e7e31daca9	Arshia Reisi	reisi.a19@htlwienwest.at	\N	https://lh3.googleusercontent.com/a/ACg8ocLHVMg2A6odLhVVbsTnk-1YQKMtLnw67lLkpj8V6P6Uaq-29cQ=s96-c
\.


--
-- Data for Name: user_question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_question ("userId", "questionId") FROM stdin;
0d1145bf-9762-4e18-94ba-03d8e14a69f2	a60baca7-804b-433e-9861-eb0bc1f8d4b1
0d1145bf-9762-4e18-94ba-03d8e14a69f2	65282492-28f2-4bdb-852b-ffec682e761f
0d1145bf-9762-4e18-94ba-03d8e14a69f2	aa764ff1-033e-489c-a738-0211a36cbb45
b908a7fd-cdae-4d0c-9767-01e7e31daca9	a60baca7-804b-433e-9861-eb0bc1f8d4b1
b908a7fd-cdae-4d0c-9767-01e7e31daca9	65282492-28f2-4bdb-852b-ffec682e761f
b908a7fd-cdae-4d0c-9767-01e7e31daca9	ceb85a91-3f3b-47ee-be6b-d690f7c61ff3
b908a7fd-cdae-4d0c-9767-01e7e31daca9	8f66d2f6-ddb5-42b7-a210-ac3de25d2680
0d1145bf-9762-4e18-94ba-03d8e14a69f2	a0d5f981-9f64-4fcb-8c21-f2ad0516b10e
\.


--
-- Data for Name: verificationToken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."verificationToken" (identifier, token, expires) FROM stdin;
\.


--
-- Name: question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.question_id_seq', 1, false);


--
-- Name: user_question_questionId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."user_question_questionId_seq"', 1, false);


--
-- Name: account account_provider_providerAccountId_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT "account_provider_providerAccountId_pk" PRIMARY KEY (provider, "providerAccountId");


--
-- Name: box box_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.box
    ADD CONSTRAINT box_name_unique UNIQUE (name);


--
-- Name: box box_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.box
    ADD CONSTRAINT box_pkey PRIMARY KEY (id);


--
-- Name: box box_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.box
    ADD CONSTRAINT box_slug_unique UNIQUE (slug);


--
-- Name: question question_boxId_questionNumber_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT "question_boxId_questionNumber_unique" UNIQUE ("questionNumber", "boxId");


--
-- Name: question question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY ("sessionToken");


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_question user_question_userId_questionId_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_question
    ADD CONSTRAINT "user_question_userId_questionId_pk" PRIMARY KEY ("userId", "questionId");


--
-- Name: verificationToken verificationToken_identifier_token_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."verificationToken"
    ADD CONSTRAINT "verificationToken_identifier_token_pk" PRIMARY KEY (identifier, token);


--
-- Name: account_userId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "account_userId_idx" ON public.account USING btree ("userId");


--
-- Name: session_userId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "session_userId_idx" ON public.session USING btree ("userId");


--
-- Name: account account_userId_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT "account_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- Name: question question_boxId_box_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT "question_boxId_box_id_fk" FOREIGN KEY ("boxId") REFERENCES public.box(id) ON DELETE CASCADE;


--
-- Name: session session_userId_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT "session_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- Name: user_question user_question_questionId_question_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_question
    ADD CONSTRAINT "user_question_questionId_question_id_fk" FOREIGN KEY ("questionId") REFERENCES public.question(id) ON DELETE CASCADE;


--
-- Name: user_question user_question_userId_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_question
    ADD CONSTRAINT "user_question_userId_user_id_fk" FOREIGN KEY ("userId") REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

