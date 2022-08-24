class ReservationsController < ApplicationController
  before_action :reservation_params, only: [:create]
  before_action :set_toothbrush, only: [:new, :create]

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.booker = current_user
    @reservation.toothbrush = @toothbrush
    if @reservation.save
      redirect_to toothbrush_path(@toothbrush), notice: 'Reservation requested.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_toothbrush
    @toothbrush = Toothbrush.find(params[:toothbrush_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :total_price)
  end
end
