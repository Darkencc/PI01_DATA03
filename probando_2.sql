DROP DATABASE PI_DTS_03;
CREATE DATABASE IF NOT EXISTS PI_DTS_03;
USE PI_DTS_03;
SET GLOBAL log_bin_trust_function_creators = 1;

DROP TABLE IF EXISTS `circuit`;
CREATE TABLE IF NOT EXISTS `circuit` (
  	`Idcircuit`    INTEGER,
  	`Refcircuit`   VARCHAR(40),
  	`Name` 	       VARCHAR(40),
	`Location`	   VARCHAR(40),
  	`Country` 	   VARCHAR(40),
    `Latitud`      VARCHAR(40),
    `Longitud`	   VARCHAR(40),
    `Altitud` 	   VARCHAR(40),
    `URL`          VARCHAR(180)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\PI\\circuits.csv' 
INTO TABLE circuit 
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES;