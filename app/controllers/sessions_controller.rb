class SessionsController < ApplicationController

    def home 
        if logged_in?
            redirect_to user_path(current_user)
        else
            
        end
    end

    def omniauth
    
        if logged_in?
            redirect_to user_path(current_user)
        else
            @user = User.from_omniauth(auth)      
                if @user.save
                    session[:user_id] = @user.id
                    @current_user = current_user
                    flash[:notice] = "Log in success!"
                    redirect_to user_path(@user)
                else
                    redirect_to root_path
                end
        end
    end

    def new
        if logged_in? && current_user
            redirect_to user_path(current_user)
        else
            
        end
    end

    def create
        if logged_in?
            redirect_to user_path(current_user)
        else
            if User.find_by(email: params[:user][:email]) == nil
                flash[:notice] = "We don't have an account matching that email."
                redirect_to login_path
            else
                @user = User.find_by(email: params[:user][:email].downcase)
                if @user && @user.authenticate(params[:user][:password])
                    session[:user_id] = @user.id
                    @current_user = current_user
                    flash[:notice] = "Log in success!"
                    redirect_to user_path(@user)
                else
                    flash[:notice] = "Email and password don't match, try again."
                    redirect_to login_path
                end
            end
            # user = User.find_by(email: params[:session][:email])
            # if user && user.authenticate(params[:session][:password])
            #     session[:user_id] = user.id
            #     redirect_to user_path(user), notice: "Logged in!"
            # else
            #     flash[:danger] = 'Invalid email or password'
            #     render 'sessions/signin'
            # end
        end
    end 

    def destroy
        log_out
        flash[:notice] = "You have logged out!"
        redirect_to '/'
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end
