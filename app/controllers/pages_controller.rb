class PagesController < ApplicationController
  def home
    @instruments = Instrument.all
  end
end
