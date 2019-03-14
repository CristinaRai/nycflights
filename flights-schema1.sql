SET AUTOCOMMIT = 0;

START TRANSACTION;

DROP SCHEMA IF EXISTS nycflights;
CREATE SCHEMA nycflights CHARACTER SET utf8MB4;
USE nycflights;

-- Création de la table flights :
DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
	#flight_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	year char(4),
	month char(2),
	day char(2),-- au moment d'ajout des FK le char(2) ne veut plus passer 
	dep_time SMALLINT UNSIGNED,
	sched_dep_time SMALLINT UNSIGNED,
	dep_delay SMALLINT,
	arr_time SMALLINT UNSIGNED,
	sched_arr_time SMALLINT UNSIGNED,
	arr_delay SMALLINT,
	carrier VARCHAR(10),-- au moment d'ajout des FK le char(2) ne veut plus passer 
	flight VARCHAR (10),
	tailnum VARCHAR (10), 
	origin char(3),
	dest char(3),
	air_time SMALLINT UNSIGNED,
	distance SMALLINT UNSIGNED,
	hour char(2),
	minute char(2) NOT NULL, -- au moment d'ajout des FK le char(2) ne veut plus passer
	time_hour DATETIME NOT NULL -- year+month+day+hour (sans les minutes)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ; 
SHOW WARNINGS ;


-- Création de la table airlines :
DROP TABLE IF EXISTS airlines ;
CREATE TABLE airlines ( 
	carrier VARCHAR(10) PRIMARY KEY,
	name varchar(27) NOT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ; 
SHOW WARNINGS ;-- Permet de capturer les erreurs et warnings générés par la rêquete précédente (en mode d'exécution manuel).



-- Création de la table planes :
DROP TABLE IF EXISTS planes ;
CREATE TABLE planes 
(
  	tailnum VARCHAR(6) PRIMARY KEY,
	year CHAR(4),
	type VARCHAR(24),
	manufacturer VARCHAR(30),
	model VARCHAR(20),
	engines SMALLINT,
	seats SMALLINT,
	speed SMALLINT,
	engine VARCHAR(20)
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ; 
SHOW WARNINGS ;-- Permet de capturer les erreurs et warnings générés par la rêquete précédente (en mode d'exécution manuel).


-- Création de la table airports :
DROP TABLE IF EXISTS airports ;
CREATE TABLE airports 
(
     faa CHAR(3) PRIMARY KEY,
     name VARCHAR(55),
     lat decimal(20,15) UNSIGNED,
     lon decimal(20,15),
     alt SMALLINT,
     tz SMALLINT,
     dst VARCHAR(1),
     tzone VARCHAR(20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ; 
SHOW WARNINGS ;-- Permet de capturer les erreurs et warnings générés par la rêquete précédente (en mode d'exécution manuel).


-- Création de la table weather :
DROP TABLE IF EXISTS weather ;
CREATE TABLE weather 
(   origin char(3),
    year char(4),
	month char(2),
	day char(2),
	hour char(2),
	temp decimal(5,2),
	dewp decimal(20,17),
	humid decimal(5,2),
	wind_dir SMALLINT UNSIGNED,
	wind_speed decimal(21,17),
	wind_gust decimal(22,18),
	precip decimal(20,18),
	pressure decimal(25,15),
	visib decimal(20,17),
	time_hour DATETIME,
	PRIMARY KEY (year, month, day, hour, origin)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ; 
SHOW WARNINGS ;-- Permet de capturer les erreurs et warnings générés par la rêquete précédente (en mode d'exécution manuel).




SET AUTOCOMMIT = 1;

-- FIN DE FICHIER SCHEMA



