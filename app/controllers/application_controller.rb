class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

   private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def authorize
    	p current_user.id
      redirect_to login_url, alert: "Not authorized!" if (current_user.id != (session[:user_id]))
    end
end
