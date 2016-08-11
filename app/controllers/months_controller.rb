class MonthsController < ApplicationController
  def index
    @months = Month.all
    session[:current_year_id] = params[:year_id]
    authorize @months
  end

  def show
    @month = Month.find(params[:id])
    @payment = @month.payments.order(:id).last
    authorize @month
    session[:current_year_id] = nil
  end
end
