class MonthsController < ApplicationController

  def index
    @months = Month.all
    session[:current_year_id] = params[:year_id]
  end

  def show
    @month = Month.find(params[:id])
    @payment = @month.payment
    session[:current_year_id] = nil
  end

end
