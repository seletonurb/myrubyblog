class CategoriesController < ApplicationController
  # GET /categories
  def index
    @categories = Category.all
  end

  def category_params
    params.require(:category).permit(:name)
  end
  # GET /categories/1
  def show
    @category = Category.find(params[:id])
    @title = @category.name
    @posts = @category.posts
  end

end
