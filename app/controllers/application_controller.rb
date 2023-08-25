require 'open-uri'

class ApplicationController < ActionController::Base
  def user_coordinates
    if current_user.nil? || !current_user.attributes.values_at("latitude", "longitude").all?
      raw = URI.open("https://api.geoapify.com/v1/ipinfo?apiKey=#{ENV['GEOAPIFY_KEY']}").read
      parsed = JSON.parse(raw)
      parsed["location"].values
    else
      current_user.coordinates
    end
  end
end
