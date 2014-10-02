-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.8.0-alpha1
-- PostgreSQL version: 9.4
-- Project Site: pgmodeler.com.br
-- Model Author: dmt_malin

SET check_function_bodies = false;
-- ddl-end --


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: db_sport | type: DATABASE --
-- -- DROP DATABASE db_sport;
-- CREATE DATABASE db_sport
-- 	ENCODING = 'UTF8'
-- ;
-- -- ddl-end --
-- 

-- object: dbo | type: SCHEMA --
-- DROP SCHEMA dbo;
CREATE SCHEMA dbo;
-- ddl-end --

SET search_path TO pg_catalog,public,dbo;
-- ddl-end --

-- object: dbo.usually_string | type: DOMAIN --
-- DROP DOMAIN dbo.usually_string;
CREATE DOMAIN dbo.usually_string AS varchar(30);
-- ddl-end --

-- -- object: dbo.auto_user_id | type: SEQUENCE --
-- -- DROP SEQUENCE dbo.auto_user_id;
-- CREATE SEQUENCE dbo.auto_user_id
-- 	INCREMENT BY 1
-- 	MINVALUE 0
-- 	MAXVALUE 2147483647
-- 	START WITH 1
-- 	CACHE 1
-- 	NO CYCLE
-- 	OWNED BY NONE;
-- -- ddl-end --
-- 
-- -- object: dbo.users | type: TABLE --
-- -- DROP TABLE dbo.users;
-- CREATE TABLE dbo.users(
-- -- 	user_id integer NOT NULL DEFAULT nextval('dbo.auto_user_id'::regclass),
-- 	name dbo.usually_string,
-- 	email dbo.usually_string NOT NULL,
-- 	password dbo.usually_string NOT NULL-- 	CONSTRAINT pk_users_user_id PRIMARY KEY (user_id)
-- 
-- );
-- -- ddl-end --
-- object: dbo.auto_type_id | type: SEQUENCE --
-- DROP SEQUENCE dbo.auto_type_id;
CREATE SEQUENCE dbo.auto_type_id
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: dbo.types | type: TABLE --
-- DROP TABLE dbo.types;
CREATE TABLE dbo.types(
	type_id integer NOT NULL DEFAULT nextval('dbo.auto_type_id'::regclass),
	object_id integer NOT NULL,
	show_name dbo.usually_string,
	name dbo.usually_string,
	CONSTRAINT pk_types_type_id PRIMARY KEY (type_id)

);
-- ddl-end --
-- object: dbo.short_string | type: DOMAIN --
-- DROP DOMAIN dbo.short_string;
CREATE DOMAIN dbo.short_string AS varchar(10);
-- ddl-end --

-- object: dbo.auto_object_id | type: SEQUENCE --
-- DROP SEQUENCE dbo.auto_object_id;
CREATE SEQUENCE dbo.auto_object_id
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: dbo.objects | type: TABLE --
-- DROP TABLE dbo.objects;
CREATE TABLE dbo.objects(
	object_id integer NOT NULL DEFAULT nextval('dbo.auto_object_id'::regclass),
	name dbo.usually_string,
	code dbo.short_string,
	CONSTRAINT pk_objects_object_id PRIMARY KEY (object_id)

);
-- ddl-end --
-- object: dbo.auto_event_id | type: SEQUENCE --
-- DROP SEQUENCE dbo.auto_event_id;
CREATE SEQUENCE dbo.auto_event_id
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: dbo.events | type: TABLE --
-- DROP TABLE dbo.events;
CREATE TABLE dbo.events(
	event_id integer NOT NULL DEFAULT nextval('dbo.auto_event_id'::regclass),
	root_user_id integer NOT NULL,
	mode_type_id integer NOT NULL,
	status_type_id integer NOT NULL,
	reload_type_id integer NOT NULL,
	name dbo.usually_string,
	date_time timestamp with time zone NOT NULL,
	date_time_reg timestamp with time zone NOT NULL,
	CONSTRAINT pk_events_event_id PRIMARY KEY (event_id)

);
-- ddl-end --
-- object: dbo.auto_venue_id | type: SEQUENCE --
-- DROP SEQUENCE dbo.auto_venue_id;
CREATE SEQUENCE dbo.auto_venue_id
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: dbo.coordinate | type: DOMAIN --
-- DROP DOMAIN dbo.coordinate;
CREATE DOMAIN dbo.coordinate AS float;
-- ddl-end --

