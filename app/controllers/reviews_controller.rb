class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.cocktail_id = params['cocktail_id']
    @review.save
    redirect_to cocktail_path(@review.cocktail_id)
  end

  def edit
    @review = Review.find(params[:id])
    @cocktail = @review.cocktail
    @dose = Dose.new(cocktail: @cocktail)
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to cocktail_path(@review.cocktail)
  end

  def destroy
    Review.find(params[:id]).destroy
    redirect_to cocktail_path(params['cocktail_id'])
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :cocktail_id)
  end
end
