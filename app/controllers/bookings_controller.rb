class BookingsController < ApplicationController
  before_action :authenticate_user!
  def destroy
    puts 'booking deleted'
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to instrument_path(@booking.instrument)
  end

  def create
    @instrument = Instrument.find(params[:instrument_id])
    @booking = Booking.new(booking_params)
    @booking.instrument = @instrument
    # TODO: make this cost calculation private so that it isn't vulnerable through exposure
    @booking.cost = @instrument.daily_price * (@booking.end_date - @booking.start_date + 1)
    if @booking.save
      puts "#{@booking} has been created"
    else
      puts 'booking failed'
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