-- object: dbo.venues | type: TABLE --
-- DROP TABLE dbo.venues;
CREATE TABLE dbo.venues(
	venue_id integer NOT NULL DEFAULT nextval('dbo.auto_venue_id'::regclass),
	sport_type_id integer NOT NULL,
	group_type_id integer NOT NULL,
	name dbo.usually_string,
	latitude_degree dbo.coordinate NOT NULL,
	longitude_degree dbo.coordinate NOT NULL,
	CONSTRAINT pk_venues_venue_id PRIMARY KEY (venue_id)

);
-- ddl-end --
-- object: dbo.auto_user_event_id | type: SEQUENCE --
-- DROP SEQUENCE dbo.auto_user_event_id;
CREATE SEQUENCE dbo.auto_user_event_id
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: dbo.users_events | type: TABLE --
-- DROP TABLE dbo.users_events;
CREATE TABLE dbo.users_events(
	user_event_id integer NOT NULL DEFAULT nextval('dbo.auto_user_event_id'::regclass),
	user_id integer NOT NULL,
	event_id integer NOT NULL,
	status_type_id integer NOT NULL,
	CONSTRAINT pk_users_events_user_event_id PRIMARY KEY (user_event_id)

);
-- ddl-end --
-- object: dbo.auto_venue_event_id | type: SEQUENCE --
-- DROP SEQUENCE dbo.auto_venue_event_id;
CREATE SEQUENCE dbo.auto_venue_event_id
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: dbo.venues_events | type: TABLE --
-- DROP TABLE dbo.venues_events;
CREATE TABLE dbo.venues_events(
	venue_event_id integer NOT NULL DEFAULT nextval('dbo.auto_venue_event_id'::regclass),
	venue_id integer NOT NULL,
	event_id integer NOT NULL,
	CONSTRAINT pk_venues_events_venue_event_id PRIMARY KEY (venue_event_id)

);
-- ddl-end --
-- -- object: dbo.user_add | type: FUNCTION --
-- -- DROP FUNCTION dbo.user_add(IN dbo.usually_string,IN dbo.usually_string,IN dbo.usually_string);
-- CREATE FUNCTION dbo.user_add (IN v_name dbo.usually_string, IN v_email dbo.usually_string, IN v_password dbo.usually_string)
-- 	RETURNS integer
-- 	LANGUAGE plpgsql
-- 	VOLATILE 
-- 	CALLED ON NULL INPUT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$--функция регистрирует пользователя
-- --Вх.:
-- --v_name - отображаемое имя пользователя
-- --v_email - email (логин)
-- --v_password - пароль
-- --Вых.:
-- --0 - пользователь с таким email существует
-- --number - пользователь зарегестрирован с id
-- --NULL - один из входных параметров NULL
-- DECLARE 
--  v_result int; 
--  v_user_group_id int;
--  v_common_group_type_id int;
-- BEGIN 
--  v_result := 0;
--  IF (NOT EXISTS (
--   SELECT u.user_id  
--   FROM dbo.users u
--   WHERE u.email = v_email
--   LIMIT 1 )) THEN  
--    INSERT INTO dbo.users (name, email, password)
--    VALUES (v_name, v_email, v_password);   
--    
--    SELECT currval('dbo.auto_user_id') INTO v_result;
-- 
--     --Добавляем пользователя в группу по-умолчанию Common
--    SELECT dbo.type_get_id('Common', 'GR') INTO v_common_group_type_id;
--    SELECT dbo.user_add_group(v_common_group_type_id, v_result) INTO v_user_group_id;
--    
--    IF(v_user_group_id = 0 OR v_user_group_id IS NULL) THEN    
--     RAISE EXCEPTION 'cannot write to users_groups';
--    END IF;
--    
--  END IF;
--  RETURN v_result;
-- END;$$;
-- -- ddl-end --
-- 
-- -- object: dbo.user_log | type: FUNCTION --
-- -- DROP FUNCTION dbo.user_log(IN dbo.usually_string,IN dbo.usually_string);
-- CREATE FUNCTION dbo.user_log (IN v_email dbo.usually_string, IN v_password dbo.usually_string)
-- 	RETURNS integer
-- 	LANGUAGE plpgsql
-- 	VOLATILE 
-- 	CALLED ON NULL INPUT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$--функция идентифицирует пользователя (логин)
-- --Вх.:
-- --v_email - email (логин)
-- --v_password - пароль
-- --Вых.:
-- --0 - пользователь или пароль не верны
-- --number - пользователь идентифицирован
-- DECLARE v_result int;
-- BEGIN
--  SELECT u.user_id 
--  INTO v_result
--  FROM dbo.users u
--  WHERE (
--   u.email = v_email AND
--   u.password = v_password);
--  IF (v_result IS NULL) THEN
--   v_result := 0; 
--  END IF;   
--  RETURN v_result;
-- END;$$;
-- -- ddl-end --
-- 
-- object: dbo.type_get_id | type: FUNCTION --
-- DROP FUNCTION dbo.type_get_id(IN dbo.usually_string,IN dbo.short_string);
CREATE FUNCTION dbo.type_get_id (IN v_name dbo.usually_string, IN v_code dbo.short_string)
	RETURNS integer
	LANGUAGE plpgsql
	VOLATILE 
	CALLED ON NULL INPUT
	SECURITY INVOKER
	COST 1
	AS $$--функция ищет type_id по имени и коду объекта
--Вх.:
--v_name - имя типа
--v_code - код типа
--Вых.:
--number - type_id найден
--NULL - не найден
DECLARE v_type_id int;
BEGIN
 SELECT t.type_id
 INTO v_type_id
 FROM dbo.types t
 INNER JOIN dbo.objects o ON t.object_id = o.object_id
 WHERE (
  t.name = v_name AND
  o.code = v_code )
 LIMIT 1;
 RETURN v_type_id;
END;$$;
-- ddl-end --

-- object: dbo.auto_user_group_id | type: SEQUENCE --
-- DROP SEQUENCE dbo.auto_user_group_id;
CREATE SEQUENCE dbo.auto_user_group_id
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: dbo.users_groups | type: TABLE --
-- DROP TABLE dbo.users_groups;
CREATE TABLE dbo.users_groups(
	user_group_id integer NOT NULL DEFAULT nextval('dbo.auto_user_group_id'::regclass),
	group_type_id integer NOT NULL,
	user_id integer NOT NULL,
	CONSTRAINT pk_users_groups_user_group_id PRIMARY KEY (user_group_id)

);
-- ddl-end --
-- object: dbo.auto_photo_id | type: SEQUENCE --
-- DROP SEQUENCE dbo.auto_photo_id;
CREATE SEQUENCE dbo.auto_photo_id
	INCREMENT BY 1
	MINVALUE 0
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;
-- ddl-end --

-- object: dbo.photos | type: TABLE --
-- DROP TABLE dbo.photos;
CREATE TABLE dbo.photos(
	photo_id integer NOT NULL DEFAULT nextval('dbo.auto_photo_id'::regclass),
	venue_id integer NOT NULL,
	photo bytea NOT NULL,
	CONSTRAINT photos_photo_id PRIMARY KEY (photo_id)

);
-- ddl-end --
-- -- object: ix_users_name | type: INDEX --
-- -- DROP INDEX dbo.ix_users_name;
-- CREATE INDEX ix_users_name ON dbo.users
-- 	USING btree
-- 	(
-- 	  name ASC NULLS LAST
-- 	);
-- -- ddl-end --
-- 
-- -- object: ix_users_email | type: INDEX --
-- -- DROP INDEX dbo.ix_users_email;
-- CREATE INDEX ix_users_email ON dbo.users
-- 	USING btree
-- 	(
-- 	  email ASC NULLS LAST
-- 	);
-- -- ddl-end --
-- 
-- object: ix_types_name | type: INDEX --
-- DROP INDEX dbo.ix_types_name;
CREATE INDEX ix_types_name ON dbo.types
	USING btree
	(
	  name ASC NULLS LAST
	);
