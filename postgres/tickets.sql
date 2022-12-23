
CREATE TABLE ticket
(
    id            SERIAL PRIMARY KEY,
    ticket_uid    uuid UNIQUE NOT NULL,
    username      VARCHAR(80) NOT NULL,
    flight_number VARCHAR(20) NOT NULL,
    price         INT         NOT NULL,
    status        VARCHAR(20) NOT NULL
        CHECK (status IN ('PAID', 'CANCELED'))
);
GRANT ALL PRIVILEGES ON ticket TO program;
grant USAGE, SELECT ON SEQUENCE ticket_id_seq TO program;

insert into ticket(id, ticket_uid, username, flight_number, price, status)
		values (1, '3422b448-2460-4fd2-9183-8000de6f8343', 'Test Max', 'a380', 1000, 'PAID');
		
select * from ticket;







