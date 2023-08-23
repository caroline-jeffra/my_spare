class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    # raise
    # @instruments must only be the current user's instrument
    # # You can get the current user by running current_user
    # # You could use Instrument.where to filter the instruments
    @instruments = current_user.instruments
    
    # @bookings must only be the current user's bookings
    # # You can get the current user by running current_user
    # # You could use Booking.where to filter the Bookings
    @bookings = current_user.bookings

    # In the dashboard html, display this information, following the sketch

  end
end
