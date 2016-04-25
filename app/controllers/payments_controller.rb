class PaymentsController < ApplicationController
  def new
    @month = Month.find(params[:month_id])
    @payment = @month.build_payment
  end

  def create
    @month = Month.find(params[:month_id])
    @payment = @month.build_payment(payments_params)
    if @payment.save
      redirect_to @month
    end
  end

  private
  def payments_params
    params.require(:payment).permit(:payment, :other_payment, :description, :month_id)
  end
end
