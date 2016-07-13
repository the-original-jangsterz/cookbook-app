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
    flash[:success] = "Recipe successfully created!"
    redirect_to "/recipes/#{recipe.id}"
  end

  def show
    @recipe = Recipe.find_by(id: params['id'])
    render 'show.html.erb'
  end

  def edit
    @recipe = Recipe.find_by(id: params['id'])
    render 'edit.html.erb'
  end

  def update
    @recipe = Recipe.find_by(id: params['id'])
    @recipe.update(
      title: params['title'],
      chef: params['chef'],
      ingredients: params['ingredients'],
      directions: params['directions']
    )
    redirect_to "/recipes/#{@recipe.id}"
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    redirect_to "/recipes"
  end
end
