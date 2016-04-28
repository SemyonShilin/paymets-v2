class PaymentsController < ApplicationController
  def new
    @month = Month.find(params[:month_id])
    @payment = @month.build_payment
  end

  def create
    @month = Month.find(params[:month_id])
    @payment = @month.build_payment(payments_params)
    @payment.year = Time.now.year
    @payment.debit = 7500 - @payment.payment - @payment.other_payment
    if @payment.save
      redirect_to @month
    else
      render 'new'
    end
  end

  def index
    @payments = Payment.where(year: params[:year_id])
  end

  private
  def payments_params
    params.require(:payment).permit(:payment, :other_payment, :description, :month_id)
  end
end
