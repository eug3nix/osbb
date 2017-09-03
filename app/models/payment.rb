class Payment < ActiveRecord::Base
  belongs_to :estate
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
