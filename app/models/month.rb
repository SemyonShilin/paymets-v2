class Month < ActiveRecord::Base
  has_one :payment
  has_and_belongs_to_many :years
end
