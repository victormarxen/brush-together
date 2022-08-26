class ReservationsController < ApplicationController
  before_action :reservation_params, only: [:create]
  before_action :set_toothbrush, only: [:new, :create]
  before_action :set_reservation, only: [:update]

  def index
    @my_bookings = policy_scope(Reservation)
    toothbrushes = Toothbrush.where(announcer: current_user)
    @my_reservations = Reservation.where(toothbrush: toothbrushes)
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

  def announcer_pending
    # authorize @reservation
    toothbrushes = Toothbrush.where(announcer: current_user)
    @reservations = Reservation.where(toothbrush: toothbrushes)
    render 'reservations/announcer_pending'
  end

  def update
    authorize @reservation
    @reservation.confirmed = !@reservation.confirmed
    @reservation.save
    redirect_to '/reservations'
    # if @reservation.confirmed?
    #   @reservation.confirmed = false
    # else
    #   @reservation.confirmed = true
    # end
  end

  # def cancel_reservation
  #   @reservation.confirmed = false
  # end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def set_toothbrush
    @toothbrush = Toothbrush.find(params[:toothbrush_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :total_price)
  end
end
