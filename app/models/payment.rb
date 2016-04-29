class Payment < ActiveRecord::Base
  belongs_to :month

  validates :payment, presence: true
  validates :payment, numericality: {greater_than_or_equal_to: 0.01,
                                     message: 'Сумма платеж не может быть отрицательным'}
  validates :other_payment, numericality: {greater_than_or_equal_to: 0,
                                           message: 'Сумма платеж не может быть отрицательным'},
            unless: Proc.new {|a| a.other_payment.blank? }
  #validates :description, uniqueness: true, unless: Proc.new {|a| a.description.blank? }
end