-- ddl-end --

-- object: ix_objects_code | type: INDEX --
-- DROP INDEX dbo.ix_objects_code;
CREATE INDEX ix_objects_code ON dbo.objects
	USING btree
	(
	  code ASC NULLS LAST
	);
-- ddl-end --

-- -- object: dbo.user_add_group | type: FUNCTION --
-- -- DROP FUNCTION dbo.user_add_group(IN integer,IN integer);
-- CREATE FUNCTION dbo.user_add_group (IN v_group_type_id integer, IN v_user_id integer)
-- 	RETURNS integer
-- 	LANGUAGE plpgsql
-- 	VOLATILE 
-- 	CALLED ON NULL INPUT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$--функция добавляет пользователя к указанной группе
-- --Вх.:
-- --v_group_type_id - id группы из таблицы types
-- --user_id - id пользователя
-- DECLARE v_result int;
-- BEGIN
--  v_result := 0; 
--  INSERT INTO dbo.users_groups(group_type_id, user_id)
--  VALUES (v_group_type_id, v_user_id);
--  SELECT currval('dbo.auto_user_group_id') INTO v_result;  
--  RETURN v_result;
-- END;$$;
-- -- ddl-end --
-- 
-- object: dbo.user_get_groups | type: FUNCTION --
-- DROP FUNCTION dbo.user_get_groups(IN integer);
CREATE FUNCTION dbo.user_get_groups (IN v_user_id integer)
	RETURNS TABLE ( group_id integer,  name dbo.usually_string,  show_name dbo.usually_string)
	LANGUAGE plpgsql
	VOLATILE 
	CALLED ON NULL INPUT
	SECURITY INVOKER
	COST 1
	AS $$--возвращает группы в которых состоит пользователь
--Вх.:
--v_user_id - id пользователя
BEGIN
 RETURN QUERY
 SELECT
	t.type_id,
	t.name,
	t.show_name		
  FROM dbo.users_groups u_g
  INNER JOIN dbo.types t ON u_g.group_type_id = t.type_id
  WHERE u_g.user_id = v_user_id
  ORDER BY t.show_name ASC;
END;

$$;
-- ddl-end --

-- object: dbo.types_get | type: FUNCTION --
-- DROP FUNCTION dbo.types_get(IN dbo.short_string);
CREATE FUNCTION dbo.types_get (IN v_code dbo.short_string)
	RETURNS TABLE ( type_id integer,  name dbo.usually_string)
	LANGUAGE plpgsql
	VOLATILE 
	CALLED ON NULL INPUT
	SECURITY INVOKER
	COST 1
	AS $$--функция возвращает все типы по коду объекта
--Вх.:
--v_code - код типа
BEGIN
 RETURN QUERY
 SELECT t.type_id, t.show_name
 FROM dbo.types t
 INNER JOIN dbo.objects o ON t.object_id = o.object_id
 WHERE o.code = v_code
 ORDER BY t.show_name ASC;
END;$$;
-- ddl-end --

-- -- object: dbo.venue_add | type: FUNCTION --
-- -- DROP FUNCTION dbo.venue_add(IN integer,IN integer,IN dbo.usually_string,IN dbo.coordinate,IN dbo.coordinate,IN bytea);
-- CREATE FUNCTION dbo.venue_add (IN v_sport_type_id integer, IN v_group_type_id integer, IN v_name dbo.usually_string, IN v_latitude_degree dbo.coordinate, IN v_longitude_degree dbo.coordinate, IN v_photo_bytes bytea DEFAULT NULL)
-- 	RETURNS integer
-- 	LANGUAGE plpgsql
-- 	VOLATILE 
-- 	CALLED ON NULL INPUT
-- 	SECURITY INVOKER
-- 	COST 1
-- 	AS $$--Добавляет площадку мероприятия
-- --Вх.:
-- --v_sport_type_id - id типа спорта
-- --v_group_type_id  -id типа группы
-- --v_name - отображаемое имя площадки
-- --v_latitude_degree - широта в градусах
-- --v_longitude_degree долгота в градусах
-- DECLARE
--  v_result int; 
-- BEGIN
--  v_result := 0;
--  INSERT INTO dbo.venues(
-- 	sport_type_id,
-- 	group_type_id,
-- 	name,
-- 	latitude_degree,
-- 	longitude_degree)
--  VALUES (
-- 	v_sport_type_id,
-- 	v_group_type_id,
-- 	v_name,
-- 	v_latitude_degree,
-- 	v_longitude_degree);
--   
--  SELECT currval('dbo.auto_venue_id') INTO v_result;
--   
--  IF(v_photo_bytes IS NOT NULL) THEN
--   INSERT INTO dbo.photos(venue_id, photo)
--   VALUES (v_result, v_photo_bytes);
--  END IF; 
-- 
--  RETURN v_result;
-- END;$$;
-- -- ddl-end --
-- 
-- object: ix_venues_latitude_degree | type: INDEX --
-- DROP INDEX dbo.ix_venues_latitude_degree;
CREATE INDEX ix_venues_latitude_degree ON dbo.venues
	USING btree
	(
	  latitude_degree ASC NULLS LAST
	);
-- ddl-end --

-- object: ix_venues_longitude_degree | type: INDEX --
-- DROP INDEX dbo.ix_venues_longitude_degree;
CREATE INDEX ix_venues_longitude_degree ON dbo.venues
	USING btree
	(
	  longitude_degree ASC NULLS LAST
	);
-- ddl-end --

