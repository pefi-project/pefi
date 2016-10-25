class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.date = Time.zone.now
    if @expense.save
      redirect_to @expense
    else
      render 'new'
    end
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    if @expense.update_attributes(expense_params)
      redirect_to expenses_path
    else
      render 'edit'
    end
  end

  def destroy
    Expense.find(params[:id]).destroy
    redirect_to expenses_path
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :price_cents, :category_id)
  end
end
