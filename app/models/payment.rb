class Payment < ActiveRecord::Base
  belongs_to :month, inverse_of: :payment

  scope :debit_behind_year, ->(y) {where(year: y)}

  before_create :set_debit

  validates :payment, presence: true
  validates :payment, numericality: {greater_than_or_equal_to: 0.01,
                                     message: 'Сумма платеж не может быть отрицательным'}
  validates :other_payment, numericality: {greater_than_or_equal_to: 0,
                                           message: 'Сумма платеж не может быть отрицательным'},
            unless: Proc.new {|a| a.other_payment.blank? }
  validates :month_id, presence: true
  #validates :month_id, unless: Proc.new {|a| a.month_id.blank? }
  #validates :description, uniqueness: true, unless: Proc.new {|a| a.description.blank? }

  private

  def set_debit
    self.debit = 7500 - payment - other_payment
  end
end
