class MoviesController < ApplicationController
    before_action :set_movie, only: [:show]

    def show
        @movie = Movie.find_by(id: params[:id])
        @user_movie = UserMovie.where(movie_id: params[:id])
        render :layout => 'show' 
    end

    def index
        @person = Person.find_by(id: params[:person_id])
        if @person
            @movies = []
            @moviepeople = MoviePerson.where(person_id: params[:person_id])
            @moviepeople.each do |p|
                @movies << Movie.find_by(id: p[:movie_id])
            end
        elsif logged_in?
            @movies = Movie.all
            @user = current_user
            @user_movies = UserMovie.where(user_id: session[:user_id])
        else
            @movies = Movie.all
        end

    end

    def set_movie
        @movie = Movie.find(params[:id])
        puts @movie
    end
end
