---- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE albums RESTART IDENTITY; -- replace with your own table name.
TRUNCATE TABLE artists RESTART IDENTITY; -- replace with your own table name.


-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO "public"."albums" ("title", "release_year", "artist_id") VALUES
('Doolittle', 1989, 1),
('Surfer Rosa', 1988, 1),
('Waterloo', 1974, 2),
('Super Trouper', 1980, 2),
('Bossanova', 1990, 1),
('Lover', 2019, 3),
('Folklore', 2020, 3),
('I Put a Spell on You', 1965, 4),
('Baltimore', 1978, 4),
( 'Here Comes the Sun', 1971, 4),
( 'Fodder on My Wings', 1982, 4),
( 'Album for Robin FROM TAYLOR', 2022, 3),
( 'Ring Ring', 1973, 2);

INSERT INTO "public"."artists" ("name", "genre") VALUES
('Pixies', 'Rock'),
('ABBA', 'Pop'),
('Taylor Swift', 'Pop'),
('Nina Simone', 'Pop');