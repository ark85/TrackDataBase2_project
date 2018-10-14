CREATE TABLE IF NOT EXISTS users (
    user_id INT NOT NULL AUTO_INCREMENT,
    login VARCHAR(45) NOT NULL,
    reg_dttm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id)
)  ENGINE=INNODB AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS payments (
    payment_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    payment_sum DOUBLE,
    payment_dttm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (payment_id),
    FOREIGN KEY (user_id) REFERENCES payments(payment_id)
)  ENGINE=INNODB AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS sessions (
    session_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    begin_dttm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    end_dttm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (session_id),
    FOREIGN KEY (user_id) REFERENCES sessions(session_id)
)  ENGINE=INNODB AUTO_INCREMENT=1;