class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  def new
    render inertia: "SignUp", props: {
    }
  end

  def create
    result = CognitoService.sign_up(params[:name], params[:password], params[:email])
    if result
      flash[:notice] = 'User created successfully. Please check your email for verification.'
      redirect_to verify_account_path(email: params[:email])
    else
      flash.now[:alert] = 'Error creating user'
      render inertia: "SignUp", props: {
        errorMessage: "Error creating user"
      }
    end
  end
end
