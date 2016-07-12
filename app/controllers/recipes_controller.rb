class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    recipe = Recipe.new(
      title: params['title'],
      chef: params['chef'],
      ingredients: params['ingredients'],
      directions: params['directions']
    )
    recipe.save
    render 'create.html.erb'
  end

  def show
    @recipe = Recipe.find_by(id: params['id'])
    render 'show.html.erb'
  end
end
