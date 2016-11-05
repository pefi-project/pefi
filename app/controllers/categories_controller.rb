class CategoriesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action only: [:index] { @categories = current_user.categories }
  before_action only: [:show] do
    @category = current_user.categories.find(params[:id])
  end

  def index
  end

  def new
    @category = Category.new
    @available_categories = current_user.categories.where.not(id: @category.id)
  end

  def create
    @category = Category.new(category_params.merge(user: current_user))
    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
    # TODO: Find a better way to get the available parent categories.
    #       With the current approach we can make circuit.
    @available_categories = current_user.categories.where.not(id: @category.id)
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :parent_category_id)
  end

  def record_not_found
    # TODO: Add flash error message
    redirect_to action: 'index'
  end
end
