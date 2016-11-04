CREATE TABLE songs (
  id BIGSERIAL PRIMARY KEY,
  artist_id SERIAL NOT NULL,
  name VARCHAR(255) NOT NULL,
  lyrics TEXT NOT NULL,
  created DATE NOT NULL DEFAULT CURRENT_DATE
);
CREATE INDEX songs_user_id_index ON songs(user_id) WHERE user_id IS NOT NULL;
CREATE INDEX songs_name_index ON songs(lower(name)) WHERE name IS NOT NULL;
