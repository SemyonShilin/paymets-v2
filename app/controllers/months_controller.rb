class MonthsController < ApplicationController

  def index
    @months = Month.all
  end

  def show
    @month = Month.find(params[:id])
    @payment = @month.payment
    @year = @month.years.build
  end

end
