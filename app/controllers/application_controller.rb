class ApplicationController < ActionController::Base


    def set_current_user
    @current_user = User.find_by(id: session[:user_id])
    end

    def authenticate_user 
        if @current_user == nil
            redirect_to("/login")
        end
    end

    def forbid_login_user
        if @current_user
            redirect_to("/")
        end
    end
end
