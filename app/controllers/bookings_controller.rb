class BookingsController < ApplicationController
  before_action :authenticate_user!
  def destroy
    # find the booking to destroy from the params
    @booking = Booking.find(params[:id])

    # destroy the booking
    @booking.destroy

    # direct the user to the dashboard show
    redirect_to dashboard_path
  end

  def create
    @instrument = Instrument.find(params[:instrument_id])
    @booking = Booking.new(booking_params)
    @booking.instrument = @instrument
    # TODO: make this cost calculation private so that it isn't vulnerable through exposure
    @booking.cost = @instrument.daily_price * (@booking.end_date - @booking.start_date + 1)
    if @booking.save
      redirect_to instrument_path(@instrument), notice: "Booking successful!"
    else
      redirect_to instrument_path(@instrument), notice: "Booking failed!"
    end
  end

  private

  def booking_params
    book_start = Date.parse(params["booking"]['start_date'].split(' ').first)
    book_end = Date.parse(params["booking"]['start_date'].split(' ').last)
    params
      .require(:booking)
      .permit(:start_date, :end_date)
      .merge(
        user: current_user,
        start_date: book_start,
        end_date: book_end
      )
  end
end
