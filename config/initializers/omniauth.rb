# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :oauth2, ENV['OAUTH_CLIENT_ID'], ENV['OAUTH_CLIENT_SECRET'], {
    site: ENV['OAUTH_SITE'],
    authorize_url: '/app/id/sign_in',
    token_url: '/app/id/oauth/token',
    token_params: { client_id: ENV['OAUTH_CLIENT_ID'], client_secret: ENV['OAUTH_CLIENT_SECRET'] },
    client_options: {
      site: ENV['OAUTH_SITE'],
      authorize_url: '/app/id/sign_in',
      token_url: '/app/id/oauth/token',
      client_id: ENV['OAUTH_CLIENT_ID'],
      client_secret: ENV['OAUTH_CLIENT_SECRET']
    }
  }
end