-- object: dbo.venues_get | type: FUNCTION --
-- DROP FUNCTION dbo.venues_get(IN integer,IN dbo.coordinate,IN dbo.coordinate,IN integer);
CREATE FUNCTION dbo.venues_get (IN v_sport_type_id integer, IN v_lat_degree dbo.coordinate, IN v_lng_degree dbo.coordinate, IN v_radius_km integer DEFAULT 5)
	RETURNS TABLE ( venue_id integer,  sport_type_id integer,  sport_type dbo.usually_string,  group_type_id integer,  group_type dbo.usually_string,  name dbo.usually_string,  latitude dbo.coordinate,  longitude dbo.coordinate,  photo bytea)
	LANGUAGE plpgsql
	VOLATILE 
	CALLED ON NULL INPUT
	SECURITY INVOKER
	COST 1
	AS $$--Получает площадки мероприятия по типу спорта и удаленности от текущего местоположения
--Вх.:
--v_sport_type_id - id типа спорта
--v_lat_degree, v_lng_degree - широта и долгота текущего местоположения
--v_radius_km - радиус удаленности поиска площадок в км
DECLARE
 v_lat_min_degree dbo.coordinate;
 v_lat_max_degree dbo.coordinate;
 v_lng_min_degree dbo.coordinate;
 v_lng_max_degree dbo.coordinate;
BEGIN 
 SELECT
	lat_min_degree,
	lat_max_degree,
	lng_min_degree,
	lng_max_degree 
 FROM dbo.equal_bounds_radian(
	v_lat_degree,
	v_lng_degree,
	v_radius_km)
 INTO
	v_lat_min_degree,
	v_lat_max_degree,
	v_lng_min_degree,
	v_lng_max_degree;
 
 RETURN QUERY
 SELECT 
  v.venue_id,
  sp.type_id,
  sp.show_name,
  gr.type_id,
  gr.show_name,
  v.name,
  v.latitude_degree,
  v.longitude_degree,
  p.photo
 FROM dbo.venues v
 LEFT OUTER JOIN dbo.photos p ON v.venue_id = p.venue_id
 LEFT OUTER JOIN dbo.types sp ON v.sport_type_id = sp.type_id
 LEFT OUTER JOIN dbo.types gr ON v.group_type_id = gr.type_id 
 WHERE 
  v.sport_type_id = v_sport_type_id AND
  (v.latitude_degree >= v_lat_min_degree AND v.latitude_degree <= v_lat_max_degree) AND
  (v.longitude_degree >= v_lng_min_degree AND v.longitude_degree <= v_lng_max_degree);
END;$$;
-- ddl-end --

-- object: dbo.equal_bounds_radian | type: FUNCTION --
-- DROP FUNCTION dbo.equal_bounds_radian(IN dbo.coordinate,IN dbo.coordinate,IN integer,OUT dbo.coordinate,OUT dbo.coordinate,OUT dbo.coordinate,OUT dbo.coordinate);
CREATE FUNCTION dbo.equal_bounds_radian (IN lat_degree dbo.coordinate, IN lng_degree dbo.coordinate, IN radius_km integer, OUT lat_min_degree dbo.coordinate, OUT lat_max_degree dbo.coordinate, OUT lng_min_degree dbo.coordinate, OUT lng_max_degree dbo.coordinate)
	RETURNS record
	LANGUAGE plpgsql
	VOLATILE 
	CALLED ON NULL INPUT
	SECURITY INVOKER
	COST 1
	AS $$--функция вычисляет границы местоположения
--Вх.:
--lat_degree, lng_degree - широта и долгота от которых ведется поиск границ
--radius_km - удаленность поиска в км
--Вых.:
--lat_min_degree, lat_max_degree - минимум и максимум границ по широте
--lng_min_degree, lng_max_degree - минимум и максимум границ по долготе
DECLARE
 r float;  
 lat_radian float;
 lng_radian float;
 delta_lng float;
BEGIN
 r := radius_km / 6371.0;
 --перевод из градусов в радианы
 lat_radian := radians(lat_degree);
 lng_radian := radians(lng_degree);
 --нахождение границ по широте (градусы)
 lat_min_degree := degrees(lat_radian - r);
 lat_max_degree := degrees(lat_radian + r); 
 --нахождение границ по долготе (градусы)
 delta_lng := asin(sin(r)/cos(lat_radian));
 lng_min_degree := degrees(lng_radian - delta_lng);
 lng_max_degree := degrees(lng_radian + delta_lng);
END;$$;
-- ddl-end --

-- object: dbo.events_get | type: FUNCTION --
-- DROP FUNCTION dbo.events_get(IN integer);
CREATE FUNCTION dbo.events_get (IN v_venue_id integer)
	RETURNS TABLE ( event_id integer,  root_user dbo.usually_string,  mode_type_id integer,  mode_type dbo.usually_string,  status_type_id integer,  status_type dbo.usually_string,  reload_type_id integer,  reload_type dbo.usually_string,  name dbo.usually_string,  date_time timestamptz,  date_time_reg timestamptz,  users_count integer)
	LANGUAGE plpgsql
	VOLATILE 
	CALLED ON NULL INPUT
	SECURITY INVOKER
	COST 1
	AS $$--функция возвращает актуальный список мероприятий на площадку
--Вх.:
--v_venue_id - id площадки
DECLARE
 v_active_status_type_id int;
BEGIN
 SELECT dbo.type_get_id('Active' ,'ST') INTO v_active_status_type_id;
 RETURN QUERY
 SELECT 
	e.event_id,
	--u.name,
	u.username,
	mt.type_id,
	mt.show_name,
	st.type_id,
	st.show_name,
	rt.type_id,
	rt.show_name,
	e.name,
	e.date_time,
	e.date_time_reg,
	count(active.user_id) :: integer		
 FROM dbo.venues_events ve
 INNER JOIN dbo.events e ON ve.event_id = e.event_id 
 --INNER JOIN dbo.users u ON e.root_user_id = u.user_id
 INNER JOIN dbo.auth_user u ON e.root_user_id = u.id
 INNER JOIN dbo.types mt ON e.mode_type_id  =mt.type_id
 INNER JOIN dbo.types st ON e.status_type_id = st.type_id
 INNER JOIN dbo.types rt ON e.reload_type_id = rt.type_id
 LEFT OUTER JOIN (
 	SELECT 
    		ue.user_event_id,
		ue.user_id,
		ue.event_id,
		ue.status_type_id
	FROM dbo.users_events ue
	WHERE ue.status_type_id = v_active_status_type_id) active
		ON e.event_id = active.event_id
 WHERE
	ve.venue_id = v_venue_id AND
 	e.date_time >= CURRENT_TIMESTAMP
 GROUP BY
	e.event_id,
	--u.name,
	u.username,
	mt.type_id,
	mt.show_name,
	st.type_id,
	st.show_name,
	rt.type_id,
	rt.show_name,
	e.name,
	e.date_time,
	e.date_time_reg
 ORDER BY
	e.date_time DESC;
