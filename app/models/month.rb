class Month < ActiveRecord::Base
  has_many :payments, inverse_of: :month
  has_and_belongs_to_many :years
end
