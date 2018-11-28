LOAD DATA INFILE '/var/lib/mysql-files/users.csv'
INTO TABLE users
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql-files/planes.csv'
INTO TABLE planes
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql-files/tickets.csv'
INTO TABLE tickets
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql-files/flights.csv'
INTO TABLE flights
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql-files/payments.csv'
INTO TABLE payments
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql-files/sessions.csv'
INTO TABLE sessions
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';