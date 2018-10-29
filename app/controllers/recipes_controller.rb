# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[edit update show destroy upvote downvote]
  before_action :require_same_user, only: %i[edit update destroy]

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      flash[:success] = 'Recipe was successfully created'
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def show; end

  def index
    @recipes = Recipe.all
  end

  def edit; end

  def update
    if @recipe.update(recipe_params)
      flash[:success] = 'Updated successfully'
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    flash[:danger] = 'Deleted successfully'
    redirect_to recipes_path
  end

  def upvote
    @recipe.upvote_by current_user
    redirect_back(fallback_location: root_path)
  end

  def downvote
    @recipe.downvote_from current_user
    redirect_back(fallback_location: root_path)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    @recipe = Recipe.find(params[:id])
    if !current_user.admin? && current_user != @recipe.user
      flash[:danger] = 'You can only edit or delete your own articles'
      redirect_to root_path
    end
  end
end
