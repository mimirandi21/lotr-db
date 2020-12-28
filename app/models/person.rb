class Person < ApplicationRecord
    has_many :movie_people
    has_many :movies, through: :movie_people

    validates :name, presence: true
end
