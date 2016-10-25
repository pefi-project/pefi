class EarningsController < ApplicationController
  before_action :authenticate_user!

  def index
    @earnings = Earning.all
  end

  def new
    @earning = Earning.new
  end

  def create
    @earning = Earning.new(earning_params)
    @earning.date = Time.zone.now
    if @earning.save
      redirect_to @earning
    else
      render 'new'
    end
  end

  def show
    @earning = Earning.find(params[:id])
  end

  def edit
    @earning = Earning.find(params[:id])
  end

  def update
    @earning = Earning.find(params[:id])
    if @earning.update_attributes(earning_params)
      redirect_to earnings_path
    else
      render 'edit'
    end
  end

  def destroy
    Earning.find(params[:id]).destroy
    redirect_to earnings_path
  end

  private

  def earning_params
    params.require(:earning).permit(:name, :amount_cents)
  end
end
