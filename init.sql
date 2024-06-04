CREATE SCHEMA schema1;

CREATE TABLE IF NOT EXISTS schema1.table1 (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100)
);


INSERT INTO schema1.table1 (nom) VALUES ('nom1');