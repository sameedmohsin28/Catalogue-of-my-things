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



-- Schema for games


