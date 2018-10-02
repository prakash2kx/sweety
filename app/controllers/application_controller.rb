class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :valid_user? , except: [:sign_in,:logged_in]

  helper_method :current_user

  PER_PAGE = 10

  def current_user
    User.where(id: session[:current_user]).first
  end

  def valid_user?
    redirect_to logging_in_path if session[:current_user].nil?
  end

end
