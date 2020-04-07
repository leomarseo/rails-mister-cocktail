class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
    if params['search'].present?
      @cocktails = Cocktail.where('name LIKE ?', '%' + params['search']['query'].split.map(&:capitalize).join(' ') + '%')
    end
  end

  def new
    @cocktail = Cocktail.new
    @dose = Dose.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new(cocktail: @cocktail)
    @review = Review.new(cocktail: @cocktail)
    @image_path = @cocktail.photo.attached? ? @cocktail.photo.key : 'z0hmday7p2mignrmd1iisi2dqp0c'
  end

  def create
    cocktail = Cocktail.create!(cocktail_params)
    redirect_to cocktail_path(cocktail.id)
  end

  def destroy
    cocktail = Cocktail.find(params[:id])
    cocktail.destroy
    redirect_to root_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
