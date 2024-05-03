# frozen_string_literal: true

# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :oauth2, ENV['OAUTH_CLIENT_ID'], ENV['OAUTH_CLIENT_SECRET'], {
    site: ENV['OAUTH_SITE'],
    authorize_url: ENV['OAUTH_AUTHORIZE_URL'],
    token_url: ENV['OAUTH_TOKEN_URL'],
    token_params: { client_id: ENV['OAUTH_CLIENT_ID'], client_secret: ENV['OAUTH_CLIENT_SECRET'] },
    client_options: {
      site: ENV['OAUTH_SITE'],
      authorize_url: ENV['OAUTH_AUTHORIZE_URL'],
      token_url: ENV['OAUTH_TOKEN_URL'],
      client_id: ENV['OAUTH_CLIENT_ID'],
      client_secret: ENV['OAUTH_CLIENT_SECRET']
    }
  }
end
