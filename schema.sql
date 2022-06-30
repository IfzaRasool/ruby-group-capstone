-- Create Database
CREATE DATABASE catalog_of_things
-- Create Music Album Table
CREATE TABLE music_albums(id serial not null primary key,archived boolean,publish_date date, on_spotify boolean);
-- created genres table
CREATE TABLE  genres(id serial not null primary key,name varchar(255));