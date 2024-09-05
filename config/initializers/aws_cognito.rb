require 'aws-sdk-cognitoidentityprovider'

Aws.config.update({
  region: ENV['AWS_COGNITO_REGION'],
  credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY'], ENV['AWS_SECRET_KEY'])
})

COGNITO_CLIENT = Aws::CognitoIdentityProvider::Client.new
COGNITO_USER_POOL_ID = ENV['AWS_COGNITO_POOL_ID']
COGNITO_APP_CLIENT_ID = ENV['AWS_COGNITO_APP_CLIENT_ID']
