DROP DATABASE PI_DTS_03;
CREATE DATABASE IF NOT EXISTS PI_DTS_03;
USE PI_DTS_03;
SET GLOBAL log_bin_trust_function_creators = 1;

/*Importacion de las tablas*/
DROP TABLE IF EXISTS `circuits`;
CREATE TABLE IF NOT EXISTS `circuits` (
  	`Idcircuit` 	INTEGER,
  	`Refcircuit` 	VARCHAR(40),
  	`Name` 	        VARCHAR(40),
    `Location`		VARCHAR(40),
  	`Country` 		VARCHAR(40),
    `Latitud`       VARCHAR(40),
    `Longitud`		VARCHAR(40),
    `Altitud`		VARCHAR(40),
    `URL` 			VARCHAR(110)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;	
truncate table circuits;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\circuits.csv' 
INTO TABLE `circuits` 
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;


DROP TABLE IF EXISTS `race`;
CREATE TABLE IF NOT EXISTS `race` (
  	`Idrace` 	   INTEGER,
  	`Year` 	       VARCHAR(40),
  	`Round` 	   VARCHAR(40),
    `Idcircuit`	   VARCHAR(40),
  	`Name` 		   VARCHAR(40),
    `Date`         VARCHAR(40),
    `Time`		   VARCHAR(40),
    `URL` 		   VARCHAR(110)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;	
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\PI\\races.csv' 
INTO TABLE `race` 
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

select * from circuits;
