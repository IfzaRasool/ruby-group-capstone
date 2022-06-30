-- Create Database
CREATE DATABASE catalog_of_things
-- Create Music Album Table
CREATE TABLE music_albums(id serial not null primary key,archived boolean,publish_date date, on_spotify boolean);
-- create genres table
CREATE TABLE  genres(id serial not null primary key,name varchar(255));



-- create movies table
CREATE TABLE movies(id INT PRIMARY KEY, silent BOOLEAN, FOREIGN KEY(id) REFERENCES item(id));

-- create sources table
CREATE TABLE sources(id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(255) PRIMARY KEY(id));