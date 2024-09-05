class ApplicationController < ActionController::Base
  before_action :authenticate_user

  private

  def authenticate_user
    token = session[:user_token]
    if token
      user = CognitoService.verify_token(token)
      if user
        @current_user = user
      else
        session.delete(:user_token)
        redirect_to login_path
      end
    else
      redirect_to login_path
    end
  end

  def current_user
    @current_user
  end
end
