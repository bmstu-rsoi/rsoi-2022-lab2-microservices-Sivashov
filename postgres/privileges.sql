
CREATE TABLE privilege
(
    id       SERIAL PRIMARY KEY,
    username VARCHAR(80) NOT NULL UNIQUE,
    status   VARCHAR(80) NOT NULL DEFAULT 'BRONZE'
        CHECK (status IN ('BRONZE', 'SILVER', 'GOLD')),
    balance  INT
);

CREATE TABLE privilege_history
(
    id             SERIAL PRIMARY KEY,
    privilege_id   INT REFERENCES privilege (id),
    ticket_uid     uuid        NOT NULL,
    datetime       TIMESTAMP   NOT NULL,
    balance_diff   INT         NOT NULL,
    operation_type VARCHAR(20) NOT NULL
        CHECK (operation_type IN ('FILL_IN_BALANCE', 'DEBIT_THE_ACCOUNT'))
);

GRANT ALL PRIVILEGES ON privilege TO program;
GRANT ALL PRIVILEGES ON privilege_history TO program;
grant USAGE, SELECT ON SEQUENCE privilege_history_id_seq TO program;
--truncate privilege cascade;
--select * from privilege;
insert into privilege (id, username, status, balance) values (1, 'Test Max', 'GOLD', 1500);
--update privilege set balance = 1500 where username = 'Dima';
--truncate privilege_history;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
insert into privilege_history (id, privilege_id, ticket_uid, datetime, balance_diff, operation_type)
values (1, 1, '049161bb-badd-4fa8-9d90-87c9a82b0668', '2021-10-08T19:59:19Z', 1500, 'FILL_IN_BALANCE');
select * from privilege;
select * from privilege_history;



