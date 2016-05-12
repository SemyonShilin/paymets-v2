class YearsController < ApplicationController
  http_basic_authenticate_with name: 'olga', password: 't42ks31'

  def index
    @years = Year.order(:value_year)
    @debit = Payment.sum(:debit)
  end

  def new
    @year = Year.new
  end

  def create
    @year = Year.create(year_params)
    if @year.errors.empty?
      redirect_to root_path
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
