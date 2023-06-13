class ApplicationController < ActionController::Base
    helper_method :logged_in?
    before_action :set_current_user
    
    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end

    def logged_in?
      !Current.user.nil?
    end

    def require_user_logged_in!
        redirect_to sign_in_path, alert: "You must be signed in to complete this" if Current.user.nil?
    end
end
