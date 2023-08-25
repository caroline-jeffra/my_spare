class PagesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_instrument, only: %i[show edit update destroy]
  helper_method :distance_from_user

  def home
    if params[:query].present?
      @instruments = Instrument.search(params[:query])
    else
      @instruments = Instrument.all
    end
    if params[:dates].present?
      @start_date = Date.parse(params[:dates].split(" to ").first)
      @end_date = Date.parse(params[:dates].split(" to ").last)
      @instruments = @instruments.available_between(@start_date, @end_date)
    end
    if params[:distance].present? && params[:distance].to_i != 100 && current_user.present?
      @instruments = @instruments.near(user_coordinates, params[:distance], units: :km)
    end
  end

  def distance_from_user(instrument)
    Geocoder::Calculations.distance_between(
      user_coordinates, instrument.coordinates
    ).round
  end
end
