--
-- PostgreSQL database dump
--

-- Dumped from database version 16rc1
-- Dumped by pg_dump version 16rc1

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
-- Name: BookXAuthor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BookXAuthor" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "authorId" uuid NOT NULL,
    "bookId" uuid NOT NULL
);


ALTER TABLE public."BookXAuthor" OWNER TO postgres;

--
-- Name: BookXFavorites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BookXFavorites" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "bookId" uuid NOT NULL,
    "userId" uuid NOT NULL
);


ALTER TABLE public."BookXFavorites" OWNER TO postgres;

--
-- Name: BookXGenre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BookXGenre" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "genreId" uuid NOT NULL,
    "bookId" uuid NOT NULL
);


ALTER TABLE public."BookXGenre" OWNER TO postgres;

--
-- Name: BookXRead; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BookXRead" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "bookId" uuid NOT NULL,
    "userId" uuid NOT NULL
);


ALTER TABLE public."BookXRead" OWNER TO postgres;

--
-- Name: BookXReading; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BookXReading" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "bookId" uuid NOT NULL,
    "userId" uuid NOT NULL
);


ALTER TABLE public."BookXReading" OWNER TO postgres;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors (
    id uuid NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authors OWNER TO postgres;

--
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    id uuid NOT NULL,
    title character varying(255) NOT NULL,
    subtitle character varying(255),
    "publishedDate" character varying(255),
    publisher character varying(255),
    description text,
    pages integer,
    "averageRating" double precision,
    "usersRating" double precision,
    cover character varying(255),
    identifier character varying(255),
    active boolean DEFAULT true,
    "genreId" uuid,
    "authorId" uuid
);


ALTER TABLE public.books OWNER TO postgres;

