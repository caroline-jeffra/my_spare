class InstrumentsController < ApplicationController
  def index
  end

  def show
    @instrument = Instrument.find(params[:id])
    @user = User.find(@instrument.user_id)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
