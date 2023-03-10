PGDMP     %                    z         
   CERNAtHome    15.1    15.1 H    Y           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            Z           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            [           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            \           1262    16920 
   CERNAtHome    DATABASE     ?   CREATE DATABASE "CERNAtHome" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "CERNAtHome";
                postgres    false            ?            1259    16931    accelerators    TABLE     r   CREATE TABLE public.accelerators (
    acceleratorid integer NOT NULL,
    name character varying(20) NOT NULL
);
     DROP TABLE public.accelerators;
       public         heap    postgres    false            ?            1259    16930    accelerators_acceleratorid_seq    SEQUENCE     ?   CREATE SEQUENCE public.accelerators_acceleratorid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.accelerators_acceleratorid_seq;
       public          postgres    false    217            ]           0    0    accelerators_acceleratorid_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.accelerators_acceleratorid_seq OWNED BY public.accelerators.acceleratorid;
          public          postgres    false    216            ?            1259    16974    cities    TABLE     e   CREATE TABLE public.cities (
    cityid integer NOT NULL,
    name character varying(20) NOT NULL
);
    DROP TABLE public.cities;
       public         heap    postgres    false            ?            1259    16973    cities_cityid_seq    SEQUENCE     ?   CREATE SEQUENCE public.cities_cityid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.cities_cityid_seq;
       public          postgres    false    223            ^           0    0    cities_cityid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.cities_cityid_seq OWNED BY public.cities.cityid;
          public          postgres    false    222            ?            1259    16965 	   countries    TABLE     ?   CREATE TABLE public.countries (
    countryid integer NOT NULL,
    name character varying(20) NOT NULL,
    population integer NOT NULL,
    pppcapita money NOT NULL
);
    DROP TABLE public.countries;
       public         heap    postgres    false            ?            1259    16964    countries_countryid_seq    SEQUENCE     ?   CREATE SEQUENCE public.countries_countryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.countries_countryid_seq;
       public          postgres    false    221            _           0    0    countries_countryid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.countries_countryid_seq OWNED BY public.countries.countryid;
          public          postgres    false    220            ?            1259    16983    hotels    TABLE     ?   CREATE TABLE public.hotels (
    hotelid integer NOT NULL,
    name character varying(30) NOT NULL,
    cityid integer,
    capacity integer NOT NULL,
    CONSTRAINT citiidcannotbenull CHECK ((cityid IS NOT NULL))
);
    DROP TABLE public.hotels;
       public         heap    postgres    false            ?            1259    16982    hotels_hotelid_seq    SEQUENCE     ?   CREATE SEQUENCE public.hotels_hotelid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hotels_hotelid_seq;
       public          postgres    false    225            `           0    0    hotels_hotelid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.hotels_hotelid_seq OWNED BY public.hotels.hotelid;
          public          postgres    false    224            ?            1259    17015    papersauthors    TABLE     c   CREATE TABLE public.papersauthors (
    paperid integer NOT NULL,
    authorid integer NOT NULL
);
 !   DROP TABLE public.papersauthors;
       public         heap    postgres    false            ?            1259    16922    projects    TABLE     j   CREATE TABLE public.projects (
    projectid integer NOT NULL,
    name character varying(60) NOT NULL
);
    DROP TABLE public.projects;
       public         heap    postgres    false            ?            1259    16921    projects_projectid_seq    SEQUENCE     ?   CREATE SEQUENCE public.projects_projectid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.projects_projectid_seq;
       public          postgres    false    215            a           0    0    projects_projectid_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.projects_projectid_seq OWNED BY public.projects.projectid;
          public          postgres    false    214            ?            1259    17030    projectsaccelerators    TABLE     q   CREATE TABLE public.projectsaccelerators (
    projectid integer NOT NULL,
    acceleratorid integer NOT NULL
);
 (   DROP TABLE public.projectsaccelerators;
       public         heap    postgres    false            ?            1259    16953    scientificpapers    TABLE     ?   CREATE TABLE public.scientificpapers (
    paperid integer NOT NULL,
    name character varying(60) NOT NULL,
    projectid integer NOT NULL,
    publicationdate timestamp without time zone,
    citationsnumber integer
);
 $   DROP TABLE public.scientificpapers;
       public         heap    postgres    false            ?            1259    16952    scientificpapers_paperid_seq    SEQUENCE     ?   CREATE SEQUENCE public.scientificpapers_paperid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.scientificpapers_paperid_seq;
       public          postgres    false    219            b           0    0    scientificpapers_paperid_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.scientificpapers_paperid_seq OWNED BY public.scientificpapers.paperid;
          public          postgres    false    218            ?            1259    16997 
   scientists    TABLE     }  CREATE TABLE public.scientists (
    scientistid integer NOT NULL,
    name character varying(20) NOT NULL,
    surname character varying(20) NOT NULL,
    birthdate timestamp without time zone NOT NULL,
    countryid integer NOT NULL,
    gender integer,
    profession character varying(22),
    hotelid integer,
    CONSTRAINT scientists_gender_check CHECK ((gender = ANY (ARRAY[0, 1, 2, 9]))),
    CONSTRAINT scientists_profession_check CHECK (((profession)::text = ANY ((ARRAY['programer'::character varying, 'fizičar'::character varying, 'inženjer'::character varying, 'znanstvenik materijala'::character varying])::text[])))
);
    DROP TABLE public.scientists;
       public         heap    postgres    false            ?            1259    16996    scientists_scientistid_seq    SEQUENCE     ?   CREATE SEQUENCE public.scientists_scientistid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.scientists_scientistid_seq;
       public          postgres    false    227            c           0    0    scientists_scientistid_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.scientists_scientistid_seq OWNED BY public.scientists.scientistid;
          public          postgres    false    226            ?           2604    16934    accelerators acceleratorid    DEFAULT     ?   ALTER TABLE ONLY public.accelerators ALTER COLUMN acceleratorid SET DEFAULT nextval('public.accelerators_acceleratorid_seq'::regclass);
 I   ALTER TABLE public.accelerators ALTER COLUMN acceleratorid DROP DEFAULT;
       public          postgres    false    216    217    217            ?           2604    16977    cities cityid    DEFAULT     n   ALTER TABLE ONLY public.cities ALTER COLUMN cityid SET DEFAULT nextval('public.cities_cityid_seq'::regclass);
 <   ALTER TABLE public.cities ALTER COLUMN cityid DROP DEFAULT;
       public          postgres    false    223    222    223            ?           2604    16968    countries countryid    DEFAULT     z   ALTER TABLE ONLY public.countries ALTER COLUMN countryid SET DEFAULT nextval('public.countries_countryid_seq'::regclass);
 B   ALTER TABLE public.countries ALTER COLUMN countryid DROP DEFAULT;
       public          postgres    false    220    221    221            ?           2604    16986    hotels hotelid    DEFAULT     p   ALTER TABLE ONLY public.hotels ALTER COLUMN hotelid SET DEFAULT nextval('public.hotels_hotelid_seq'::regclass);
 =   ALTER TABLE public.hotels ALTER COLUMN hotelid DROP DEFAULT;
       public          postgres    false    224    225    225            ?           2604    16925    projects projectid    DEFAULT     x   ALTER TABLE ONLY public.projects ALTER COLUMN projectid SET DEFAULT nextval('public.projects_projectid_seq'::regclass);
 A   ALTER TABLE public.projects ALTER COLUMN projectid DROP DEFAULT;
       public          postgres    false    215    214    215            ?           2604    16956    scientificpapers paperid    DEFAULT     ?   ALTER TABLE ONLY public.scientificpapers ALTER COLUMN paperid SET DEFAULT nextval('public.scientificpapers_paperid_seq'::regclass);
 G   ALTER TABLE public.scientificpapers ALTER COLUMN paperid DROP DEFAULT;
       public          postgres    false    219    218    219            ?           2604    17000    scientists scientistid    DEFAULT     ?   ALTER TABLE ONLY public.scientists ALTER COLUMN scientistid SET DEFAULT nextval('public.scientists_scientistid_seq'::regclass);
 E   ALTER TABLE public.scientists ALTER COLUMN scientistid DROP DEFAULT;
       public          postgres    false    226    227    227            J          0    16931    accelerators 
   TABLE DATA           ;   COPY public.accelerators (acceleratorid, name) FROM stdin;
    public          postgres    false    217   EW       P          0    16974    cities 
   TABLE DATA           .   COPY public.cities (cityid, name) FROM stdin;
    public          postgres    false    223   ?W       N          0    16965 	   countries 
   TABLE DATA           K   COPY public.countries (countryid, name, population, pppcapita) FROM stdin;
    public          postgres    false    221   ?W       R          0    16983    hotels 
   TABLE DATA           A   COPY public.hotels (hotelid, name, cityid, capacity) FROM stdin;
    public          postgres    false    225   bY       U          0    17015    papersauthors 
   TABLE DATA           :   COPY public.papersauthors (paperid, authorid) FROM stdin;
    public          postgres    false    228   !Z       H          0    16922    projects 
   TABLE DATA           3   COPY public.projects (projectid, name) FROM stdin;
    public          postgres    false    215   ?[       V          0    17030    projectsaccelerators 
   TABLE DATA           H   COPY public.projectsaccelerators (projectid, acceleratorid) FROM stdin;
    public          postgres    false    229   .\       L          0    16953    scientificpapers 
   TABLE DATA           f   COPY public.scientificpapers (paperid, name, projectid, publicationdate, citationsnumber) FROM stdin;
    public          postgres    false    219   k\       T          0    16997 
   scientists 
   TABLE DATA           s   COPY public.scientists (scientistid, name, surname, birthdate, countryid, gender, profession, hotelid) FROM stdin;
    public          postgres    false    227   k`       d           0    0    accelerators_acceleratorid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.accelerators_acceleratorid_seq', 7, true);
          public          postgres    false    216            e           0    0    cities_cityid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.cities_cityid_seq', 7, true);
          public          postgres    false    222            f           0    0    countries_countryid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.countries_countryid_seq', 21, true);
          public          postgres    false    220            g           0    0    hotels_hotelid_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.hotels_hotelid_seq', 26, true);
          public          postgres    false    224            h           0    0    projects_projectid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.projects_projectid_seq', 5, true);
          public          postgres    false    214            i           0    0    scientificpapers_paperid_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.scientificpapers_paperid_seq', 18, true);
          public          postgres    false    218            j           0    0    scientists_scientistid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.scientists_scientistid_seq', 19, true);
          public          postgres    false    226            ?           2606    16938 "   accelerators accelerators_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.accelerators
    ADD CONSTRAINT accelerators_name_key UNIQUE (name);
 L   ALTER TABLE ONLY public.accelerators DROP CONSTRAINT accelerators_name_key;
       public            postgres    false    217            ?           2606    16936    accelerators accelerators_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.accelerators
    ADD CONSTRAINT accelerators_pkey PRIMARY KEY (acceleratorid);
 H   ALTER TABLE ONLY public.accelerators DROP CONSTRAINT accelerators_pkey;
       public            postgres    false    217            ?           2606    16981    cities cities_name_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_name_key UNIQUE (name);
 @   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_name_key;
       public            postgres    false    223            ?           2606    16979    cities cities_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (cityid);
 <   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
       public            postgres    false    223            ?           2606    16972    countries countries_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_name_key UNIQUE (name);
 F   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_name_key;
       public            postgres    false    221            ?           2606    16970    countries countries_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (countryid);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    221            ?           2606    17047    hotels hotels_name_cityid_key 
   CONSTRAINT     `   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_name_cityid_key UNIQUE (name, cityid);
 G   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_name_cityid_key;
       public            postgres    false    225    225            ?           2606    16988    hotels hotels_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (hotelid);
 <   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_pkey;
       public            postgres    false    225            ?           2606    17019     papersauthors papersauthors_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.papersauthors
    ADD CONSTRAINT papersauthors_pkey PRIMARY KEY (paperid, authorid);
 J   ALTER TABLE ONLY public.papersauthors DROP CONSTRAINT papersauthors_pkey;
       public            postgres    false    228    228            ?           2606    16929    projects projects_name_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_name_key UNIQUE (name);
 D   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_name_key;
       public            postgres    false    215            ?           2606    16927    projects projects_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (projectid);
 @   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_pkey;
       public            postgres    false    215            ?           2606    17034 .   projectsaccelerators projectsaccelerators_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public.projectsaccelerators
    ADD CONSTRAINT projectsaccelerators_pkey PRIMARY KEY (projectid, acceleratorid);
 X   ALTER TABLE ONLY public.projectsaccelerators DROP CONSTRAINT projectsaccelerators_pkey;
       public            postgres    false    229    229            ?           2606    16958 &   scientificpapers scientificpapers_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.scientificpapers
    ADD CONSTRAINT scientificpapers_pkey PRIMARY KEY (paperid);
 P   ALTER TABLE ONLY public.scientificpapers DROP CONSTRAINT scientificpapers_pkey;
       public            postgres    false    219            ?           2606    17004    scientists scientists_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_pkey PRIMARY KEY (scientistid);
 D   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_pkey;
       public            postgres    false    227            ?           2606    16991    hotels hotels_cityid_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_cityid_fkey FOREIGN KEY (cityid) REFERENCES public.cities(cityid);
 C   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_cityid_fkey;
       public          postgres    false    225    3238    223            ?           2606    17025 )   papersauthors papersauthors_authorid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.papersauthors
    ADD CONSTRAINT papersauthors_authorid_fkey FOREIGN KEY (authorid) REFERENCES public.scientists(scientistid);
 S   ALTER TABLE ONLY public.papersauthors DROP CONSTRAINT papersauthors_authorid_fkey;
       public          postgres    false    228    3244    227            ?           2606    17020 (   papersauthors papersauthors_paperid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.papersauthors
    ADD CONSTRAINT papersauthors_paperid_fkey FOREIGN KEY (paperid) REFERENCES public.scientificpapers(paperid);
 R   ALTER TABLE ONLY public.papersauthors DROP CONSTRAINT papersauthors_paperid_fkey;
       public          postgres    false    228    3230    219            ?           2606    17040 <   projectsaccelerators projectsaccelerators_acceleratorid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.projectsaccelerators
    ADD CONSTRAINT projectsaccelerators_acceleratorid_fkey FOREIGN KEY (acceleratorid) REFERENCES public.accelerators(acceleratorid);
 f   ALTER TABLE ONLY public.projectsaccelerators DROP CONSTRAINT projectsaccelerators_acceleratorid_fkey;
       public          postgres    false    217    3228    229            ?           2606    17035 8   projectsaccelerators projectsaccelerators_projectid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.projectsaccelerators
    ADD CONSTRAINT projectsaccelerators_projectid_fkey FOREIGN KEY (projectid) REFERENCES public.projects(projectid);
 b   ALTER TABLE ONLY public.projectsaccelerators DROP CONSTRAINT projectsaccelerators_projectid_fkey;
       public          postgres    false    215    229    3224            ?           2606    16959 0   scientificpapers scientificpapers_projectid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.scientificpapers
    ADD CONSTRAINT scientificpapers_projectid_fkey FOREIGN KEY (projectid) REFERENCES public.projects(projectid);
 Z   ALTER TABLE ONLY public.scientificpapers DROP CONSTRAINT scientificpapers_projectid_fkey;
       public          postgres    false    3224    215    219            ?           2606    17005 $   scientists scientists_countryid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_countryid_fkey FOREIGN KEY (countryid) REFERENCES public.countries(countryid);
 N   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_countryid_fkey;
       public          postgres    false    221    3234    227            ?           2606    17010 "   scientists scientists_hotelid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_hotelid_fkey FOREIGN KEY (hotelid) REFERENCES public.hotels(hotelid);
 L   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_hotelid_fkey;
       public          postgres    false    225    227    3242            J   7   x?3???p?2????KLV0?2??L?L8???L?$?g0?4??q??????? V??      P   <   x?3?tO?K-K?2?N??+?r3?u?K3sr*?̀?%??y?\朾??E?y\1z\\\ ???      N   z  x?=?=O?0????``?????푂?!*6?Z%"uQH@?????N??? \N???%?Xk????B녁e??ݴD?ZhT?????m:??c??U???????8{?_?{߭??"??"? ??e??O?@?Af?M?7]?S? ?3bN*?=???3??Y?Pj0?mv? X????p;?\??fhQ9l5?M??:@?8SR,??p??? u??a??@Oy???1?7??ٚ???-<???T???,??y??Z???:X?T?0N????V???[!ê????zrNƴF9?=??RW?y;?rZEY?~?&??ܖ>?F??^??n??b8Jr_?I-???tcޜ=te????UN.??{??ԏ5r??)?to???ܐ??      R   ?   x?E?A?0E??St?δ@A?F?'p3	m?֔?z{K?q9???3??????nQ?=M4@R	&WIl?m???=?,?5lq?O<?k?+???j?x???e2??[?3?gp?%?o?Uu?mA??a.??v?8?K%?p??Z??u?/??NAk????xsEO8N??????d?} ??C?      U   ?  x?ES[?C!??????{???q?i??G???&w??	-I?l?ɭ-y?Slo?%fWS????M 7d??S7???w?S?؎????#??Lڕ?r?ZH?H??ɱIt?w?A?  N??????H????.r?R?`U< .}&???0??ZzC?5v?"_?[]?3?챏&????{?96???R?p???b???q̱?P6?ƺ??q???????0܎6i?Pp?????????:??B??3??1N?tI?\jn?̓_
