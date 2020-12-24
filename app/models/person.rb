class Person < ApplicationRecord
    has_many :movie_people
    has_many :movies, through: :movie_people

    validates :name, presence: true
    validates :imdb_link, uniqueness: true
end
