class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    # potentially get information from the DB
    @instruments = Instrument.all

    # show the information in the view


    # returns the view it finds
  end
end
