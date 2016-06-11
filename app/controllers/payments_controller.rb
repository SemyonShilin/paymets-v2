class PaymentsController < ApplicationController
  def index
    @payments = Payment.debit_behind_year(params[:year_id])
    @sum_debit_behind_year = @payments.sum(:debit)
  end

  def new
    @month = Month.find(params[:month_id])
    @payment = @month.payments.build
  end

  def create
    @month = Month.find(params[:month_id])
    @payment = @month.payments.build(payments_params)
    authorize @payment
    @payment.year = session[:current_year_id]
    if @payment.save
      redirect_to @month
    else
      render 'new'
    end
  end

  private

  def payments_params
    params.require(:payment)
          .permit(:payment, :other_payment, :description, :month_id)
  end
end