END;$$;
-- ddl-end --

-- object: dbo.users_event_get | type: FUNCTION --
-- DROP FUNCTION dbo.users_event_get(IN integer);
CREATE FUNCTION dbo.users_event_get (IN v_event_id integer)
	RETURNS TABLE ( user_id integer,  name dbo.usually_string)
	LANGUAGE plpgsql
	VOLATILE 
	CALLED ON NULL INPUT
	SECURITY INVOKER
	COST 1
	AS $$--функция возвращает список пользователей, участвующих в мероприятии
--Вх.:
--v_event_id - id мероприятия
DECLARE
 v_active_status_type_id int;
BEGIN
 SELECT dbo.type_get_id('Active' ,'ST') INTO v_active_status_type_id;
 RETURN QUERY
 SELECT u.id, u.username
 --SELECT u.user_id, u.name
 FROM dbo.users_events ue
 --INNER JOIN dbo.users u ON ue.user_id = u.user_id
 INNER JOIN dbo.auth_user u ON ue.user_id = u.id
 WHERE ue.event_id = v_event_id AND ue.status_type_id = v_active_status_type_id
 --ORDER BY u.name ASC;
 ORDER BY u.username ASC;
END;$$;
-- ddl-end --

-- object: dbo.user_event_add | type: FUNCTION --
-- DROP FUNCTION dbo.user_event_add(IN integer,IN integer,OUT integer,OUT dbo.usually_string);
CREATE FUNCTION dbo.user_event_add (IN v_user_id integer, IN v_event_id integer, OUT v_result integer, OUT v_message dbo.usually_string)
	RETURNS record
	LANGUAGE plpgsql
	VOLATILE 
	CALLED ON NULL INPUT
	SECURITY INVOKER
	COST 1
	AS $$--Функция регистрирует пользователя на мероприятие
--Вх.:
--v_user_id - id пользователя
--v_event_id - id мероприятия
--Вых.:
--v_result - 0 - пользователь не был зарегистрирован / 1 - регистрация одобрена (отправлена заяка на участие)
--v_message - сообщение о результате выполнения
DECLARE
 v_active_status_type_id int;
 v_wait_status_type_id int;
 v_public_mode_type_id int;
BEGIN
 v_result := 0;
 --если пользователь подписан/подал заявку на событие
 IF(EXISTS (
	SELECT ue.user_event_id
	FROM dbo.users_events ue
	WHERE ue.user_id = v_user_id AND ue.event_id = v_event_id
	LIMIT 1)) THEN
  v_message := 'Заявка существует ';
  RETURN;
 END IF;  
 --если пользователь подписывается на событие, котрое сам и создал
 IF(EXISTS (
	SELECT e.event_id
	FROM dbo.events e
	WHERE  e.event_id = v_event_id and e.root_user_id = v_user_id
	LIMIT 1)) THEN
  v_message := 'Владелец события';
  RETURN;
 END IF;
 --если событие не имеет статус "Активный"
 SELECT dbo.type_get_id('Active' ,'ST') INTO v_active_status_type_id;
 IF (NOT EXISTS (
	SELECT e.event_id 
	FROM dbo.events e
	WHERE e.event_id = v_event_id AND e.status_type_id = v_active_status_type_id
	LIMIT 1)) THEN
  v_message := 'Событие отменено';
  RETURN;
 END IF;
 --если событие имеет режим "Публичный"
 SELECT dbo.type_get_id('Public', 'MD') INTO v_public_mode_type_id;
 IF(EXISTS (
	SELECT e.event_id 
	FROM dbo.events e
	WHERE e.event_id = v_event_id AND e.mode_type_id = v_public_mode_type_id
	LIMIT 1)) THEN
    --регистрируем пользователя на событие со статусом "Активный"
  INSERT INTO dbo.users_events (user_id, event_id, status_type_id)
  VALUES (v_user_id, v_event_id, v_active_status_type_id);

  v_message := 'Заявка одобрена';
 ELSE 
  --подаем заявку на участие в мероприятии
  SELECT dbo.type_get_id('Wait', 'ST') INTO v_wait_status_type_id;
  INSERT INTO dbo.users_events (user_id, event_id, status_type_id)
  VALUES (v_user_id, v_event_id, v_wait_status_type_id); 

  v_message := 'Заяка принята';
 END IF;
 SELECT currval('dbo.auto_user_event_id') INTO v_result; 
END;$$;
-- ddl-end --

-- object: dbo.user_events_get | type: FUNCTION --
-- DROP FUNCTION dbo.user_events_get(IN integer,IN integer);
CREATE FUNCTION dbo.user_events_get (IN v_user_id integer, IN v_limit integer)
	RETURNS TABLE ( event_id integer,  root_user_id integer,  root_user dbo.usually_string,  mode_type_id integer,  mode_type dbo.usually_string,  status_type_event_id integer,  status_type_event dbo.usually_string,  status_type_user_id integer,  status_type_user dbo.usually_string,  reload_type_id integer,  reload_type dbo.usually_string,  name dbo.usually_string,  date_time timestamptz,  date_time_reg timestamptz)
	LANGUAGE plpgsql
	VOLATILE 
	CALLED ON NULL INPUT
	SECURITY INVOKER
	COST 1
	AS $$--Функция возвращает мероприятия с которыми пользователь взаимодействовал
