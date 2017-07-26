DROP TABLE IF EXISTS pokemons;
DROP TABLE IF EXISTS trainers;

CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  name TEXT,
  img_url TEXT,
  color TEXT
);

CREATE TABLE trainers (
  id SERIAL PRIMARY KEY,
  name TEXT,
  img_url TEXT,
  level INTEGER,
  team_id INTEGER REFERENCES teams(id)
);

CREATE TABLE pokemons (
  id SERIAL PRIMARY KEY,
  name TEXT,
  move TEXT,
  cp INTEGER,
  img_url TEXT,
  trainer_id INTEGER REFERENCES trainers(id)
);
