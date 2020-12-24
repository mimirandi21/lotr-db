class Movie < ApplicationRecord
    has_many :user_movies
    has_many :users, through: :user_movies
    has_many :movie_people
    has_many :people, through: :movie_people
end
