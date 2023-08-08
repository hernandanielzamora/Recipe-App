class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id

    if @recipe.save
      flash[:notice] = 'Recipe was successfully added to the table.'
      redirect_to recipes_path
    else
      flash[:alert] = 'Recipe was not added to the table.'
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy!
    flash[:notice] = 'Recipe was successfully deleted.'
    redirect_to recipes_path
  end

  def update
    @recipe = current_user.recipes.find(params[:id])
    @recipe.update!(public: !public)
    redirect_to user_recipe_path(current_user, @recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
