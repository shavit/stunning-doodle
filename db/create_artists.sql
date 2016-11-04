CREATE TABLE artists (
  id SERIAL,
  uid VARCHAR(255) NOT NULL,
  name VARCHAR(80) NOT NULL,
  picture VARCHAR(255) NOT NULL,
  created DATE NOT NULL DEFAULT CURRENT_DATE
);
CREATE INDEX artists_uid_index ON artists(uid) WHERE uid IS NOT NULL;
CREATE INDEX artists_name_index ON artists(lower(name)) WHERE name IS NOT NULL;
