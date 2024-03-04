
CREATE TABLE IF NOT EXISTS cattle (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    breed VARCHAR(255),
    weight_kg INT,
    height_cm INT,
    description TEXT
);

LOAD DATA INFILE '/docker-entrypoint-initdb.d/cattle.csv'
INTO TABLE cattle
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(name, breed, weight_kg, height_cm, description);


