# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  require 'net/http'
  require 'uri'
  require 'json'

  def create
    if params[:error]
      log_and_redirect_on_error
    else
      set_token(request.env['omniauth.auth'].credentials.token)
      user_data = fetch_user_data(session[:token])
      store_user_data_in_session(user_data) if user_data
      redirect_to root_path, notice: "Authentication successful!"
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'You have been logged out.'
  end

  private

  def fetch_user_data(token)
    uri = URI.parse("#{ENV['API_URL']}/users/current")
    request = Net::HTTP::Get.new(uri)
    request["Authorization"] = "Bearer #{token}"
  
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(request)
    end
  
    if response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body)
    else
      Rails.logger.error "Failed to fetch user data: #{response.body}"
      nil
    end
  end

  def store_user_data_in_session(user_data)
    session[:user_info] = user_data
  end

  def set_token(token)
    session[:token] = token
  end

  def log_and_redirect_on_error
    Rails.logger.error "OAuth Error: #{params[:error_description] || params[:error]}"
    redirect_to root_path, alert: "Authentication failed: #{params[:error_description] || params[:error]}"
  end
end