--Вх.:
--user_id - id пользователя
--v_limit - кол-во возвращаемых записей
BEGIN 
 RETURN QUERY
 SELECT 
	e.event_id,
	--u.user_id,
	--u.name,
	u.id,
	u.username,
	mt.type_id,
	mt.show_name,
	st_e.type_id,
	st_e.show_name,
	st_u.type_id,
	st_u.show_name,
	rt.type_id,
	rt.show_name,
	e.name,
	e.date_time,
	e.date_time_reg			
 FROM dbo.users_events ue
 INNER JOIN dbo.events e ON ue.event_id = e.event_id 
 --INNER JOIN dbo.users u ON e.root_user_id = u.user_id
 INNER JOIN dbo.auth_user u ON e.root_user_id = u.id
 INNER JOIN dbo.types mt ON e.mode_type_id  =mt.type_id
 INNER JOIN dbo.types st_e ON e.status_type_id = st_e.type_id 
 INNER JOIN dbo.types rt ON e.reload_type_id = rt.type_id
 INNER JOIN dbo.types st_u ON ue.status_type_id = st_u.type_id 
 WHERE ue.user_id = v_user_id
 ORDER BY e.date_time DESC
 LIMIT v_limit; 
END;$$;
-- ddl-end --

-- -- object: ix_users_password | type: INDEX --
-- -- DROP INDEX dbo.ix_users_password;
-- CREATE INDEX ix_users_password ON dbo.users
-- 	USING btree
-- 	(
-- 	  password ASC NULLS LAST
-- 	);
-- -- ddl-end --
-- 
-- object: ix_types_show_name | type: INDEX --
-- DROP INDEX dbo.ix_types_show_name;
CREATE INDEX ix_types_show_name ON dbo.types
	USING btree
	(
	  show_name ASC NULLS LAST
	);
-- ddl-end --

-- object: dbo.event_add | type: FUNCTION --
-- DROP FUNCTION dbo.event_add(IN integer,IN integer,IN integer,IN integer,IN dbo.usually_string,IN timestamptz,OUT integer,OUT dbo.usually_string);
CREATE FUNCTION dbo.event_add (IN v_user_id integer, IN v_venue_id integer, IN v_mode_type_id integer, IN v_reload_type_id integer, IN v_name dbo.usually_string, IN v_date_time timestamptz, OUT v_result integer, OUT v_message dbo.usually_string)
	RETURNS record
	LANGUAGE plpgsql
	VOLATILE 
	CALLED ON NULL INPUT
	SECURITY INVOKER
	COST 1
	AS $$--Добавление мероприятия к площадке
--Вх.:
--v_user_id - id пользователя
--v_venue_id - id площадки
--v_mode_type_id -id режима мероприятия (публичный.приватный)
--v_reload_type_id -id режима перегружаемый/неперегружаемый
--v_name - имя мероприятия
--v_date_time - дата/время проведения
--Вых.:
--v_result -  0 - не зарегистрировано/ 1 - зарегистрировано
--v_message - сообщение о результате выполнения
DECLARE
 v_active_status_type_id int; 
BEGIN
 v_result := 0; 
 --Мероприятие не может быть зарегестрировано на прошедшее время
 IF(v_date_time <= CURRENT_TIMESTAMP) THEN
  v_message := 'Дата и время некоректны';
  RETURN;
 END IF;
 --Если событие на данную площадку существует
 IF(EXISTS (
	SELECT *
	FROM dbo.venues_events ve
	INNER JOIN dbo.events e ON ve.event_id = e.event_id
	WHERE
	ve.venue_id = v_venue_id AND
	e.date_time = v_date_time AND
	e.name = v_name)) THEN

  v_message := 'Событие существует';
  RETURN;
 END IF;
 SELECT dbo.type_get_id('Active' ,'ST') INTO v_active_status_type_id;
 --Если пользователь  может создавать мероприятия на площадку
 IF(EXISTS (
	SELECT ug.user_group_id
	FROM dbo.users_groups ug
	INNER JOIN dbo.types t ON ug.group_type_id = t.type_id
	INNER JOIN dbo.venues v ON t.type_id = v.group_type_id
	WHERE ug.user_id = v_user_id AND v.venue_id = v_venue_id
	LIMIT 1)) THEN
 --Записываем событие
 INSERT INTO dbo.events (
	root_user_id,
	mode_type_id,
	status_type_id,
	reload_type_id,
	name,
	date_time,
	date_time_reg)
  VALUES (
	v_user_id,
	v_mode_type_id,
	v_active_status_type_id,
	v_reload_type_id,
	v_name,
	v_date_time,
	CURRENT_TIMESTAMP);  

  SELECT currval('dbo.auto_event_id') INTO v_result;
  
  INSERT INTO dbo.venues_events (venue_id, event_id)
  VALUES (v_venue_id, v_result);  
  v_message := 'Событие добавлено' ;
  
 ELSE
  v_message := 'Нет прав на добавление';	
 END IF;	
END;$$;
-- ddl-end --

-- object: ix_events_name | type: INDEX --
-- DROP INDEX dbo.ix_events_name;
CREATE INDEX ix_events_name ON dbo.events
	USING btree
	(
	  name ASC NULLS LAST
	);
-- ddl-end --

-- object: ix_events_date_time | type: INDEX --
-- DROP INDEX dbo.ix_events_date_time;
CREATE INDEX ix_events_date_time ON dbo.events
	USING btree
	(
	  date_time DESC NULLS LAST
	);
-- ddl-end --

-- object: ix_events_date_time_reg | type: INDEX --
-- DROP INDEX dbo.ix_events_date_time_reg;
CREATE INDEX ix_events_date_time_reg ON dbo.events
	USING btree
	(
	  date_time_reg DESC NULLS LAST
	);
-- ddl-end --

-- object: dbo.user_requests_get | type: FUNCTION --
-- DROP FUNCTION dbo.user_requests_get(IN integer,IN integer);
CREATE FUNCTION dbo.user_requests_get (IN v_user_id integer, IN v_limit integer)
	RETURNS TABLE ( user_id integer,  user_name dbo.usually_string,  mode_type_id integer,  mode_type dbo.usually_string,  status_type_id integer,  status_type dbo.usually_string,  reload_type_id integer,  reload_type dbo.usually_string,  name dbo.usually_string,  date_time timestamptz,  date_time_reg timestamptz)
	LANGUAGE plpgsql
	VOLATILE 
	CALLED ON NULL INPUT
	SECURITY INVOKER
	COST 1
	AS $$--Функция возвращает запросы на подтверждение об участии в мероприятии
