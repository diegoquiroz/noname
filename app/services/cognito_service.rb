class CognitoService
  class << self
    def sign_up(name, password, email)
      COGNITO_CLIENT.sign_up({
        client_id: COGNITO_APP_CLIENT_ID,
        username: email,
        password: password,
        user_attributes: [
          {
            name: "name",
            value: name
          }
        ]
      })
    rescue Aws::CognitoIdentityProvider::Errors::ServiceError => e
      Rails.logger.error "Error signing up user: #{e.message}"
      nil
    end

    def confirm_sign_up(email, confirmation_code)
      COGNITO_CLIENT.confirm_sign_up({
        client_id: COGNITO_APP_CLIENT_ID,
        username: email,
        confirmation_code: confirmation_code
      })
    end

    def sign_in(email, password)
      COGNITO_CLIENT.initiate_auth({
        client_id: COGNITO_APP_CLIENT_ID,
        auth_flow: 'USER_PASSWORD_AUTH',
        auth_parameters: {
          'USERNAME' => email,
          'PASSWORD' => password
        }
      })
    rescue Aws::CognitoIdentityProvider::Errors::ServiceError => e
      Rails.logger.error "Error signing in user: #{e.message}"
      nil
    end

    def verify_token(token)
      COGNITO_CLIENT.get_user({
        access_token: token
      })
    rescue Aws::CognitoIdentityProvider::Errors::ServiceError => e
      Rails.logger.error "Error verifying token: #{e.message}"
      nil
    end
  end
end
