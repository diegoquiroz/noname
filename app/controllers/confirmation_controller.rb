class ConfirmationController < ApplicationController
  skip_before_action :authenticate_user
  def new
    render inertia: 'VerifyAccount', props: { email: params[:email] }
  end

  def verify
    CognitoService.confirm_sign_up(params[:email], params[:code])
    redirect_to '/'
  end
end