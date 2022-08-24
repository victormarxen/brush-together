class ToothbrushesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_toothbrush, only: %i[show edit update destroy]

  def index
    @toothbrushes = Toothbrush.all
    @toothbrushes = policy_scope(Toothbrush)
  end

  def show
    @review = Review.new
    authorize @toothbrush
  end

  def new
    @toothbrush = Toothbrush.new
    authorize @toothbrush
  end

  def create
    @toothbrush = Toothbrush.new(toothbrush_params)
    @toothbrush.announcer = current_user
    authorize @toothbrush
    if @toothbrush.save
      redirect_to toothbrush_path(@toothbrush), notice: 'Toothbrush was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @toothbrush
  end

  def update
    authorize @toothbrush
    @toothbrush.update(toothbrush_params)
    redirect_to toothbrush_path(@toothbrush)
  end

  def destroy
    authorize @toothbrush
    @toothbrush.destroy
    redirect_to toothbrushes_path, status: :see_other
  end

  private

  def set_toothbrush
    @toothbrush = Toothbrush.find(params[:id])
  end

  def toothbrush_params
    params.require(:toothbrush).permit(:title, :description, :location, :color, :category, :daily_price, photos: [])
  end
end
