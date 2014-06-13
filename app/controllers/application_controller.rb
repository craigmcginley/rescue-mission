class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?, :authenticate!

  private

  def current_user
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    current_user.present?
  end

  def authenticate!
    unless signed_in?
      flash[:notice] = 'You need to sign in to do that!'
      redirect_to questions_path
    end
  end

end
