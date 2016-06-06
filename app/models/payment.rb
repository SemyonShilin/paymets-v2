class Payment < ActiveRecord::Base
  belongs_to :month, inverse_of: :payments, required: true

  scope :debit_behind_year, ->(y) {where(year: y)}
  default_scope -> { order('month_id ASC') }

  before_create :set_debit

  validates :payment, presence: true
  validates :payment, numericality: {greater_than_or_equal_to: 0.01,
                                     message: 'Сумма платежа не может быть отрицательным'}
  validates :other_payment, numericality: {greater_than_or_equal_to: 0,
                                           message: 'Сумма платежа не может быть отрицательным'},
            unless: Proc.new {|a| a.other_payment.blank? }

  private

  def set_debit
    self.debit = 7500 - payment - other_payment
  end

end
