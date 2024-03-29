class AssetsController < ApplicationController
  before_action :set_asset, only: [:destroy]

  def index
    uri = URI("#{ENV['API_URL']}/assets")
    request = Net::HTTP::Get.new(uri)

    params = { include: 'product,manufacturer' }
    uri.query = URI.encode_www_form(params)

    request["Authorization"] = "Bearer #{session[:token]}"

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(request)
    end

    @body = JSON.parse(response.body)
    @assets = @body['assets']
  rescue JSON::ParserError
    @assets = []
    flash.now[:alert] = "There was a problem fetching the assets."

  respond_to do |format|
    format.html 
    format.json { render json: @assets }
    end
  end

  def destroy
    uri = URI("#{ENV['API_URL']}/assets/#{@asset['id']}")
    request = Net::HTTP::Delete.new(uri)
    request["Authorization"] = "Bearer #{session[:token]}"

    response = Net::HTTP.start(uri) { |http| http.request(request) }

    respond_to do |format|
      if response.is_a?(Net::HTTPSuccess)
        format.turbo_stream
        format.html { redirect_to assets_url, notice: "Asset was successfully destroyed." }
      else
        format.html { redirect_to assets_url, alert: "Failed to delete the asset." }
      end
    end
  end

  private

  def set_asset
    uri = URI("#{ENV['API_URL']}/assets/#{params[:id]}")
    request = Net::HTTP::Get.new(uri)
    request["Authorization"] = "Bearer #{session[:token]}"
    
    response = Net::HTTP.start(uri.hostname, uri.port) { |http| http.request(request) }
    body = JSON.parse(response.body)
    debugger
  rescue JSON::ParserError
    redirect_to assets_url, alert: "There was a problem fetching the asset."
  end
end
