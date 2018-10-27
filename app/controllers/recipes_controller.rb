class  RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      flash[:success] = "Recipe was successfully created"
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:success] = "Updated successfully"
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:danger] = "Deleted successfully"
    redirect_to recipes_path
  end


private

  def recipe_params
    params.require(:recipe).permit(:title, :description)
  end

end