--
-- Name: genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genres (
    id uuid NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.genres OWNER TO postgres;

--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id uuid NOT NULL,
    comment character varying(500),
    score integer NOT NULL,
    create_date date NOT NULL,
    edit_date date,
    "bookId" uuid,
    "userId" uuid
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriptions (
    id uuid NOT NULL,
    plan character varying(255) NOT NULL,
    "startDate" date,
    "finishDate" date,
    active boolean DEFAULT true,
    "userId" uuid
);


ALTER TABLE public.subscriptions OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    "userName" character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    "profilePic" character varying(255) DEFAULT 'https://firebasestorage.googleapis.com/v0/b/henry-book-explorer.appspot.com/o/image?alt=media&token=3dccc098-e2c1-48ab-9539-ce0024b12996'::character varying,
    active boolean DEFAULT true NOT NULL,
    banned boolean DEFAULT false NOT NULL,
    admin boolean DEFAULT false NOT NULL,
    "firstLogin" boolean DEFAULT true NOT NULL,
    notifications json DEFAULT '{"all":true,"expDate":true,"newBooks":true}'::json,
    "googleUser" boolean NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: BookXAuthor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BookXAuthor" ("createdAt", "updatedAt", "authorId", "bookId") FROM stdin;
\.


--
-- Data for Name: BookXFavorites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BookXFavorites" ("createdAt", "updatedAt", "bookId", "userId") FROM stdin;
2023-10-23 18:37:59.378-03	2023-10-23 18:37:59.378-03	53af539b-1d93-45e3-a5f6-c7f0ab87e646	f3b16f05-cb25-4aed-9179-6ec8bb8d31c9
2023-10-23 18:38:03.307-03	2023-10-23 18:38:03.307-03	db5dafe6-8b2c-4f43-a320-d78d76b60076	f3b16f05-cb25-4aed-9179-6ec8bb8d31c9
2023-10-23 18:38:27.682-03	2023-10-23 18:38:27.682-03	082d23cb-0339-4f50-a37d-7ea67e92d9ed	f3b16f05-cb25-4aed-9179-6ec8bb8d31c9
\.


--
-- Data for Name: BookXGenre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BookXGenre" ("createdAt", "updatedAt", "genreId", "bookId") FROM stdin;
\.


--
-- Data for Name: BookXRead; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BookXRead" ("createdAt", "updatedAt", "bookId", "userId") FROM stdin;
2023-09-29 17:19:23.373-03	2023-09-29 17:19:23.373-03	bbd83ea2-fa9f-477b-ae03-af6538d20f24	f3b16f05-cb25-4aed-9179-6ec8bb8d31c9
2023-10-23 18:38:06.466-03	2023-10-23 18:38:06.466-03	ef241683-73c3-47f0-914e-a164b8133dda	f3b16f05-cb25-4aed-9179-6ec8bb8d31c9
2023-10-23 18:39:05.68-03	2023-10-23 18:39:05.68-03	53af539b-1d93-45e3-a5f6-c7f0ab87e646	f3b16f05-cb25-4aed-9179-6ec8bb8d31c9
\.


--
-- Data for Name: BookXReading; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BookXReading" ("createdAt", "updatedAt", "bookId", "userId") FROM stdin;
\.


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authors (id, name) FROM stdin;
a961fbb9-697c-46a3-8725-789750d6201e	Mario Vargas Llosa
18be8db5-8f50-4130-9351-4b45df16592f	Jorge Luis Borges
2a1ea228-9ebe-426b-b2e4-ee26b9b4c062	Isabel Allende
c615f43f-291e-42d1-9a59-a171b213135a	Jorge Amado
bced5b8a-a4c4-4682-bac8-cc5c147823f9	Julio Verne
b9ce6c52-af56-4928-8716-8669796d7c9f	Philip K. Dick
4b904fd0-7beb-4889-bca1-dc6538337647	J. G. Ballard
e096aa94-cbec-4bfe-be89-6861f83d3443	Frank Hebert
6805fa49-f0ac-45ed-bd1a-8b219ead764c	Margaret Atwood
c6875ef2-ec56-4ff8-b8f5-11ab4ddc59f7	George Orwell
fc5bb96c-b966-49bf-ba0c-ba0bdfba71c8	Yevgeny Zamiatin
d7474d2e-604b-49ee-b0ae-f29f04e1f438	Emily St. John Mandel
434485ab-428c-4d07-a802-398bcd629404	Agatha Christie
d7ce169e-8cb7-40e8-a588-c5c1d0259899	Sir Arthur Conan Doyle
bba7433e-7614-463e-8088-b12284f924e9	Gillian Flynn
99ff250d-a3a4-4e9e-a5b1-6557a9480399	Stephen King
4f296f88-7e1d-4a9a-84ee-747ac5788211	George R. R. Martin
3b47f5cf-b2f4-4d73-892f-5d1e9824126d	Seanan McGuire
747a9024-ee42-4b7c-b769-9c5f8c8a5dae	Nnedi Okorafor
89a19a37-630f-4527-95e5-63fe2a1ef161	Andrzej Sapkowski
0f69d6b8-4adb-4841-81f5-30bdc9c00dbb	William Shakespeare
e1447963-37ad-4f4e-a5f7-e79d738fe395	Sylvia Plath
a4e2305f-315f-4c11-821e-fdbb44440eb7	Sappho
5cf79f07-4456-4c06-a0b6-c8387ee90a2d	Lord Byron
94176593-8337-4ff0-b497-03ba15f73be5	Gabriel García Márquez
591be30c-e2dc-438d-bc37-12c86774cb95	Miguel Asturias
e24841fb-424a-4d1a-8c21-8fdfd0543795	Arthur C. Clarke
0e506a9b-7a67-428d-86a1-250473cd5e26	Adolfo Bioy Casares
90996aaf-15d2-42ef-8cf0-998537fa2846	Christina Dalcher
3d8dc926-5072-49e1-9d95-f71079cc471f	Scott Westerfeld
31ae5b7a-db23-40d2-8dbd-a8d0d2a683a3	Ann Cleeves
5f1f07e9-2ce9-458b-a955-75782f1d6917	Lee Child
6e2a4907-ab5f-4b6f-9105-b73a27ffba25	Patrick Rothfuss
83cbf4a9-0d87-46cc-b2d3-076f5d5b61b1	Tamora Pierce
e22d0713-325d-4968-971b-e0c77f8257dd	Dante Alighieri
7dbc32e9-e31b-4b01-8a06-93401ecabcf8	Langston Hughes
51a9b677-2f6b-40f1-960d-5e31928da236	José Martí
7f094334-ef49-4387-a321-1e58ad0eb924	Julio Cortázar
9c7453aa-7cc0-406d-a510-3bb85e35868e	Isaac Asimov
d805ddc9-db1e-4a64-b250-f238a584b9fd	Ursula K. Le Guin
51a0949d-3608-4084-820f-72dd0f824ecc	Aldous Huxley
1d3bd94a-0154-40ca-a7c8-71007b2f4c2b	Kazuo Ishiguro
b85cd731-10b0-4b18-918b-2d3d009bcecc	Louise Penny
36026556-f411-47fe-a31b-a50047942dc1	Harlan Coben
1e146f35-f24d-4b29-98b3-fb1e8ba4f1a6	Brandon Sanderson
6bf9a6c1-6794-4af6-9c42-9ed706283817	Naomi Novik
3404bc7a-2d99-4d99-b363-9a199dd430ec	Ted Hughes
0ab93fbb-25b2-417c-9b53-1711a66f8027	Li Bai
1770c0d9-88ae-4411-a311-149b6baa1368	Pablo Neruda
e875fbd4-532a-42bf-ad54-4bf1a7bda64f	Jorge Amado
cfd9cbd5-292b-4083-a01b-0ccce3983871	Robert A. Heinlein
07089b76-e8cf-492b-9dff-b1b74631d636	Mary Shelley
8d7de875-a8ad-46d5-9d7a-4dd54e28f0bd	Ray Bradbury
8497e56f-d640-48ed-a8fd-f8d8b81d63fd	H. G. Wells
31fe4070-75bc-4cc5-a37a-e187a59fb640	David Baldacci
f553277a-3e6e-448b-b22c-1ed324c08a90	James Patterson
80e84d63-bce2-4184-9557-c2d661ad5a67	J.R.R. Tolkien
735237a6-892e-4433-834b-cb86db283603	J. K. Rowling
e9bcf986-dd86-4139-88c1-9a76e45475c3	Maya Angelou
c682f046-e167-4f42-98c7-ea2f8ac9e413	Emily Dickinson
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.books (id, title, subtitle, "publishedDate", publisher, description, pages, "averageRating", "usersRating", cover, identifier, active, "genreId", "authorId") FROM stdin;
2067e123-127d-452a-8dc4-e9f565576dd6	Seconds Away	\N	2012	Mickey Bolitar Novels	When tragedy strikes close to home, Mickey Bolitar and his new friends find themselves at the center of a murder mystery.	395	4	\N	http://books.google.com/books/content?id=e5CGMgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	ISBN:1410453480	t	0ae21e35-1af8-4308-8a26-79b81a8760b9	36026556-f411-47fe-a31b-a50047942dc1
f59f24a4-5faf-423f-a6f6-7bed8e59c43f	Cinco Esquinas	\N	2016	ALFAGUARA	Una novela del Premio Nobel de Literatura Mario Vargas Llosa. «Él había pensado que, después de todo, un periodista puede ser a veces útil. "Y también peligroso", concluyó. Tuvo el presentimiento de que nada bueno saldría de esta visita.» «La idea de esta novela comenzó con una imagen de dos señoras amigas que de pronto una noche, de una manera impensada para ambas, viven una situación erótica. Luego se fue convirtiendo en una historia policial, casi un thriller, y el thriller se fue transformando en una especie de mural de la sociedad peruana en los últimos meses o semanas de la dictadura de Fujimori y Montesinos. Me gustó la idea de que la historia se llamase Cinco esquinas como un barrio que, de alguna manera, es emblemático de Lima, de Perú y también de la época en la que está situada la historia. »Si hay un tema que permea, que impregna toda la historia, es el periodismo, el periodismo amarillo. La dictadura de Fujimori utilizó el periodismo amarillo, el periodismo de escándalo, como un arma política para desprestigiar y aniquilar moralmente a todos sus adversarios. Al mismo tiempo, también está la otra cara, cómo el periodismo, que puede ser algo vil y sucio, puede convertirse de pronto en un instrumento de liberación, de defensa moral y cívica de una sociedad. Esas dos caras del periodismo son uno de los temas centrales de Cinco Esquinas.» Mario Vargas Llosa La opinión de la crítica: «Uno de los aciertos de la novela reside, sin duda, en lo fielmente que retrata las pretensiones éticas de esta peña que trabaja en la prensa más sensacionalista...» Iñaki Ezkerra, El Pueblo Vasco «Cinco Esquinas, la nueva novela de Mario Vargas Llosa, es un retrato del Perú de los años noventa, estremecido por la violencia de Sendero Luminoso, sacudido por la corrupción del gobierno de Fujimori y escandalizado por el periodismo sensacionalista.» Letras libres «Cinco Esquinas, la novela del Premio Nobel que reúne a modo de resumen todos los elementos presentes en la extensa producción de su autor, arropados con la magnífica prosa que acostumbra.» Francisco García Pérez, Información De Alicante-Artes Y Letras «Es una novela muy bien construida, con un dominio del lenguaje notable [...].» Joan Garí, Ara «[...] Cinco Esquinas es una obra que Vargas Llosa ha escrito con malicia y con buen humor, vertiendo con maestría los trucos de su sabiduría narrativa, pero sin tomarse muy enserio ni a sí mismo ni a unos personajes verosímiles en su superficialidad.» Iñaki Ezkerra, Ideal de Almería	272	4	\N	http://books.google.com/books/content?id=YKpwCwAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	ISBN:9788420421988	t	957206ed-a071-43f4-ab09-2fed4344fe9d	a961fbb9-697c-46a3-8725-789750d6201e
db5dafe6-8b2c-4f43-a320-d78d76b60076	Full Woman, Fleshly Apple, Hot Moon	Selected Poems of Pablo Neruda	1997	not specified	Mitchell has selected 49 poems and brought them to life for a whole new generation of readers. [He] focuses on the poetry of Neruda's ripeness, from the first book of Elemental Odes, published when he was fifty, to Full Powers, published when he was fifty-eight, eleven years before his death. Full Woman, Fleshly Apple, Hot Moon is a bilingual edition, with the English translation facing Neruda's original Spanish text. --HarperCollins Publishers.	296	5	3	http://books.google.com/books/content?id=5-AcAQAAIAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	STANFORD:36105019253967	t	957206ed-a071-43f4-ab09-2fed4344fe9d	1770c0d9-88ae-4411-a311-149b6baa1368
5a983d78-7f50-42c0-b8d6-1c6fa7624591	Los propios dioses	\N	2011	DEBOLS!LLO	¿Qué podríamos hacer con un suministro de energía gratuita e inagotable? Con una gran maestría, Asimov nos sumerge en un universo totalmente diferente al que conocemos. Un derroche de imaginación pocas veces realizado. Los habitantes de un universo paralelo en el futuro, con leyes físicas ligeramente distintas a las nuestras, descubren la forma de intercambiar materia con nosotros. Materia que, una vez en el universo de destino, y merced a las diferencias físicas entre ambos, comienza a desprender energía de forma espontánea. Una vez consumida la capacidad energética del material, éste puede volver a ser intercambiado, para recomenzar el ciclo. ¿Qué podríamos hacer con un suministro de energía gratuita e inagotable? Más allá que cualquier otra historia, esta novela destaca por una impresionante descripción del cosmos, una visión que nos hace aún más insignificantes de lo que podíamos pensar.	344	5	2	http://books.google.com/books/content?id=adCGC15KAk8C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	ISBN:9788499895352	t	469ad8e3-f024-4b91-8cae-d5aa165db597	9c7453aa-7cc0-406d-a510-3bb85e35868e
ef241683-73c3-47f0-914e-a164b8133dda	Pablo Neruda - Veinte Poemas de Amor Y Una Canción Desesperada	\N	2007	Manchester University Press	Pablo Neruda's Veinte Poemas de Amor y Una Canción Desesperada (1924) is perhaps the most widely read and best loved book of poetry ever written in Spanish. Its verses can be recited by heart by millions of Latin Americans from every conceivable background and walk of life, and it has acquired the status of a bible for young lovers. This new critical edition - the first to include critical notes in English - argues that the book constitutes a critical juncture in the young Neruda's development as a poet.	212	5	0	http://books.google.com/books/content?id=dhJAHN6JD-kC&printsec=frontcover&img=1&zoom=1&source=gbs_api	ISBN:0719072999	t	957206ed-a071-43f4-ab09-2fed4344fe9d	1770c0d9-88ae-4411-a311-149b6baa1368
1465fe14-f8d2-477f-b937-5d21b7f0b253	Dominoes: One: Sherlock Holmes: The Emerald Crown	\N	2009	OUP Oxford	The activities in Dominoes keep students engaged in the stories and help to reinforce their understanding of the key language. They can be completed at home or in class. The project activities in Dominoes build on the themes from the story and encourage students to draw on their ownexperiences. Activities include note-taking and language tasks, leading to extended writing, poster-making, and class presentations. They are ideal for group work in class or individual assignments.	56	4	\N	http://books.google.com/books/content?id=n6WiQAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	ISBN:0194247627	t	0ae21e35-1af8-4308-8a26-79b81a8760b9	d7ce169e-8cb7-40e8-a588-c5c1d0259899
7e7852f3-83ec-4a3b-896b-7060b5044e13	Duma Key	A Novel	2008	Simon and Schuster	An injured man seeking mental recovery retreats to the Florida Keys and takes up painting once again.	631	4	\N	http://books.google.com/books/content?id=EzJFPz4qVOoC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	ISBN:9781416552512	t	0ae21e35-1af8-4308-8a26-79b81a8760b9	99ff250d-a3a4-4e9e-a5b1-6557a9480399
acde4dd9-99ee-40a1-9fa9-e848770dffe3	Rushing to Paradise	\N	1994	HarperCollins	A key backlist title from the author of Cocaine Nights – to be reissued as part of a repackaging of the Ballard backlist.	248	2.5	\N	http://books.google.com/books/content?id=i1haAAAAMAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	UOM:39015034289002	t	469ad8e3-f024-4b91-8cae-d5aa165db597	4b904fd0-7beb-4889-bca1-dc6538337647
21eb47e5-84ea-40e0-9b18-b7a5577e3f87	The Handmaid's Tale	Notes	1998	not specified	Key Features: Study methods Introduction to the text Summaries with critical notes Themes and techniques Textual analysis of key passages Author biography Historical and literary background Modern and historical critical approaches Chronology Glossary of literary terms	96	4	\N	http://books.google.com/books/content?id=vqdfvgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	ISBN:0582329183	t	ca086428-9691-4d83-a56f-8affaa4017fb	6805fa49-f0ac-45ed-bd1a-8b219ead764c
cc0a357a-3034-411c-a5b2-e6fc0f4d8256	Fahrenheit 451, Ray Bradbury	\N	2008	Spark Publishing Group	Created by Harvard students for students everywhere, SparkNotes books contain complete plot summaries and analyses, key facts about the featured work, analysis of the major characters, suggested essay topics, themes, motifs, and symbols, and explanations of important quotations.	76	3	\N	http://books.google.com/books/content?id=qunXLAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	ISBN:1411405129	t	ca086428-9691-4d83-a56f-8affaa4017fb	8d7de875-a8ad-46d5-9d7a-4dd54e28f0bd
1acca4d8-b8e0-4016-b4b2-07da6b9f2e0f	The Lola Quartet	\N	2015	Pan Macmillan	How far would you go for someone you love? The Lola Quartet: Jack, Daniel, Sasha and Gavin, four talented musicians at the end of their high school careers. On the dream-like night of their last concert, Gavin's girlfriend Anna disappears. Ten years later Gavin sees a photograph of a little girl who looks uncannily like him and who shares Anna's surname, and suddenly he finds himself catapulted back to a secretive past he didn't realize he'd left behind. But that photo has set off a cascade of dangerous consequences and, as one by one the members of the Lola Quartet are reunited, a terrifying story emerges: of innocent mistakes, of secrecy and of a life lived on the run. Filled with love, music and thwarted dreams, Emily St. John Mandel's The Lola Quartet is a thrilling novel about how the errors of the past can threaten the future.	288	3.5	\N	http://books.google.com/books/content?id=65h-BQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	ISBN:9781447280088	t	ca086428-9691-4d83-a56f-8affaa4017fb	d7474d2e-604b-49ee-b0ae-f29f04e1f438
0fb3a1a6-87eb-483b-bc79-b1c51f590263	Simply Lies	\N	2023	Pan Macmillan	Killer twists. Heroes to believe in. Trust Baldacci. Simply Lies is an intense thriller featuring Mickey Gibson, a former New Jersey detective, from the number one bestselling author David Baldacci. NO TRUTH Former Jersey City detective and single mother of two, Mickey Gibson, now works for global investigation company, ProEye, to track down assets of the wealthy who have tried to avoid their creditors. One day she gets a call from a colleague, Arlene Robinson, asking her to visit the home of a notorious arms dealer who has cheated some of ProEye’s clients in the past. Mickey arrives at the mansion to discover the body of a man hidden in a secret room. NO LIMITS It turns out that nothing is at it seems. The arms dealer did not exist, and nobody at ProEye knew of Arlene Robinson. Mickey had been tricked and now the cops were involved. The body was that of Thomas Lancaster who’d been in Witness Protection having had links with the mob. NO FEAR Now begins a cat-and-mouse showdown between hardened ex-cop, Mickey, and a woman with sociopathic tendencies who has no name and a mysterious past. She intends to get what she wants and people who get in her way will die. For Mickey to stop her, she must first discover her true identity and what damaged her all those years ago. And the truth behind why she selected Micky to become her nemesis . . .	448	4	\N	http://books.google.com/books/content?id=DIt9EAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	ISBN:9781529062052	t	0ae21e35-1af8-4308-8a26-79b81a8760b9	31fe4070-75bc-4cc5-a37a-e187a59fb640
8da67838-ead4-4ded-9256-db5a8124e991	Harbour Street	A Vera Stanhope Mystery	2015	Minotaur Books	From Ann Cleeves—New York Times bestselling and award-winning author of the Vera and Shetland series, both of which are hit TV shows—comes Harbour Street. “Ann Cleeves is one of my favorite mystery writers.”—Louise Penny As the snow falls thickly on Newcastle, the shouts and laughter of Christmas revelers break the muffled silence. Detective Joe Ashworth and his daughter Jessie are swept along in the jostling crowd onto the Metro. But when the train is stopped due to the bad weather, and the other passengers fade into the swirling snow, Jessie notices that one lady hasn't left the train: Margaret Krukowski has been fatally stabbed. Arriving at the scene, DI Vera Stanhope is relieved to have an excuse to escape the holiday festivities. As she stands on the silent, snow-covered station platform, Vera feels a familiar buzz of anticipation, sensing that this will be a complex and unusual case. Then, just days later, a second woman is murdered. Vera knows that to find the key to this new killing she needs to understand what had been troubling Margaret so deeply before she died - before another life is lost. She can feel in her bones that there's a link. Retracing Margaret's final steps, Vera finds herself searching deep into the hidden past of this seemingly innocent neighborhood, led by clues that keep revolving around one street...Harbour Street. Told with piercing prose and a forensic eye, Ann Cleeves' gripping novel explores what happens when a community closes ranks to protect their own-and at what point silent witnesses become complicit.	392	4	\N	http://books.google.com/books/content?id=xjw6CQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	ISBN:9781466881051	t	0ae21e35-1af8-4308-8a26-79b81a8760b9	31ae5b7a-db23-40d2-8dbd-a8d0d2a683a3
11b31ada-7516-4338-83ac-d894633b0725	The Grownup	\N	2015	Hachette UK	A young woman is making a living faking it as a cut-price psychic (with some illegal soft-core sex work on the side). She makes a decent wage mostly by telling people what they want to hear. But then she meets Susan Burke. Susan moved to the city one year ago with her husband and 15-year-old stepson Miles. They live in a Victorian house called Carterhook Manor. Susan has become convinced that some malevolent spirit is inhabiting their home. The young woman doesn't believe in exorcism or the supernatural. However when she enters the house for the first time, she begins to feel it too, as if the very house is watching her, waiting, biding its time . . . The Grownup, which originally appeared as 'What Do You Do?' in George R. R. Martin's Rogues short story anthology, proves once again that Gillian Flynn is one of the world's most original and skilled voices in fiction.	64	3.5	\N	http://books.google.com/books/content?id=AaVVCgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	ISBN:9781474603058	t	0ae21e35-1af8-4308-8a26-79b81a8760b9	bba7433e-7614-463e-8088-b12284f924e9
30a7c934-5aad-408d-b865-9084836b5f32	Legion: Skin Deep	\N	2015	Hachette UK	Following the success of Legion, Legion: Skin Deep charts another fast moving and gripping adventure for Stephen Leeds, AKA Legion. Leeds is a genius, his mind contains too much information. And to cope it has split his skills off into individual personalities. They crowd his head and he lives with them in a vast empty mansion. While he can call on any one of them to solve a problem he also walks a line across an all-consuming madness. In development for television Brandon Sanderson's Legion stories are gripping psychological thrillers, perfect for any fan of speculative fiction. They will resonate particularly strongly with fans of stories about that other tortured crime-fighting genius: Sherlock Holmes. Legion: Skin Deep is an all-new, action-packed novella starring one of the most fascinating and charismatic heroes ever.	208	3.5	\N	http://books.google.com/books/content?id=5CgnBgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	ISBN:9781473212510	t	fc342538-aae1-4e98-b076-116cfe29a661	1e146f35-f24d-4b29-98b3-fb1e8ba4f1a6
89bc87ab-841a-4acd-9a1a-636834a2e677	Harry Potter and the Chamber of Secrets	\N	2016	Arthur A. Levine Books	Originally published in a slightly different form in the United Kingdom by Bloomsbury in 1998.	259	4.5	1	http://books.google.com/books/content?id=Gt_MtAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	ISBN:0545791324	t	fc342538-aae1-4e98-b076-116cfe29a661	735237a6-892e-4433-834b-cb86db283603
e68ede1f-f032-4af2-95ac-d208df1590b5	The Slow Regard of Silent Things	\N	2014	Astra Publishing House	Deep below the University, there is a dark place. Few people know of it: a broken web of ancient passageways and abandoned rooms. A young woman lives there, tucked among the sprawling tunnels of the Underthing, snug in the heart of this forgotten place. Her name is Auri, and she is full of mysteries. The Slow Regard of Silent Things is a brief, bittersweet glimpse of Auri’s life, a small adventure all her own. At once joyous and haunting, this story offers a chance to see the world through Auri’s eyes. And it gives the reader a chance to learn things that only Auri knows.... In this book, Patrick Rothfuss brings us into the world of one of The Kingkiller Chronicle’s most enigmatic characters. Full of secrets and mysteries, The Slow Regard of Silent Things is the story of a broken girl trying to live in a broken world.	173	3.5	1	http://books.google.com/books/content?id=plCJEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	ISBN:9780698184947	t	fc342538-aae1-4e98-b076-116cfe29a661	6e2a4907-ab5f-4b6f-9105-b73a27ffba25
bbd83ea2-fa9f-477b-ae03-af6538d20f24	Of Love and Other Demons	\N	1996	Penguin Books India	This is a comprehensive reference guide for professional and student structural engineers containing key information required on a day-to-day basis. By bringing together data from many sources, this book should help engineers to apply classroom theories into practical projects on the ground. With quick and clear access to charts, tables and data it speeds up scheme design in the office, in transit, or on the site.	172	5	4.5	http://books.google.com/books/content?id=Lu2a9lqhsaEC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	ISBN:0140246312	t	957206ed-a071-43f4-ab09-2fed4344fe9d	94176593-8337-4ff0-b497-03ba15f73be5
847e10ba-fb13-449e-9b1b-9bf653fb01e5	Cradle	\N	2011	Hachette UK	When the US Navy's new, state-of-the-art missile disappears after its test launch, panic ensues - if it ends up anywhere near civilians, the consequences could be massive. Where has it gone? What has happened? Seemingly unconnected, journalist Carol Dawson is investigating the unusual sightings of whales in Miami, which may or may not be linked to the missing rocket. Armed with Oceanographic research equipment, Carol charters a boat skippered by Nick Williams and Jefferson Troy and heads to the Gulf of Mexico. What they find can barely be explained but could be worth untold riches. While Carol, Nick and Jefferson attempt to uncover the origin of the mysterious artefact they have discovered, they must dodge treasure hunters, the government, and consider the origin of humanity itself. Is this the First Contact? Or is it the last?	368	3	\N	http://books.google.com/books/content?id=SxtcJI0KmcIC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	ISBN:9780575121690	t	469ad8e3-f024-4b91-8cae-d5aa165db597	e24841fb-424a-4d1a-8c21-8fdfd0543795
ccf4d8c0-daae-495f-83a9-b339e521cbde	Cocaine Nights	\N	2012	HarperCollins UK	‘Snort up Cocaine Nights. It’s disorientating, deranging and knocks the work of other avant-garde writers into a hatted cock’ Will Self	336	3	\N	http://books.google.com/books/content?id=S1vEIxMod1kC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	ISBN:9780007378814	t	469ad8e3-f024-4b91-8cae-d5aa165db597	4b904fd0-7beb-4889-bca1-dc6538337647
7147b7e9-329d-4a53-964c-9cedccfe4bb9	Station Eleven	A novel	2014	Vintage	NATIONAL BESTSELLER • NATIONAL BOOK AWARD FINALIST • A PEN/FAULKNER AWARD FINALIST • Set in the eerie days of civilization’s collapse—the spellbinding story of a Hollywood star, his would-be savior, and a nomadic group of actors roaming the scattered outposts of the Great Lakes region, risking everything for art and humanity. • Now an original series on HBO Max. • Over one million copies sold! Kirsten Raymonde will never forget the night Arthur Leander, the famous Hollywood actor, had a heart attack on stage during a production of King Lear. That was the night when a devastating flu pandemic arrived in the city, and within weeks, civilization as we know it came to an end. Twenty years later, Kirsten moves between the settlements of the altered world with a small troupe of actors and musicians. They call themselves The Traveling Symphony, and they have dedicated themselves to keeping the remnants of art and humanity alive. But when they arrive in St. Deborah by the Water, they encounter a violent prophet who will threaten the tiny band’s existence. And as the story takes off, moving back and forth in time, and vividly depicting life before and after the pandemic, the strange twist of fate that connects them all will be revealed. Look for Emily St. John Mandel’s bestselling new novel, Sea of Tranquility!	344	4	\N	http://books.google.com/books/content?id=2RIcAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	ISBN:9780385353311	t	ca086428-9691-4d83-a56f-8affaa4017fb	d7474d2e-604b-49ee-b0ae-f29f04e1f438
7ebda859-8d21-4cac-b5ca-d917bcf6ab18	The Ways of White Folks	Stories	1990	Vintage	A collection of vibrant and incisive short stories depicting the sometimes humorous, but more often tragic interactions between Black people and white people in America in the 1920s and ‘30s. One of the most important writers to emerge from the Harlem Renaissance, Langston Hughes may be best known as a poet, but these stories showcase his talent as a lively storyteller. His work blends elements of blues and jazz, speech and song, into a triumphant and wholly original idiom. Stories included in this collection: "Cora Unashamed" "Slave on the Block" "Home" "Passing" "A Good Job Gone" "Rejuvenation Through Joy" "The Blues I'm Playing" "Red-Headed Baby" "Poor Little Black Fellow" "Little Dog" "Berry" "Mother and Child" "One Christmas Eve" "Father and Son"	273	4.5	\N	http://books.google.com/books/content?id=ksdfDwAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	ISBN:9780679728177	t	568c4d96-5281-435e-9f9c-44f68b5cef7a	7dbc32e9-e31b-4b01-8a06-93401ecabcf8
383edee2-8f20-44c2-a64a-a5f3c6fc351d	The Million Dollar Bond Robbery	A Hercule Poirot Short Story	2012	Harper Collins	A young banker is suspected of stealing one million dollars in Liberty Bonds on a transatlantic journey to New York, and appeals to Hercule Poirot to clear his name. Poirot learns the identities of the three people who hold keys to the locked trunk, but it won't be as easy to identify the true thief…	100	3.5	\N	http://books.google.com/books/content?id=FzfJgyO2sdoC&printsec=frontcover&img=1&zoom=1&source=gbs_api	ISBN:9780062210944	t	0ae21e35-1af8-4308-8a26-79b81a8760b9	434485ab-428c-4d07-a802-398bcd629404
8d0d0bdf-2563-4e1f-b251-43903830f883	Variable Star	\N	2010	Tor Books	A never-before-published masterpiece from science fiction's greatest writer, rediscovered after more than half a century. When Joel Johnston first met Jinny Hamilton, it seemed like a dream come true. And when she finally agreed to marry him, he felt like the luckiest man in the universe. There was just one small problem. He was broke. His only goal in life was to become a composer, and he knew it would take years before he was earning enough to support a family. But Jinny wasn't willing to wait. And when Joel asked her what they were going to do for money, she gave him a most unexpected answer. She told him that her name wasn't really Jinny Hamilton---it was Jinny Conrad, and she was the granddaughter of Richard Conrad, the wealthiest man in the solar system. And now that she was sure that Joel loved her for herself, not for her wealth, she revealed her family's plans for him---he would be groomed for a place in the vast Conrad empire and sire a dynasty to carry on the family business. Most men would have jumped at the opportunity. But Joel Johnston wasn't most men. To Jinny's surprise, and even his own, he turned down her generous offer and then set off on the mother of all benders. And woke up on a colony ship heading out into space, torn between regret over his rash decision and his determination to forget Jinny and make a life for himself among the stars. He was on his way to succeeding when his plans--and the plans of billions of others--were shattered by a cosmic cataclysm so devastating it would take all of humanity's strength and ingenuity just to survive. At the Publisher's request, this title is being sold without Digital Rights Management Software (DRM) applied.	320	3.5	\N	http://books.google.com/books/content?id=jYgXMZr3wwoC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	ISBN:9781429983457	t	469ad8e3-f024-4b91-8cae-d5aa165db597	cfd9cbd5-292b-4083-a01b-0ccce3983871
2ebfde22-8930-4c5f-99ac-3a5186a7a673	Rosemary and Rue (Toby Daye Book 1)	\N	2015	Hachette UK	The first instalment of the highly praised Toby Daye series. The world of Faerie never disappeared; it merely went into hiding, continuing to exist parallel to our own. Secrecy is the key to Faerie's survival: but no secret can be kept forever, and when the fae and mortal worlds collide, changelings are born. Outsiders from birth, these children spend their lives fighting for the respect of their immortal relations. Or in the case of October 'Toby' Daye, rejecting the fae completely. Toby has retreated into a 'normal' life - spending her nights stocking shelves at a San Francisco grocery store and her days asleep in her downtown apartment. But when Countess Evening Winterroseis murdered, Toby finds herself drawn abruptly back into the world she thought she'd left behind. It's going to take everything she's got just to stay alive, and the stakes are higher than anyone has guessed . . .	256	3.5	\N	http://books.google.com/books/content?id=BZWIBwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	ISBN:9781472116352	t	fc342538-aae1-4e98-b076-116cfe29a661	3b47f5cf-b2f4-4d73-892f-5d1e9824126d
c7281d99-2e37-4f8e-9cc3-e2fe4bc05a76	Hallelujah!, the Welcome Table	A Lifetime of Memories with Recipes	2005	Virago Press	Throughout Maya Angelou's life, food has played a key role at important moments. In HALLELUJAH! THE WELCOME TABLE she narrates some of these tales and then gives us recipes for the food that helped shape her memories. There was the time she cooked a cassoulet for M.F.K. Fischer on the very day she moved into her new house in California. Or how her mother made a delicious caramel cake for her when she was expelled from school for not being able to speak. Then there's Jessica 'Decca' Mitford's 'Chicken Drunkard Style'. The recipes cover fried meat pies, Minnesota wild rice, chicken livers and many more. Maya Angelou's kitchen is a social centre; she cooks while she entertains and is renowned for what she serves.	214	4	\N	http://books.google.com/books/content?id=UmJuPwAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	ISBN:184408163X	t	568c4d96-5281-435e-9f9c-44f68b5cef7a	e9bcf986-dd86-4139-88c1-9a76e45475c3
b5f47c8a-7a5f-4afb-9087-df6cf50ed612	The Unconsoled	\N	2009	Faber & Faber	*Kazuo Ishiguro's new novel Klara and the Sun is now available * Ryder, a renowned pianist, arrives in a Central European city he cannot identify for a concert he cannot remember agreeing to give . . . On first publication in 1995, The Unconsoled was met in some quarters with bewilderment and vilification, in others with the highest praise. One commentator asked, 'Has Ishiguro gone for greatness or has he gone mad?' Over the years, this uniquely strange and extraordinary novel about a man whose life has accelerated beyond his control has come to be seen by many as being the key work and a turning point in his career. 'A masterpiece. It is above all a book devoted to the human heart.' Rachel Cusk, The Times 'The most original and remarkable book he has so far produced.' New York Times Book Review 'One of the strangest books in memory.' TLS 'I've never read a book like it. I think it is a masterpiece.' John Carey, The Late Show	629	3.5	1	http://books.google.com/books/content?id=eSGXKEWzULkC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	ISBN:9780571249367	t	ca086428-9691-4d83-a56f-8affaa4017fb	1d3bd94a-0154-40ca-a7c8-71007b2f4c2b
97246287-9c3d-4921-8300-1ae8985eb154	The Seagull	A Vera Stanhope Mystery	2018	Minotaur Books	"I loved The Seagull — quite simply it reminds me why Ann Cleeves is one of my favorite mystery writers! I relish learning more about Vera with each book, and The Seagull provides fresh insight into one of our most complex and lovable sleuths."—New York Times bestselling author Louise Penny "Definitely one of the best crime novels of 2017."—Reviewing the Evidence A visit to her local prison brings DI Vera Stanhope face to face with an old enemy: former detective superintendent, and now inmate, John Brace. Brace was convicted of corruption and involvement in the death of a gamekeeper – and Vera played a key part in his downfall. Now, Brace promises Vera information about the disappearance of Robbie Marshall, a notorious wheeler-dealer who disappeared in the mid-nineties, if she will look out for his daughter and grandchildren. He tells her that Marshall is dead, and that his body is buried close to St Mary’s Island in Whitley Bay. However, when a search team investigates, officers find not one skeleton, but two. This cold case case takes Vera back in time, and very close to home, as Brace and Marshall, along with a mysterious stranger known only as ‘the Prof’, were close friends of Hector, her father. Together, they were the 'Gang of Four’, regulars at a glamorous nightclub called The Seagull. Hector had been one of the last people to see Marshall alive. As the past begins to collide dangerously with the present, Vera confronts her prejudices and unwanted memories to dig out the truth . . . The Seagull is a searing new novel by Sunday Times bestselling author Ann Cleeves, about corruption deep in the heart of a community, and fragile, and fracturing, family relationships.	416	4	\N	http://books.google.com/books/content?id=Li81swEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	ISBN:125019332X	t	0ae21e35-1af8-4308-8a26-79b81a8760b9	31ae5b7a-db23-40d2-8dbd-a8d0d2a683a3
53af539b-1d93-45e3-a5f6-c7f0ab87e646	Broken Places & Outer Spaces	Finding Creativity in the Unexpected	2019	Simon & Schuster/ TED	A powerful journey from star athlete to sudden paralysis to creative awakening, award-winning science fiction writer Nnedi Okorafor shows that what we think are our limitations have the potential to become our greatest strengths. Nnedi Okorafor was never supposed to be paralyzed. A college track star and budding entomologist, Nnedi’s lifelong battle with scoliosis was just a bump in her plan—something a simple operation would easily correct. But when Nnedi wakes from the surgery to find she can’t move her legs, her entire sense of self begins to waver. Confined to a hospital bed for months, unusual things begin to happen. Psychedelic bugs crawl her hospital walls; strange dreams visit her nightly. Nnedi begins to put these experiences into writing, conjuring up strange, fantastical stories. What Nnedi discovers during her confinement would prove to be the key to her life as a successful science fiction author: In science fiction, when something breaks, something greater often emerges from the cracks. In Broken Places & Outer Spaces, Nnedi takes the reader on a journey from her hospital bed deep into her memories, from her painful first experiences with racism as a child in Chicago to her powerful visits to her parents’ hometown in Nigeria. From Frida Kahlo to Mary Shelly, she examines great artists and writers who have pushed through their limitations, using hardship to fuel their work. Through these compelling stories and her own, Nnedi reveals a universal truth: What we perceive as limitations have the potential to become our greatest strengths—far greater than when we were unbroken. A guidebook for anyone eager to understand how their limitations might actually be used as a creative springboard, Broken Places & Outer Spaces is an inspiring look at how to open up new windows in your mind.	112	4	\N	http://books.google.com/books/content?id=25eZDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	ISBN:9781501195471	t	fc342538-aae1-4e98-b076-116cfe29a661	747a9024-ee42-4b7c-b769-9c5f8c8a5dae
5ee6e512-a1bf-4589-b184-9720d7b87a50	The Wise Man's Fear	\N	2011	Astra Publishing House	Discover book two of Patrick Rothfuss’ #1 New York Times-bestselling epic fantasy series, The Kingkiller Chronicle. “I just love the world of Patrick Rothfuss.” —Lin-Manuel Miranda DAY TWO: THE WISE MAN’S FEAR “There are three things all wise men fear: the sea in storm, a night with no moon, and the anger of a gentle man.” My name is Kvothe. You may have heard of me. So begins a tale told from his own point of view—a story unequaled in fantasy literature. Now in The Wise Man’s Fear, Day Two of The Kingkiller Chronicle, an escalating rivalry with a powerful member of the nobility forces Kvothe to leave the University and seek his fortune abroad. Adrift, penniless, and alone, he travels to Vintas, where he quickly becomes entangled in the politics of courtly society. While attempting to curry favor with a powerful noble, Kvothe uncovers an assassination attempt, comes into conflict with a rival arcanist, and leads a group of mercenaries into the wild, in an attempt to solve the mystery of who (or what) is waylaying travelers on the King's Road. All the while, Kvothe searches for answers, attempting to uncover the truth about the mysterious Amyr, the Chandrian, and the death of his parents. In The Wise Man's Fear, Kvothe takes his first steps on the path of the hero and learns how difficult life can be when a man becomes a legend in his own time.	1010	4	\N	http://books.google.com/books/content?id=6FmJEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	ISBN:9781101486405	t	fc342538-aae1-4e98-b076-116cfe29a661	6e2a4907-ab5f-4b6f-9105-b73a27ffba25
9af3b0f8-b3f9-4b13-a818-4c88eee6cef4	Last Man Standing	\N	2001	Hachette UK	The sole survivor of a devastating ambush, FBI Hostage Rescue Team agent Web London would do anything to find out what really happened that night--and a ten year old boy may be the unexpected key in this #1 New York Times bestselling thriller. Web London was trained to penetrate hostile ground and come out alive. Then ten seconds in a dark alley cost him everything: his friends, his fellow agents, his reputation. Among his super-elite FBI Hostage Rescue Team, Web was the sole survivor of a high-tech, devastating ambush. Now Web is trying to put his life back together and understand what really happened. To get answers, he'll need the help of psychiatrist Claire Daniels and the one other human being who lived through the attack--a ten-year-old boy. But when his search leads him back to that bloodstained alley, Web suddenly realizes he is about to face his assassin again. And this time, one of them will become the Last Man Standing.	560	3.5	\N	http://books.google.com/books/content?id=ybZmAgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	ISBN:9780759526471	t	0ae21e35-1af8-4308-8a26-79b81a8760b9	31fe4070-75bc-4cc5-a37a-e187a59fb640
6d21ee1e-08c8-48a7-8f7a-06a055d03ee2	True Blue	\N	2010	Pan Macmillan	True Blue is a gripping ride, full of pace, action and tension from David Baldacci, one of the world’s favourite storytellers. Mace Perry was a maverick cop on the DC police force who lost everything when she was framed for a crime she didn’t commit. She spent two years in prison and now she’s trying to rebuild her life. But first she’s determined to hunt down the people who set her up. Even with her police chief sister by her side, she needs to work in the shadows. There are those with power out there just looking for a reason to put her back behind bars and she needs to find the reason why. A female partner at a city law firm is found murdered and it seems her fate is entangled with Mace’s story. As the investigation deepens, Mace finds herself drawn into both the public and private world of the nation’s capital as dark secrets begin to emerge. If she’s to prove her innocence, she will need all her skills to reveal the truth, confront her enemies and regain her life.	400	3	\N	http://books.google.com/books/content?id=d7FZDz5bsEcC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	ISBN:9780330524698	t	0ae21e35-1af8-4308-8a26-79b81a8760b9	31fe4070-75bc-4cc5-a37a-e187a59fb640
082d23cb-0339-4f50-a37d-7ea67e92d9ed	Inferno	\N	1982	Bantam Classic & Loveswept	An informative introduction and commentary accompany this classic translation of Dante's epic poem about a spiritual pilgrim being led by Virgil through the nine circles of hell, available in a dual-language edition. Reissue.	396	3.5	\N	http://books.google.com/books/content?id=91LOrIx1TqUC&printsec=frontcover&img=1&zoom=1&source=gbs_api	ISBN:9780553213393	t	568c4d96-5281-435e-9f9c-44f68b5cef7a	e22d0713-325d-4968-971b-e0c77f8257dd
181cabdd-efa5-4b3c-847e-44731fe61446	Love in the Time of Cholera	\N	2008	not specified	Gabriel García Márquez's Love in the Time of Cholera is a brilliantly crafted, beautifully written story of love and the love-sick. Spurned as a young man, Florentino Ariza has a half century of waiting to fill before a chance to redeclare his love for Fermina Daze comes, when her husband is killed retrieving a parrot from a mango tree. Funny, poignant and heartfelt - enduring and unrequited love have rarely been more movingly expressed.	423	3.5	\N	http://books.google.com/books/content?id=ErWlPwAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api	ISBN:0141037458	t	957206ed-a071-43f4-ab09-2fed4344fe9d	94176593-8337-4ff0-b497-03ba15f73be5
144f6d65-5164-4f4e-8e8e-728f88156123	Saving Faith	\N	2000	not specified	Saving Faith is a thriller about a cash-for-questions scandal involving the highest ranking members of the US government. Washington lobbyist Danny Buchanan has made a fortune peddling influence for his cash-rich client companies.	464	3	\N	http://books.google.com/books/content?id=HGyXzuAoTW4C&printsec=frontcover&img=1&zoom=1&source=gbs_api	ISBN:068486164X	t	0ae21e35-1af8-4308-8a26-79b81a8760b9	31fe4070-75bc-4cc5-a37a-e187a59fb640
eda82a68-f235-4a55-90ee-b052aa8d9a37	Billy Summers (edición en español)	\N	2021	PLAZA & JANÉS	Stephen King, el narrador legendario de imaginación incontenible, nos regala una espectacular novela sobre un buen tipo con un trabajo muy malo. Billy Summers es un asesino a sueldo y el mejor en lo suyo, pero tiene una norma: solo acepta un encargo si su objetivo es realmente mala persona. Ahora Billy quiere dejarlo, pero todavía le queda un último golpe. Y siendo uno de los mejores francotiradores del mundo, un veterano condecorado de la guerra de Irak, un auténtico Houdini cuando toca desaparecer después de finiquitar un trabajo, ¿qué podría salirle mal? Todo. Reseñas: «En Billy Summers (como ya lo hizo en Misery) King insiste en la idea de que escribir es sobrevivir y que no hay nada más importante que el vivir para contarlo». Rodrigo Fresán «Excombatiente de la guerra de Irak, Billy Summers tiene un pasado más jodido que el de Rambo, pero es un tipo estupendo: buen vecino, buen niñero,buen amante... Y un soldado que sabe que nunca se deja atrás a un compañero, aun cuando esto sea un mal negocio». Esquire «Con Billy Summers, su segunda novela en un año, el Rey del Terror vuelve a su mejor nivel». El País «Si su ingenuidad sin malevolencia es el atractivo de Billy Summers, a medida que avanza la acción se transforma en un justiciero digno de admiración». La Razón «Todo confluye, una vez más, en lo que probablemente sea El Tema recurrente de King: el hacer justicia deshaciendo injusticia». ABC «Una negra crítica a la sociedad con la que el prolífico escritor vuelve a ponernosfrente al horror, pero en esta ocasión enfrentándonos a nosotros mismos y a la sociedad en la que vivimos». Cosmopolitan «Billy Summers lo tiene todo: es una inquietante novela criminal, es una dulce historia de amor, es un crudo relato de guerra, es también un excelentemanual sobre cómo escribir un libro y, además, una trepidante trama de venganza, al estilo de las de Yo soy la justicia». La Voz de Galicia «No hay asesinato más criminal ni caos más entretenido. Otra lectura adictiva de un maestro de mente proteica». Kirkus «Otra novedad excepcional de un escritor que siempre les da a los lectores mucho más de lo que esperan». Publishers Weekly «En Billy Summers no hay elementos sobrenaturales (salvo una referencia oculta a cierto hotel embrujado). En lugar de eso, [Stephen King] se pone en modo noir y nos cuenta el relato de un asesino a sueldo con un último trabajo por delante... Y es su mejor libro en años». The Guardian «Billy Summers está tan plagada de monstruos como sus anteriores novelas. Pero no son de los paranormales que solemos asociar al maestro del terror. Aquí, los monstruos son asesinos, mafiosos, violadores y ladrones... En resumen, maleantes de la peor calaña». Star Tribune «¿Ahora también es el Rey del Crimen? Stephen King da en el clavo con su thrillersobre un asesino a sueldo, Billy Summers». USA Today «Billy Summers es mitad El día del Chacal, mitad homenaje a la parte más rural de Estados Unidos, mitad historia de amor y completamente adictiva». The Times	634	4	4	http://books.google.com/books/content?id=H187EAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	ISBN:9788401026379	t	0ae21e35-1af8-4308-8a26-79b81a8760b9	99ff250d-a3a4-4e9e-a5b1-6557a9480399
1d85b5e8-2080-4263-9d47-2344d855a67a	The Monogram Murders	A Hercule Poirot Mystery	2014	Harper Collins	"Equal parts charming and ingenious, dark and quirky and utterly engaging. Reading The Monogram Murders was like returning to a favorite room of a long-lost home" -Gillian Flynn, #1 New York Times bestselling author of Gone Girl Since the publication of her first novel in 1920, more than two billion copies of Agatha Christie’s books have been sold around the globe. Now, for the first time ever, the guardians of her legacy have approved a brand new novel featuring Dame Agatha’s most beloved creation, Hercule Poirot. ‘I’m a dead woman, or I shall be soon…’ Hercule Poirot's quiet supper in a London coffeehouse is interrupted when a young woman confides to him that she is about to be murdered. She is terrified – but begs Poirot not to find and punish her killer. Once she is dead, she insists, justice will have been done. Later that night, Poirot learns that three guests at a fashionable London Hotel have been murdered, and a cufflink has been placed in each one’s mouth. Could there be a connection with the frightened woman? While Poirot struggles to put together the bizarre pieces of the puzzle, the murderer prepares another hotel bedroom for a fourth victim...	257	4	\N	http://books.google.com/books/content?id=q-9zAwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	ISBN:9780062297235	t	0ae21e35-1af8-4308-8a26-79b81a8760b9	434485ab-428c-4d07-a802-398bcd629404
04899e8e-bde5-4d83-9e9e-e84e60675420	All the Devils Are Here	(A Chief Inspector Gamache Mystery Book 16)	2022	Hachette UK	*** WINNER OF THE AGATHA AWARD FOR BEST MYSTERY NOVEL 2021*** 'Makes most of her competitors seem like wannabes' THE TIMES There is more to solving a crime than following the clues. Welcome to Chief Inspector Gamache's world of facts and feelings. On their first night in Paris, the Gamaches gather for a family dinner with Armand's godfather, the billionaire Stephen Horowitz. But the evening ends in horror when Stephen is knocked down and critically injured in what Armand is convinced is no accident, but a deliberate attempt on an elderly man's life. When a strange key is found in Stephen's possession it sends Armand on a desperate search for the truth that will take him from the top of the Tour Eiffel, to the bowels of the Paris Archives. And as Armand begins to uncover the secrets his godfather has kept hidden for decades, he finds himself ensnared in a web of lies and deceit that threatens to destroy everything - and everyone - he holds dear. For even the City of Light casts long shadows. And in that darkness devils hide . . . Ten million readers. Three pines One inimitable Chief Inspector Gamache 'The series is deep and grand and altogether extraordinary . . . Miraculous' Washington Post	528	4.5	1	http://books.google.com/books/content?id=by1YEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api	ISBN:9781529387520	t	0ae21e35-1af8-4308-8a26-79b81a8760b9	b85cd731-10b0-4b18-918b-2d3d009bcecc
\.


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genres (id, name) FROM stdin;
957206ed-a071-43f4-ab09-2fed4344fe9d	latin american
469ad8e3-f024-4b91-8cae-d5aa165db597	science fiction
ca086428-9691-4d83-a56f-8affaa4017fb	dystopias
0ae21e35-1af8-4308-8a26-79b81a8760b9	crime
fc342538-aae1-4e98-b076-116cfe29a661	fantasy
568c4d96-5281-435e-9f9c-44f68b5cef7a	poetry
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, comment, score, create_date, edit_date, "bookId", "userId") FROM stdin;
2cb0eda2-3454-4f5f-8db6-b34b5e9bb82b	Muy bueno che todo el librillo\n	5	2023-09-28	\N	bbd83ea2-fa9f-477b-ae03-af6538d20f24	f3b16f05-cb25-4aed-9179-6ec8bb8d31c9
1a3f133c-9a1d-4588-9459-d0a690e61ef0	tu vieja en tanga este libro	1	2023-09-29	\N	e68ede1f-f032-4af2-95ac-d208df1590b5	f3b16f05-cb25-4aed-9179-6ec8bb8d31c9
6224fd63-9353-4291-bb4c-5114bca9619d	asfafasfsf	1	2023-10-23	\N	04899e8e-bde5-4d83-9e9e-e84e60675420	f3b16f05-cb25-4aed-9179-6ec8bb8d31c9
3a4eb5be-c426-4902-860f-4bc43e2ca658	mierda pura total review 2	2	2023-09-12	\N	5a983d78-7f50-42c0-b8d6-1c6fa7624591	f02913ed-d740-429e-952e-1d70aca317fe
3f1c6ee3-4604-4e78-b958-fcc59c4f20be	Prueba de review	4	2023-09-22	\N	bbd83ea2-fa9f-477b-ae03-af6538d20f24	f02913ed-d740-429e-952e-1d70aca317fe
1560be69-173a-4094-a7f9-2f52749e630d	Hola quiero dejar también acá una review sobre este libro de mierda	3	2023-09-26	\N	db5dafe6-8b2c-4f43-a320-d78d76b60076	f02913ed-d740-429e-952e-1d70aca317fe
bba1cdc1-eeec-46c5-a6dd-09ee8a3a024e	Hola pepe	4	2023-09-26	\N	eda82a68-f235-4a55-90ee-b052aa8d9a37	f3b16f05-cb25-4aed-9179-6ec8bb8d31c9
96a5358e-ec7f-48db-8bf0-ad7e17c0cb6d	review 1	1	2023-09-27	\N	b5f47c8a-7a5f-4afb-9087-df6cf50ed612	f3b16f05-cb25-4aed-9179-6ec8bb8d31c9
726fe8e8-2e1d-4883-84db-f5cbec6806f5	hola 2	1	2023-09-28	\N	89bc87ab-841a-4acd-9a1a-636834a2e677	f3b16f05-cb25-4aed-9179-6ec8bb8d31c9
\.


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriptions (id, plan, "startDate", "finishDate", active, "userId") FROM stdin;
6379c1a9-adaf-4703-8758-b62ac32e9c19	One month	2023-09-03	2023-10-03	t	f3b16f05-cb25-4aed-9179-6ec8bb8d31c9
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, "userName", email, "profilePic", active, banned, admin, "firstLogin", notifications, "googleUser") FROM stdin;
f3b16f05-cb25-4aed-9179-6ec8bb8d31c9	La germana 	henrybookexplorer@gmail.com	https://firebasestorage.googleapis.com/v0/b/henry-book-explorer.appspot.com/o/f3b16f05-cb25-4aed-9179-6ec8bb8d31c9%2FprofilePic?alt=media&token=245f76ae-5b9a-4f7e-aab1-99a335c2f544	t	f	f	f	{"all":true,"expDate":true,"newBooks":true}	f
f02913ed-d740-429e-952e-1d70aca317fe	ger.leithner	ger.leithner@gmail.com	https://firebasestorage.googleapis.com/v0/b/henry-book-explorer.appspot.com/o/f02913ed-d740-429e-952e-1d70aca317fe%2FprofilePic?alt=media&token=803caafc-7cc2-47b8-ab31-d43c0549b949	t	f	f	f	{"all":true,"expDate":true,"newBooks":true}	t
\.


