class User < ActiveRecord::Base
    has_many :user_movies
    has_many :movies, through: :user_movies
    validates :email, :uniqueness => true
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create } 

    has_secure_password

    def self.from_omniauth(auth)
        #create a new user if doesn't exist already
        where(email: auth.info.email).first_or_initialize do |u|
            u.name = auth.info.name
            u.email = auth.info.email
            u.password = SecureRandom.hex(12)
        end
    end
end
