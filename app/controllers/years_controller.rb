class YearsController < ApplicationController
  def new
    @year = Year.new
  end

  def create
    @year = Year.create(year_params)
    if @year.errors.empty?
      redirect_to years_path
    else
      render 'new'
    end
  end

  def index
    @years = Year.all
  end

  private
  def year_params
    params.require(:year).permit(:value_year)
  end
end
