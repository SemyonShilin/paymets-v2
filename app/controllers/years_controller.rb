class YearsController < ApplicationController
  def index
    @years = Year.order(:value_year)
    @debit = Payment.sum(:debit)
  end

  def new
    @year = Year.new
    authorize @year
  end

  def create
    @year = Year.create(year_params)
    if @year.errors.empty?
      redirect_to years_path
    else
      flash.now[:error] = 'Не могу добавить год'
      render 'new'
    end
  end

  private

  def year_params
    params.require(:year).permit(:value_year)
  end
end
