class CategoriesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :load_categories, only: [:index, :new]
  before_action :load_current_category,
                only: [:show, :category, :destroy, :edit]

  def new
    @category = Category.new
    @available_categories = @categories
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
    @available_categories = @categories.where.not(id: params[:id])
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
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

  def load_categories
    @categories ||= current_user.categories
  end

  def load_current_category
    load_categories
    @category ||= @categories.find(params[:id])
  end
end
