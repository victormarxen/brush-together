class ReservationsController < ApplicationController
  before_action :reservation_params, only: [:create]
  before_action :set_toothbrush, only: [:new, :create]

  def index
    @reservations = Reservation.all
    @reservations = policy_scope(Reservation)
  end

  def new
    @reservation = Reservation.new
    authorize @reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.booker = current_user
    @reservation.toothbrush = @toothbrush
    authorize @reservation
    if @reservation.save
      redirect_to toothbrush_path(@toothbrush), notice: 'Reservation requested.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    authorize @reservation
    @reservation.destroy
    redirect_to toothbrushes_path, status: :see_other
  end

  private

  def set_toothbrush
    @toothbrush = Toothbrush.find(params[:toothbrush_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :total_price)
  end
end
