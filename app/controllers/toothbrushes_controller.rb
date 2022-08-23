class ToothbrushesController < ApplicationController
  before_action :set_toothbrush, only: %i[show edit update destroy]

  def index
    @toothbrushes = Toothbrush.all
  end

  def show
  end

  def new
    @toothbrush = Toothbrush.new
  end

  def create
    @toothbrush = Toothbrush.new(toothbrush_params)
    @toothbrush.announcer = current_user
    if @toothbrush.save
      redirect_to toothbrush_path(@toothbrush), notice: 'Toothbrush was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @toothbrush.update(toothbrush_params)
    redirect_to toothbrush_path(@toothbrush)
  end

  def destroy
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
