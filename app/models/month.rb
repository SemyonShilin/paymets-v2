class Month < ActiveRecord::Base
  has_one :payment, inverse_of: :month
  has_and_belongs_to_many :years
end
