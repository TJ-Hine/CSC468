#!/bin/bash

# Wait for the MySQL server to start
sleep 10

# SQL commands to create the `cattle` table
# Modify the below table schema according to your CSV structure
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "
USE $MYSQL_DATABASE;
CREATE TABLE cattle (
    id INT AUTO_INCREMENT PRIMARY KEY,
    breed VARCHAR(255),
    weight DECIMAL(10, 2),
    age INT
);
"

# Import data from the CSV file into the `cattle` table
# Modify the below command according to your CSV structure and table schema
mysqlimport --ignore-lines=1 \
            --fields-terminated-by=',' \
            --verbose \
            --local \
            -u root -p"$MYSQL_ROOT_PASSWORD" \
            $MYSQL_DATABASE \
            /tmp/cattle_data.csv
