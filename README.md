# Middle Earth - A Lord of the Rings Movie Database and Fan Site
A fan site for Peter Jackson's Lord of the Rings and Hobbit movies that allows you to create your own movie hoard.
![screenshot](./public/login.png)

[Project Walkthrough Video](https://drive.google.com/file/d/12xtB-bY6oBehyJpDjHR8iT1JpmfOay5s/view?usp=sharing)

## Table of contents
* [General info](#general-info)
* [Screenshots](#screenshots)
* [Technologies](#technologies)
* [Setup](#setup)
* [Features](#features)
* [Status](#status)
* [Inspiration](#inspiration)
* [Contact](#contact)

## General info
Welcome to Middle Earth. Here you can find information about the Lord of the Rings and The Hobbit movies, all the editions released, and create your own hoard of these movies! Keep track of which versions you own, write reviews and see other user reviews. See fun facts about the movies. Can you compete with Smaug's hoard?
Additionally, find out more about the actors and writers - fun facts and quotes from the people of Middle Earth.
_This includes only the Peter Jackson movies._

## Screenshots
![screenshot](./public/LOTRMovie.png)

## Technologies
* Ruby on Rails
* Omniauth - version 1.9.1
* PostgreSQL - version 1.2.3
* TSV - version 1.0.0
* Bootstrap-SASS - version 3.4.1

****To see more about this process:****

[Project Blog Post](https://dev.to/meemeek/one-does-not-simply-build-a-rails-project-5522)

THANKS FOR CHECKING OUT MY PROJECT!

## Setup
Clone this repo to your local machine `git clone <this-repo-url>`
run `cd lotr-db` to access
run `bundle install` to install required dependencies
run `rails db:migrate` to create the database tables
run `rails db:seed` to integrate information from tsv seed files
run `rails s` in your terminal and follow link to the correct port

## Features
* Implementation of log in through Google OAuth.
* Ability to see other user reviews and ratings as well as have private comments.
* Full CRUD capabilities for the users to maintain a full database of their own movies.

To-do list:
* 

## Status
Project is complete.

## Inspiration
Project inspired by Peter Jackson's amazing vision of J.R.R Tolkein's work and the hard work that was put into bringing it to life.

## Contact
Bug reports and pull requests are welcome on GitHub at https://github.com/mimirandi21/lotr-db.