--
-- Name: BookXAuthor BookXAuthor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BookXAuthor"
    ADD CONSTRAINT "BookXAuthor_pkey" PRIMARY KEY ("authorId", "bookId");


--
-- Name: BookXFavorites BookXFavorites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BookXFavorites"
    ADD CONSTRAINT "BookXFavorites_pkey" PRIMARY KEY ("bookId", "userId");


--
-- Name: BookXGenre BookXGenre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BookXGenre"
    ADD CONSTRAINT "BookXGenre_pkey" PRIMARY KEY ("genreId", "bookId");


--
-- Name: BookXRead BookXRead_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BookXRead"
    ADD CONSTRAINT "BookXRead_pkey" PRIMARY KEY ("bookId", "userId");


--
-- Name: BookXReading BookXReading_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BookXReading"
    ADD CONSTRAINT "BookXReading_pkey" PRIMARY KEY ("bookId", "userId");


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: books books_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_title_key UNIQUE (title);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: BookXAuthor BookXAuthor_authorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BookXAuthor"
    ADD CONSTRAINT "BookXAuthor_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES public.authors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: BookXAuthor BookXAuthor_bookId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BookXAuthor"
    ADD CONSTRAINT "BookXAuthor_bookId_fkey" FOREIGN KEY ("bookId") REFERENCES public.books(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: BookXFavorites BookXFavorites_bookId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BookXFavorites"
    ADD CONSTRAINT "BookXFavorites_bookId_fkey" FOREIGN KEY ("bookId") REFERENCES public.books(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: BookXFavorites BookXFavorites_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BookXFavorites"
    ADD CONSTRAINT "BookXFavorites_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: BookXGenre BookXGenre_bookId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BookXGenre"
    ADD CONSTRAINT "BookXGenre_bookId_fkey" FOREIGN KEY ("bookId") REFERENCES public.books(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: BookXGenre BookXGenre_genreId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BookXGenre"
    ADD CONSTRAINT "BookXGenre_genreId_fkey" FOREIGN KEY ("genreId") REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: BookXRead BookXRead_bookId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BookXRead"
    ADD CONSTRAINT "BookXRead_bookId_fkey" FOREIGN KEY ("bookId") REFERENCES public.books(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: BookXRead BookXRead_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BookXRead"
    ADD CONSTRAINT "BookXRead_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: BookXReading BookXReading_bookId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BookXReading"
    ADD CONSTRAINT "BookXReading_bookId_fkey" FOREIGN KEY ("bookId") REFERENCES public.books(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: BookXReading BookXReading_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BookXReading"
    ADD CONSTRAINT "BookXReading_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: books books_authorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT "books_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES public.authors(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: books books_genreId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT "books_genreId_fkey" FOREIGN KEY ("genreId") REFERENCES public.genres(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: reviews reviews_bookId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT "reviews_bookId_fkey" FOREIGN KEY ("bookId") REFERENCES public.books(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: reviews reviews_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT "reviews_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: subscriptions subscriptions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT "subscriptions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