DECLARE
 v_wait_status_type_id int;
BEGIN
 SELECT dbo.type_get_id('Wait', 'ST') INTO v_wait_status_type_id;
 RETURN QUERY
 SELECT 
	--u.user_id,
	--u.name,
	u.id,
	u.username
	mt.type_id,
	mt.show_name,
	st.type_id,
	st.show_name,
	rt.type_id,
	rt.show_name,
	e.name,
	e.date_time,
	e.date_time_reg
 FROM dbo.events e
 INNER JOIN dbo.users_events ue ON e.event_id = ue.event_id
 --INNER JOIN dbo.users u ON ue.user_id = u.user_id
 INNER JOIN dbo.auth_user u ON ue.user_id = u.id
 INNER JOIN dbo.types mt ON e.mode_type_id = mt.type_id
 INNER JOIN dbo.types st ON e.status_type_id = st.type_id
 INNER JOIN dbo.types rt ON e.reload_type_id = rt.type_id
 WHERE e.root_user_id  = v_user_id AND ue.status_type_id = v_wait_status_type_id
 ORDER BY e.date_time DESC
 LIMIT v_limit;
END;$$;
-- ddl-end --

-- object: dbo.user_request_active_cancel | type: FUNCTION --
-- DROP FUNCTION dbo.user_request_active_cancel(IN integer,IN integer,IN integer);
CREATE FUNCTION dbo.user_request_active_cancel (IN v_user_id integer, IN v_event_id integer, IN v_active_cancel_flag integer)
	RETURNS integer
	LANGUAGE plpgsql
	VOLATILE 
	CALLED ON NULL INPUT
	SECURITY INVOKER
	COST 1
	AS $$--Функция отклоняет или принимает запрос на присоединение к мероприятию
--Вх.:
--v_user_id -id  пользователя
--v_event_id- id мероприятия
--v_active_cancel_flag - флаг, указывающий на присоединение (1) или отклонение (0) запроса
--Вых.:
--v_result - 1 - успешно, 0 - v_active_cancel_flag - отличный от 0 или от 1
--Функция отклоняет или принимает запрос на присоединение к мероприятию
DECLARE
 v_result int;
 v_status_type_id int;
BEGIN 
 v_result := 0;
 IF (v_active_cancel_flag = 1) THEN
  SELECT dbo.type_get_id('Active' ,'ST') INTO v_status_type_id;  
 ELSIF (v_active_cancel_flag = 0) THEN
  SELECT dbo.type_get_id('Cancel' ,'ST') INTO v_status_type_id;
 ELSE
  RETURN v_result;
 END IF;
 UPDATE dbo.users_events
 SET status_type_id = v_status_type_id
 WHERE user_id = v_user_id and event_id = v_event_id;
 
 SELECT currval('dbo.auto_user_event_id') INTO v_result;
 
 RETURN v_result;
END;$$;
-- ddl-end --

