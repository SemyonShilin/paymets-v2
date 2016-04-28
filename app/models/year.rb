class Year < ActiveRecord::Base
  has_and_belongs_to_many :months

  validates :value_year, presence: true, uniqueness: true,
                          numericality: { only_integer: true, greater_than: 2000 }
end
