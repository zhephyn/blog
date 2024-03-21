class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  
  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to post_path(@post)
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      redirect_to posts_path
    end
  end

  private
  def category_params
    params.require(:category).permit(:title)
  end
end
