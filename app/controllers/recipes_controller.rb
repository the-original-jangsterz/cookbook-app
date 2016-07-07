class RecipesController < ApplicationController
  def recipe
    @recipe = Recipe.first
    render 'myrecipe.html.erb'
  end
end
