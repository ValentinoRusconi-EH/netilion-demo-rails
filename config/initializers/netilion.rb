# frozen_string_literal: true

Netilion.configure do |c|
  c.environment = :local # accepts :production, :staging, :local
  c.oauth_token_url = ENV['OAUTH_TOKEN_URL']
  c.client_id = ENV['OAUTH_CLIENT_ID']
  c.client_secret = ENV['OAUTH_CLIENT_SECRET']
end
