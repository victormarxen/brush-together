class ReviewsController < ApplicationController
  before_action :set_toothbrush, only: %i[new create destroy]

  def index
    @reviews = Review.where(toothbrush_id: @toothbrush_id)
  end

  def create
    @review = Review.new(review_params)
    @review.toothbrush = @toothbrush
    if @review.save
      redirect_to toothbrush_path(@toothbrush), notice: 'Review was successfully created.'
    else
      render 'toothbrushes/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to review_path, status: :see_other
  end

  private

  def set_toothbrush
    @toothbrush = Toothbrush.find(params[:toothbrush_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
