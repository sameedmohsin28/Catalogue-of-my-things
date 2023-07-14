
-- Schema for Item
CREATE TABLE item (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publish_date DATE,
  archived BOOLEAN,
  genre TEXT,
  author TEXT,
  source TEXT,
  label TEXT
);


-- Schema for books
CREATE TABLE books (
  id INT NOT NULL PRIMARY KEY REFERENCES item(id),
  publisher TEXT,
  cover_state TEXT
);

CREATE TABLE label(
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title TEXT,
  color TEXT
);

CREATE TABLE item_label (
  label INT REFERENCES label(id)
  item INT REFERENCES item(id),
  PRIMARY KEY (label, item)
);


-- Schema for songs
CREATE TABLE genre (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name TEXT
);

CREATE TABLE music_album (
  id INT PRIMARY KEY REFERENCES item(id),
  on_spotify BOOLEAN
);

CREATE TABLE item_genre (
  genre INT REFERENCES genre(id),
  item INT REFERENCES item(id),
  PRIMARY KEY (genre, item)
);

-- Schema for games
CREATE TABLE games (
  id INT NOT NULL PRIMARY KEY REFERENCES item(id)
  publish_date DATE,
  last_played_at DATE,
  multiplayer BOOLEAN
);

CREATE TABLE author (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  first_name CHAR(255),
  last_name CHAR(255)
);

CREATE TABLE item_author (
  author INT REFERENCES games(id),
  item INT REFERENCES item(id),
  PRIMARY KEY (author, item)
);
