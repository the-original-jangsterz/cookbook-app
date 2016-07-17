class RecipesController < ApplicationController
  def index
    sort_attribute = params[:sort]
    @recipes = Recipe.order(sort_attribute)
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
    flash[:warning] = "Recipe <strong>successfully</strong> edited!"
    flash[:success] = "But you're all good bro!"
    redirect_to "/recipes/#{@recipe.id}"
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    flash[:success] = "Successfully deleted recipe!"
    redirect_to "/recipes"
  end
end
