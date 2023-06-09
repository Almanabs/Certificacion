PGDMP                         {            Certificacion    15.1    15.1 %    "           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            #           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            $           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            %           1262    131133    Certificacion    DATABASE     �   CREATE DATABASE "Certificacion" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Chile.1252';
    DROP DATABASE "Certificacion";
                postgres    false            �            1259    131233    comentarios    TABLE     �   CREATE TABLE public.comentarios (
    id integer NOT NULL,
    publicacion_id integer NOT NULL,
    usuario_id integer NOT NULL,
    texto text NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT now()
);
    DROP TABLE public.comentarios;
       public         heap    postgres    false            �            1259    131232    comentarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comentarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.comentarios_id_seq;
       public          postgres    false    221            &           0    0    comentarios_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.comentarios_id_seq OWNED BY public.comentarios.id;
          public          postgres    false    220            �            1259    131216    likes    TABLE     �   CREATE TABLE public.likes (
    id integer NOT NULL,
    publicacion_id integer NOT NULL,
    usuario_id integer NOT NULL,
    estado boolean NOT NULL
);
    DROP TABLE public.likes;
       public         heap    postgres    false            �            1259    131215    likes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.likes_id_seq;
       public          postgres    false    219            '           0    0    likes_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;
          public          postgres    false    218            �            1259    131206    publicaciones    TABLE     8  CREATE TABLE public.publicaciones (
    id integer NOT NULL,
    titulo character varying(255) NOT NULL,
    descripcion text NOT NULL,
    imagen_url character varying(255) NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT now(),
    megusta integer DEFAULT 0,
    nomegusta integer DEFAULT 0
);
 !   DROP TABLE public.publicaciones;
       public         heap    postgres    false            �            1259    131205    publicaciones_id_seq    SEQUENCE     �   CREATE SEQUENCE public.publicaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.publicaciones_id_seq;
       public          postgres    false    217            (           0    0    publicaciones_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.publicaciones_id_seq OWNED BY public.publicaciones.id;
          public          postgres    false    216            �            1259    131195    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    correo character varying(255) NOT NULL,
    contrasena character varying(255) NOT NULL
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            �            1259    131194    usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public          postgres    false    215            )           0    0    usuarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
          public          postgres    false    214            z           2604    131236    comentarios id    DEFAULT     p   ALTER TABLE ONLY public.comentarios ALTER COLUMN id SET DEFAULT nextval('public.comentarios_id_seq'::regclass);
 =   ALTER TABLE public.comentarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            y           2604    131219    likes id    DEFAULT     d   ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);
 7   ALTER TABLE public.likes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            u           2604    131209    publicaciones id    DEFAULT     t   ALTER TABLE ONLY public.publicaciones ALTER COLUMN id SET DEFAULT nextval('public.publicaciones_id_seq'::regclass);
 ?   ALTER TABLE public.publicaciones ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            t           2604    131198    usuarios id    DEFAULT     j   ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215                      0    131233    comentarios 
   TABLE DATA           \   COPY public.comentarios (id, publicacion_id, usuario_id, texto, fecha_creacion) FROM stdin;
    public          postgres    false    221   f*                 0    131216    likes 
   TABLE DATA           G   COPY public.likes (id, publicacion_id, usuario_id, estado) FROM stdin;
    public          postgres    false    219   �*                 0    131206    publicaciones 
   TABLE DATA           p   COPY public.publicaciones (id, titulo, descripcion, imagen_url, fecha_creacion, megusta, nomegusta) FROM stdin;
    public          postgres    false    217   �*                 0    131195    usuarios 
   TABLE DATA           B   COPY public.usuarios (id, nombre, correo, contrasena) FROM stdin;
    public          postgres    false    215   b-       *           0    0    comentarios_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.comentarios_id_seq', 1, true);
          public          postgres    false    220            +           0    0    likes_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.likes_id_seq', 1, false);
          public          postgres    false    218            ,           0    0    publicaciones_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.publicaciones_id_seq', 1, true);
          public          postgres    false    216            -           0    0    usuarios_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.usuarios_id_seq', 1, true);
          public          postgres    false    214            �           2606    131241    comentarios comentarios_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.comentarios DROP CONSTRAINT comentarios_pkey;
       public            postgres    false    221            �           2606    131221    likes likes_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_pkey;
       public            postgres    false    219            �           2606    131214     publicaciones publicaciones_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.publicaciones
    ADD CONSTRAINT publicaciones_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.publicaciones DROP CONSTRAINT publicaciones_pkey;
       public            postgres    false    217            }           2606    131204    usuarios usuarios_correo_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_correo_key UNIQUE (correo);
 F   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_correo_key;
       public            postgres    false    215                       2606    131202    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    215            �           2606    131242 +   comentarios comentarios_publicacion_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_publicacion_id_fkey FOREIGN KEY (publicacion_id) REFERENCES public.publicaciones(id);
 U   ALTER TABLE ONLY public.comentarios DROP CONSTRAINT comentarios_publicacion_id_fkey;
       public          postgres    false    221    3201    217            �           2606    131247 '   comentarios comentarios_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);
 Q   ALTER TABLE ONLY public.comentarios DROP CONSTRAINT comentarios_usuario_id_fkey;
       public          postgres    false    215    221    3199            �           2606    131222    likes likes_publicacion_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_publicacion_id_fkey FOREIGN KEY (publicacion_id) REFERENCES public.publicaciones(id);
 I   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_publicacion_id_fkey;
       public          postgres    false    219    3201    217            �           2606    131227    likes likes_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);
 E   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_usuario_id_fkey;
       public          postgres    false    219    3199    215               =   x�3�4���T��҂�"��̢�JE�4202�50"CK++#C=#sC3SC�=... ���            x������ � �         �  x�mS�nA����p�q��� A�4��y���e��ȩxJJ�H ��ܛ�$|�g"Er$;3���33�7��+m�j�q��6�a[
�d9P&VV�3�NU�I,]���;���\��}ϥ�V���@�(p<w&�6R��e�-�)�[3Fƺ%n*U"�u#q�@w�XG��E�	�C�7%c&���v2��x�M��&�!]�ʠ�$���l�%3����=5�
ώ\�X�O�dc:9Qb�hkSF�}O�Q���8�g��Ɨ��k��stk��D(4�6nx�o�+-����.
/���=�tN���5�5Ȗ�]͘���R�Gے�i��ʃ����A�VjM��fq�4^.'�l�Z� �����X���ۛY?���$�u�XI"+����9O�N ڠG��1ڸ!2�G.������vI<�H63`�pɲ���t���a��p=D�R������Z�ĺ}����K��HD7? �Á��t���ن>8k�$����8�ržЃ�)�SЄe��y޵�"��&���]����RT1W;H���`R� l�� �Jր�[.[=]�s7{<�n�;o*�����l1�M���|>�}���mU�pEg�)>4^\].�&���r:]L{�޸;����[�         ;   x�3���/JOUN-8�+�,5%Q�%?971�3+L;��&f��%��r�p��qqq L�     