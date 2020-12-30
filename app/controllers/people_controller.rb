class PeopleController < ApplicationController
    before_action :set_person, only: [:show]


    def show
        render :layout => 'show'
    end

    def index
        #search only by user's collection if a user is logged in
        if params[:user_id]
            @person = Person.where(user_id: session[:user_id])
        else
            @people = Person.all 
        end
    end

    def set_person
        @person = Person.find(params[:id])
        puts @person
    end
end
