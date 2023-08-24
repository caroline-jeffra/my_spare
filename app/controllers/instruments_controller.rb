require 'json'
class InstrumentsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_instrument, only: %i[show edit update destroy]
  helper_method :distance_from_user

  def index
    if params[:query].present?
      @instruments = Instrument.search(params[:query])
    else
      @instruments = Instrument.all
    end
    if params[:dates].present?
      @start_date = Date.parse(params[:dates].split(" to ").first)
      @end_date = Date.parse(params[:dates].split(" to ").last)
      @instruments = Instrument.where.not(id: Booking.unavailable(@start_date, @end_date).pluck(:instrument_id))
    end
  end

  def show
    @user = User.find(@instrument.user_id)
    @instrument_bookings = booked_dates(@instrument.bookings)
    @booking = Booking.new
    @distance = distance_from_user(@instrument)
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    if @instrument.save
      redirect_to instrument_path(@instrument)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @instrument.update(instrument_params)
      redirect_to instrument_path(@instrument)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  def distance_from_user(instrument)
    if current_user.nil?
      Geocoder::Calculations.distance_between(
        [User.last.latitude, User.last.longitude],
        [instrument.latitude, instrument.longitude]
      ).round
    else
      Geocoder::Calculations.distance_between(
        [current_user.latitude, current_user.longitude],
        [instrument.latitude, instrument.longitude]
      ).round
    end
  end

  private

  def booked_dates(bookings)
    booked_dates = []
    bookings.each do |booking|
      booked_dates.push({ from: booking.start_date.to_s, to: booking.end_date.to_s })
    end
    return booked_dates.to_json
  end

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def instrument_params
    params.require(:instrument)
          .permit(
            :model,
            :brand,
            :category,
            :daily_price,
            :description,
            :image_url,
            :city
          ).merge(user: current_user)
  end
end