-- object: fk_objects_types_object_id | type: CONSTRAINT --
-- ALTER TABLE dbo.types DROP CONSTRAINT fk_objects_types_object_id;
ALTER TABLE dbo.types ADD CONSTRAINT fk_objects_types_object_id FOREIGN KEY (object_id)
REFERENCES dbo.objects (object_id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- object: fk_types_events_status_type_id | type: CONSTRAINT --
-- ALTER TABLE dbo.events DROP CONSTRAINT fk_types_events_status_type_id;
ALTER TABLE dbo.events ADD CONSTRAINT fk_types_events_status_type_id FOREIGN KEY (status_type_id)
REFERENCES dbo.types (type_id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- object: fk_types_events_reload_type_id | type: CONSTRAINT --
-- ALTER TABLE dbo.events DROP CONSTRAINT fk_types_events_reload_type_id;
ALTER TABLE dbo.events ADD CONSTRAINT fk_types_events_reload_type_id FOREIGN KEY (reload_type_id)
REFERENCES dbo.types (type_id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- object: fk_types_events_type_id | type: CONSTRAINT --
-- ALTER TABLE dbo.events DROP CONSTRAINT fk_types_events_type_id;
ALTER TABLE dbo.events ADD CONSTRAINT fk_types_events_type_id FOREIGN KEY (mode_type_id)
REFERENCES dbo.types (type_id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- -- object: fk_users_events_root_user_id | type: CONSTRAINT --
-- -- ALTER TABLE dbo.events DROP CONSTRAINT fk_users_events_root_user_id;
-- ALTER TABLE dbo.events ADD CONSTRAINT fk_users_events_root_user_id FOREIGN KEY (root_user_id)
-- REFERENCES dbo.users (user_id) MATCH SIMPLE
-- ON DELETE CASCADE ON UPDATE NO ACTION;
-- -- ddl-end --
-- 
-- 
-- object: fk_types_venues_type_id | type: CONSTRAINT --
-- ALTER TABLE dbo.venues DROP CONSTRAINT fk_types_venues_type_id;
ALTER TABLE dbo.venues ADD CONSTRAINT fk_types_venues_type_id FOREIGN KEY (sport_type_id)
REFERENCES dbo.types (type_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: fk_types_venues_group_type_id | type: CONSTRAINT --
-- ALTER TABLE dbo.venues DROP CONSTRAINT fk_types_venues_group_type_id;
ALTER TABLE dbo.venues ADD CONSTRAINT fk_types_venues_group_type_id FOREIGN KEY (group_type_id)
REFERENCES dbo.types (type_id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- -- object: fk_users_users_events_user_id | type: CONSTRAINT --
-- -- ALTER TABLE dbo.users_events DROP CONSTRAINT fk_users_users_events_user_id;
-- ALTER TABLE dbo.users_events ADD CONSTRAINT fk_users_users_events_user_id FOREIGN KEY (user_id)
-- REFERENCES dbo.users (user_id) MATCH SIMPLE
-- ON DELETE CASCADE ON UPDATE NO ACTION;
-- -- ddl-end --
-- 
-- 
-- object: fk_events_users_events_event_id | type: CONSTRAINT --
-- ALTER TABLE dbo.users_events DROP CONSTRAINT fk_events_users_events_event_id;
ALTER TABLE dbo.users_events ADD CONSTRAINT fk_events_users_events_event_id FOREIGN KEY (event_id)
REFERENCES dbo.events (event_id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- object: fk_types_users_events_status_type_id | type: CONSTRAINT --
-- ALTER TABLE dbo.users_events DROP CONSTRAINT fk_types_users_events_status_type_id;
ALTER TABLE dbo.users_events ADD CONSTRAINT fk_types_users_events_status_type_id FOREIGN KEY (status_type_id)
REFERENCES dbo.types (type_id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- object: fk_venues_venues_events_event_id | type: CONSTRAINT --
-- ALTER TABLE dbo.venues_events DROP CONSTRAINT fk_venues_venues_events_event_id;
ALTER TABLE dbo.venues_events ADD CONSTRAINT fk_venues_venues_events_event_id FOREIGN KEY (venue_id)
REFERENCES dbo.venues (venue_id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- object: fk_events_venues_events_event_id | type: CONSTRAINT --
-- ALTER TABLE dbo.venues_events DROP CONSTRAINT fk_events_venues_events_event_id;
ALTER TABLE dbo.venues_events ADD CONSTRAINT fk_events_venues_events_event_id FOREIGN KEY (event_id)
REFERENCES dbo.events (event_id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- object: fk_types_users_groups_group_id | type: CONSTRAINT --
-- ALTER TABLE dbo.users_groups DROP CONSTRAINT fk_types_users_groups_group_id;
ALTER TABLE dbo.users_groups ADD CONSTRAINT fk_types_users_groups_group_id FOREIGN KEY (group_type_id)
REFERENCES dbo.types (type_id) MATCH SIMPLE
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --


-- -- object: fk_users_users_groups_user_id | type: CONSTRAINT --
-- -- ALTER TABLE dbo.users_groups DROP CONSTRAINT fk_users_users_groups_user_id;
-- ALTER TABLE dbo.users_groups ADD CONSTRAINT fk_users_users_groups_user_id FOREIGN KEY (user_id)
-- REFERENCES dbo.users (user_id) MATCH SIMPLE
-- ON DELETE CASCADE ON UPDATE NO ACTION;
-- -- ddl-end --
-- 
-- 
-- object: fk_venues_photos_venue_id | type: CONSTRAINT --
-- ALTER TABLE dbo.photos DROP CONSTRAINT fk_venues_photos_venue_id;
ALTER TABLE dbo.photos ADD CONSTRAINT fk_venues_photos_venue_id FOREIGN KEY (venue_id)
REFERENCES dbo.venues (venue_id) MATCH FULL
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --



-- Appended SQL commands --
INSERT INTO dbo.objects (name, code) VALUES ('status_type', 'ST');
INSERT INTO dbo.objects (name, code) VALUES ('group_type', 'GR');
INSERT INTO dbo.objects (name, code) VALUES ('mode_type', 'MD');
INSERT INTO dbo.objects (name, code) VALUES ('reload_type', 'RL');
INSERT INTO dbo.objects (name, code) VALUES ('sport_type', 'SP');
--status
INSERT INTO dbo.types (show_name, name, object_id) VALUES ('Активный', 'Active', (SELECT o.object_id FROM dbo.objects o WHERE o.code = 'ST' LIMIT 1)) ;
INSERT INTO dbo.types (show_name, name, object_id) VALUES ('Отмененный', 'Cancel', (SELECT o.object_id FROM dbo.objects o WHERE o.code = 'ST' LIMIT 1)) ;
INSERT INTO dbo.types (show_name, name, object_id) VALUES ('В ожидании', 'Wait', (SELECT o.object_id FROM dbo.objects o WHERE o.code = 'ST' LIMIT 1)) ;
--group
INSERT INTO dbo.types (show_name, name, object_id) VALUES ('Общая', 'Common', (SELECT o.object_id FROM dbo.objects o WHERE o.code = 'GR' LIMIT 1)) ;

--mode
INSERT INTO dbo.types (show_name, name, object_id) VALUES ('Публичный', 'Public', (SELECT o.object_id FROM dbo.objects o WHERE o.code = 'MD' LIMIT 1)) ;
INSERT INTO dbo.types (show_name, name, object_id) VALUES ('Приватный', 'Private', (SELECT o.object_id FROM dbo.objects o WHERE o.code = 'MD' LIMIT 1)) ;
--reload
INSERT INTO dbo.types (show_name, name, object_id) VALUES ('Перегружаемый', 'Reload', (SELECT o.object_id FROM dbo.objects o WHERE o.code = 'RL' LIMIT 1)) ;
INSERT INTO dbo.types (show_name, name, object_id) VALUES ('Неперегружаемый', 'NoReload', (SELECT o.object_id FROM dbo.objects o WHERE o.code = 'RL' LIMIT 1)) ;

--to use django user table
--ALTER TABLE dbo.events ADD CONSTRAINT fk_auth_user_events_root_user_id FOREIGN KEY (root_user_id)
--REFERENCES dbo.auth_user (id) MATCH SIMPLE
--ON DELETE CASCADE ON UPDATE NO ACTION;

--ALTER TABLE dbo.users_events ADD CONSTRAINT fk_auth_user_users_events_user_event_id FOREIGN KEY (user_id)
--REFERENCES dbo.auth_user (id) MATCH SIMPLE
--ON DELETE CASCADE ON UPDATE NO ACTION;

---ALTER TABLE dbo.users_groups ADD CONSTRAINT fk_auth_user_users_groups_user_group_id FOREIGN KEY (user_id)
--REFERENCES dbo.auth_user (id) MATCH SIMPLE
--ON DELETE CASCADE ON UPDATE NO ACTION;


---
