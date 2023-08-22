class InstrumentsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
  end

  def show
    @instrument = Instrument.find(params[:id])
    @user = User.find(@instrument.user_id)
    @booking = Booking.new
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    if @instrument.save!
      redirect_to instrument_path(@instrument)
    else
      render :new_instrument, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

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

  # for future use
  def search_params
    params.require(:instrument).permit(:model, :brand, :category)
  end
end
