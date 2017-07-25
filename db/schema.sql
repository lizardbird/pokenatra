DROP TABLE IF EXISTS pokemons;
DROP TABLE IF EXISTS trainers;

CREATE TABLE trainers (
  id SERIAL PRIMARY KEY,
  name TEXT,
  level INTEGER,
  img_url TEXT
);

CREATE TABLE pokemons (
  id SERIAL PRIMARY KEY,
  name TEXT,
  poke_type TEXT,
  cp INTEGER,
  img_url TEXT,
  trainer_id INTEGER REFERENCES trainers(id)
);
