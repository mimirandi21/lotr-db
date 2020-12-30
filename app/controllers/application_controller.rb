class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :log_out


    private


    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

        def log_out 
            session[:user_id] = nil
            @current_user = nil
        end

        def logged_in?
            !!@current_user
        end

        
end
