class MonthsController < ApplicationController

  def index
    @months = Month.all
  end

  def show
    @month = Month.find(params[:id])
    @payment = @month.payment
  end

  def get_month_id
    @month.id
  end
end
