DROP TABLE IF EXISTS questions CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS pairs CASCADE;
DROP TABLE IF EXISTS games CASCADE;
DROP SEQUENCE IF EXISTS questions_id_seq;
DROP SEQUENCE IF EXISTS users_id_seq;
DROP SEQUENCE IF EXISTS games_id_seq;
CREATE SEQUENCE questions_id_seq;
CREATE SEQUENCE users_id_seq;
CREATE SEQUENCE games_id_seq;


CREATE TABLE questions
(
  id integer DEFAULT nextval('questions_id_seq'),
  question char(100),
  answers char(100),
  correct_answer integer,
  difficulty integer,
  CONSTRAINT questions_pk PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);

CREATE TABLE users
(
  id integer DEFAULT nextval('users_id_seq'),
  name char(20),
  CONSTRAINT users_pk PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);

CREATE TABLE games
(
  id integer DEFAULT nextval('games_id_seq'),
  player_id integer,
  score integer,
  finished boolean,
  CONSTRAINT games_pk PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);

CREATE TABLE pairs
(
  game_id integer,
  question_id integer,
  order_number integer,
  is_correct boolean
) WITH (
  OIDS=FALSE
);

ALTER TABLE games ADD CONSTRAINT games_fk1 FOREIGN KEY (player_id) REFERENCES users(id);
ALTER TABLE pairs ADD CONSTRAINT pairs_fk1 FOREIGN KEY (game_id) REFERENCES games(id);
ALTER TABLE pairs ADD CONSTRAINT pairs_fk2 FOREIGN KEY (question_id) REFERENCES questions(id);
