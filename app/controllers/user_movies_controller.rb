class UserMoviesController < ApplicationController
    before_action :set_user_movie, except: [:new, :create]
    before_action :set_user

    def new
        @user_movie = UserMovie.new
        @movie = Movie.find_by(id: params[:id])
    end

    def create
        @user_movie = UserMovie.create(user_movie_params)
        redirect_to user_collection_path(current_user, @user_movie.movie_id)
    end

    def index
        @user_movies = UserMovie.where(user_id: current_user.id)
    end

    def show
        @user_movie = UserMovie.find_by(movie_id: params[:id])
    end

    def edit
        
    end

    def update
        @user_movie.update(user_movie_params)
        redirect_to user_collection_path(current_user, @user_movie)
    end

    def destroy
        @user_movie.delete
        redirect_to user_collection_path(current_user)
    end

    private

    def user_movie_params
        params.require(:user_movie).permit(:source, :user_rating, :user_notes, :private_notes, :user_id, :movie_id)
    end

    def set_user_movie
        @user_movie = UserMovie.where(user_id: current_user.id)
        puts @user_movie
    end

    def set_user
        @user = current_user
        if @user 
            puts @user
        else
            redirect_to root_path
        end
    end

end