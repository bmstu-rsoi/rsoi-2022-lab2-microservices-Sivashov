
CREATE TABLE airport
(
    id      SERIAL PRIMARY KEY,
    name    VARCHAR(255),
    city    VARCHAR(255),
    country VARCHAR(255)
);

CREATE TABLE flight
(
    id              SERIAL PRIMARY KEY,
    flight_number   VARCHAR(20)              NOT NULL,
    datetime        TIMESTAMP WITH TIME ZONE NOT NULL,
    from_airport_id INT REFERENCES airport (id),
    to_airport_id   INT REFERENCES airport (id),
    price           INT                      NOT NULL
);

GRANT ALL PRIVILEGES ON flight TO program;
GRANT ALL PRIVILEGES ON airport TO program;
insert into airport (id, name, city, country) values (1, 'Шереметьево', 'Москва', 'Россия'),
													(2, 'Пулково', 'Санкт-Петербург', 'Россия');
insert into flight (id, flight_number, datetime, from_airport_id, to_airport_id, price)
		values (1, 'AFL031', '2021-10-08 20:00', 2, 1, 1500);
select * from airport;
select * from flight;





