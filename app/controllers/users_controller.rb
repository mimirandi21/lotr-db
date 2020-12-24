class UsersController < ApplicationController 
    # skip_before_action :verify_authenticity_token, :only => [:index, :show]

    def home
        if logged_in?
            redirect_to user_path(current_user)
        else
            
        end
    end

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
                return head(:forbidden)
                redirect_to root_path
            else
                @user.save
                session[:user_id] = @user.id
                redirect_to users_signin_path
            end
        end
    end

    def omniauth
        #get access tokens from google using google oauth2
        if logged_in?
            redirect_to user_path(current_user)
        else
            @user = User.from_omniauth(auth)        
                if @user.save
                    redirect_to user_path(@user)
                else
                    redirect_to root_path
                end
        end
    end

    def signin
        if logged_in? && current_user
            redirect_to user_path(current_user)
        else
            log_out
            render 'users/signin'
        end
    end

    def login
        if logged_in?
            redirect_to user_path(current_user)
        else
            if User.find_by(email: params[:user][:email]) == nil
                return head(:forbidden)
                redirect_to new_user_path
            else
                @user = User.find_by(email: params[:user][:email])
                return head(:forbidden) unless @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            end
        end
    end 

    def logout
        log_out
        redirect_to '/'
    end

    def edit
        if logged_in? && current_user
            @user = current_user
        else
            log_out
            return head(:forbidden)
            render root_path
        end
    end

    def update
        if logged_in? && current_user
            @user = current_user
        else
            log_out
            return head(:forbidden)
            render root_path
        end
    end

    def show
        if logged_in?
            @user = current_user
        else
            return head(:forbidden)
            render root_path
        end
    end

    def index
    end

    def destroy
        if logged_in? && current_user
            session.delete :user_id
            render root_path
        else
            log_out
            return head(:forbidden)
            render root_path
        end
    end


    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :uid)
    end

    def auth
        request.env['omniauth.auth']
    end
end