?Ŝ?B??7??J??jq??f#?!*?gx>8`N?	????z?@s?iw????;+??猼&T?<??	??%;?j?????Ӟb6?)WS;r?V?C%?Dq?9?????bu??cpp?E0?x?????	?)2:?A?˟?C???P???OU???_      H   E   x?3??????p?2????vR-H/JLI?2???t????qq?2?tt???2?t?q?s??????? A??      V   -   x?3?4?2?4bc.# ۈӄ˘??͸L?| ?Ȏ???? {?b      L   ?  x?]U?r?8|_???eC??!ɒ*?e???־???c[IN????#?SEQ	X??>?%??Z*}m:iv?9??JV???:?|g?t?}????˛??ZZ?#2???U?Γ?Z???%??$??˻??4MSWd??y???xn??4I??s?t?? ??9h???M?׺??ԺxR%J??эSi?W$???ŭTɂt%z??s'??(?{?>?o?DX?*?t6?????׽5>kj*I?{???1?<??x?_|%f@?T?%ɻ/u偟?_L?TJ???"?v ܛ?>?׫d?Z?)K?%iv)?:????'????r?N?H??_?????d?L??ԑ?ȑ?.*d??????]:?RY??,?l<ru;4Ѣ8?{???S*?̺?z??֊?K??^??????da?? _?	??c%M?1?B3j???~??????????`K?? ??$?Ǡ?????;?rp?~?j???4??9K'*??.???I????4?@A???Á?J?q???#+????jd ?D?	II^k?Zs4?mL??2?K?gbiuQp??r?33?ΩW?Fn??d??douE?i_??????l????F?sQN??̲3X>??k???`?E???????v$?N??v_7m?bO.ʨ???&?n??2??6l+?j??į[$???B??hNÞ??q??????@e**u?_g:???)jcNH?t??RqR?????1???Y?&k?7/??`z?l?LƾD?yU`dWcP%??=????cp?kz;`/c?UC6r??mO?F?????Ll!?<?yqYmIt?v?;??xb???^ ??j?/ٷ????P4?Si?}?F??????|?쑉lz?3&9ps׫??????8????鯇??Gy]^??dq?e????????*??d(/&j??6C?~~?[???/?\?`?s?A?AI[??p?????4?g?Vc~?.
???ݛn&??;???2?? ???C	?b03;j?|?Ϸ?d????<>      T      x??\Ko#Ir>??|j?2????????#K?4<?K?L??,Vi???Pw}?y?0p{?]` ???????,?"kH,0??(??????/?&>???Ua????֘@?i?&L????0??'2??C?R????&????.?????l?;S??J?7???BXUT?????jh??y??:??~??+X??N??פ????U?=??X~???o???ԁ??(??6????oM?5?K?+??~&????1?Yd?$??K[n??t???f?oB?։??r
w,ᅂK?ܚ??`???J???p3??3|?,???????Tp?}mt5?~kLpk?????Rt>?W?#?M??R???k	?<??1o?H8,???W????I?ھ4hۑmps??8??2?p???Epa?f?WU!?l1?????|?/[Ί???i?W?#???v;pUt@t????BWp???B?M?GPx9p)8??Gj"bp??v?N?'4p???13?????#z?M???9.??_[?????,?=8???9? ?8?]Jd?;??^??????2?zW?f
#???Zտx??+q]F?xe????F???í??r?Z???h[?vʢ7"?Μ6<??+ݔ?o??M?2?}sHx?cƆ???QW5D?e?3G?N????gB߱?????k=k
????<??????3?M?4>w???S?X?ux?8?ھv????D??r?l?n;3A`?$???%???纡??7?sD|?t????iL?`?2
D?QC??3?0??????e????b???5f?C??wU???O`???5???i?^,S??G̚g??iQB?1?] ?3m???V?(>֭?????W???nq?48?z?xr?7+{???,t&?D{?5??v??Ơ ??v8?"z??tݕ?1?p???~?0????4%?Y??%SF?_???o?W??7??i6???{{;??<J!g??|?]?'?Ȯ?gOr???oJY?3??guy߬?}hg?r?o?????ie???K2?|c?*>m?+?+(J;??{֍C< ??Ŵݴ?T,4㠚??&??z?MYR?J??O?o?Ob?-??3??3'?e]r?6?????dI??jz?????-A?/??/9,??.???Zؕ??????%??+???$??'??(R/?Ӧ??~?|???\??-1???QW?3KJu???uA?+;???wQ?t;],??y ??aW[??n??x6ۅ?:?.D?\2?$!OQ? ˢj??s?v1??$??6?oS@?R?!?㮒k @?їK$d??
<?~D?g??NP<?t?NN?????s? ?????֑?.?@?k?????/???1P?x????o?$;d6Tw?!AJ????2?e??J??Q?;<??āBף??0%?&??ǖ?$Q6???? ???~?*??G?????rHS?_5???r??!?x??Μ?Xk??)?6???+?sՈ?j?cC*?dq??P????pT??A?)̛??'??wg???R???u??S???T~??????(??l????XiLR???XhH???a;??4?Uʷ??ʢq???x?]i???-?ɾ?&?q?????c?pt??ʆ?????e蝊&?I?<R?ϭ`??)?p?xɛ???M8PY0?U???x???BV?B?`?f?gD?_PebWl|YmW?i?:[??<??#???? 5+?-??S?\?E?Q??tZ??	??q??fq???????}.??{?,???????i)+E?e)??k?~*?{M?򰜥 ???)~ k?坳f???pV?P????C*??? ]׬1?'? ?`?Å} ????b????}Pap?W?u@P?b76???6?Ub?jN??so?2n#??f?$?d?ek?<4??я????1ܬgφ??I?5??a?V1,?:?ܔ?? c?)u??kX[??g???)??W?z?T\?o???-???x?\^9X??q3???,?#E?xQ8Q*?A??B7?YS?Lpǒq6??|h?ki?nhA6nȽ"?9??;??????|7??Dp??{?P?Z1!?=7b??e??u??#??ؐg%?Y?/G?Q?O`??H?7?z?2?7?c?v>S?Kb?O??y??*? $???+??? ???l|r^W3?A?իb_?#????<sO?6r??????e|[?,H??? ?S???~p????d??J S??B? ??t???/zfr???WWIǼ???"?I/?~j 	?+?x??F?\(!N^?"?_???s??)Q?a?(wE?g?Bٮ??e??+?!&?8?lz?B?t?C?a
d????m?T ?C?D#?u|?`?-?vޕ??b.?#??~#???????M?@o?[u(????L?D?Ļ??3։2Ϟuf?*NJB???MU?v?"?1?S?!B*???)V?f?/?F M????PNv???O?ȾB?????CY:S?T?G>?`??_???w??HJ?/9?8V
?]'?A(?<	G!?%!?
`?g6?O??u??XgL?#?' ???8+ꮫ?.K_!⪾??nXiV?J??|C?C?C&R??
?!}W???
?m???+]t}#????\!w?t???x=?oóz?6<+?ׇ???B?f?֨X?+η???R?uS???D1]?????/*?Ł?_??-?κY????L?ߓ????l}?uQu?9ҫC??½B&??.Nfz?.G???%C?H??r??R[*Br????|?-?Ѧٔ@?Lcle???K?üM???.??Me9(?<?c??,z????]_BE#ext?(?l
??!=}?`?b?=&?/L?w+u	<7??v??????s??."??
?c????fC????(rZ???~.-?C]x??rh˧/u?dI???Y?b-%D???}??k???<?Y???}*??ǖ?$?????;D0?????K?&JI?en<??H?w(????	?ɨ???݉???m?Ķc??m
Wq?8?h}???獽??rM??@?!Pڳ~|??K??E^3?X??ާ?SB?[:?????ED?5??/6t??vXġD????L??A]?ȻxG??8!?8?m???v???o?8????{]`??$?_?R?b?5fq?'??2?e?Xds???&cXL,?,??R??T7?3f?$?;?(?9T}??*??ځM?7?P?8???'}?l??z?-?ہ??aH??P$??????m?R????%<?/?<??V?'??G"8?%Qpj?ɏf?l?ڑ-?w{m ?$ޅj?>,Xf?/7E?s&?x???F?"Oi?SѲ? ????
{H?R>?'?
7֝?/14?''?yS??ω???5?{?*39R1?Q?M????Eٺ?l???8Ɉ'?a?I?v??lHk?'ݶ?-B??????P*l???E7??o??h??H?3?;Q
?($\Wn??׋9|??'????#??n?4z?4?z5?T pR?X?????`E???ו?ܲSX?d4? ?t??]??n?E1??5`K??Eʫ?j?"E?&K>J`?
?\X"u]:w?-????-?-?A???uqF"?B?????½?{5????9Ũ#?10?nz\$?A?U??r?m>L????E5r??Y%e?D????A??vV???)?D&?4?K?S????p??|cf	??z???FI?;.?AE??N?}??ڽ]???/ΰS?>????Ҳ!?X????kT	i?i$?,?\??ԝ?^??l!?5#?-?Bt:??\?????l?G??v9%Pn??_gz]Y???h|???N?Py??։?!???yK?????5?B ]???#?P1'o+??Ԣ????8?̶?+p??,{QS??A|? ??F0_?͊?E????Y???O?????N??0k???̧?L??:?)V?zM?	???Y!?}E?`????V????X?D?"Gk?<??^?????6e???GrfKq???[7???er4??47??F?MU[33???9??r??P?[}? ??g?ɽ2?W???yL??????)??QEJ??.U~1MY?2e?Rd\?6?Z????\?? ??j?w?fe?,L= E  \??hN?T?z??&????ѽ?/??,&?%??2?+?3{??????M%?Ņ??SA5???&S??
??Q?$?$Q?9?
?????|???@?2?_"??@?P??x??I??- 
?????-M`a4??a?????????#??'?0a????۪Oˇ?I,?3?! Tm??-v??+G~?<z????[]??*G?#΢2???P?I???s;?????g>m??;?iA?~@???~h?ő?"E?V???????g??˦?L?????>????O?O??*T???@?VK?vX&?P(:g??
?`??*vv???8??У5⛭?35???N?HpS׭?(??R?d4W5|?x??t???!???Ե?Ž???J??O>?J????,?o?ǆ/???4?S????I?HF????&??}%+}e?g.??	?'Uk?;E?????I)v?.?$=K???g+F?n???)??J??xcD?h????:????????H?WX?????1??
K???+???7?~?m?S?N?ib!e/&???k??խ{??|??d4?*i@??-[?L???W?_?^???zVL?????c??C	?K_?}en>???u??? ??`??u?M??ঋ????y?GF???πI,^X? ?s?=?@c???s?u?i???(B??W?c????a???Ž?tm?A?????Ʉ?h?	j&??!;OzE!O?Q?????M???uz?KqeF#????<a?;?%~ǆj??ƙ?i??}eӻ#C??	??*lv?7?ռm ??;?9??~?r?Y??k????[??????e?4???o????r???@@???ل758????\??f??x?k??k?Ø??@??Ҷ??`????곸??ܴNŅ?!?C_??A?????l?w?$B-????N1???U?\{??L]?.?b????
Kߣ??????usE??(?}??'????o??^?????x}"?|?????zݚ??!????X/w????l?g?W}b???-?~6???u?V?c??xk&?3?????G??????}????	??z?+f?Հ??9I?,??a????(3??C6`M?????????u??-?!?80??I??`???U???Y O?I?>??I?a?ˆ?? "????N?Ǭ?O$0HJ?7??i????v??,??)??q㳦^???????UG?F?+NLi?oi?/???????????'8???|{D????????Ϥ??L??F?$i?????xl?nK?0	?G@~??Yp??????+J??i??+???}?z?Ԃ& ??h:?G?Z??ד???ɣ??bY6????y?P[g?ͨ???_/4?xi^??N;Xm??Σ???2
^?S??n?+_??)??oG?j?S~q?4??H?? X3*?????KCy?d?:??4~?1?Ը?-????&?W??????~?~??????W?s??~??T??ǧ??c??}}??r7?tט?ѽ(?#???J??`??$?:Z??tx??`T?O?8??4?%n???zvQ???/Mu?eQ?z????#??"T???F?ԛz?)͐!?XŻ)?S]???kuX?7???????h̳?0
?_*7K[??Cߎ??(???A?Аn??H=v <??4?}цU??o???^????<2U?Lu????	??+?|?-??Ic1?;'??8T??|;??????b?Sߖ4?M^w?g?ʨ?
?c?a?????????X?!4??q?8??N????ȷ=??[?Oz??R??Ӻ#?#?|S???s8???dQ??O??p??Aq??P??4???羡??????x?????:??ō?@? ?xjqm??1???eV??}???d???(W?     