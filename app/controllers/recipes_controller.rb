class RecipesController < ApplicationController

def new
@recipe = Recipe.new
end

def create
@recipe = Recipe.create(recipe_params)
if params[:ingredient]
params[:ingredient].each do |ingredient|
  @ingredient = Ingredient.find(ingredient)
  @recipe.ingredients << @ingredient
end
end
redirect_to recipe_path(@recipe)
end

def show
@recipe = Recipe.find(params[:id])
@ingredients = Ingredient.all
end
def edit
  @recipe = Recipe.find(params[:id])
  @ingredients = Ingredient.all
end
def update
  @recipe = Recipe.find(params[:id])
  @recipe.update(recipe_params)
  @recipe.ingredients = []
  @recipe.save
  if params[:ingredient]
  params[:ingredient].each do |ingredient|
    @ingredient = Ingredient.find(ingredient)
    @recipe.ingredients << @ingredient
  end
  end
  redirect_to recipe_path(@recipe)
end
private

def recipe_params
  params.require(:recipe).permit(:name)
end
end
