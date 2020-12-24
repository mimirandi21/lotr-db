class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user, :log_out


    private

        def log_out
            session.delete :user_id
        end

        def logged_in?
            !!session[:user_id]
        end

        def current_user
            @current_user = User.find_by(id: session[:user_id])
        end
end
