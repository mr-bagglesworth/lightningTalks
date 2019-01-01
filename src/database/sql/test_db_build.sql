BEGIN;

DROP TABLE IF EXISTS users cascade;
DROP TABLE IF EXISTS talks cascade;

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  username VARCHAR(100) NOT NULL,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(200) NOT NULL
);


CREATE TABLE talks (
  id SERIAL PRIMARY KEY NOT NULL,
  user_id INTEGER REFERENCES users (id),
  subject VARCHAR(100) NOT NULL,
  datetime TIMESTAMP NOT NULL, -- have to combine date and tiem picker on front and back end, and put into correct format
  html BOOLEAN NOT NULL,
  css BOOLEAN NOT NULL,
  js BOOLEAN NOT NULL,
  sql BOOLEAN NOT NULL,
  node BOOLEAN NOT NULL
);


-- insert dummy data for testing purposes
-- this gets input before every database test
INSERT INTO users (username, name, email, password) VALUES
(
  'mr-bagglesworth', 
  'Martin',
  'martinbagshaw1@gmail.com',
  'p4$$WrDwe'
),
(
  'zurda', 
  'Michal',
  'zurda@github.com',
  'PL5tN0ani'
),
(
  'la-fosse', 
  'Charlie',
  'lafosse@github.com',
  'fl055inG_'
);

INSERT INTO talks (user_id, subject, datetime, html, css, js, sql, node) VALUES
(
  1, 
  'SCSS',
  '2018-12-29 15:00:00',
  false,
  true,
  false,
  false,
  false
),
(
  2, 
  'Database testing',
  '2019-01-10 13:00:00',
  false,
  false,
  false,
  true,
  false
),
(
  3, 
  'React', 
  '2019-01-15 17:30:00',
  false,
  true,
  true,
  false,
  false
);

COMMIT;