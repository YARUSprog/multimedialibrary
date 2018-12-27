DROP SCHEMA IF EXISTS public CASCADE;
commit;
CREATE SCHEMA public;
commit;

CREATE TABLE user_roles
(
    id   SERIAL   NOT NULL,
    name VARCHAR(30) NOT NULL
);

ALTER TABLE user_roles
  ADD CONSTRAINT group_user_PK PRIMARY KEY (id);

CREATE TABLE users
(
    id                 BIGSERIAL    NOT NULL,
    password           VARCHAR(100) NOT NULL,
    first_name         VARCHAR(50)  NOT NULL,
    middle_name        VARCHAR(50)  NOT NULL,
    last_name          VARCHAR(50),
    email              VARCHAR(320) NOT NULL,
    details            VARCHAR(500),
    enable             BOOLEAN      NOT NULL,
    account_non_locked BOOLEAN      NOT NULL,
    teacher            BOOLEAN      NOT NULL,
    user_role_id       INTEGER      NOT NULL
);

CREATE INDEX users__IDX
  ON users
  (
    first_name ASC,
    middle_name ASC,
    last_name ASC
  );

ALTER TABLE users
  ADD CONSTRAINT users_PK PRIMARY KEY (id);

ALTER TABLE users
  ADD CONSTRAINT users__UN UNIQUE (email);

CREATE TABLE user_attempts
(
    id            BIGSERIAL                NOT NULL,
    attempts      INTEGER                  NOT NULL,
    last_modified TIMESTAMP WITH TIME ZONE NOT NULL,
    user_id       INTEGER                  NOT NULL
);

ALTER TABLE user_attempts
  ADD CONSTRAINT user_attempts_PK PRIMARY KEY (id);

CREATE TABLE user_register_token
(
    id        BIGSERIAL    NOT NULL,
    user_id   INTEGER      NOT NULL,
    token     VARCHAR(60)  NOT NULL,
    date_send TIMESTAMP(0) NOT NULL,
    used      BOOLEAN      NOT NULL
);

ALTER TABLE user_register_token
  ADD CONSTRAINT user_register_token_PK PRIMARY KEY (id);

CREATE TABLE persistent_logins
(
    series    CHARACTER VARYING(64)       NOT NULL,
    username  CHARACTER VARYING(64)       NOT NULL,
    token     CHARACTER VARYING(64)       NOT NULL,
    last_used TIMESTAMP WITHOUT TIME ZONE NOT NULL
);

ALTER TABLE persistent_logins
  ADD CONSTRAINT persistent_logins_PK PRIMARY KEY (series);

CREATE TABLE article
(
    id              BIGSERIAL       NOT NULL,
    title           VARCHAR(100)    NOT NULL,
    text            VARCHAR(2000),
    update_date     TIMESTAMP(0)    NOT NULL,
    conference_id   INTEGER         NOT NULL,
    subject_id      INTEGER         NOT NULL
);

ALTER TABLE article
    ADD CONSTRAINT article_PK PRIMARY KEY ( id ) ;


CREATE TABLE conference
(
    id      BIGSERIAL       NOT NULL ,
    name    VARCHAR(100)    NOT NULL,
    details VARCHAR(300)
);

ALTER TABLE conference
    ADD CONSTRAINT conference_PK PRIMARY KEY ( id ) ;

CREATE TABLE conference_subjects
(
    subject_id      INTEGER NOT NULL,
    conference_id   INTEGER NOT NULL
);

ALTER TABLE conference_subjects
    ADD CONSTRAINT conference_subjects_PK PRIMARY KEY ( subject_id, conference_id ) ;


CREATE TABLE subject
(
    id      BIGSERIAL       NOT NULL,
    name    VARCHAR(100)    NOT NULL
);

ALTER TABLE subject
    ADD CONSTRAINT subject_PK PRIMARY KEY ( id ) ;

CREATE TABLE articles_subjects
(
    article_id  INTEGER NOT NULL,
    subject_id  INTEGER NOT NULL
);

ALTER TABLE articles_subjects
    ADD CONSTRAINT articles_subjects_PK PRIMARY KEY ( article_id, subject_id ) ;

CREATE TABLE user_articles
(
    article_id  INTEGER NOT NULL,
    user_id     INTEGER NOT NULL
);

ALTER TABLE user_articles
    ADD CONSTRAINT user_articles_PK PRIMARY KEY ( article_id, user_id ) ;


CREATE TABLE files
(
    path_to_file    VARCHAR(2000)   NOT NULL,
    trash           BOOLEAN         NOT NULL,
    user_id         INTEGER         NOT NULL
);

ALTER TABLE files
    ADD CONSTRAINT files_PK PRIMARY KEY ( path_to_file ) ;

-----------------------------------------------------------------------------------
-------------------------------Foreign keys----------------------------------------
-----------------------------------------------------------------------------------

ALTER TABLE users
  ADD CONSTRAINT users_user_roles_FK FOREIGN KEY
  (
    user_role_id
  )
REFERENCES user_roles
  (
    id
  );

ALTER TABLE user_attempts
  ADD CONSTRAINT user_attempts_users_FK FOREIGN KEY
  (
    user_id
  )
REFERENCES users
  (
    id
  )
ON DELETE CASCADE;

ALTER TABLE user_register_token
  ADD CONSTRAINT user_register_token_users_FK FOREIGN KEY
  (
    user_id
  )
REFERENCES users
  (
    id
  )
ON DELETE CASCADE;

ALTER TABLE user_articles
    ADD CONSTRAINT user_articles_article_FK FOREIGN KEY
    (
        article_id
    )
    REFERENCES article
    (
        id
    )
ON DELETE CASCADE;

ALTER TABLE user_articles
    ADD CONSTRAINT user_articles_user_FK FOREIGN KEY
    (
        user_id
    )
    REFERENCES users
    (
        id
    )
ON DELETE CASCADE;

ALTER TABLE articles_subjects
    ADD CONSTRAINT articles_subjects_subject_FK FOREIGN KEY
    (
        subject_id
    )
    REFERENCES subject
    (
        id
    )
ON DELETE CASCADE;

ALTER TABLE articles_subjects
    ADD CONSTRAINT articles_subjects_article_FK FOREIGN KEY
    (
        article_id
    )
    REFERENCES article
    (
        id
    )
ON DELETE CASCADE;

ALTER TABLE article
    ADD CONSTRAINT article_conference_FK FOREIGN KEY
    (
        conference_id
    )
    REFERENCES conference
    (
        id
    )
ON DELETE CASCADE;

ALTER TABLE conference_subjects
    ADD CONSTRAINT conference_subjects_conf_FK FOREIGN KEY
    (
        conference_id
    )
    REFERENCES conference
    (
        id
    )
ON DELETE CASCADE;

ALTER TABLE conference_subjects
    ADD CONSTRAINT conference_subjects_subject_FK FOREIGN KEY
    (
        subject_id
    )
    REFERENCES subject
    (
        id
    )
ON DELETE CASCADE;

ALTER TABLE files
    ADD CONSTRAINT files_users_FK FOREIGN KEY
    (
        user_id
    )
    REFERENCES users
    (
        id
    )
ON DELETE CASCADE;

COMMIT;
