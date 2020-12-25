class MoviesController < ApplicationController
    before_action :set_movie, only: [:show]

    def show
        @movie = Movie.find_by(id: params[:id])
        @user_movie = UserMovie.find_by(movie_id: params[:id])
        render :layout => 'show' 
    end

    def index
        #search only by a user's collection if a user is logged in
        if logged_in?
            @movies = Movie.all
            @user = current_user
            @user_movies = UserMovie.where(user_id: params[:user_id])
        else
            @movies = Movie.all
        end

    end

    def set_movie
        @movie = Movie.find(params[:id])
        puts @movie
    end
end
