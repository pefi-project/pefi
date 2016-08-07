class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(params.require(:category).permit(:name))
    @category.save
    redirect_to @category
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def show
    @category = Category.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
