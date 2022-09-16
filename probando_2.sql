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
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\circuits.csv' 
INTO TABLE circuit 
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

DROP TABLE IF EXISTS `race`;
CREATE TABLE IF NOT EXISTS `race` (
  	`Idrace` 	   INTEGER,
  	`Year` 	       INTEGER,
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
LINES TERMINATED BY '\r\n' IGNORE 1 LINES;


DROP TABLE IF EXISTS `constructor`;
CREATE TABLE IF NOT EXISTS `constructor` (
  	`num` 	               INTEGER,
  	`Idconstructor` 	   INTEGER,
  	`constructorRef` 	   VARCHAR(40),
    `name`	               VARCHAR(40),
  	`nationality` 		   VARCHAR(40),
    `URL` 		           VARCHAR(110)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;	
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\constructors_conv.csv' 
INTO TABLE `constructor` 
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

DROP TABLE IF EXISTS `driver`;
CREATE TABLE IF NOT EXISTS `driver` (
  	`num` 	       INTEGER,
  	`Iddriver` 	   INTEGER,
  	`driverRef`    VARCHAR(40),
    `number`	   VARCHAR(40),
  	`code` 		   VARCHAR(40),
    `name` 		   VARCHAR(110),
    `dob`          VARCHAR(40),
    `nationality`  VARCHAR(40),
    `URL`          VARCHAR(110)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;	
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\drivers_conv.csv' 
INTO TABLE `driver` 
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES;


DROP TABLE IF EXISTS `result`;
CREATE TABLE IF NOT EXISTS `result` (
  	`num` 	           INTEGER,
  	`Idresult` 	       INTEGER,
  	`Idrace`           INTEGER,
    `Iddriver`	       INTEGER,
  	`Idcosntructor`    INTEGER,
    `number` 		   VARCHAR(110),
    `grid`             VARCHAR(40),
    `position`         VARCHAR(40),
    `positionText`     VARCHAR(40),
    `positionOrder`    VARCHAR(40),
    `points`           VARCHAR(40),
    `laps`             VARCHAR(40),
    `time`             VARCHAR(40),
    `milliseconds`     VARCHAR(40),
    `fastestLap`       VARCHAR(40),
    `rank`             VARCHAR(40),
    `fastestLapTime`   VARCHAR(40),
    `fastestLapSpeed`  VARCHAR(40),
    `Idstatus`         VARCHAR(40)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;	
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\results_conv.csv' 
INTO TABLE `result` 
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

# Consultas

#________________________________  1  ___________________________________
Select MAX(ra.carreras) as Cant_max_año  
	from (Select year as ye, count(year) as carreras 
    from race group by year) ra;
    
