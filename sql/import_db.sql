PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    question_id INTEGER
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    parent_question INTEGER NOT NULL,
    parent_reply INTEGER,
    name_id INTEGER NOT NULL,
    content_body TEXT NOT NULL,
    FOREIGN KEY (parent_question) REFERENCES questions(id),
    FOREIGN KEY (parent_reply) REFERENCES replies(id),
    FOREIGN KEY (name_id) REFERENCES users(id)
);

INSERT INTO
    users (fname, lname)
VALUES
    ('Jon', 'Fun'),
    ('Kin Ka', 'Tse'),
    ('Ariel', 'Davies'),
    ('Greta', 'Hayes');

INSERT INTO
    questions (title, body, author_id)
VALUES
    ('Why do I feel depressed?', 'Blah Blah', 1),
    ('How can I pass assessments?', 'Studying?', 2),
    ('What is my favorite font?', 'Arial', 3),
    ('Who is the best instructor?', 'Pick me', 4);

INSERT INTO
    replies (parent_question, name_id, content_body)
VALUES
    (3, 4, 'So cool!'),
    (1, 3, 'Even cooler!'),
    (2, 2, 'Even Coolest!'),
    (4, 1, 'Not cool.');