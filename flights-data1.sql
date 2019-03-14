
USE nycflights ;

TRUNCATE TABLE flights;

LOAD DATA INFILE  'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/nycflights/flights.csv' 
INTO TABLE flights
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
();

ALTER TABLE flights ADD COLUMN flight_id int UNSIGNED AUTO_INCREMENT PRIMARY KEY ;

-- (Q: Comment traiter les NA de R des valeurs manquantes csv et les mettre en SQL)


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/nycflights/airlines.csv'
INTO TABLE airlines
FIELDS TERMINATED BY ',' -- separateur: ;|
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'  -- '\r\n' for windows
ignore 1 lines               -- 0 lines ça marche
-- (col_name1, col_name2)
();



LOAD DATA INFILE  'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/nycflights/planes.csv' 
INTO TABLE planes
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES

();

INSERT INTO planes (tailnum)
SELECT distinct tailnum FROM flights
WHERE tailnum NOT IN (SELECT tailnum FROM planes);


LOAD DATA INFILE  'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/nycflights/airports.csv' 
INTO TABLE airports
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
();
INSERT INTO airports (faa, name)
  VALUES ('BQN', 'Rafael Hernandez Airport'),
    ('PSE', 'Mercedita Airport'),
    ('SJU', 'San Juan Airport'),
    ('STT', 'Cyril E. King Airport');

LOAD DATA INFILE  'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/nycflights/weather.csv' 
INTO TABLE weather
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES

();




-- clés étrangeres
 
 ALTER TABLE flights 
ADD CONSTRAINT fk_tailnum FOREIGN KEY (tailnum) 
REFERENCES planes (tailnum) ON DELETE RESTRICT ON UPDATE CASCADE;

 ALTER TABLE flights 
ADD CONSTRAINT fk_carrier FOREIGN KEY (carrier) 
REFERENCES airlines(carrier) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE flights 
ADD CONSTRAINT fk_origin FOREIGN KEY (origin) 
REFERENCES airports(faa) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE flights
ADD CONSTRAINT fk_faa_dest FOREIGN KEY (dest) REFERENCES airports(faa) ON DELETE RESTRICT ON UPDATE CASCADE;


ALTER TABLE flights 
ADD CONSTRAINT fk_weather FOREIGN KEY (year,month,day,hour,origin) 
REFERENCES weather(year,month,day,hour,origin) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE weather 
ADD CONSTRAINT fk_origin_weather FOREIGN KEY (origin) 
REFERENCES airports(faa) ON DELETE RESTRICT ON UPDATE CASCADE;







