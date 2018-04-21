require 'httparty'
require 'json'

class Kele
  include HTTParty
  # initialize method creates a new Kele client authorized with a username and password
  # Params: username = string, password = string
  def initialize(email, password)
    response = self.class.post(api_url("sessions"), body: {"email": email, "password": password})
    @auth_token = response["auth_token"]
    puts "There was a problem authorizing those credentials. Please try again." if @auth_token.nil?
  end

  def api_url(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end
end
