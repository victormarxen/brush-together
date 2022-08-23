class ReservationsController < ApplicationController
  before_action :reservation_params, only: [:create]

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    raise
    @reservation = Reservation.new(reservation_params)
    @reservation.booker = current_user
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :total_price)
  end
end
