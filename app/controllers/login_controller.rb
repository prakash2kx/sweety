class LoginController < ApplicationController

  def sign_in
  end

  def logged_in
    user = User.find_by(email: params["user"]["email"])
    if user&.authenticate(params["user"]["password"])
      session[:current_user] = user.id
      redirect_to metrics_path
    else
      render 'sign_in', flash[:notice] => "Please enter valid credentials"
    end
  end

  def logout
    session[:current_user] = nil
    redirect_to logging_in_path
  end

end
