class Menu < ActiveRecord::Base
  belongs_to :restaurant

  validates :name, :price, presence: true
  validates :price, numericality: {
            greater_than_or_equal_to: 0.01,
            less_than_or_equal_to:    1000}
end
