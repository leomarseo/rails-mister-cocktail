class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    cocktail = Cocktail.create!(name: params['cocktail'])
    ingredient = Ingredient.where(name: params['ingredient']).first
    Dose.create!(description: params['description'], cocktail: cocktail, ingredient: ingredient)
    redirect_to root_path
  end

  def destroy
    cocktail = Cocktail.find(params[:id])
    cocktail.destroy
    redirect_to root_path
  end

  def search_index
    @cocktails = Cocktail.where('name LIKE ?', '%' + params['cocktail'].downcase.capitalize + '%')
  end
end
