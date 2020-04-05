class DosesController < ApplicationController
  def index
    @cocktail = Cocktail.find(params[:id])
  end

  def create
    ingredient = Ingredient.where(name: params['ingredient']).first
    Dose.create!(description: params['description'], cocktail_id: params[:id], ingredient: ingredient)
    redirect_to "/#{params[:id]}"
  end

  def edit
    @dose = Dose.find(params[:dose_id])
  end

  def update
    @dose = Dose.find(params[:dose_id])
    @dose.update(description: params['description'])
    redirect_to "/#{params[:id]}"
  end

  def destroy
    Dose.find(params[:dose_id]).delete
    redirect_to "/#{params[:id]}"
  end
end
