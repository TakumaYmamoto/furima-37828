class ApplicationController < ActionController::Base
  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_gozi"] && password == ENV["BASIC_AUTH_1993"]
    end
  end
end
