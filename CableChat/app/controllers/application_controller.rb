class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:display_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:display_name])



  end
  # def current_user
  #   # return this user if session:user_id exists in the session hash based on said user_id
  #   # gives the whole user object from the session hash
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #   #don't go to DB is you already have @current_user, otherwise find it
  # end
  #
  # def logged_in?
  #   # !! converts whatever after it into a boolean
  #   !!current_user
  # end
  #
  # def require_user
  #   if !logged_in?
  #     flash[:danger] = "You must be logged in."
  #     redirect_to root_path
  #   end
  # end
end
