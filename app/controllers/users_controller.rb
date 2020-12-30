class UsersController < ApplicationController 
    # skip_before_action :verify_authenticity_token, :only => [:index, :show]

    

    def new
        if logged_in? #verifys user logged in (using helpers)
            redirect_to user_path(current_user)
        else
            @user = User.new
            render new_user_path
        end
    end

    def create
        if logged_in?
            redirect_to user_path(current_user)
        else
            @user = User.new(user_params)
            if !@user.save
                redirect_to root_path, notice: "Oops, we better try that again!"
            else
                @user.save
                session[:user_id] = @user.id
                redirect_to login_path
            end
        end
    end

    def self.from_omniauth(auth)
        where(email: auth.email).first_or_initialize do |user|
            user.name = auth.name
            user.email = auth.email
            user.password = SecureRandom.hex
        end
    end


    def edit
        if current_user && logged_in?
            @user = current_user
        else
            log_out
            render root_path, notice: 'You have to log in to do this'
        end
    end

    def update
        if current_user && logged_in?
            @user = current_user
            @user = @user.update(user_params)
            redirect_to user_path(current_user)
        else
            log_out
            render root_path, notice: 'You have to log in to do this'
        end
    end

    def show
        if current_user && logged_in?
            @user = current_user
        else
            render root_path, notice: 'You have to log in to do this'
        end
    end

    def index
    end

    def destroy
        if current_user && logged_in?
            user_movies = UserMovie.where(:user_id => current_user.id)
            user_movies.destroy_all
            current_user.delete
            session.delete :user_id
            render root_path
        else
            log_out
            render root_path, notice: 'You have to log in to do this'
        end
    end


    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :uid)
    end


end
