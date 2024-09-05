class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  def new
    render inertia: "SignIn", props: {}
  end

  def create
    result = CognitoService.sign_in(params[:email], params[:password])

    if result && result.authentication_result
      logger.debug "result: #{result}"
      session[:user_token] = result.authentication_result.access_token
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid username or password'
      redirect_to action: :new
    end
  end

  def destroy
    session.delete(:user_token)
    redirect_to login_path
  end
end
