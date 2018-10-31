# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit update show destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category saved'
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def show; end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def edit; end

  def update
    if @category.update(category_params)
      flash[:success] = 'Category name changed'
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    flash[:danger] = 'Deleted successfully'
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
